#!/bin/sh

getMemoryPerCore() {
  echo "Parameter 1 (CPU Cores)  = $1"
  echo "Parameter 2 (RAM)        = $2"
  echo "Ergebnis (Ram pro Core)  = $(($2/$1))"
}

getCpuCores() {
  #cat /proc/cpuinfo | grep "cpu cores" | awk '{print $4}' | head -n 1

  read -p "Bitte Anzahl CPU Kerne eingeben: " cpuCores
  echo $cpuCores
}

getTotalMemory() {
  free -g | head -n 2 | tail -n 1 | awk '{print $2}'
}

getMetrics() {
  memory=$(getTotalMemory)
  cpuCores=$(getCpuCores)

  getMemoryPerCore $cpuCores $memory
}


getMetrics
