# ┏━╸┏━┓┏━┓┏━┓┏━┓┏━┓╻ ╻
# ┃  ┣┳┛┃ ┃┗━┓┗━┓┗━┓┣━┫
# ┗━╸╹┗╸┗━┛┗━┛┗━┛┗━┛╹ ╹
# by tudurom
# bits shared between different shells (bash, mksh, zsh)

export EDITOR=nvim
export VISUAL=nvim

# Golang specific variables
if [ -d /usr/local/go ]; then
    export GOPATH=$HOME/gopath
    export GOROOT=/usr/local/go
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$GOPATH/bin:$PATH"
fi

# Ruby
if [ -f /usr/local/bin/ruby ]; then
    export PATH=$HOME/.node/bin:$PATH
    ruby_ver="$(ls -1 $HOME/.gem/ruby | sort -nr | head -n 1)"
    export PATH=$HOME/.gem/ruby/$ruby_ver/bin:$PATH
fi

# Source local scripts
export PATH="$HOME/bin/clint:$HOME/bin:$PATH"

# god's own os
export PATH="$PATH:/usr/local/plan9/bin"

# Python packages
export PATH="$PATH:$HOME/.local/bin"

# Aliases aka hacks
alias :q=exit
alias irb=pry
alias ccat=pygmentize
alias problemhelper="time problemhelper"
alias ph=problemhelper
alias tls="tmux ls"
alias tswitch="tmux switch -t"
alias tkill="tmux kill-session -t"
alias rm="rm -I"
alias clip="xclip -selection clipboard"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
test "$(uname)" = "FreeBSD" && alias tput="/usr/local/bin/tput"
export LESS='-F -g -i -M -R -S -w -X -z-4'

testnet() {
    ping duckduckgo.com
}

ghclone() {
    git clone https://github.com/${1}.git ${2}
}

transfer() {
    local tmpfile="$(mktemp -t tranferXXX)"
    curl --progress-bar --upload-file $1 "https://transfer.sh/$(basename $1)" >> $tmpfile
    cat $tmpfile
    rm -rf $tmpfile
    unset tmpfile
}

pi() {
    ssh tudoo $1
}

push() {
    local branch="${1:-master}"
    git remote | while read -r line; do
        git push $line $branch
    done
}

radio() {
    mpv http://radio.2f30.org:8000/live.mp3
}
