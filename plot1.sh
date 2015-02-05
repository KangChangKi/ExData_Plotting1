#!/bin/bash

rm ~/Desktop/plot1.png
r -q -f plot1.R 2>&1 >/dev/null
ll ~/Desktop/plot1.png
open ~/Desktop/plot1.png
