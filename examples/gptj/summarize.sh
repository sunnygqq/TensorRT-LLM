#!/bin/bash

python3  ../summarize.py --engine_dir gptj_engine_fp6_debug \
                        --hf_model_dir /home/scratch.qgai_sw/qgai/project/temp/gpt-j-6b \
                        --test_hf \
                        --batch_size 1 \
                        --test_trt_llm \
                        --tensorrt_llm_rouge1_threshold 14 \
                        --data_type fp16 \
                        --check_accuracy \
                        --log_level=verbose > summarize_gptj_engine_fp6_update.log 2>&1 &

# > run_log_v3.log 2>&1 & > summarize_gptj_engine_fp6_update.log 2>&1 &