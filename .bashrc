echo ".bashrc"
# test -x "$(which docker)" && eval $(docker-machine env default)
DOCKER_EMOJI=🐳
__active_machine() {
  if [ -x "$(which docker)" -a -n "$DOCKER_SHELL" ]; then
    FORMAT=$1
    if ACTIVE=$(docker-machine active 2>/dev/null); then
      STATE=$(docker-machine status $ACTIVE)
      if [ "$STATE" = "Running" ]; then
        STATE="+"
        # IP=$(docker-machine ip $ACTIVE)
      else
        STATE="${bakred}${bldwht}${STATE}${txtrst}"
      fi

      printf "$FORMAT" "$DOCKER_EMOJI" "$ACTIVE" "$STATE"
    fi
  fi
}

alshow() {
    d=$(mktemp -d);
    allure generate -v 1.4.5 -o "$d" "$@";
    allure report open -o "$d";
}

install_latest_node() {
    # FIXME: brew install node@6
    # then just add `echo` into end of {VENV}/bin/activate
    if [ -n "$VIRTUAL_ENV" ]; then
        pushd /tmp
        curl http://nodejs.org/dist/node-latest.tar.gz | tar x
        pushd node-v*
        ./configure --prefix=$VIRTUAL_ENV
        make install
        popd
        rm -rf node-v*
        popd
    else
        echo "You should activate your Virtual Env first"
        # or use nodeenv pypi pkg
    fi
}

install_cscope() {
    # brew install cscope
    sudo apt-get install -y cscope
}

install_ctags() {
    # http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    # brew install ctags
    sudo apt-get install -y exuberant-ctags
}

install_vimrc_link() {
    if [ ! -h $1 ]; then
        ln -sf ~/vimrc/$(basename $1) $1
    fi
}

install_myrepos() {
    # Usage: mr init your repos
    # brew install myrepos
    sudo apt-get install myrepos
}

install_fuck() {
    # brew install thefuck
    cd ~ && wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0
}

install_ag() {
    # brew install the_silver_searcher
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
    # brew install automake pkg-config pcre xz
    # cd ~ && git clone https://github.com/ggreer/the_silver_searcher && cd the_silver_searcher && ./build.sh && sudo make install
    # cd ~ && git clone https://github.com/sampson-chen/sack.git && cd sack && chmod +x install_sack.sh && ./install_sack.sh
    # FIXME: next cmd is so danger
    # ln -sf /usr/local/bin ~/bin
    # cd ~ && git clone https://github.com/sampson-chen/sack.git && cp sack/sag /usr/local/bin/sag && cp sack/sack /usr/local/bin/sack
    # more tools:
    # * rpl
    # * cloc
}

init_bundle() {
    # TODO:
    # https://github.com/svermeulen/vim-easyclip
    # https://github.com/tpope/vim-unimpaired
    # https://github.com/goldfeld/vim-seek
    read -r -d '' list_of_vim_plugins <<-'EOF'
https://github.com/Quramy/tsuquyomi
https://github.com/Quramy/vim-js-pretty-template
https://github.com/Shougo/neocomplete
https://github.com/Shougo/vimproc.vim
https://github.com/altercation/vim-colors-solarized
https://github.com/ctrlpvim/ctrlp.vim
https://github.com/d3ph/vim-flake8
https://github.com/davidhalter/jedi-vim
https://github.com/leafgarland/typescript-vim
https://github.com/rking/ag.vim
https://github.com/scrooloose/nerdtree
https://github.com/ternjs/tern_for_vim
https://github.com/tpope/vim-abolish
https://github.com/tpope/vim-commentary
https://github.com/tpope/vim-dispatch
https://github.com/tpope/vim-fugitive
https://github.com/tpope/vim-repeat
https://github.com/tpope/vim-speeddating
https://github.com/tpope/vim-surround
https://github.com/vim-scripts/taglist-plus
https://github.com/wincent/Command-T
EOF
    if [ -d ~/.vim/bundle ]; then
        for url in $list_of_vim_plugins; do
            cd ~/.vim/bundle && git clone --recursive $url
        done
        if [ -d ~/.vim/bundle/vimproc.vim ]; then
            pushd ~/.vim/bundle/vimproc.vim
            make
            popd
        fi
        if [ -d ~/.vim/bundle/tern_for_vim ]; then
            pushd ~/.vim/bundle/tern_for_vim
            npm install
            popd
        fi
    fi
}

