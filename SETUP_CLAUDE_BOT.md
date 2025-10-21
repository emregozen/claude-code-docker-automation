# 🤖 Setting Up Claude Bot for Automated PR Reviews

This guide explains how to enable Claude Bot to automatically review PRs created by the automation.

## 📋 Prerequisites

- Repository admin access
- GitHub account

## 🚀 Installation Steps

### Step 1: Install Claude GitHub App

1. Go to: https://github.com/apps/claude
2. Click **"Install"** or **"Configure"**
3. Select your repository (`emregozen/ai-logbook`)
4. Grant the required permissions:
   - ✅ Read access to code and metadata
   - ✅ Read and write access to issues, pull requests, and comments

### Step 2: Verify Installation

1. Go to your repository settings
2. Navigate to: **Settings → Integrations → GitHub Apps**
3. You should see "Claude" listed
4. Make sure it has access to your repository

### Step 3: Test Claude Bot

Create a test PR and mention Claude:
```
@claude Please review this PR
```

Claude should respond within 1-2 minutes!

## ⚙️ Configuration

Update your `.env` file:
```env
# Enable auto-review with Claude Bot
AUTO_REVIEW=true

# Wait for approval before exiting
WAIT_FOR_APPROVAL=true

# Maximum time to wait for approval (seconds)
MAX_WAIT_TIME=1800  # 30 minutes

# How often to check PR status (seconds)
POLL_INTERVAL=30    # 30 seconds

# Maximum fix iterations
MAX_FIX_ITERATIONS=5
```

## 🔄 How It Works

1. **Script creates PR** with your changes
2. **@claude mention** triggers automatic review
3. **Claude Bot reviews** the code
4. **If issues found:**
   - Script automatically fixes issues
   - Pushes new commits
   - Requests re-review from @claude
5. **Repeats** until approved or max iterations reached
6. **Script exits** only after approval ✅

## 📊 Example Workflow
```bash
./run-claude.sh "Initialize a Spring Boot project"

# Output:
# ✅ PR created: #123
# 🤖 Requesting review from @claude...
# ⏳ Waiting for Claude Bot to respond...
# ⏱️  Checking PR status... (30s elapsed)
# 📊 Review Status: PENDING
# ⏱️  Checking PR status... (60s elapsed)
# 🔧 Changes requested by Claude Bot
# 💬 Claude Bot's Feedback: [shows feedback]
# 🔧 Applying fixes...
# ✅ Fixes pushed
# 🔄 Requesting re-review from Claude Bot...
# ⏱️  Checking PR status... (90s elapsed)
# ✅ SUCCESS! PR has been APPROVED by Claude Bot!
```

## 🎛️ Advanced Configuration

### Disable Auto-Review
```env
AUTO_REVIEW=false
```

Script will create PR but not request review.

### Don't Wait for Approval
```env
WAIT_FOR_APPROVAL=false
```

Script will request review but exit immediately.

### Adjust Timeouts
```env
# Wait longer for complex reviews
MAX_WAIT_TIME=3600  # 1 hour

# Check more frequently
POLL_INTERVAL=15    # 15 seconds

# Allow more fix attempts
MAX_FIX_ITERATIONS=10
```

## 🔍 Troubleshooting

### Claude Bot Not Responding

**Check:**
1. Is the Claude app installed on your repo?
2. Does it have the correct permissions?
3. Is the @claude mention in a comment on the PR?

**Solution:**
```bash
# Manually mention Claude
gh pr comment <PR_NUMBER> --repo emregozen/ai-logbook --body "@claude Please review"
```

### Script Times Out

**Possible reasons:**
- Claude is very busy
- Complex PR requires longer review
- Network issues

**Solution:**
- Increase `MAX_WAIT_TIME` in `.env`
- Check PR page manually for Claude's response
- Re-run with longer timeout

### Too Many Fix Iterations

**Reason:**
- Issues are complex
- Claude needs clearer instructions

**Solution:**
- Increase `MAX_FIX_ITERATIONS`
- Review Claude's feedback manually
- Simplify the original prompt

## 📖 Resources

- **Claude GitHub App:** https://github.com/apps/claude
- **Claude Code Docs:** https://docs.claude.com/en/docs/claude-code
- **GitHub Actions Integration:** https://docs.claude.com/en/docs/claude-code/github-actions

## 💡 Tips

1. **Clear prompts** → Better initial implementation → Fewer review iterations
2. **Small PRs** → Faster reviews → Quicker approval
3. **Good commit messages** → Claude understands context better
4. **Test locally** → Fewer issues → Less back-and-forth

## 🎯 Next Steps

Once setup is complete:
```bash
# Run your first automated PR with review
./run-claude.sh "Your task here"

# The script will:
# ✅ Create PR
# ✅ Request Claude Bot review  
# ✅ Wait for approval
# ✅ Auto-fix issues if needed
# ✅ Exit only when approved
```

Happy automating! 🚀
