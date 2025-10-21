#!/bin/bash
set -e
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
echo -e "${CYAN}🤖 Claude Code Automation${NC}" && echo "========================"
if [ -f .env ]; then export $(cat .env | grep -v '^#' | grep -v '^[[:space:]]*$' | xargs); echo -e "${GREEN}✓ Loaded .env${NC}"; else echo -e "${RED}✗ .env not found${NC}" && exit 1; fi
[ -z "$ANTHROPIC_API_KEY" ] && echo -e "${RED}✗ ANTHROPIC_API_KEY not set${NC}" && exit 1
[ -z "$GITHUB_TOKEN" ] && echo -e "${RED}✗ GITHUB_TOKEN not set${NC}" && exit 1
[ -z "$GITHUB_REPO" ] && echo -e "${RED}✗ GITHUB_REPO not set${NC}" && exit 1
PROMPT_TEXT="${1:-$PROMPT}" && [ -z "$PROMPT_TEXT" ] && echo -e "${RED}✗ No prompt${NC}" && exit 1
echo "" && echo -e "${CYAN}Repo:${NC} $GITHUB_REPO" && echo -e "${CYAN}Task:${NC} $PROMPT_TEXT" && echo ""
docker images | grep -q "claude-code-automation" || (echo -e "${YELLOW}Building...${NC}" && docker build -t claude-code-automation .)
docker run --rm -e ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY" -e GITHUB_TOKEN="$GITHUB_TOKEN" -e GITHUB_REPO="$GITHUB_REPO" -e SOURCE_BRANCH="${SOURCE_BRANCH:-main}" -e PROMPT="$PROMPT_TEXT" -e GIT_EMAIL="${GIT_EMAIL:-claude-bot@example.com}" -e GIT_NAME="${GIT_NAME:-Claude Bot}" -e BRANCH_NAME="${BRANCH_NAME:-}" -e BASE_BRANCH="${BASE_BRANCH:-}" claude-code-automation
echo "" && echo -e "${GREEN}✨ Done!${NC}"
