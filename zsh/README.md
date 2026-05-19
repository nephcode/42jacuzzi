# ZSH CONFIGURATION

## INSTALL OHMYZSH

## SETUP THE MINIMAL 42 SESSION

## SUPPR ZCOMPDUMP FILES

perhaps you see more files like `~/.zcompdump*` with the `ls -la` command. Here we are fixing the issue.

1. Create a cache folder

```bash
mkdir -p ~/.cache/zsh
```

2. Add in `~/.zshrc` this blockcode

```bash
autoload -Uz compinit

export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump"

compinit -d "$ZSH_COMPDUMP"
```

3. Clean the garbage

```bash
rm -f ~/.zcompdump*
```
