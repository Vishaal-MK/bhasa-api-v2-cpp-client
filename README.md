## Prerequisites

* **CMake v3.12+** - found at [https://cmake.org/](https://cmake.org/)

* **C++ Compiler** - needs to support at least the **C++17** standard, i.e. *MSVC*,
*GCC*, *Clang*

* **BOOST v1.70** - found at [https://www.boost.org/](https://www.boost.org/)

* **OpenSSL** - found at [https://www.openssl.org/](https://www.openssl.org/)



## Building

Build by running `cmake` in the dir, and then use `make` to build the desired target.

Example:

``` bash
> cmake .
> make
```

## Running

``` bash
> ./transcription_cpp_client <path/to/audio_file> <API-KEY>
```