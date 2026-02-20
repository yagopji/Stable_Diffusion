#!/bin/bash

echo "=========================================="
echo "🔍 이미지 생성 문제 진단 스크립트"
echo "=========================================="
echo ""

# 1. WebUI 프로세스 확인
echo "1️⃣ WebUI 프로세스 확인:"
if pgrep -f "webui\|launch.py" > /dev/null; then
    echo "   ✅ WebUI가 실행 중입니다"
    ps aux | grep -E "webui|launch.py" | grep -v grep | head -3
else
    echo "   ❌ WebUI가 실행되지 않았습니다"
fi
echo ""

# 2. 포트 확인
echo "2️⃣ 포트 7860 확인:"
if netstat -tlnp 2>/dev/null | grep :7860 > /dev/null || ss -tlnp 2>/dev/null | grep :7860 > /dev/null; then
    echo "   ✅ 포트 7860이 열려있습니다"
else
    echo "   ❌ 포트 7860이 열려있지 않습니다"
fi
echo ""

# 3. 모델 파일 확인
echo "3️⃣ 모델 파일 확인:"
MODEL_DIR="/home/01_AI그림생성_Stable_Diffusion/stable-diffusion-webui/models/Stable-diffusion"
MODEL_FILE="v1-5-pruned-emaonly.safetensors"

if [ -f "$MODEL_DIR/$MODEL_FILE" ]; then
    SIZE=$(stat -c%s "$MODEL_DIR/$MODEL_FILE" 2>/dev/null)
    SIZE_GB=$(echo "scale=2; $SIZE / 1024 / 1024 / 1024" | bc)
    echo "   ✅ 모델 파일 존재: $SIZE_GB GB"
    if (( $(echo "$SIZE_GB >= 3.5" | bc -l) )); then
        echo "   ✅ 파일 크기 정상"
    else
        echo "   ⚠️ 파일 크기가 작습니다 (다운로드 미완료 가능)"
    fi
else
    echo "   ❌ 모델 파일이 없습니다: $MODEL_FILE"
fi
echo ""

# 4. GPU 확인
echo "4️⃣ GPU 확인:"
if command -v nvidia-smi &> /dev/null; then
    echo "   GPU 정보:"
    nvidia-smi --query-gpu=name,memory.total,memory.used --format=csv,noheader,nounits 2>/dev/null | head -1 || echo "   GPU 정보를 가져올 수 없습니다"
else
    echo "   ⚠️ nvidia-smi를 찾을 수 없습니다 (CPU 모드일 수 있음)"
fi
echo ""

# 5. 로그 파일 확인
echo "5️⃣ 최근 로그 확인:"
LOG_FILE="/home/01_AI그림생성_Stable_Diffusion/stable-diffusion-webui/nohup.out"
if [ -f "$LOG_FILE" ]; then
    echo "   최근 에러 메시지:"
    tail -30 "$LOG_FILE" | grep -i "error\|exception\|traceback\|failed" | tail -5 || echo "   최근 에러 없음"
else
    echo "   ⚠️ 로그 파일을 찾을 수 없습니다"
fi
echo ""

# 6. Python 환경 확인
echo "6️⃣ Python 환경 확인:"
VENV_PATH="/home/01_AI그림생성_Stable_Diffusion/stable-diffusion-webui/venv"
if [ -d "$VENV_PATH" ]; then
    echo "   ✅ 가상환경 존재"
    if [ -f "$VENV_PATH/bin/python" ]; then
        echo "   Python 버전: $($VENV_PATH/bin/python --version 2>&1)"
    fi
else
    echo "   ⚠️ 가상환경을 찾을 수 없습니다"
fi
echo ""

echo "=========================================="
echo "💡 다음 단계:"
echo "1. WebUI가 실행 중이 아니면 ./webui.sh 실행"
echo "2. 브라우저에서 http://localhost:7860 접속"
echo "3. Settings → Stable Diffusion에서 모델 선택 확인"
echo "4. 브라우저 콘솔(F12)에서 에러 확인"
echo "=========================================="
