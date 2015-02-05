#!/bin/bash

rm ./plot1.png
r -q -f plot1.R 2>&1 >/dev/null
open ./plot1.png
