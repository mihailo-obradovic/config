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
alias ni 'npx nuxi module add'
alias update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias dock 'sudo docker'
alias lazydock 'sudo lazydocker'

pyenv init - fish | source

set -g theme_display_date no
