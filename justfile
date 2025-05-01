clean:
    git clean -X -f -d

format:
    find . -name 'CMakeLists.txt' | xargs cmake-format -i

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

gcc-make: clean-build
    clear
    cmake --preset gcc
    cmake --build --preset gcc

clang-make: clean-build
    clear
    cmake --preset clang
    cmake --build --preset clang
    # ./build/src/ngspice_main