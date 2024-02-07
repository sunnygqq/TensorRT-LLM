import subprocess

model = "gptj_6b"
mode = "plugin"
batch_sizes = "1;4;8"
log_level = "info"
# engine_dir = "/home/nvcntse/qgai/tekit-internal/examples/qwen/trt_engines/fp16/Qwen-7B-Chat-int4/"
engine_dir = "/home/nvcntse/qgai/tekit-internal/examples/gptj/gptj_engine"

dir_name = "GPTJ_int4_awq"
import os
if not os.path.exists(dir_name):
    os.makedirs(dir_name)
    print("文件夹已创建")
else:
    print("文件夹已存在")
enable_cuda_graph = True

# input_output_lens = [
#     "128,128",
#     "256,256",
#     "512,512",
#     "1024,1024",
#     "2048,2048",

# ]
input_output_lens = [
    "128,1",
    "256,1",
    "512,1",
    "1024,1",
    "2048,1",

]


for input_output_len in input_output_lens:
    command = f"python3 benchmark.py \
        --model {model} \
        --mode {mode} \
        --batch_size \"{batch_sizes}\" \
        --input_output_len \"{input_output_len}\" \
        --log_level \"{log_level}\" \
        --engine_dir {engine_dir} \
        {'--enable_cuda_graph' if enable_cuda_graph else ''}"

    log_file = dir_name+ f"_{input_output_len.replace(',', '_')}.log"
    log_file_dir = os.path.join(dir_name,log_file)
    subprocess.call(f"{command} > {log_file_dir} 2>&1", shell=True)