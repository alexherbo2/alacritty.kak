provide-module alacritty %{
  define-command alacritty -params .. -shell-completion -docstring 'Open a new terminal' %{
    nop %sh{
      setsid alacritty "$@" < /dev/null > /dev/null 2>&1 &
    }
  }

  define-command alacritty-popup -params .. -shell-completion -docstring 'Open a new terminal as a popup' %{
    alacritty --class 'Alacritty-Popup' %arg{@}
  }

  # Conform to terminal as aliases
  define-command alacritty-terminal -params 1.. -shell-completion -docstring 'Open a new terminal' %{
    alacritty --command %arg{@}
  }

  define-command alacritty-terminal-popup -params 1.. -shell-completion -docstring 'Open a new terminal as a popup' %{
    alacritty-popup --command %arg{@}
  }
}
