# GitHub 배포 가이드

## 현재 상태

✅ 프로젝트 구조 정리 완료  
✅ 커밋 완료 (3개 커밋)  
⚠️ GitHub 저장소 연결 필요

## 푸시 방법

### 1. GitHub 저장소 생성

1. https://github.com/new 접속
2. Repository name: `Stable_Diffusion`
3. Public 또는 Private 선택
4. **README, .gitignore, license는 추가하지 않기** (이미 있음)
5. Create repository 클릭

### 2. 원격 저장소 설정 및 푸시

```bash
cd /home/01_AI그림생성_Stable_Diffusion

# 원격 저장소 설정 (YOUR_USERNAME을 실제 GitHub 사용자명으로 변경)
git remote set-url origin https://github.com/YOUR_USERNAME/Stable_Diffusion.git

# 푸시
git push -u origin main
```

### 3. 인증

**Personal Access Token 사용**:
- GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
- 새 토큰 생성 (repo 권한 필요)
- 비밀번호 대신 토큰 사용

**SSH 사용**:
```bash
git remote set-url origin git@github.com:YOUR_USERNAME/Stable_Diffusion.git
git push -u origin main
```

## 자동 푸시 스크립트

```bash
./scripts/push_to_github.sh
```

스크립트가 사용자명을 물어보고 자동으로 푸시합니다.
