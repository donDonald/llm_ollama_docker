#!/bin/bash

NVTOOLKIT="nvidia-container-toolkit"
MODE=".llm-mode"
LLM_MODE_NVIDIA="NVIDIA-GPU"
LLM_MODE_CPU="CPU"
rm -rf "$MODE"

if command -v "$NVTOOLKIT" >/dev/null 2>&1; then
    if "$NVTOOLKIT" --version >/dev/null 2>&1; then
        echo "✅ '$NVTOOLKIT' installed"
        echo "Running on NVIDIA GPU"
        echo "$LLM_MODE_NVIDIA" &> "$MODE"
        docker-compose -f docker-compose-nvidia.yml up -d
    fi
else
    echo "Here is no $NVTOOLKIT installed, no NVIDIA is supported"
    echo "Running on CPU"
    echo "$LLM_MODE_CPU" &> "$MODE"
    docker-compose -f docker-compose.yml up -d
fi
