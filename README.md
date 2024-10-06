## Dotfiles

zsh, nvim, helix, kitty, yazi ... configurations

##### How to add a lock file that generated automatically
1. touch a `{$lock_file_name}.origin`.
2. copy the text from `lock_file` to `lock_file.origin`.
3. `chezmoi add lock_file.origin && chezmoi add -T lock_file`.
4. add `{{- .chezmoi.sourceDir }}/path/to/lock_file.origin` into `.chezmoiignore`.

