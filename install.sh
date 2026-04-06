#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES"

# --- Zsh ---
SOURCE_LINE="source $DOTFILES/zsh/zshrc"
if [ -f "$HOME/.zshrc" ]; then
  if ! grep -qF "$SOURCE_LINE" "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"
    echo "# Dotfiles" >> "$HOME/.zshrc"
    echo "$SOURCE_LINE" >> "$HOME/.zshrc"
    echo "Added source line to ~/.zshrc"
  else
    echo "~/.zshrc already sources dotfiles"
  fi
else
  echo "# Dotfiles" > "$HOME/.zshrc"
  echo "$SOURCE_LINE" >> "$HOME/.zshrc"
  echo "Created ~/.zshrc with source line"
fi

# --- Claude skills ---
mkdir -p "$HOME/.claude"
TARGET="$DOTFILES/claude/skills"

if [ -L "$HOME/.claude/skills" ]; then
  CURRENT=$(readlink "$HOME/.claude/skills")
  if [ "$CURRENT" = "$TARGET" ]; then
    echo "~/.claude/skills already symlinked"
  else
    rm "$HOME/.claude/skills"
    ln -s "$TARGET" "$HOME/.claude/skills"
    echo "Updated ~/.claude/skills symlink"
  fi
elif [ -d "$HOME/.claude/skills" ]; then
  mv "$HOME/.claude/skills" "$HOME/.claude/skills.bak"
  ln -s "$TARGET" "$HOME/.claude/skills"
  echo "Backed up existing skills to ~/.claude/skills.bak and created symlink"
else
  ln -s "$TARGET" "$HOME/.claude/skills"
  echo "Created ~/.claude/skills symlink"
fi

echo "Done!"
