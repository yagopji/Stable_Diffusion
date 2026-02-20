# 🎨 Stable Diffusion WebUI

Stable Diffusion을 쉽게 사용할 수 있게 만든 웹 인터페이스 프로젝트입니다.

[![License](https://img.shields.io/badge/license-AGPL--3.0-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/)

---

## ✨ 주요 기능

- 🖼️ **텍스트 → 이미지**: 프롬프트로 이미지 생성
- 🎨 **이미지 → 이미지**: 이미지 편집 및 변환
- 🌐 **한글 프롬프트 지원**: 자동 번역 기능
- 🎭 **다양한 스타일**: 애니메이션, 리얼리즘 등
- 🔍 **이미지 확대**: 고해상도 변환
- 👤 **얼굴 복원**: GFPGAN, CodeFormer 지원

---

## 🚀 빠른 시작

### 필수 요구사항

- Python 3.10.6 (3.8 ~ 3.11 가능)
- Git
- Linux/Windows/MacOS
- GPU 권장 (CPU도 가능하지만 느림)

### 설치 및 실행

```bash
# 1. 저장소 클론
git clone https://github.com/YOUR_USERNAME/Stable_Diffusion.git
cd Stable_Diffusion

# 2. WebUI 실행
cd stable-diffusion-webui
chmod +x webui.sh
./webui.sh
```

**첫 실행 시 자동으로**:
- Python 가상환경 생성
- 필요한 라이브러리 설치
- 브라우저 자동 열림

### 브라우저 접속

```
http://localhost:7860
```

---

## 📁 프로젝트 구조

```
Stable_Diffusion/
├── README.md                      # 이 파일
├── requirements.txt               # Python 패키지 의존성
├── .gitignore                     # Git 제외 파일 목록
│
├── docs/                          # 📚 문서
│   ├── QUICKSTART.md              # 빠른 시작 가이드
│   ├── 사용가이드.md              # 상세 사용 설명서
│   ├── 동작원리_설명서.md         # 코드 구조 및 동작 원리
│   └── 로컬복사_가이드.md         # 다른 환경으로 복사 가이드
│
├── scripts/                       # 🔧 유틸리티 스크립트
│   ├── check_model.py             # 모델 확인 스크립트
│   ├── 모델_확인_스크립트.sh      # 모델 확인 (bash)
│   └── 문제진단_스크립트.sh       # 문제 진단 도구
│
└── stable-diffusion-webui/        # 🎨 메인 WebUI 코드
    ├── webui.sh                   # 실행 스크립트 (Linux/Mac)
    ├── webui.bat                  # 실행 스크립트 (Windows)
    ├── webui.py                   # 메인 프로그램
    ├── modules/                   # 핵심 모듈들
    ├── models/                    # AI 모델 저장소 (git 제외)
    └── ...
```

---

## 📦 설치 방법

### 방법 1: 자동 설치 (권장)

```bash
cd stable-diffusion-webui
./webui.sh
```

자동으로 모든 것을 설치합니다.

### 방법 2: 수동 설치

```bash
cd stable-diffusion-webui

# 가상환경 생성
python3.10 -m venv venv

# 가상환경 활성화
source venv/bin/activate  # Linux/Mac
# 또는
venv\Scripts\activate     # Windows

# 라이브러리 설치
pip install -r ../requirements.txt

# 실행
python webui.py
```

---

## 📚 문서

- **[빠른 시작 가이드](docs/QUICKSTART.md)**: 30초 안에 시작하기
- **[사용 가이드](docs/사용가이드.md)**: 웹 UI 사용 방법
- **[동작 원리](docs/동작원리_설명서.md)**: 코드 구조 및 동작 원리
- **[로컬 복사 가이드](docs/로컬복사_가이드.md)**: 다른 환경으로 복사하는 방법

---

## ⚙️ 설정

### GPU 메모리 부족 시

`stable-diffusion-webui/webui-user.sh` 파일 편집:

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

### Python을 찾을 수 없음
```bash
python3 --version
# webui-user.sh에서 Python 경로 지정
python_cmd="python3.10"
```

### 권한 오류
```bash
chmod +x webui.sh
chmod +x webui-user.sh
```

### CUDA 메모리 부족
- `--medvram` 또는 `--lowvram` 옵션 사용
- 이미지 크기 줄이기

### 모델이 목록에 안 보임
- WebUI 재시작
- Settings → Stable Diffusion → **Refresh** 클릭

더 많은 문제 해결 방법은 [문제진단_스크립트.sh](scripts/문제진단_스크립트.sh)를 실행하세요.

---

## 💡 사용 팁

### 프롬프트 작성

**좋은 프롬프트 구조**: `주제 + 스타일 + 품질`

```
예: "a red sports car, professional photography, high quality, detailed, 4k"
```

### 추천 설정

- **이미지 크기**: 처음엔 512x512로 시작
- **샘플링 스텝**: 20-25 (높을수록 품질 좋지만 느림)
- **CFG Scale**: 7 (기본값, 높을수록 프롬프트 따름)

### 한글 프롬프트 사용

한글 프롬프트는 자동으로 영어로 번역됩니다.

```
입력: "아름다운 일몰 풍경"
자동 번역: "beautiful sunset landscape, high quality, detailed"
```

---

## 🛠️ 개발

### 의존성 설치

```bash
pip install -r requirements.txt
```

### 코드 구조

주요 모듈:
- `modules/processing.py`: 이미지 생성 엔진
- `modules/ui.py`: 웹 인터페이스
- `modules/txt2img.py`: 텍스트→이미지 변환
- `modules/korean_prompt_translate.py`: 한글 번역 기능

자세한 내용은 [동작원리_설명서.md](docs/동작원리_설명서.md)를 참고하세요.

---

## 📝 라이선스

이 프로젝트는 Stable Diffusion WebUI를 기반으로 합니다.

- **Stable Diffusion**: CreativeML Open RAIL-M License
- **WebUI**: AGPL-3.0 License

---

## 🤝 기여

버그 리포트, 기능 제안, Pull Request를 환영합니다!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🔗 참고 링크

- **원본 저장소**: [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
- **공식 위키**: [WebUI Wiki](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki)
- **모델 다운로드**: [Hugging Face](https://huggingface.co/models?library=diffusers)

---

## 📧 문의

문제가 발생하면 [Issues](https://github.com/YOUR_USERNAME/Stable_Diffusion/issues)에 등록해주세요.

---

**시작하기**: `cd stable-diffusion-webui && ./webui.sh` 🚀
