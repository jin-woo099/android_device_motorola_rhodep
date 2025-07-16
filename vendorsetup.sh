#!/bin/bash

clone_if_missing() {
    local repo_url=$1
    local branch=$2
    local target_dir=$3

    if [ ! -d "$target_dir" ]; then
        echo "Cloning $target_dir..."
        if [ -n "$branch" ]; then
            git clone "$repo_url" -b "$branch" "$target_dir"
        else
            git clone "$repo_url" "$target_dir"
        fi
        echo "Done."
    fi
}

# Git clones
clone_if_missing "https://github.com/jin-woo099/android_device_motorola_rhodep.git" "" "device/motorola/rhodep"
clone_if_missing "https://github.com/jin-woo099/android_device_motorola_sm6375-common.git" "" "device/motorola/sm6375-common"
clone_if_missing "https://gitlab.com/Motorola-SM6375-Devs/proprietary_vendor_motorola_rhodep.git" "" "vendor/motorola/rhodep"
clone_if_missing "https://github.com/jin-woo099/android_vendor_motorola_sm6375-common.git" "" "vendor/motorola/sm6375-common"
clone_if_missing "https://github.com/jin-woo099/kernel_motorola_sm6375.git" "" "kernel/motorola/sm6375"

# Additional repos
clone_if_missing "https://github.com/jin-woo099/android_hardware_motorola.git" "15.0" "hardware/motorola"
