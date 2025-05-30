if command -v brew >/dev/null 2>&1 && brew --prefix llvm >/dev/null 2>&1; then
  LLVM_PREFIX="$(brew --prefix llvm)"
  export PATH="$LLVM_PREFIX/bin:$PATH"
  export CPATH="$LLVM_PREFIX/include${CPATH:+:$CPATH}"
  export LIBRARY_PATH="$LLVM_PREFIX/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
fi
export CC=clang
export CXX=clang++
export CPLUS_INCLUDE_PATH="$(python3 - <<'PY'
import sysconfig, sys
sys.stdout.write(sysconfig.get_path("include"))
PY
)"

alias sl='ls'

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ "$TMUX" = "" ]; then tmux; fi
