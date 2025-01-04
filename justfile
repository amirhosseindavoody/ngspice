configure:
    ./autogen.sh > autogen.log
    ./configure > config.log

make-make: configure
    make > make.log

clean:
    git clean -X -f -d

cmake-make: configure
    mkdir -p build
    cd build && cmake ..
    cd build && make

only-cmake-make:
    mkdir -p build
    cd build && cmake ..
    cd build && make
