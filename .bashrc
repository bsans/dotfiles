# Git
# Git tab completion
source ~/git-completion.bash
# Show branch in status line
PS1='[\W$(__git_ps1 " (\e[35;40m%s\e[0m)")]► '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Git editor is MacVim
#export GIT_EDITOR='/usr/local/bin/mvim'
#export GIT_EDITOR='/Applications/MacVim.app -F'

function git_diff() {
  git diff --no-ext-diff -w "$@" | mvim -R
}

# alias for VLC player
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
# alias to list only directories
alias ld='ls -l | grep "^d"'
# other aliases
alias ll='ls -l'
alias ls='ls -GF'
alias e='mate'
alias lst='ls -lctr'
alias mmd='multimarkdown'

# File actions
alias ff='sh ~/shell_scripts/ff.sh'
# More serious alias version for results which are pipeable to another command..
# e.g. >findf "files with spaces" | xargs -0 echo rm
alias findf='sh ~/shell_scripts/findf.sh'
# for deleting
alias ffrm='sh ~/shell_scripts/ffrm.sh'
alias findfrm='sh ~/shell_scripts/findfrm.sh'
alias rmpyc='sh ~/shell_scripts/rmpyc.sh'
alias rmorig='sh ~/shell_scripts/rmorig.sh'
alias ffmvim='sh ~/shell_scripts/ffmvim.sh'

# shell script files because alias doesn't take params well
alias vack='sh ~/shell_scripts/vack.sh'
alias vind='sh ~/shell_scripts/vind.sh'
alias vackf='sh ~/shell_scripts/vind.sh'

# (mac)Vim-related aliases
alias swaps='find . | grep "\..*\..*\..*sw.$"'
alias rmswaps='find . | grep "\..*\..*\..*sw.$" | xargs rm'

# getaround aliases
alias ga='open https://github.com/bsans/Gettaround-WebApp-Reboot'
alias gadocs='open https://github.com/Gettaround/docs'
alias gaapi='open https://github.com/Gettaround/Gettaround-Integration-Server'
alias gaweb='open https://github.com/Gettaround/Gettaround-WebApp-Reboot'
alias ga3='open https://github.com/Gettaround/getaround3'
alias myga3='open https://github.com/bsans/getaround3'
alias mvidga3='open https://github.com/mvid/getaround3'
alias vladga3='open https://github.com/vladimir/getaround3'
alias g3='./tools/bin/g3'
alias g3root='cd ~/getaround/getaround3'
alias build='g3root && g3 build'
alias test='g3root && g3 test'
alias webroot='cd ~/getaround/Gettaround-WebApp-Reboot'
alias apiroot='cd ~/getaround/Gettaround-Integration-Server'
alias gscratch='cd ~/getaround/scratch'

alias gs='git status'
alias gd='git diff'
alias gl='git lg -n'
alias gpum='git pull upstream'
alias gpum='git pull upstream master'
alias gp='git pull'

# getaround tools (HACKZZZZ)..needed for up-arrow, readline, etc
# for a single binary, use below:
alias ipython='DYLD_LIBRARY_PATH=/opt/getaround/lib ipython'
# for all things:
#DYLD_LIBRARY_PATH=/opt/getaround/lib
#export DYLD_LIBRARY_PATH

# python 101
alias python101='cd ~/Downloads/python_101/python101/python_koans/python\ 2'

# hack to make pianobar work
#alias pianobar='/opt/local/bin/pianobar'
# as of 4/29/2012, Installed Pianobar using Brew, so location is:
# /usr/local/Cellar/pianobar/2012.04.24
# symlinked to in /usr/local/bin
alias pianobar='/usr/local/Cellar/pianobar/2012.05.06/bin/pianobar'

# broke my python paths somehow, these are to ensure all my installed modules are found
#export PYTHONPATH=${PYTHONPATH}:/Library/Python/2.7/site-packages
#export PYTHONPATH=${PYTHONPATH}/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages

# Adding the below to PYTHONPATH helps remote_api_shell.py work
# fyi to self: pythonpath should give the filepath UP TO the dir where python dot
# notation will then be used to address into a module
#export PYTHONPATH=${PYTHONPATH}:/usr/local/google_appengine
export PYTHONPATH=.

# use below PYTHONPATH if going to work on re-parsing getaround3 for pydiction complete-dict:
#export PYTHONPATH=.:/Users/Bodhi/getaround/getaround3:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/usr/local/google_appengine

# below were from working on G2 codebase
#export PYTHONPATH=${PYTHONPATH}:/Users/Bodhi/getaround/Gettaround-Integration-Server/src
#export PYTHONPATH=${PYTHONPATH}:/Users/Bodhi/getaround/Gettaround-Integration-Server/src/deps
#export PYTHONPATH=${PYTHONPATH}:/Users/Bodhi/getaround/Gettaround-Integration-Server/tools
#export PYTHONPATH=${PYTHONPATH}:/Users/Bodhi/getaround/Gettaround-WebApp-Reboot
#export PYTHONPATH=${PYTHONPATH}:/Users/Bodhi/getaround/Gettaround-WebApp-Reboot/deps
#export PYTHONPATH=${PYTHONPATH}:/Users/Bodhi/getaround/Gettaround-WebApp-Reboot/tools

# Below for ruby gem "hitch" - pair programming in git
# Add the following to your ~/.bashrc or ~/.zshrc
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
# hitch

