export EDITOR='emacsclient -n'
# Use to make GNU Global treat *.h files as C++
export GTAGSFORCECPP=

if [[ `hostname` == 'tinkle' ]]; then
    # Tinkle is the woefully under-powered machine, on which I must
    # use the package manager's binary of Clang, not my custom build.
    export CLANG=clang-3.6
    export CLANGXX=clang++-3.6
else
    # Otherwise, my dotfiles will put the right build directory on my
    # path, and I'll use my own version of Clang.
    export CLANG=clang
    export CLANGXX=clang++
fi
