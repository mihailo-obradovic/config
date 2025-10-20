if status is-interactive
    neofetch
end

function fish_greeting
    #
end

# pnpm
set -gx PNPM_HOME "/home/mihailo/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias update-system 'sudo pacman -Syyu'
alias update-aur 'yay -Sua'
alias remove-orphans 'sudo pacman -Qtdq | sudo pacman -Rns -'
alias remove-aur-orphans 'yay -Qtdq | yay -Rns -'
alias art 'php artisan'
alias pr 'pnpm run'
alias pi 'pnpm install'
alias pid 'pnpm install --save-dev'
alias pup 'pnpm update'
alias puf 'pnpm uninstall'
alias px 'pnpm dlx'
alias ni 'pnpm dlx nuxi module add'
alias nc 'pnpm dlx nuxi cleanup'
alias update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias dock 'sudo docker'
alias lazydock 'sudo lazydocker'
alias clera 'clear'

function scn
  pnpm dlx shadcn-vue@latest $argv
end

function doc-md
  pnpm dlx @mdream/crawl $argv
end

function glg
    git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
end

# node options are set temporarily (will set globally if it works, while max user watches are set permanently in /etc/sysctl.conf)
alias improve-performance 'set -gx NODE_OPTIONS "--max-old-space-size=4096" && echo fs.inotify.max_user_watches=524288 && echo $NODE_OPTIONS'

# Uncomment if using pyenv
# pyenv init - fish | source

# Uncomment if using Kiro
# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

set -g theme_display_date no

set -Ua fish_user_paths (composer global config bin-dir --absolute >/dev/null 2>&1)

# Start GNOME Keyring if we are in a graphical session and it's not already running
if status is-login && test -z "$SSH_CLIENT" && test -n "$DISPLAY"
  if not set -q GNOME_KEYRING_PID
      eval (gnome-keyring-daemon --start --components=secrets)
      set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  end
end
