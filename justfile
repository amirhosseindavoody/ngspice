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
    cd build && cmake -GNinja ..
    cd build && ninja

only-cmake-make2:
    rm -rf build
    mkdir -p build
    cd build && cmake -S .. --preset clang 
    cmake --build ./build

cmake-make: configure only-cmake-make    