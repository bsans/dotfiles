# this is "unsafe" but oh well
. ~/.bashrc
. ~/.profile
# for using TextMate as default editor
#export EDITOR='mate -w'
# for using MacVim as default editor, with nice flags for behavior
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

##
# Your previous /Users/Bodhi/.bash_profile file was backed up as /Users/Bodhi/.bash_profile.macports-saved_2011-07-29_at_01:09:41
##

# MacPorts Installer addition on 2011-07-29_at_01:09:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/getaround/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# in addition to commenting out above export, may have to temporarily move macports dir like so:
# sudo mv /opt/local ~/macports
# until can get brew to work again..
