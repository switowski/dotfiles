# source some additional config files
# aliases will hopefully overwrite the built-in zsh aliases
for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && source "$file"
        done
        unset file

# Show current folder in terminal title
# precmd () {print -Pn "\e]; %~\a"}

# Enable fasd
eval "$(fasd --init auto)"