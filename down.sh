#!/bin/bash

MODE=".llm-mode"
LLM_MODE_NVIDIA="NVIDIA-GPU"
LLM_MODE_CPU="CPU"

ACTUAL_MODE=$(< $MODE)
case "$ACTUAL_MODE" in 

    "$LLM_MODE_NVIDIA")
        echo "Stop NVIDIA GPU setup"
        docker-compose -f docker-compose-nvidia.yml down
        ;;

    "$LLM_MODE_CPU") 
        echo "Stop CPU setup"
        docker-compose -f docker-compose.yml down
        ;;

    *)
        echo "Nothing to stop"
        ;; 

esac
