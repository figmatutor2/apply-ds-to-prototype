# apply-ds-to-prototype

Claude로 만든 프로토타입에 **Figma 디자인 시스템(변수·컴포넌트)** 을 입히는 Claude 스킬입니다.

Figma 공식 스킬(`figma-use`, `figma-generate-design`) 위에 **순서 규칙과 승인 단계**만 얹은 얇은 스킬이에요.

## 흐름

1. **준비** — 라이브러리 연결 확인, 원본 복제, 가져온 레이어 정리(폰트·오토레이아웃), 작업 전 상태 기록
2. **변수 · 스타일** — 값이 정확히 일치하는 것만 바인딩, 근사값은 목록으로 보고하고 사용자가 결정
3. **대응표** — 프로토타입 요소 → DS 컴포넌트 / variant / 확신도 표 + **추가 컴포넌트 제안**을 만들고 **승인받을 때까지 멈춤**
4. **컴포넌트 교체** — 승인된 표대로 한 종류씩 교체, 필요하면 DS 토큰으로 로컬 컴포넌트 제작
5. **비포 · 애프터 비교** — Figma에 비교 보드 생성 + 수치 비교표 + 차이 목록 + 밸런스 개선 제안
6. **프로토타입 아티팩트** — After 화면 기준으로 동작하는 웹 프로토타입, Before / After 탭으로 비교
7. **리포트** — 바인딩·교체 수, 새 로컬 컴포넌트, 남은 하드코딩 값, DS 팀에 올려볼 컴포넌트

작업 중에는 Figma 캔버스에 `🤖 Claude 작업 상태` 카드와 "AI 작업 중" 반짝임으로 진행 상황이 보여요.

## 이런 점을 챙겨요

- 근사값이 두 토큰 정중앙이면 간격은 작은 쪽, 라운드는 큰 쪽으로
- Success/Info 같은 State 색을 "선택됨"으로 잘못 쓰지 않기
- 같은 폼의 입력칸·드롭다운·버튼 높이 맞추기
- DS 컴포넌트가 원본보다 화면을 무겁게 만들면 가벼운 로컬 컴포넌트(예: Filter Chip, Segmented Control, Toolbar Button) 제안

## 최종 산출물

1. **Figma 비교 보드** — 기획 화면 vs 디자인 컴포넌트·토큰 적용 화면 + 수치 비교표
2. **프로토타입 아티팩트** — 적용된 화면 기준, Before / After 탭으로 직접 눌러보며 비교

## 필요한 것

- Claude + Figma MCP 서버 연결
- 작업 파일에 DS 라이브러리가 추가돼 있을 것
- 프로토타입: Figma 프레임 링크 또는 실행 중인 웹 페이지

## 설치

### Claude Code — 한 줄 설치

```bash
curl -fsSL https://raw.githubusercontent.com/figmatutor2/apply-ds-to-prototype/main/install.sh | bash
```

현재 프로젝트에만 설치하려면:

```bash
curl -fsSL https://raw.githubusercontent.com/figmatutor2/apply-ds-to-prototype/main/install.sh | bash -s -- --project
```

이미 설치돼 있으면 기존 파일을 `SKILL.md.bak`으로 백업한 뒤 최신 버전으로 바꿔요. 업데이트할 때도 같은 명령을 쓰면 돼요.

### Claude 앱 (claude.ai · Cowork)

[Releases](https://github.com/figmatutor2/apply-ds-to-prototype/releases/latest)에서 `apply-ds-to-prototype.zip`을 받아 스킬 설정 화면에서 업로드하세요.

## 사용 예

```
DS 라이브러리: <Figma 링크>
프로토타입: <Figma 프레임 링크>
디자인 시스템 입혀줘
```

---

Made by [하이서 · HighStand](https://figmatutor.info)
