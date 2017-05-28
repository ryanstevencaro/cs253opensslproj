#!/bin/sh

openssl dgst -sha1 -out sha1.txt image.tiff
openssl dgst -sha256 -out sha256.txt image.tiff
openssl dgst -sha512 -out sha512.txt image.tiff