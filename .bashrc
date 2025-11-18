#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Bash-it theme.
export BASH_IT_THEME='brainy'
export THEME_SHOW_CLOCK='false'
export THEME_SHOW_PYTHON='false'
export ___BRAINY_TOP_LEFT='user_info dir scm python'
export ___BRAINY_TOP_RIGHT=' '
export ___BRAINY_BOTTOM='exitcode char'
source /usr/lib/bash-it-git/bash_it.sh

# Clang-format version selector.
export PATH="/opt/clang-format-static:$PATH"

# Default editor choice.
export EDITOR=vim

# Use Ninja by default in CMake builds.
export CMAKE_GENERATOR=Ninja

# Use colored CTest output.
export CLICOLOR_FORCE=ON 

# Add MinGW compiler paths to Wine.
export WINEPATH=/usr/x86_64-w64-mingw32/bin

# Dotfiles git config alias.
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# Uitilities aliases.
alias ls='lsd'
alias cat='bat'

# Poetry alias.
alias pshell="source \"\$(poetry env list --full-path | grep Activated | cut -d' ' -f1 )/bin/activate\""

# CMake aliases.
alias ccp='cmake --preset'
alias clp='cmake --list-presets'
alias cbp='cmake --build --preset'
alias cblp='cmake --build --list-presets'
alias ctp='ctest --preset'
alias ctlp='ctest --build --list-presets'
alias cpp='cpack --preset'
alias cplp='cpack --build --list-presets'
alias cwp='cmake --workflow --preset'
alias cwlp='cmake --workflow --list-presets'
alias cwf='cmake --workflow --fresh'

# Max compression alias.
alias compress="tar -c -I 'xz -9 -T0 -M80%' -f"

# Colored output for ls command.
source ~/.config/bash/ls_colors.sh
