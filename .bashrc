alshow() {
    d=$(mktemp -d);
    allure generate -v 1.4.5 -o "$d" "$@";
    allure report open -o "$d";
}

install_vimrc_link() {
    if [ ! -h $1 ]; then
        ln -s ~/vimrc/$(basename $1) $1
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
}

# force_color_prompt=yes

test -x "$(which thefuck)" && eval "$(thefuck --alias)" || echo "Warning:: fuck not found, install it from github.com/nvbn/thefuck"

export GITAWAREPROMPT=~/.bash/git-aware-prompt
if [ -f "${GITAWAREPROMPT}/main.sh" ]; then
    source "${GITAWAREPROMPT}/main.sh"
    if [ $(whoami) == "root" ]; then
        export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;31m\]\u\[\033[01;32m\]@\h\[$txtrst\]:\[\033[01;34m\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]# "
    else
        export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[$txtrst\]:\[\033[01;34m\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
    fi
fi
