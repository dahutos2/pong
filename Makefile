.PHONY: setup run ios ios_open

# 仮想環境＋依存インストール（mac開発用）
setup:
	uv venv & uv pip install -r requirements.txt

# アプリ実行（mac開発用）
run:
	uv run python src/main.py

# iOSビルド
ios:
	bash sh/build_ios.sh

# Xcodeで開く（手動で実機ビルド・署名）
ios_open:
	open pong-ios/pong.xcodeproj
