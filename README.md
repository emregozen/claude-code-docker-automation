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

## 🤖 Claude Bot Auto-Review

This automation can automatically request reviews from Claude Bot and wait for approval!

### Setup

1. **Install Claude GitHub App:** https://github.com/apps/claude
2. Grant it access to your repository
3. See [SETUP_CLAUDE_BOT.md](SETUP_CLAUDE_BOT.md) for detailed instructions

### Usage
```bash
# Automatically creates PR, requests review, and waits for approval
./run-claude.sh "Your task here"
```

The script will:
- ✅ Create PR with changes
- 🤖 Mention @claude to trigger review
- ⏳ Wait for Claude Bot's response
- 🔧 Auto-fix issues if requested
- ✅ Exit only when PR is approved

See [SETUP_CLAUDE_BOT.md](SETUP_CLAUDE_BOT.md) for full documentation.
