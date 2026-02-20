#!/bin/bash

echo "=========================================="
echo "📥 모델 다운로드 확인 스크립트"
echo "=========================================="
echo ""

MODEL_DIR="/home/01_AI그림생성_Stable_Diffusion/stable-diffusion-webui/models/Stable-diffusion"
MODEL_FILE="v1-5-pruned-emaonly.safetensors"
FULL_PATH="${MODEL_DIR}/${MODEL_FILE}"

echo "📁 확인 경로: ${FULL_PATH}"
echo ""

if [ -f "$FULL_PATH" ]; then
    echo "✅ 파일 존재함!"
    echo ""
    echo "📊 파일 정보:"
    ls -lh "$FULL_PATH"
    echo ""
    
    FILE_SIZE=$(stat -c%s "$FULL_PATH" 2>/dev/null)
    SIZE_GB=$(echo "scale=2; $FILE_SIZE / 1024 / 1024 / 1024" | bc)
    
    echo "📦 파일 크기: ${SIZE_GB} GB"
    echo ""
    
    if (( $(echo "$SIZE_GB >= 3.5" | bc -l) )); then
        echo "✅ 다운로드 완료!"
        echo "   파일 크기가 정상 범위입니다 (3.5-4.5 GB)"
    else
        PERCENTAGE=$(echo "scale=1; $SIZE_GB / 4.0 * 100" | bc)
        echo "🔄 다운로드 진행 중..."
        echo "   진행률: ${PERCENTAGE}%"
        echo "   남은 크기: 약 $(echo "scale=2; 4.0 - $SIZE_GB" | bc) GB"
    fi
else
    echo "❌ 파일이 없습니다."
    echo ""
    echo "📁 폴더 내용:"
    ls -lah "$MODEL_DIR" 2>&1 | head -10
    echo ""
    echo "💡 다운로드가 필요합니다."
fi

echo ""
echo "=========================================="
