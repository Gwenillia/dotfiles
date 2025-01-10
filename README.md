# My Dotfiles

This repository contains my personal dotfiles for setting up and managing my development environment. It includes configurations for terminal emulators, shell, text editors, and more.

Currently included:
- [Ghostty](https://ghostty.dev/) (my current terminal)
- [Kitty](https://sw.kovidgoyal.net/kitty/) (previous terminal)
- [tmux](https://github.com/tmux/tmux) (terminal multiplexer)
- [Neovim](https://neovim.io/) (text editor)
- [Fish Shell](https://fishshell.com/) (my preferred shell)

Feel free to explore, fork, or adapt them to your needs!

---

## 📝 Note: Exploring Ghostty

I recently switched from **Kitty** to **Ghostty** as my primary terminal emulator. While Kitty remains an excellent terminal, I wanted to explore Ghostty for its fresh approach to theming and simple configuration.

Both `.ghostty` and `.kitty` configurations are available in this repository, but Ghostty is my primary terminal for now. I might keep this section updated with my experiences.

---

## 📂 Repository Structure

Here's how the repository is organized:

- `./.ghostty/`: Configuration for Ghostty terminal.
  - Link to my Ghostty config repo: [https://github.com/Gwenillia/.ghostty](https://github.com/Gwenillia/.ghostty)

- `./.kitty/`: Configuration for Kitty terminal (not currently in use).
  - Link to my Kitty config repo: [https://github.com/Gwenillia/.kitty](https://github.com/Gwenillia/.kitty)

- `./.tmux`: My `tmux` configuration.
  - Link to my tmux config repo: [https://github.com/Gwenillia/.tmux](https://github.com/Gwenillia/.tmux)

- `./.nvim/`: My Neovim configuration files, organized for ease of use.
  - Link to my Neovim config repo: [https://github.com/Gwenillia/.nvim](https://github.com/Gwenillia/.nvim)

- `./.fish/`: Configuration files for Fish shell.
  - Link to my Fish config repo: [https://github.com/Gwenillia/.fish](https://github.com/Gwenillia/.fish)

---

## 🚀 How to Use These Dotfiles

To use these dotfiles, clone this repository and symlink the configurations to their appropriate locations:

### Clone the Repository
```bash
git clone https://github.com/Gwenillia/dotfiles.git ~/dotfiles
cd ~/dotfiles
```
### Symlink the Configurations
```bash
# Ghostty configuration
ln -s ~/dotfiles/.ghostty ~/.config/ghostty

# Kitty configuration (if switching back to Kitty)
ln -s ~/dotfiles/.kitty ~/.config/kitty

# tmux configuration
ln -s ~/dotfiles/.tmux ~/.config/tmux

# Neovim configuration
ln -s ~/dotfiles/.nvim ~/.config/nvim

# Fish shell configuration
ln -s ~/dotfiles/.fish ~/.config/fish
```
## 📦 Requirements
- [Ghostty](https://ghostty.dev/)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [tmux](https://github.com/tmux/tmux)
- [Neovim](https://neovim.io/)
- [Fish Shell](https://fishshell.com/)
