#!/bin/bash

# Configure zram swap
zram_config() {
  # Disable existing swap
  swapoff -a

  # Set zram device and algorithm (change lz4 to desired option)
  zram_dev="/dev/zram0"
  zram_algo="lz4"

  # Set zram size (adjust based on your needs)
  zram_size="24G"

  # Create zram device
  echo "${zram_algo}" > "/sys/block/${zram_dev}/comp_algorithm"
  echo "${zram_size}" > "/sys/block/${zram_dev}/disksize"

  # Format and activate zram swap
  mkswap "${zram_dev}"
  swapon "${zram_dev}"

  # Add fstab entry (uncomment if desired for persistence across reboots)
  # echo "/dev/zram0 none swap defaults 0 0" >> /etc/fstab
}

# Enable zram on boot (modify as needed for your systemd setup)
zram_service() {
  # systemctl enable zramswap
}

# Call functions
zram_config
zram_service

echo "zRAM is now configured."
