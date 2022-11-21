cmake_minimum_required(VERSION 3.12)

project(tanscription_cpp_client LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


#used for beast::websocket
find_package(Boost 1.70 REQUIRED)

#openSSL / crypto required by boost-websocket
find_package(OpenSSL REQUIRED)

add_executable(tanscription_cpp_client
    wav_loader.h
    main.cpp)

target_include_directories(tanscription_cpp_client PUBLIC ${Boost_INCLUDE_DIRS})

#library to load root certificates for SSL as it is OS-specifiec
#https://github.com/djarek/certify
#https://github.com/boostorg/beast/issues/2194
add_subdirectory(certify)
target_link_libraries(tanscription_cpp_client certify::core)

#tbb is used by C++17 standard to do threads and should be linked explicit
target_link_libraries(tanscription_cpp_client tbb ${Boost_LIBRARIES} ${OPENSSL_CRYPTO_LIBRARY} ${OPENSSL_SSL_LIBRARY})

#from https://github.com/adamstark/AudioFile/blob/master/CMakeLists.txt
if(MSVC)
  # needed for M_PI macro
  add_compile_definitions(-D_USE_MATH_DEFINES)
endif()

