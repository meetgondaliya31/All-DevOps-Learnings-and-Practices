#!/bin/bash


create(){
	mkdir demo
}

if ! create; then
	echo "this directory already exists!!"
	exit 1
fi

echo 'directory created'
