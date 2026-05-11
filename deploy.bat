@echo off
chcp 65001 > nul
cd /d "%~dp0"

echo.
echo ============================================
echo   アメニティ在庫管理アプリ デプロイ
echo ============================================
echo.

if not exist "zaiko_v1.html" (
  echo [エラー] zaiko_v1.html が見つかりません
  pause
  exit /b 1
)

echo [1/4] zaiko_v1.html を index.html にコピー...
copy /Y zaiko_v1.html index.html > nul
if errorlevel 1 (
  echo [エラー] コピーに失敗しました
  pause
  exit /b 1
)
echo       OK
echo.

echo [2/4] 変更をステージング...
git add -A
echo       OK
echo.

echo [3/4] コミット作成...
git commit -m "Update index.html" 2> nul
if errorlevel 1 (
  echo       変更なし、または既にコミット済み
) else (
  echo       OK
)
echo.

echo [4/4] GitHub に push...
git push origin main
if errorlevel 1 (
  echo.
  echo [エラー] push に失敗しました
  echo.
  echo - 初回はブラウザが自動で開くので GitHub にログインしてください
  echo - すでに最新の場合は気にしなくてOKです
  echo - ネットが繋がっているか確認してください
  pause
  exit /b 1
)

echo.
echo ============================================
echo   [完了] デプロイが終わりました
echo ============================================
echo.
echo 公開URL: https://scissors-estate.github.io/zaiko-app/
echo 反映には 1 から 2 分かかります。
echo.
pause