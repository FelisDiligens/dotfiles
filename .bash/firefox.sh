# Export required variables if nvidia-vaapi-driver is installed.
# See: https://github.com/elFarto/nvidia-vaapi-driver
if [ -x "$(command -v exa)" ] && dnf list installed nvidia-vaapi-driver --quiet &>/dev/null; then
    # The driver requires that Firefox uses the EGL backend.
    export MOZ_X11_EGL=1
    # The direct backend is currently required on NVIDIA driver series 525 due to a regression.
    export NVD_BACKEND=direct
    # Disables the sandbox for the RDD process that the decoder runs in.
    export MOZ_DISABLE_RDD_SANDBOX=1
    # This forces libva to load the nvidia backend.
    export LIBVA_DRIVER_NAME=nvidia
fi