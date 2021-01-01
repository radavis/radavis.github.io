# tmux

```bash
$ sudo apt install tmux
$ tmux
```

## Commands

- List commands: `Ctrl-b ?`
- Split the screen vertically: `Ctrl-b %`
- Split the screen horizontally: `Ctrl-b "`
- Switch panes: `Ctrl-b ← → ↑ ↓`
- Close pane: `exit` or `Ctrl-d`
- Toggle pane full-screen: `Ctrl-b z`
- Resize pane: `Ctrl-b Ctrl-<arrow-key>`
- Create window: `Ctrl-b c`
- Switch windows: `Ctrl-b p` or `Ctrl-b n` or `Ctrl-b <window-number>`
- Rename window: `Ctrl-b ,`
- Detach: `Ctrl-b d` or `tmux detach`
- List tmux sessions: `tmux ls`
- Connect to session: `tmux attach -t 0`
- Create a new named session: `tmux new -s <session-name>`
- Rename an existing session: `tmux rename-session -t 0 <session-name>`
- Remove a session: `tmux kill-session -t <session-name>`

## References

- [](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
