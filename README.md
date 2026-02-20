# 🎨 Stable Diffusion WebUI - 빠른 시작 가이드

이 프로젝트는 Stable Diffusion을 쉽게 사용할 수 있게 만든 웹 인터페이스입니다.

---

## 🚀 빠른 시작 (3단계)

### 1단계: 필수 요구사항 확인

**시스템 요구사항**:
- Python 3.10.6 (3.8 ~ 3.11 가능)
- Git
- Linux/Windows/MacOS

**Linux 필수 패키지 설치**:
```bash
# Debian/Ubuntu
sudo apt install wget git python3 python3-venv libgl1 libglib2.0-0

# Red Hat/Fedora
sudo dnf install wget git python3 gperftools-libs libglvnd-glx
```

### 2단계: 프로젝트 실행

```bash
cd stable-diffusion-webui
chmod +x webui.sh
./webui.sh
```

**첫 실행 시**:
- 자동으로 Python 가상환경 생성
- 필요한 라이브러리 자동 설치 (5-10분 소요)
- 모델 자동 다운로드 (처음만)

### 3단계: 브라우저에서 접속

```
http://localhost:7860
```

---

## 📦 설치 방법

### 방법 A: 자동 설치 (권장)

```bash
# 프로젝트 폴더로 이동
cd stable-diffusion-webui

# 실행 권한 부여
chmod +x webui.sh

# 실행 (자동으로 모든 것을 설치)
./webui.sh
```

### 방법 B: 수동 설치

```bash
cd stable-diffusion-webui

# 가상환경 생성
python3.10 -m venv venv

# 가상환경 활성화
source venv/bin/activate  # Linux/Mac
# 또는
venv\Scripts\activate  # Windows

# 라이브러리 설치
pip install -r requirements.txt

# 실행
python webui.py
```

---

## 📋 프로젝트 구조

```
01_AI그림생성_Stable_Diffusion/
├── README.md                      # 이 파일 (빠른 시작 가이드)
├── 사용가이드.md                   # 상세 사용 설명서
├── 동작원리_설명서.md              # 코드 구조 및 동작 원리
├── 로컬복사_가이드.md              # 다른 환경으로 복사 가이드
├── requirements.txt                # Python 패키지 목록
└── stable-diffusion-webui/        # 메인 프로젝트 폴더
    ├── webui.sh                   # 실행 스크립트 (Linux/Mac)
    ├── webui.bat                  # 실행 스크립트 (Windows)
    ├── webui.py                   # 메인 프로그램
    ├── modules/                   # 핵심 모듈들
    ├── models/                    # AI 모델 저장소
    └── ...
```

---

## 🎯 주요 기능

- ✅ **텍스트 → 이미지**: 프롬프트로 이미지 생성
- ✅ **이미지 → 이미지**: 이미지 편집 및 변환
- ✅ **한글 프롬프트 지원**: 자동 번역 기능
- ✅ **다양한 스타일**: 애니메이션, 리얼리즘 등
- ✅ **이미지 확대**: 고해상도 변환
- ✅ **얼굴 복원**: GFPGAN, CodeFormer 지원

---

## 📚 상세 문서

- **[사용가이드.md](사용가이드.md)**: 웹 UI 사용 방법
- **[동작원리_설명서.md](동작원리_설명서.md)**: 코드 구조 및 동작 원리
- **[로컬복사_가이드.md](로컬복사_가이드.md)**: 다른 환경으로 복사하는 방법

---

## ⚙️ 설정

### GPU 메모리 부족 시

`stable-diffusion-webui/webui-user.sh` 파일을 편집:

```bash
export COMMANDLINE_ARGS="--medvram --opt-split-attention"
```

### CPU만 사용 시

```bash
export COMMANDLINE_ARGS="--use-cpu all --no-half"
```

### 포트 변경

```bash
export COMMANDLINE_ARGS="--port 7861"
```

---

## 🔧 문제 해결

### 문제 1: "Python not found"
```bash
# Python 버전 확인
python3 --version

# webui-user.sh에서 Python 경로 지정
python_cmd="python3.10"
```

### 문제 2: "Permission denied"
```bash
chmod +x webui.sh
chmod +x webui-user.sh
```

### 문제 3: "CUDA out of memory"
- GPU 메모리 부족
- `--medvram` 또는 `--lowvram` 옵션 사용
- 이미지 크기 줄이기

### 문제 4: 모델이 목록에 안 보임
- WebUI 재시작
- Settings → Stable Diffusion → **Refresh** 클릭

---

## 📦 의존성 설치

### 전체 패키지 설치

```bash
cd stable-diffusion-webui
pip install -r requirements.txt
```

### 특정 버전 설치 (호환성 문제 시)

```bash
pip install -r requirements_versions.txt
```

---

## 🌐 한글 프롬프트 사용

한글 프롬프트는 자동으로 영어로 번역됩니다.

**예시**:
```
입력: "아름다운 일몰 풍경"
자동 번역: "beautiful sunset landscape, high quality, detailed"
```

**번역 기능 활성화**:
```bash
pip install deep-translator
```

---

## 💡 사용 팁

1. **프롬프트 작성**: `주제 + 스타일 + 품질` 형식으로 작성
   ```
   예: "a red sports car, professional photography, high quality, detailed, 4k"
   ```

2. **이미지 크기**: 처음엔 512x512로 시작, 나중에 확대

3. **샘플링 스텝**: 20-25가 적당 (높을수록 품질 좋지만 느림)

4. **CFG Scale**: 7이 기본값 (높을수록 프롬프트 따름)

---

## 🔗 참고 링크

- **공식 저장소**: [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
- **위키**: [공식 위키](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki)
- **모델 다운로드**: [Hugging Face](https://huggingface.co/models?library=diffusers)

---

## 📝 라이선스

이 프로젝트는 Stable Diffusion WebUI를 기반으로 합니다.
- Stable Diffusion: CreativeML Open RAIL-M License
- WebUI: AGPL-3.0 License

---

## 🆘 지원

문제가 발생하면:
1. 에러 메시지 확인
2. [문제진단_스크립트.sh](문제진단_스크립트.sh) 실행
3. [공식 이슈 트래커](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues) 확인

---

**작성일**: 2026-02-20  
**버전**: 1.0

**시작하기**: `cd stable-diffusion-webui && ./webui.sh` 🚀
