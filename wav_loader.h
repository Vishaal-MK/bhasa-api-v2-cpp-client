#pragma once
#include <filesystem>
#include <stdint.h>
#include <vector>
#include <string>
#include <iostream>
#include <memory>
#include <memory.h>
#include <variant>
#include <fstream>
#include <array>
#include <execution>

//dumb stupid plain WAV loader, do not use on production.
namespace wav
{
#pragma pack(push, 1)
    struct header
    {
        char riff[4];
        uint32_t fileSize;
        char wave[4];
        char fmt[4];
        uint32_t fmtLen;
        uint16_t ftmType; //PCM
        uint16_t channels;
        uint32_t sampleRate;
        uint32_t sampleBitsMath;//(Sample Rate * BitsPerSample * Channels) / 8.
        uint16_t someMore;//(BitsPerSample * Channels) / 8.1 - 8 bit mono2 - 8 bit stereo/16 bit mono4 - 16 bit stereo
        uint16_t bps;
        char data[4];
        uint32_t dataLen;
    };
#pragma pack(pop)

    using samples_t = std::variant<std::monostate, std::vector<uint8_t>, std::vector<int16_t>>;

    using split_wav = std::pair<header, samples_t>;

    inline split_wav load2ram(const std::filesystem::path& fn)
    {
        const size_t file_size = std::filesystem::file_size(fn);
        std::fstream fs(fn, std::ios_base::in);

        header h;
        {
            std::array<char, sizeof(header)> tmp;
            fs.read(tmp.data(), tmp.size());
            memcpy(&h, tmp.data(), tmp.size());
        }
        const auto dataLen = file_size - sizeof(header);
        if (h.dataLen != dataLen)
        {
            std::cerr << "WAV files has len IN HEADER: " << h.dataLen << ", but real is " << dataLen << std::endl;
            h.dataLen = dataLen;
        }

        std::vector<uint8_t> d;
        {
            std::vector<char> tmp;
            tmp.resize(h.dataLen);
            fs.read(tmp.data(), h.dataLen);

            d.resize(h.dataLen);
            std::transform(std::execution::par_unseq, tmp.begin(), tmp.end(), d.begin(),[](auto c)
            {
                return static_cast<uint8_t>(c);
            });
        }

        if (h.bps == 16)
        {
            std::vector<int16_t> s;
            s.reserve(d.size() / 2);

            for (size_t index = 0, sz = d.size(); index < sz; index += 2)
            {
                int16_t value;
                memcpy(&value, &d[index], 2);
                s.push_back(static_cast<int16_t>(value));
            }

            return {h, s};
        }

        return {h, d};
    }
};
