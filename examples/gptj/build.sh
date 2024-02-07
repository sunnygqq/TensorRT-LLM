#!/bin/bash
# python3  build.py --dtype=float16 \
#                  --log_level=verbose \
#                  --use_gpt_attention_plugin float16 \
#                  --use_gemm_plugin float16 \
#                  --max_batch_size=8 \
#                  --max_input_len=1919 \
#                  --max_output_len=1024 \
#                  --remove_input_padding \
#                  --output_dir=gptj_engine \
#                  --use_weight_only \
#                  --per_group \
#                  --weight_only_precision=int4 \
#                  --paged_kv_cache \
#                  --model_dir=/work/gptj_awq_4bit > build_paged_kv_cache.log  2>&1 &
# # > build.log  2>&1 &  -m pdb  --enable_context_fmha \  --paged_kv_cache \  --use_inflight_batching \


python3  build.py --dtype=float16 \
                 --log_level=verbose \
                 --use_gpt_attention_plugin float16 \
                 --use_gemm_plugin float16 \
                 --max_batch_size=1 \
                 --max_input_len=1919 \
                 --max_output_len=1024 \
                 --max_beam_width=1 \
                 --remove_input_padding \
                 --output_dir=gptj_engine_fp6_debug \
                 --use_layernorm_plugin \
                 --enable_context_fmha \
                 --model_dir=/home/scratch.qgai_sw/qgai/project/temp/gpt-j-6b > build_fp16_v2.log  2>&1 &
#/work/gpt-j-6b  /work/build/models/GPTJ-6B/checkpoint-final  --max_beam_width=1 \
