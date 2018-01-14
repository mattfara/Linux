#!/bin/bash

echo hello world
echo 'this bash script is called: '		   $0
echo 'hostname: '                          $HOSTNAME
echo 'arguments passed in: '               $#
echo 'all the arguments passed in: '       $@
echo 'exit status: '                       $?
echo 'process ID: '                        $$
echo 'user running this: '                 $USER
echo 'time since script started: '         $SECONDS
echo 'a random number: '                   $RANDOM
echo 'line number where this was called: ' $LINENO


