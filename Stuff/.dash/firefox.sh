#!/bin/sh

#   _  ___   _____ ___ ___   _   
#  | \| \ \ / /_ _|   \_ _| /_\  
#  | .` |\ V / | || |) | | / _ \ 
#  |_|\_| \_/ |___|___/___/_/ \_\
#

# Export required variables if nvidia-vaapi-driver is installed.
# See: https://github.com/elFarto/nvidia-vaapi-driver

# if [ -f "/usr/lib64/dri/nvidia_drv_video.so" ] || [ -f "/usr/lib/x86_64-linux-gnu/dri/nvidia_drv_video.so" ]; then
#     # The driver requires that Firefox uses the EGL backend.
#     export MOZ_X11_EGL=1
#     # The direct backend is currently required on NVIDIA driver series 525 due to a regression.
#     export NVD_BACKEND=direct
#     # Disables the sandbox for the RDD process that the decoder runs in.
#     export MOZ_DISABLE_RDD_SANDBOX=1
#     # This forces libva to load the nvidia backend.
#     export LIBVA_DRIVER_NAME=nvidia
#     # Required on FF98+ when running on Wayland, due to a regression that has been introduced.
#     [ "$XDG_SESSION_TYPE" == "wayland" ] && export EGL_PLATFORM=wayland
# fi

#     _   __  __ ___    ___         _              
#    /_\ |  \/  |   \  | _ \__ _ __| |___ ___ _ _  
#   / _ \| |\/| | |) | |   / _` / _` / -_) _ \ ' \ 
#  /_/ \_\_|  |_|___/  |_|_\__,_\__,_\___\___/_||_|
#

# Export required variables for mesa and libva-vdpau-driver.
# See https://wiki.archlinux.org/title/Hardware_video_acceleration

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
export VDPAU_DRIVER=radeonsi
export LIBVA_DRIVER_NAME=radeonsi