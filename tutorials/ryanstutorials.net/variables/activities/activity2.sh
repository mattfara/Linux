#!/bin/bash

allWords=$(cat /usr/share/dict/words)

echo $allWords[$RANDOM]
