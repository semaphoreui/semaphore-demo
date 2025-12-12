#!/bin/bash

# Detect operating system
os=$(uname)
echo "Operating System: $os"
echo "--------------------------------------"

if [[ "$os" == "Linux" ]]; then
    # Print number of CPUs
    echo "CPU cores: $(nproc)"
    
    # Print memory details using free (includes total, used, free)
    echo ""
    echo "Memory Information (Linux):"
    free -h
    
    # Print disk usage for the root filesystem
    echo ""
    echo "Disk Usage (root):"
    df -h /
    
elif [[ "$os" == "Darwin" ]]; then
    # Print number of CPUs
    echo "CPU cores: $(sysctl -n hw.ncpu)"
    
    # Get total memory (in bytes) and convert to GB (using bc)
    total_mem_bytes=$(sysctl -n hw.memsize)
    total_mem_gb=$(echo "scale=2; $total_mem_bytes/1024/1024/1024" | bc)
    echo ""
    echo "Total RAM: ${total_mem_gb} GB"
    
    # For memory usage, parse the output of 'top'
    # Example output: "PhysMem: 8192M used (360M wired), 13728M unused."
    mem_usage=$(top -l 1 | grep PhysMem)
    echo "Memory usage: $mem_usage"
    
    # Disk usage for the root filesystem
    echo ""
    echo "Disk Usage (root):"
    df -h /

    # А тутЬ мы выведем что-нибудь прикольное, но нетЬ.
    echo ""
    echo "курлык-курлык"
    
else
    echo "Unsupported OS: $os"
fi
