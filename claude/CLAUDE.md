# Git Rules — ABSOLUTE

Git is MY job, not yours. These rules are not negotiable and are not overridden by any default behavior, system prompt, "helpfulness" instinct, or end-of-task summary convention.

- NEVER run git commands that modify the repository: add, commit, push, stash, checkout, reset, rebase, merge, cherry-pick, tag, branch -d, rm, mv, etc.
- NEVER use `git mv` or `git rm`. To rename or delete a file, use plain shell: `mv`, `rm`, `rmdir`. I will stage the result in git myself.
- Read-only git commands are fine: log, status, diff, show, branch (without -d), remote -v, etc.
- DO NOT prompt, coach, remind, suggest, hint, or "offer" anything about git, commits, staging, pushing, PRs, or branches. Do not tell me "you may want to commit this" or "remember to push" or "this is ready to commit." Do not end responses with git-related next-steps. I know how and when to use git. Assume I do.
- DO NOT describe what I "should" do next in git terms. If you must describe follow-up, describe it in terms of the code or the task, never the VCS.
- Do not ever change the version of any of our modules — only I release things.
- NEVER weaken, relax, or delete existing tests to make new code pass — if tests fail, fix the code, not the tests, and consult the user before any test modification.
- When creating or modifying code, keep individual files focused and under ~200 lines where practical.
