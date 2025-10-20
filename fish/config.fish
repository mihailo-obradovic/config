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

# node options are set temporarily (will set globally if it works, while max user watches are set permanently in /etc/sysctl.conf)
alias improve-performance 'set -gx NODE_OPTIONS "--max-old-space-size=4096" && echo fs.inotify.max_user_watches=524288 && echo $NODE_OPTIONS'

# Uncomment if using pyenv
# pyenv init - fish | source

set -g theme_display_date no

set -Ua fish_user_paths (composer global config bin-dir --absolute >/dev/null 2>&1)
