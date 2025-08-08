# WSL2 Ubuntu 24.04 Dotfiles

This repository contains my WSL2 Ubuntu 24.04 configuration with Zsh, Powerlevel10k and Claude Code.

## Prerequisites

### Install Ubuntu 24.04 on WSL2

Open Powershell as Administrator:

```powershell
wsl --install Ubuntu-24.04 --name "<enter-profile-name-here>"
```

Set it as Default:

```powershell
wsl --setdefault "<enter-profile-name-here>"
```

Restart Terminal(otherwise you won't see the newly created profile):
```powershell
wt
```

## Installation

Run this to set up everything:

```bash
git clone https://github.com/snwfrg/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

After installation:

1. Restart terminal
2. Configure Windows Terminal to use "FiraCode Nerd Font" and the right color scheme for the new profile
3. Configure Claude Code

## Windows Terminal Configuration

Add this to your Windows Terminal settings.json for the new profile:

```json
{
    "font": {
        "face": "FiraCode Nerd Font",
        "features": {
            "liga": 1,
            "calt": 1,
            "ss01": 1,
            "ss02": 1,
            "ss03": 1,
            "ss04": 1,
            "ss05": 1,
            "ss06": 1,
            "ss07": 1
        }
    },
    "colorScheme": "One Half Dark"
}
```

## What's Included

- Zsh with Oh My Zsh
- Powerlevel10k theme
- FiraCode Nerd Font with ligatures
- Syntax highlighting
- Auto-suggestions
- Enhanced tab completion
- Git integration
- Docker integration
- NVM (Node Version Manager)
- Node.js LTS (set as default)
- Various helpful aliases
- Claude Code

## Delete everything

Open Powershell as Administrator
```powershell
wsl --unregister "<enter-profile-name-here>"
```