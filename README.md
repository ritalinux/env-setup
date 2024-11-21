# env-setup
Repo for new development environments
- Zsh
- Oh-my-zsh!
- Neovim
- Tmux

## Setup
- Download and setup
```
git clone https://github.com/ritalinux/env-setup.git && cd env-setup
chmod +x setup.sh
./setup.sh
```
- Paste this snippet into ~/.zshrc file if you don't have it (after setup's done)
```Shell script
if [ -z "$TMUX" ]; then
  tmux new -d -s delete-me && \\
  tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \\
  tmux kill-session -t delete-me && \\
  tmux attach || tmux attach
fi
```

## Notes
Neovim will report an error on the first 2 launches but everything is fine, 
just continue by pressing `<PD><Enter>` (It will try to run plugins that will
be downloaded on the first launch and configured on the second)

Tmux will not behave as expected on the first launch, remember to install the  
plugins with `<prefix + I>` and `<prefix + U>`

## Working on 
| Distro                        | Date / Release              |      Tag    |
|-------------------------------|-----------------------------|-------------|
| Arch Linux                    | 2024-06-02                  |  <= v0.1.0  |
| Ubuntu                        | 18.04 LTS                   |  <= v0.1.0  |
| Big Linux                     | 2024-11-21                  |  == v0.4.0  |


