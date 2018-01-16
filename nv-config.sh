#!/bin/bash

for x in 0 1 2 3 4 5; do
	nvidia-settings -a [gpu:$x]/GpuPowerMizerMode=1
done
