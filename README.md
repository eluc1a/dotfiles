# My Dotfiles

These are my personal configuration files, managed with **[GNU Stow](https://www.gnu.org/software/stow/)**.



## Installation

1.  Clone the repository to your home directory:
    ```bash
    git clone [https://github.com/your-username/dotfiles.git](https://github.com/your-username/dotfiles.git) ~/.dotfiles
    ```
2.  Navigate into the cloned directory:
    ```bash
    cd ~/.dotfiles
    ```
3.  Use `stow` to create the symbolic links for the desired configurations. For example, to install the `zsh` and `git` configs:
    ```bash
    stow zsh git
    ```
    To install all configurations at once, you can run:
    ```bash
    stow */
    ```

***

## Window & Space Management

* **[Aerospace](https://github.com/nikitabobko/AeroSpace)**: An i3-like tiling window manager for macOS that arranges windows in a predictable grid without gaps.
* **[Yabai](https://github.com/koekeishiya/yabai)**: A tiling window manager for macOS that uses a binary space partitioning algorithm to manage windows.

***

## Terminal & Shell

* **[Zsh](https://www.zsh.org/)**: My primary shell, configured for productivity and customization with various plugins and themes.
* **[Ghostty](https://github.com/ghostty-org/ghostty)**: A modern, GPU-accelerated terminal emulator focused on speed and simplicity.
* **[iTerm2](https://iterm2.com/)**: A powerful and highly customizable terminal emulator for macOS.
* **[Tmux](https://github.com/tmux/tmux/wiki)**: A terminal multiplexer that allows you to manage multiple terminal sessions from a single window.
* **[Bat](https://github.com/sharkdp/bat)**: A modern replacement for `cat` with syntax highlighting, Git integration, and other advanced features.
* **[Eza](https://github.com/eza-community/eza)**: A contemporary and feature-rich replacement for the `ls` command.
* **[TheFuck](https://github.com/nvbn/thefuck)**: A magnificent app that corrects errors in your previous console commands.

***

## Development & Git

* **[Git](https://git-scm.com/)**: Configuration for my global `.gitconfig`, including aliases and user settings.
* **[GitHub CLI (`gh`)](https://cli.github.com/)**: Configurations for GitHub's official command-line tool, helping to streamline workflows.
* **[Gitleaks](https://github.com/gitleaks/gitleaks)**: A tool for detecting and preventing hardcoded secrets like passwords and API keys in git repositories.
* **[UV](https://github.com/astral-sh/uv)**: An extremely fast Python package installer and resolver, written in Rust.
* **[VS Code](https://code.visualstudio.com/)**: Settings, keybindings, and extensions list for my primary code editor, synced as JSON files.

***

## System & Utilities

* **[Brave Browser](https://brave.com/)**: Custom CSS themes to modify the look and feel of the Brave browser.
* **[btop](https://github.com/aristocratos/btop)**: A modern and feature-rich resource monitor that shows usage and stats for the processor, memory, disks, and network.
* **[htop](https://htop.dev/)**: The classic interactive process viewer for Unix-like systems, used for system monitoring.
* **[Cheat](https://github.com/cheat/cheat)**: A command-line utility that allows you to create and view interactive cheatsheets.
* **[Homepage](https://gethomepage.dev/)**: A highly customizable application dashboard with integrations for over 100 services.
* **[Neofetch](https://github.com/dylanaraps/neofetch)**: A command-line system information tool that displays system details in an aesthetically pleasing way.
* **[Spicetify](https://spicetify.app/)**: A command-line tool for customizing the official Spotify client with themes, extensions, and custom apps.
