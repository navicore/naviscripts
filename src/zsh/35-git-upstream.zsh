git-set-upstream() {
  if [[ -z "$1" ]]; then
    echo "usage: git-set-upstream <github-org-or-user>"
    return 1
  fi

  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "not inside a git repository"
    return 1
  }

  if git remote get-url upstream >/dev/null 2>&1; then
    echo "remote 'upstream' already exists"
    return 1
  fi

  local repo owner url
  repo="$(basename "$(git rev-parse --show-toplevel)")"
  owner="$1"
  url="https://github.com/${owner}/${repo}.git"

  echo "git remote add upstream $url"
  git remote add upstream "$url"
}

