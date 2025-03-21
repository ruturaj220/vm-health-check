# VM Health Check Script

This repository contains a shell script named `vm_health_check.sh` that analyzes the health of a virtual machine based on CPU, memory, and disk space utilization.

## Usage

To use the script, run the following command:

```bash
./vm_health_check.sh
```

To get an explanation of the health status, use the "explain" command line argument:

```bash
./vm_health_check.sh explain
```

## Health Check Criteria

The script checks the following criteria to determine the health of the virtual machine:

- **CPU Utilization**: The script uses the `top` command to check the CPU utilization. If the CPU utilization is less than 60%, the VM is considered healthy. If the CPU utilization is 60% or more, the VM is considered unhealthy.
- **Memory Utilization**: The script uses the `free` command to check the memory utilization. If the memory utilization is less than 60%, the VM is considered healthy. If the memory utilization is 60% or more, the VM is considered unhealthy.
- **Disk Space Utilization**: The script uses the `df` command to check the disk space utilization. If the disk space utilization is less than 60%, the VM is considered healthy. If the disk space utilization is 60% or more, the VM is considered unhealthy.

## Example Output

When running the script without the "explain" argument, the output will be either:

```
VM is healthy
```

or

```
VM is unhealthy
```

When running the script with the "explain" argument, the output will include the utilization percentages for CPU, memory, and disk space, along with the health status:

```
CPU usage: 45.5%
Memory usage: 50.2%
Disk usage: 55%
VM is healthy
```

or

```
CPU usage: 65.3%
Memory usage: 70.1%
Disk usage: 80%
VM is unhealthy
```
