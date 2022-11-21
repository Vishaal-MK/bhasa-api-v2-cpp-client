#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <execution>
#include <chrono>
#include <cassert>
#include <thread>
#include "roots.h"
#include <boost/beast.hpp>
#include <boost/beast/ssl.hpp>
#include <boost/asio.hpp>
#include <boost/asio/ssl.hpp>
#include <boost/beast/websocket/ssl.hpp>
#include "boost/certify/https_verification.hpp"

#include "json.hpp"
#include "AudioFile.h"
#include "wav_loader.h"
#define CHUNK_SIZE 5000
#define needread ((16000 * CHUNK_SIZE / 1000) * sizeof(int16_t))

FILE *f;
clock_t start, end;
int w1, w2, w3;
int r;

static int x = 0;
static void usage(const std::string &fn)
{
    std::cout  << " voice.wav "
              << " <ip_address>" << std::endl;
    exit(0);
}


int main(const int argc, const char *argv[])
{

    int result = 0;
    using json = nlohmann::json;
    if (argc < 3)
        usage(argv[0]);
    // const static std::string bhasaEndpoint = "wss://transcribe-api.bhasa.io/ws/listen";

    // parsed original "endpoint", as connection is couple-steps things

    // 1. we need to resolve IP
    const static std::string ws_host = argv[2];
    // 2. we need to setup path ("endpoint")
    const static std::string ws_path = "/ws/listen";
    // 3. we use port during IP resolve too, default is 80 or 443 for SSL in browsers
    const static std::string ws_port = "8000";
    // 4. and last but not least we will indicate SSL by using SSL stream objects below ("wss:/" part)

    //{"api_key":"<APIKEY>","event":"config","format":"LINEAR16","language":"en-US","rate":"audio_context.sampleRate"}
    const static json initer =
        {

            {"language", {"en-us", "en-uk"}},
            {"format", "LINEAR-PCM"},
            {"api_key", "a1b2c33d4e5f6g7h8i9jakblc"},
            {"profanity", true},
            {"interim", true},
            {"word_time_offset", true},
            {"number_of_streams", 2}};

    // else
    {
       
        {
            
            namespace beast = boost::beast;         // from <boost/beast.hpp>
            namespace http = beast::http;           // from <boost/beast/http.hpp>
            namespace websocket = beast::websocket; // from <boost/beast/websocket.hpp>
            namespace net = boost::asio;            // from <boost/asio.hpp>
            namespace ssl = boost::asio::ssl;       // from <boost/asio/ssl.hpp>

            using tcp = boost::asio::ip::tcp; // from <boost/asio/ip/tcp.hpp>

            // The io_context is required for all I/O
            net::io_context ioc;

            // The SSL context is required, and holds certificates
            ssl::context ctx{ssl::context::tlsv13_client};
            load_root_certificates(ctx);
            // verify SSL context (that code uses "certify" lib bounded to example)
            ctx.set_verify_mode(boost::asio::ssl::verify_none);
            // ctx.set_verify_mode(boost::asio::ssl::verify_peer | boost::asio::ssl::context::verify_fail_if_no_peer_cert);
            ctx.set_default_verify_paths();
            boost::certify::enable_native_https_server_verification(ctx);

            // These objects perform our I/O
            websocket::stream<tcp::socket> wss(net::make_strand(ioc));



            std::atomic<size_t> offset(0); // samples (not bytes!)
            FILE *r = fopen(argv[1], "rb");
            FILE *rcv = fopen("m.wav", "wb");
            const auto current_write = [ r, rcv]()
            {
                char m[needread + 1];
                size_t x = fread(m, 1, needread, r);

                fwrite(m, 1, x, rcv);
                // std::cerr << "Next  = " << offset << std::endl;
                return net::buffer(m, x);
            };

            // declaring explicit type instead auto so lambda can capture itself and use recursive
            using rw_t = std::function<void(beast::error_code, std::size_t)>;

            beast::flat_buffer buffer;
            std::shared_ptr<std::mutex> m = std::make_shared<std::mutex>();
            const rw_t recursion_read = [&](auto ec, auto readed)
            {
                
                std::cout << "\n------------\n";
              
                m->lock();
                std::cout << beast::make_printable(buffer.data());
                std::cout.flush();
                fflush(stdout);
                buffer.clear();
                m->unlock();
                                std::cout << "\n---end------\n";

               // if (!ec)
                {
                  //  std::cout << "re reading"<<std::endl;
                    wss.async_read(buffer, recursion_read);
                }
                //else {
                  //  std::cout <<  ec.message();
               // }
            };

            auto stop_check = std::chrono::system_clock::now();
        //    boost::beast::websocket::stream_base::timeout t;

            // wss.set_option()
            const rw_t recursion_write = [&](auto, auto written /*bytes*/)
            {
                //std::cout << "writting recursively" << std::endl;
                if (!feof(r)){
                    wss.async_write(current_write(), recursion_write);
                    // std::this_thread::sleep_for(std::chrono::seconds(5));
                    }
               // else
                 //   std::cout << "----------exiting---------" << std::endl;
            };

            const auto async_rw = [&](auto)
            {
                // std::cerr << "on rw\n";
                // Send the message

                try
                {
                    wss.text(true);
                    wss.write(net::buffer(initer.dump()));
                    // std::cerr << "Wrote JSON." << std::endl;
                }
                catch (std::exception &ec)
                {

                    std::cout << ec.what() << std::endl;
                }

                wss.binary(true);
                wss.auto_fragment(true);
          //      wss.write_buffer_bytes(write_fragment * bytes_per_sample);

                // launching recursion initially
                //  std::cout << "writing recursive";
                // fwrite(current_write().data(), 1, current_write().size(), f);

                // writing sncronized data

                // char mn/[79];
                // fread(mn, 1, 78, r);

                std::cout << "writing" << std::endl;

                // wss.write_some(true, boost::asio::buffer(m, x));

                // x = fread(m, 1, needread, r);
                // wss.write_some(true, boost::asio::buffer(m, x));
                    //  while(1){
                    //      char bf[1024];
                    //      std::cout << "trying read" <<std::endl;
                    //     wss.read_some(boost::asio::buffer(bf,1024));

                    //     std::cout  << bf;
                    //     std::cout << "trying to wriyr" <<std::endl;
                    //     std::cout.flush();

                    //     wss.write(current_write());
                        
                    //  }
                std::cout << "over" << std::endl;
                wss.async_write(current_write(), recursion_write);
                start = clock();
                std::cout << "reading" << std::endl;
          //      d.expires_from_now(boost::posix_time::seconds(10));
            //    d.async_wait([&](const boost::system::error_code& error){
                                        // if(error.value() == 0)
// {
                    // std::cout << "time out occur"<<std::endl;
                                        // wss.close(boost::beast::websocket::close_code::normal);
// }
              //  });
                char bf[1024];
              //  wss.read_some(boost::asio::buffer(bf,1024));
                //std::cout  << bf;
                wss.async_read(buffer, recursion_read);
                // std::cout << "start reading"<<std::endl;
            };

            const auto on_ssl_handshake = [&wss, async_rw](auto)
            {
                // std::cerr << "on ssl handshake\n";
                // Set a decorator to change the User-Agent of the handshake
               
                wss.async_handshake(ws_host, ws_path, async_rw);
            };

            const auto on_connect = [&wss, async_rw](auto)
            {
                std::cout << "on connect\n";
                // Set SNI Hostname (many hosts need this to handshake successfully)
                
                wss.set_option(
            websocket::stream_base::timeout::suggested(
                beast::role_type::client));

        // Set a decorator to change the User-Agent of the handshake
        wss.set_option(websocket::stream_base::decorator(
            [](websocket::request_type& req)
            {
                req.set(http::field::user_agent,
                    std::string(BOOST_BEAST_VERSION_STRING) +
                        " websocket-client-async");
            }));

                // 1.2 Perform the SSL handshake
                                wss.async_handshake(ws_host, ws_path, async_rw);

                // wss.next_layer().async_handshake(ssl::stream_base::client, on_ssl_handshake);
            };

            // actual starting code
            boost::asio::ip::tcp::resolver resolver(ioc);
            boost::asio::ip::tcp::resolver::query resolver_query(ws_host, ws_port,
                                                                 boost::asio::ip::tcp::resolver::query::numeric_service);
            const auto rr = resolver.resolve(ws_host, ws_port);
            const boost::asio::ip::tcp::endpoint endpoint(*rr);
            // ready to go, once ioc.run(); executed chain of callbacks will go upward from here
            beast::get_lowest_layer(wss).async_connect(endpoint, on_connect);

            // launching possibility to use async_*** functions (event loop)
            // real read/write happens when callback exits, so can't use deep loops there, must be fast
            ioc.run();

            std::cout << std::endl
                      << std::endl
                      << "FINAL: " << beast::make_printable(buffer.data()) << std::endl;
            std::cout << std ::endl
                      << w1 << "  " << w2;
        }
    }
    return result;
}
