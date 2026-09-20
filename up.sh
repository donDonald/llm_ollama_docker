#!/bin/bash

NVTOOLKIT="nvidia-container-toolkit"

if command -v "$NVTOOLKIT" >/dev/null 2>&1; then
    if "$NVTOOLKIT" --version >/dev/null 2>&1; then
        echo "✅ '$NVTOOLKIT' installed"
        echo "Running on NVIDIA GPU"
        docker-compose -f docker-compose-nvidia.yml up -d
    fi
else
    echo "Here is no $NVTOOLKIT installed, no NVIDIA is supported"
    echo "Running on CPU"
    docker-compose -f docker-compose.yml up -d
fi