update_bundle() {
    for i in ~/.vim/bundle/*; do
        echo $i && cd $i && git pull --ff-only
    done
}

setup_bash() {
    if [ ! -d ~/.bash ]; then
        mkdir ~/.bash
        pushd ~/.bash
        # TODO: check for git, if darwin -> brew, ubuntu apt-get, gentoo ...
        test -x "$(which git)" && git clone git://github.com/jimeh/git-aware-prompt.git || echo "Warning:: git not found, please install it and rerun setup_bash"
        popd
    fi

    install_vimrc_link ~/.bash_alias
    install_vimrc_link ~/.vim
    install_vimrc_link ~/.vimrc
    install_vimrc_link ~/.gitconfig
    install_vimrc_link ~/.gitignore_global
    install_vimrc_link ~/.tmux.conf
    install_vimrc_link ~/.sackrc
    install_vimrc_link ~/.ctags
    test ! -h ~/.mrconfig && cp ~/vimrc/.mrconfig ~/.mrconfig
}

not_master() {
    test -x "$(which git)" && test ${git_branch:-(master)} != "(master)"
}

hard_rebase() {
    not_master && git fetch && git merge oribin/master master && git rebase --onto master ${TOD:place_here_all_branches_between_current_and_master} ${git_branch//[()]}
}

merge() {
    not_master && git fetch && git merge origin/master ${git_branch//[()]}
}

push() {
    not_master && git push origin ${git_branch//[()]}
}

# Show Reverse Dependencies
deps() {
    # FIXME: apt-cache rdepends --installed $1 | tail -n +1
    apt-cache showpkg $1 | perl -lne 'BEGIN{$flag=0};if (/^Reverse Depends:/) {$flag=1} elsif (/^Dependencies:/) {$flag=0} elsif ($flag) {m/\s+([^,]+)/; print $1};' | sort | uniq
}

# Show Installed Packages
pkgs() {
    dpkg -l | cut -f3 -d ' ' | tail -n +6
}

# Print Associative Arrays
pp() { for k in $(eval "echo \${!$1[@]}"); do echo $k:$(eval "echo \${$1[\$k]}"); done }

# recursive & depends on blame() & deps()
reverse_find() { for i in `deps $1`; do { dpkg -l $i 2>/dev/null | tail -n +6; } && let aa[$i]+=1 && test ${aa[$i]} -lt 5 && reverse_find $i; done }

# depends on reverse_find() & pp()
blame() { unset aa; declare -A aa; reverse_find $1; pp aa; }

ssh0() { ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$1; }

function rcanybar() {
    echo "$@" '&& (echo -n "exclamation" | nc -4u -w0 localhost 1738 ) || (echo -n "question" | nc -4u -w0 localhost 1738)' > /tmp/__watch
    watch bash /tmp/__watch
}

# force_color_prompt=yes

test -x "$(which thefuck)" && eval "$(thefuck --alias)" || echo "Warning:: fuck not found, install it from github.com/nvbn/thefuck"

export GITAWAREPROMPT=~/.bash/git-aware-prompt
if [ -f "${GITAWAREPROMPT}/main.sh" ]; then
    source "${GITAWAREPROMPT}/main.sh"
    if [ "$(whoami)" == "root" ]; then
        export PS1="\${debian_chroot:+(\$debian_chroot)}\[$bldred\]\u\[$bldgrn\]@\h\[$txtrst\]:\[$bldblu\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]# "
    else
        export PS1="\$(__active_machine '\[$bldblk\]{%s :%s:\[$txtylw\]%s\[$bldblk\]}\[$txtrst\]')\${debian_chroot:+(\$debian_chroot)}\[$bldgrn\]\u@\h\[$txtrst\]:\[$bldblu\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
    fi
fi

export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:[bf]g:exit'
export IGNOREEOF=1
export CLICOLOR=1
export GREP_COLOR='1;31'
export LESS="-ierX"
export LSCOLORS="Exfxcxdxbxegedabagacad"
export TERM=xterm-256color
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

install_homeshick() {
    git clone git://github.com/andsens/homeshick.git ${HOME}/.homesick/repos/homeshick
}
if [ -f "${HOME}/.homeshick/repos/homeshick/homeshick.sh" ]; then
    source ${HOME}/.homeshick/repos/homeshick/homeshick.sh
fi

PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;
