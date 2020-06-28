# Git

## Aliases

Add to `~/.gitconfig`:

```bash
[alias]
    tree1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
    tree2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)%s%C(reset) %C(bold blue)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(dim white){ Author: %C(reset)%C(white)%an%C(dim white), Email: %C(reset)%C(white)%ae%C(dim white), Date: %C(reset)%C(white)%cd%C(dim white) }%C(reset)' --all
    tr = !"git tree2"
    s = status
```
