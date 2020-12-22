             #_--"""""--_#
           #*             *#
         #+           .----.+#
       #.'           /-*-.  \'.#
      #/            / _/..\  \ \#   =================================================
     #:         _.--*'__-.*   * :#   _                     __ _     _            _
     #|    _.- ' __     /  ____\|#  | |_ _   _ _ __   ___ / _(_)___| |__    __ _| |_
     #|  <.     //\\   :_./    \|#  | __| | | | '_ \ / _ \ |_| / __| '_ \  / _` | __|
     #|  __'>   \\//   : |      |#  | |_| |_| | | | |  __/  _| \__ \ | | || (_| | |_
     #:  `.             \'     /:#   \__|\__,_|_| |_|\___|_| |_|___/_| |_(_)__,_|\__|
      #\   `.            '.__.'/#   =================================================
       #'.    `- _    _.-'   .'#
         #+       '*-----___+#                        zsh config
          ##.             .##
             #*--.....--*#



# attatch tmux session if it exists and we don't run i3
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && ! pgrep -x "i3" > /dev/null; then
    tmux -2 attach -t default || tmux -2 new -s default
fi

# enable colors
autoload -U colors && colors

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# git branch detection for prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' [%b]'
setopt PROMPT_SUBST

# autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vim mode
bindkey -v
export KEYTIMEOUT=1

# vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# use lf to switch directories with ctrl+o
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# editor
export EDITOR='vim'

# common alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -la'

# void specific alias
alias services='sudo sv status /var/service/*'
alias searchpkg='xbps-query -Rs'
alias pkginstall='sudo xbps-install -Su'
alias pkgdeps='xbps-query -Rx'

# less colors for manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# prompt setup
PROMPT='[%F{green}%n%f%F{blue}@%f%F{green}%m%f %F{blue}%~%f]%F{yellow}${vcs_info_msg_0_}%{$reset_color%} '

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# terminal color hack since tmux messes up color settings
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.svg=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"
