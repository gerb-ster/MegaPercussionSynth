#!/bin/bash

source ../../.project

IO_FILE=../src/ioboard/ioboard-left.brd
if [[ -f "$IO_FILE" ]]; then
    rm -Rf ../../gerber_files/$PROJECT_NAME-ioboard-left

    mkdir ./tmp-io
    eagle -X -dCAMJOB -j./jlcpcb_2_layer_v9.cam -o./tmp-io $IO_FILE
    mv ./tmp-io/tmp-io/* ./tmp-io/
    rm -Rf ./tmp-io/tmp-io
    cd ./tmp-io
    for f in * ; do mv -- "$f" "$PROJECT_NAME-$f" ; done
    cd ../

    mv ./tmp-io/$PROJECT_NAME-BOM.html ../BOM/$PROJECT_NAME-ioboard-left.html
    echo "$(tail -n +2 ../BOM/$PROJECT_NAME-ioboard-left.html)" > ../BOM/$PROJECT_NAME-ioboard-left.html

    mkdir ../../gerber_files/$PROJECT_NAME-ioboard-left
    mv ./tmp-io/* ../../gerber_files/$PROJECT_NAME-ioboard-left
    rm -Rf ./tmp-io

    if [[ -f "../src/ioboard/ioboard-left.png" ]]; then
        mv ../src/ioboard/ioboard-left.png ../$PROJECT_NAME-ioboard-left.png
    fi

    if [[ -f "../src/ioboard/ioboard-left.pdf" ]]; then
        mv ../src/ioboard/ioboard-left.pdf ../$PROJECT_NAME-ioboard-left.pdf
    fi
fi

IO_FILE=../src/ioboard/ioboard-right.brd
if [[ -f "$IO_FILE" ]]; then
    rm -Rf ../../gerber_files/$PROJECT_NAME-ioboard-right

    mkdir ./tmp-io
    eagle -X -dCAMJOB -j./jlcpcb_2_layer_v9.cam -o./tmp-io $IO_FILE
    mv ./tmp-io/tmp-io/* ./tmp-io/
    rm -Rf ./tmp-io/tmp-io
    cd ./tmp-io
    for f in * ; do mv -- "$f" "$PROJECT_NAME-$f" ; done
    cd ../

    mv ./tmp-io/$PROJECT_NAME-BOM.html ../BOM/$PROJECT_NAME-ioboard-right.html
    echo "$(tail -n +2 ../BOM/$PROJECT_NAME-ioboard-right.html)" > ../BOM/$PROJECT_NAME-ioboard-right.html

    mkdir ../../gerber_files/$PROJECT_NAME-ioboard-right
    mv ./tmp-io/* ../../gerber_files/$PROJECT_NAME-ioboard-right
    rm -Rf ./tmp-io

    if [[ -f "../src/ioboard/ioboard-right.png" ]]; then
        mv ../src/ioboard/ioboard-right.png ../$PROJECT_NAME-ioboard-right.png
    fi

    if [[ -f "../src/ioboard/ioboard-right.pdf" ]]; then
        mv ../src/ioboard/ioboard-right.pdf ../$PROJECT_NAME-ioboard-right.pdf
    fi
fi

MB_FILE=../src/mainboard/mainboard.brd
if [[ -f "$MB_FILE" ]]; then
    rm -Rf ../../gerber_files/$PROJECT_NAME-mainboard

    mkdir ./tmp-mb
    eagle -X -dCAMJOB -j./jlcpcb_2_layer_v9.cam -o./tmp-mb $MB_FILE
    mv ./tmp-mb/tmp-mb/* ./tmp-mb/
    rm -Rf ./tmp-mb/tmp-mb
    cd ./tmp-mb
    for f in * ; do mv -- "$f" "$PROJECT_NAME-$f" ; done
    cd ../

    mv ./tmp-mb/$PROJECT_NAME-BOM.html ../BOM/$PROJECT_NAME-mainboard.html
    echo "$(tail -n +2 ../BOM/$PROJECT_NAME-mainboard.html)" > ../BOM/$PROJECT_NAME-mainboard.html

    mkdir ../../gerber_files/$PROJECT_NAME-mainboard
    mv ./tmp-mb/* ../../gerber_files/$PROJECT_NAME-mainboard
    
    rm -Rf ./tmp-mb

    if [[ -f "../src/mainboard/mainboard.png" ]]; then
        mv ../src/mainboard/mainboard.png ../$PROJECT_NAME-mainboard.png
    fi

    if [[ -f "../src/mainboard/mainboard.pdf" ]]; then
        mv ../src/mainboard/mainboard.pdf ../$PROJECT_NAME-mainboard.pdf
    fi
fi