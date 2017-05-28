#!/bin/sh

head -n 3 image.ppm > header.txt
tail -n +4 image.ppm > body.bin
openssl enc -aes-128-ecb -e -in  body.bin -out body.ecb.bin -K 1001011
cat header.txt body.ecb.bin > image.ecb.ppm

openssl enc -aes-128-ecb -e -in  body.bin -out body.cbc.bin -K 1001011 
cat header.txt body.cbc.bin > image.cbc.ppm 