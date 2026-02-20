#!/bin/bash
# GitHub에 푸시하는 스크립트

cd "$(dirname "$0")"

echo "🚀 Stable Diffusion WebUI 프로젝트 GitHub 푸시 스크립트"
echo ""

# 현재 원격 저장소 확인
CURRENT_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
echo "현재 원격 저장소: $CURRENT_REMOTE"
echo ""

# GitHub 사용자명 입력
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ 사용자명이 입력되지 않았습니다."
    exit 1
fi

# 원격 저장소 URL 설정
REPO_URL="https://github.com/${GITHUB_USERNAME}/Stable_Diffusion.git"
echo "원격 저장소 URL: $REPO_URL"
echo ""

# 원격 저장소 설정
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"

# 브랜치 이름 확인 및 변경
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "브랜치 이름을 main으로 변경 중..."
    git branch -M main
fi

# 상태 확인
echo "현재 상태:"
git status --short | head -10
echo ""

# 확인
read -p "푸시하시겠습니까? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "취소되었습니다."
    exit 0
fi

# 푸시
echo ""
echo "📤 푸시 중..."
if git push -u origin main; then
    echo ""
    echo "✅ 푸시 완료!"
    echo ""
    echo "저장소 주소: https://github.com/${GITHUB_USERNAME}/Stable_Diffusion"
else
    echo ""
    echo "❌ 푸시 실패"
    echo ""
    echo "가능한 원인:"
    echo "1. GitHub에 저장소가 생성되지 않았습니다"
    echo "   → https://github.com/new 에서 'Stable_Diffusion' 저장소 생성"
    echo ""
    echo "2. 인증 문제"
    echo "   → Personal Access Token 사용 필요"
    echo "   → GitHub → Settings → Developer settings → Personal access tokens"
    echo ""
    echo "3. 저장소 이름이 다릅니다"
    echo "   → 저장소 이름이 'Stable_Diffusion'인지 확인"
fi
