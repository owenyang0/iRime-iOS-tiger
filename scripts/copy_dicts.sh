#!/bin/bash

# 检查参数数量
if [ $# -ne 2 ]; then
    echo "用法: $0 <source_dir> <dest_dir>"
    exit 1
fi

source_dir="$1"
dest_dir="$2"

# 检查目标目录是否存在
if [ ! -d "$dest_dir" ]; then
    echo "错误：目标目录 $dest_dir 不存在"
    exit 2
fi

# 定义要复制的文件列表
files=(
    "core2022.dict.yaml"
    "tiger.dict.yaml"
    "tigress.dict.yaml"
    "tigress_ci.dict.yaml"
    "tigress_simp_ci.dict.yaml"
    "user_custom.dict.yaml"
)

# 复制文件
for file in "${files[@]}"; do
    cp -v "$source_dir/$file" "$dest_dir/"
done

echo "文件已成功复制到 $dest_dir"