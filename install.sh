#!/usr/bin/env bash
# apply-ds-to-prototype 스킬 설치 스크립트 (Claude Code)
#
# 전역 설치 (모든 프로젝트에서 사용):
#   curl -fsSL https://raw.githubusercontent.com/figmatutor2/apply-ds-to-prototype/main/install.sh | bash
#
# 현재 프로젝트에만 설치:
#   curl -fsSL https://raw.githubusercontent.com/figmatutor2/apply-ds-to-prototype/main/install.sh | bash -s -- --project
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/figmatutor2/apply-ds-to-prototype/main"
NAME="apply-ds-to-prototype"

if [ "${1:-}" = "--project" ]; then
  BASE="$(pwd)/.claude/skills"
else
  BASE="${HOME}/.claude/skills"
fi
DEST="${BASE}/${NAME}"

mkdir -p "${DEST}"
if [ -f "${DEST}/SKILL.md" ]; then
  cp "${DEST}/SKILL.md" "${DEST}/SKILL.md.bak"
  echo "• 기존 SKILL.md를 SKILL.md.bak으로 백업했어요."
fi
curl -fsSL "${REPO_RAW}/plugins/apply-ds-to-prototype/skills/apply-ds-to-prototype/SKILL.md" -o "${DEST}/SKILL.md"

echo "✓ ${NAME} 설치 완료 → ${DEST}"
echo "  Claude Code를 다시 열고 '/${NAME}' 또는 \"디자인 시스템 입혀줘\"로 실행하세요."
echo "  필요: Figma MCP 서버 연결"
