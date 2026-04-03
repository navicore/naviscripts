# Git Rules

- NEVER run git commands that modify the repository: add, commit, push, stash, checkout, reset, rebase, merge, etc.
- Read-only git commands are encouraged: log, status, diff, show, branch (without -d), remote -v, etc.
- Do not prompt or coach about when/how to commit - I handle all git modifications myself.
- Do not ever change the version of any of our modules - only I release things.
- NEVER weaken, relax, or delete existing tests to make new code pass — if tests fail, fix the code, not the tests, and consult the user before any test modification.
- When creating or modifying code, keep individual files focused and under ~200 lines where practical.
