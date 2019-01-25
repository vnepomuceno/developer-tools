# Zsh Customization

## Frameworks & Plugins

* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), a framework for managing your Zsh configuration.
* [zsh-completions](https://github.com/zsh-users/zsh-completions), additional completion definitions for Zsh.
* [bat](https://github.com/sharkdp/bat), a cat(1) clone with wings.

## Git

### Aliases

Add to `~/.gitconfig`:

```
[alias]
	tree1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
	tree2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)%s%C(reset) %C(bold blue)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(dim white){ Author: %C(reset)%C(white)%an%C(dim white), Email: %C(reset)%C(white)%ae%C(dim white) }%C(reset), %ad' --all
	tr = !"git tree2"
```

### Plugins

* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy), good-lookin' diffs.
