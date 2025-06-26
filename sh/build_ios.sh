#!/bin/bash
set -e

# iOSプロジェクト名はプロジェクトルート名と合わせて
APP_NAME="pong"
PROJECT_DIR="${APP_NAME}-ios"
DICTIONARY="src" 
PYTHON_LIB="$HOME/.kivy-ios/build/python3/build/lib/libpython3.a"

echo "🔍 Python3 iOSビルドの確認"
if [ ! -f "$PYTHON_LIB" ]; then
    echo "📥 Python3 を iOS 向けにビルドします..."
    toolchain build python3
else
    echo "✅ Python3 は既にビルド済みです"
fi

echo "🔧 Kivy コアライブラリのビルド"
toolchain build kivy

echo "📦 iOS アプリプロジェクト作成 or 再利用"
if [ ! -d "$PROJECT_DIR" ]; then
    toolchain create "$APP_NAME" "$DICTIONARY"
else
    echo "✅ 既存の $PROJECT_DIR を再利用します"
fi

echo "📁 アイコンを同期 (icon.png → $PROJECT_DIR/icon.png)"
rm -rf "$PROJECT_DIR/icon.png"
cp icon.png "$PROJECT_DIR/icon.png"

echo "✅ 完了: $PROJECT_DIR に iOS ビルド環境が整いました"
