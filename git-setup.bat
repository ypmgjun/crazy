@echo off
chcp 65001 >nul
echo GitHub 저장소 설정 중...
cd /d "%~dp0"

if not exist ".git" (
    git init
    echo Git 초기화 완료
)

git remote remove origin 2>nul
git remote add origin https://github.com/ypmgjun/crazy.git
echo Remote origin 설정: https://github.com/ypmgjun/crazy.git

git add .
git status
echo.
echo 아래 명령으로 커밋 후 푸시하세요:
echo   git add .
echo   git commit -m "메시지"
echo   git push -u origin main
echo.
echo 또는 'main' 대신 'master' 브랜치를 사용하는 경우:
echo   git push -u origin master
pause
