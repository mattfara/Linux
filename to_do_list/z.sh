#!/bin/bash

function zenity_message(){
	DISPLAY=:0 zenity --question --text="$1"
}

zenity_message $1


