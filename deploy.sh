#!/usr/bin/env bash
# 百里路 · 一键发布脚本
#
# 用法：
#   ./deploy.sh                      # 自动用时间戳作 commit
#   ./deploy.sh "lesson 002 名"      # 自定义 commit
#
# ===== 服务器信息 =====
SSH_USER="ubuntu"
SSH_HOST="124.222.164.101"
SSH_PORT="22"
REMOTE_PATH="/var/www/baili"
SITE_URL="https://baili.xxcode.work"
# ====================

set -e
cd "$(dirname "$0")"

if [ -n "$1" ]; then
  MSG="$1"
else
  MSG="update: $(date '+%Y-%m-%d %H:%M')"
fi

git add -A
if git diff --cached --quiet; then
  echo "ℹ️  本地无新改动，跳过 commit"
else
  git commit -m "$MSG"
  echo "✅ 已 commit：$MSG"
fi

echo "🚀 推送到 GitHub..."
git push

echo "🔄 通知服务器更新..."
ssh -p "$SSH_PORT" "${SSH_USER}@${SSH_HOST}" "cd ${REMOTE_PATH} && git pull"

echo ""
echo "✅ 全部完成。${SITE_URL} 已更新。"
