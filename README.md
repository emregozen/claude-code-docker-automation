# Claude Code Docker Automation

🤖 Clones GitHub repo, runs Claude Code, creates PRs automatically.

## Quick Start
```bash
cp .env.example .env
# Edit .env with credentials
./run-claude.sh "Your task"
```

## Configuration (.env)
```env
ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
GITHUB_TOKEN=ghp_xxxxx
GITHUB_REPO=owner/repo
SOURCE_BRANCH=main
PROMPT=Fix linting errors
```

## Examples
```bash
./run-claude.sh "Add TypeScript types"
./run-claude.sh "Implement dark mode"
SOURCE_BRANCH=develop ./run-claude.sh "Complete feature"
```

## Get API Keys

- Anthropic: https://console.anthropic.com/settings/keys
- GitHub: https://github.com/settings/tokens (scopes: repo, workflow)

## Cost: $0.50-$5 per run
