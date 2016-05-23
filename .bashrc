test -x "$(which docker)" && eval $(docker-machine env default)
DOCKER_EMOJI=🐳
__active_machine() {
  if [ -x "$(which docker)" ]; then
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
    ln -sf /usr/local/bin ~/bin
    cd ~ && git clone https://github.com/sampson-chen/sack.git && cp sack/sag /usr/local/bin/sag && cp sack/sack /usr/local/bin/sack
    # more tools:
    # * rpl
    # * cloc
}

init_bundle() {
    read -r -d '' list_of_vim_plugins <<-'EOF'
https://github.com/rking/ag.vim
https://github.com/wincent/Command-T
https://github.com/davidhalter/jedi-vim.git
https://github.com/d3ph/vim-flake8
https://github.com/tpope/vim-fugitive.git
https://github.com/ctrlpvim/ctrlp.vim
https://github.com/scrooloose/nerdtree
EOF
    if [ -d ~/.vim/bundle ]; then
        for url in $list_of_vim_plugins; do
            cd ~/.vim/bundle && git clone --recursive $url
        done
    fi
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

# force_color_prompt=yes

test -x "$(which thefuck)" && eval "$(thefuck --alias)" || echo "Warning:: fuck not found, install it from github.com/nvbn/thefuck"

export GITAWAREPROMPT=~/.bash/git-aware-prompt
if [ -f "${GITAWAREPROMPT}/main.sh" ]; then
    source "${GITAWAREPROMPT}/main.sh"
    if [ $(whoami) == "root" ]; then
        export PS1="\${debian_chroot:+(\$debian_chroot)}\[$bldred\]\u\[$bldgrn\]@\h\[$txtrst\]:\[$bldblu\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]# "
    else
        export PS1="\$(__active_machine '\[$bldblk\]{%s :%s:\[$txtylw\]%s\[$bldblk\]}\[$txtrst\]')\${debian_chroot:+(\$debian_chroot)}\[$bldgrn\]\u@\h\[$txtrst\]:\[$bldblu\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
    fi
fi
