#Color table from: http://www.understudy.net/custom.html
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}
 
# PROMPT PIMPIN'
## Leave the initial line break or else your commands won't have space between them
PROMPT="
${fg_lgreen}%n@${at_underl}%m${at_underloff}${fg_white}[${fg_cyan}%~${fg_white}]
[${fg_green}%T${fg_white}]:${at_normal}"
 
## MAKE DER ZSH SING FOR ITS SUPPER
autoload -U compinit
compinit
 
## Lets set some options
setopt correctall
setopt autocd
setopt auto_resume
setopt extendedglob
setopt completeinword
unsetopt caseglob
 
## Set some ZSH auto complete options
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
 
## History stuffs
HISTFILE=~/.zsh-histfile
HISTSIZE=5000
SAVEHIST=5000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory
 
#ALIASES
##ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls -G' #I like color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
 
## cd, because typing the backslash is A LOT of work!!
### not needed due to ZSH autocd opt
#alias .='cd ../'
#alias ..='cd ../../'
#alias ...='cd ../../../'
#alias ....='cd ../../../../'
 
#SSH ALIASES
## alias -g shost='ssh -p 9999 user@host.com'
 
# SCREEN ALIASES
## add a new screen , or entire session, name it, then ssh to the host
## Replace HOST with what you want the screen session named, surround with double quotes if there is a space
#alias sshost='screen -t HOST shost'
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
        zstyle ':vcs_info:*' formats       \
            '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
                zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

                zstyle ':vcs_info:*' enable git cvs svn

                # or use pre_cmd, see man zshcontrib
                vcs_info_wrapper() {
                  vcs_info
                    if [ -n "$vcs_info_msg_0_" ]; then
                        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
                          fi
                          }
                          RPROMPT=$'$(vcs_info_wrapper)'
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
function chpwd() {
    emulate -L zsh
	    ls 
}
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="$PATH:$HOME/.cargo/bin"
