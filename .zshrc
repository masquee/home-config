ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(extract z git tmux git-extras kubectl minikube helm gitignore mvn bower gitfast github npm python pip docker bazel zsh-autosuggestions zsh-syntax-highlighting)

if [[ $(uname) == 'Linux' ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    alias idea='nohup ~/jetbrains/idea/bin/idea.sh &'
    alias goland='nohup ~/jetbrains/goland/bin/goland.sh &'
    alias clion='nohup ~/jetbrains/clion/bin/clion.sh &'
fi
if [[ $(uname) == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
    # alias idea="open -a '/Applications/IntelliJ IDEA.app'"
    # alias goland="open -a '/Applications/Goland.app'"
    # alias charm="open -a '/Applications/PyCharm.app'"
    # alias ws="open -a '/Applications/WebStorm.app'"
    # alias clion="open -a '/Applications/CLion.app'"
    alias vs="open -a '/Applications/Visual Studio Code.app'"
    alias chrome="open -a 'Google Chrome'"
    if [[ -d "/Applications/Xcode.app" ]]; then
        export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
        export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
    fi
fi

export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

source ~/.p10k.zsh

# Create user level tmp
(! test -e /tmp/"$USER"_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && touch /tmp/"$USER"_tmp_inited

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

if [ -f ~/.env_profile ]; then
    . ~/.env_profile
fi

if [ -f ~/.alias_profile ]; then
    . ~/.alias_profile
fi
