#!/bin/bash
set -e

# 创建临时工作目录
tmp_dir=$(mktemp -d "/tmp/current_copy.XXXXXX")

# 复制当前目录到临时目录
current_dir=$(basename "$(pwd)")
cp -a . "$tmp_dir/$current_dir"

# 进入副本目录处理
cd "$tmp_dir/$current_dir"
echo "当前处理目录：$(pwd)"

# 删除指定目录
find . -type d \( -name "build" -o -name ".git" -o -path "./演示说明" -o -path "./theme/easyboard" -o -path "./theme/木易iPhone键盘" -o -path "./theme/jumboboard" \) -exec rm -rf {} + 2>/dev/null

# 打包为zip（带时间戳）
zip_name="${current_dir}_$(date +%Y%m%d%H%M%S).zip"
zip -rq "$zip_name" .

# 移动zip到原目录
mv "$zip_name" "$OLDPWD"

# 清理临时目录
rm -rf "$tmp_dir"

echo "操作完成，生成的ZIP包：$OLDPWD/$zip_name"