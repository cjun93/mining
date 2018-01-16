#!/bin/bash

for x in 0 1 2 3 4 5; do
	nvidia-settings -a [gpu:$x]/GPUGraphicsClockOffset[3]=100       # For GTX 1060
  	nvidia-settings -a [gpu:$x]/GPUMemoryTransferRateOffset[3]=800  # For GTX 1060
#  	nvidia-settings -a [gpu:$x]/GPUGraphicsClockOffset[2]=100       # For P-106 or GTX 1050 Ti 
#  	nvidia-settings -a [gpu:$x]/GPUMemoryTransferRateOffset[2]=800  # For P-106 or GTX 1050 Ti
  	nvidia-settings -a [gpu:$x]/GpuPowerMizerMode=1
  	nvidia-settings -a [gpu:$x]/GPUFanControlState=1
  	nvidia-settings -a [fan:$x]/GPUTargetFanSpeed=80
done
