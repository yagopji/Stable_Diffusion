# ⚡ 빠른 시작 가이드 (Quick Start)

## 🎯 30초 안에 시작하기

```bash
cd stable-diffusion-webui
chmod +x webui.sh
./webui.sh
```

브라우저에서 `http://localhost:7860` 접속!

---

## 📋 체크리스트

### ✅ 실행 전 확인사항

- [ ] Python 3.10 설치됨 (`python3 --version`)
- [ ] Git 설치됨 (`git --version`)
- [ ] 충분한 디스크 공간 (최소 10GB)
- [ ] GPU가 있다면 CUDA 드라이버 설치됨

### ✅ 첫 실행 시

- [ ] 가상환경 자동 생성 (venv 폴더)
- [ ] 라이브러리 자동 설치 (5-10분)
- [ ] 모델 자동 다운로드 (처음만, 시간 소요)

### ✅ 실행 후

- [ ] 브라우저에서 `http://localhost:7860` 접속
- [ ] "txt2img" 탭에서 프롬프트 입력
- [ ] "Generate" 버튼 클릭
- [ ] 이미지 생성 확인!

---

## 🚨 자주 발생하는 문제

### 문제: "bash: ./webui.sh: Permission denied"
**해결**:
```bash
chmod +x webui.sh
```

### 문제: "Python not found"
**해결**:
```bash
# Python 설치 확인
python3 --version

# webui-user.sh 편집
python_cmd="python3.10"
```

### 문제: "CUDA out of memory"
**해결**:
```bash
# webui-user.sh 편집
export COMMANDLINE_ARGS="--medvram"
```

### 문제: 모델이 안 보임
**해결**:
- WebUI 재시작
- Settings → Stable Diffusion → Refresh 클릭

---

## 💡 첫 이미지 생성하기

1. **프롬프트 입력**:
   ```
   a cute cat, kawaii style, high quality, detailed
   ```

2. **설정**:
   - Width: 512
   - Height: 512
   - Sampling Steps: 20
   - CFG Scale: 7

3. **Generate 클릭!**

---

## 📚 더 알아보기

- **[사용가이드.md](사용가이드.md)**: 상세 사용법
- **[동작원리_설명서.md](동작원리_설명서.md)**: 코드 구조 이해
- **[README.md](README.md)**: 전체 문서

---

**시작**: `cd stable-diffusion-webui && ./webui.sh` 🚀
