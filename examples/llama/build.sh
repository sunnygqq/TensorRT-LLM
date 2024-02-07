#/!bin/bash
python3 build.py --model_dir /home/nvcntse/qgai/jingwei_station/llama-2-7b-chat-hf/ \
                --quant_ckpt_path /home/nvcntse/qgai/jingwei_station/llama-2-7b-chat-4bit-gs128.safetensors \
                --dtype float16 \
                --remove_input_padding \
                --use_gpt_attention_plugin float16 \
                --use_gemm_plugin float16 \
                --use_weight_only \
                --weight_only_precision int4_gptq \
                --per_group \
                --enable_context_fmha \
                --output_dir ./tmp/llama/7B/trt_engines/int4_GPTQ/1-gpu-test/ \
                --visualize \
                --use_rmsnorm_plugin \
                --log_level verbose  > build_fmha.log 2>&1 &
