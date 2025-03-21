#!/bin/bash

# Function to check CPU utilization
check_cpu() {
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  echo $cpu_usage
}

# Function to check memory utilization
check_memory() {
  memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  echo $memory_usage
}

# Function to check disk space utilization
check_disk() {
  disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
  echo $disk_usage
}

# Main script
cpu=$(check_cpu)
memory=$(check_memory)
disk=$(check_disk)

if [ "$1" == "explain" ]; then
  echo "CPU usage: $cpu%"
  echo "Memory usage: $memory%"
  echo "Disk usage: $disk%"
fi

if (( $(echo "$cpu < 60" | bc -l) )) && (( $(echo "$memory < 60" | bc -l) )) && (( $(echo "$disk < 60" | bc -l) )); then
  echo "VM is healthy"
else
  echo "VM is unhealthy"
fi
