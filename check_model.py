#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys

MODEL_DIR = "/home/01_AI그림생성_Stable_Diffusion/stable-diffusion-webui/models/Stable-diffusion"
MODEL_FILE = "v1-5-pruned-emaonly.safetensors"
FULL_PATH = os.path.join(MODEL_DIR, MODEL_FILE)

print("=" * 60)
print("📥 모델 다운로드 확인")
print("=" * 60)
print(f"\n📁 확인 경로: {FULL_PATH}")
print()

if os.path.exists(FULL_PATH):
    print("✅ 파일 존재함!")
    print()
    
    file_size = os.path.getsize(FULL_PATH)
    size_gb = file_size / (1024**3)
    
    print("📊 파일 정보:")
    print(f"   파일명: {MODEL_FILE}")
    print(f"   크기: {size_gb:.2f} GB ({file_size:,} 바이트)")
    print()
    
    if size_gb >= 3.5:
        print("✅ 다운로드 완료!")
        print("   파일 크기가 정상 범위입니다 (3.5-4.5 GB)")
        print()
        print("🚀 다음 단계:")
        print("   1. WebUI 접속: http://localhost:7860")
        print("   2. Settings → Stable Diffusion")
        print("   3. Refresh 버튼 클릭")
        print("   4. 모델 선택 후 Apply settings")
    else:
        percentage = (size_gb / 4.0) * 100
        remaining_gb = 4.0 - size_gb
        print(f"🔄 다운로드 진행 중...")
        print(f"   진행률: {percentage:.1f}%")
        print(f"   남은 크기: 약 {remaining_gb:.2f} GB")
else:
    print("❌ 파일이 없습니다.")
    print()
    
    if os.path.exists(MODEL_DIR):
        print("📁 폴더 내용:")
        try:
            files = os.listdir(MODEL_DIR)
            if files:
                for f in sorted(files):
                    filepath = os.path.join(MODEL_DIR, f)
                    if os.path.isfile(filepath):
                        size = os.path.getsize(filepath)
                        size_gb = size / (1024**3)
                        print(f"   - {f}: {size_gb:.2f} GB")
            else:
                print("   (폴더가 비어있습니다)")
        except Exception as e:
            print(f"   오류: {e}")
    else:
        print(f"⚠️ 폴더가 존재하지 않습니다: {MODEL_DIR}")
    
    print()
    print("💡 다운로드가 필요합니다.")
    print()
    print("다운로드 명령어:")
    print(f"cd {MODEL_DIR}")
    print("wget --progress=bar:force https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors")

print()
print("=" * 60)
