clean:
    git clean -X -f -d

configure: clean
    ./autogen.sh > autogen.log
    ./configure > config.log

make-make: configure
    make > make.log

only-cmake-make:
    rm -rf build
    mkdir -p build
    cmake --preset clang
    cmake --build --preset clang

cmake-make: configure only-cmake-make    