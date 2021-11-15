# Tmux

## Installation

```bash
brew install tmux
```

## Configuration

Create file `~/.tmux.conf`:

```bash
# Change prefix key
unbind C-b
set-option -g prefix C-a

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'dracula/tmux'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Plugin settings
set -g @continuum-boot 'on'
set -g base-index 1           # start windows numbering at 1

# Dracula theme
set -g @dracula-plugins "cpu-usage ram-usage weather time"
set -g @dracula-weather-colors "light_purple dark_gray"
set -g @dracula-show-powerline true
set -g @dracula-show-left-icon session
set -g @dracula-border-contrast true
set -g @dracula-day-month true
set -g @dracula-refresh-rate 2

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```