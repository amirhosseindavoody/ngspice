clean:
    git clean -X -f -d

configure: clean
    ./autogen.sh > autogen.log
    ./configure > config.log

make-make: configure
    make > make.log

clean-build:
    rm -rf build

only-cmake-make:
    cmake --preset clang
    cmake --build --preset clang

cmake-make: configure clean-build only-cmake-make    