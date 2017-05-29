#!/bin/sh

#RSA-AES Encryption
openssl genrsa -out private.pem 2048
openssl rsa -in private.pem -outform PEM -pubout -out public.pem

openssl rand -base64 32 > key.bin

openssl rsautl -encrypt -inkey public.pem -pubin -in key.bin -out key.bin.enc
openssl enc -aes-256-cbc -salt -in image.tiff -out image.tiff.enc -pass file:./key.bin


#ECDSA Signature
openssl dgst -sha256 -sign private.pem image.tiff > imagesignature.der
openssl dgst -sha256 -hex -sign private.pem image.tiff > rsasha.txt

hexdump imagesignature.der

openssl dgst -sha256 -verify public.pem -signature imagesignature.der image.tiff
