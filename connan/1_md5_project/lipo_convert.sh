#! /usr/bin/env bash

for FILE in armv7/lib/*.a
do 
    lipo -create ${FILE} ${FILE/armv7/armv8} -output ${FILE/armv7/.}
done