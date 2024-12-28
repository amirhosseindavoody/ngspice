compile:
    ./autogen.sh > autogen.log
    ./configure > config.log
    make > make.log

clean:
    git clean -X -f -d