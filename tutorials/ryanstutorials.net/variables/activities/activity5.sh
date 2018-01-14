#!/bin/bash

theDate=$(date -I)
underscore="_"
dest="$theDate$underscore$1"



cp $1 $dest
