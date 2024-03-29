if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias v="nvim"
alias vim="nvim"

alias dot="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

switch (uname)
  case Darwin
    set -x PATH /opt/homebrew/bin $PATH
    set -x PATH /opt/homebrew/opt/llvm/bin $PATH
    set -x PATH /opt/homebrew/opt/bison@3.8/bin $PATH
    set -x PATH $HOME/Library/Application Support/Coursier/bin $PATH
    set -x PATH $HOME/.cargo/bin $PATH
    set -x PATH /usr/local/bin $PATH
    
    set -x PATH /Applications/CMake.app/Contents/bin $PATH
    set -x PATH $HOME/.local/bin $PATH
    set -x PATH $HOME/Library/Python/3.10/bin $PATH


    set LLVM_BIN /opt/homebrew/Cellar/llvm/16.0.1/bin
    set -g -x CC $LLVM_BIN/clang
    set -g -x CXX $LLVM_BIN/clang++

    set -x PATH $HOME/Devel/dartshit/fluttersdk/flutter/bin $PATH
  case Linux
  case '*'

end

