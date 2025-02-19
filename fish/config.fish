if status is-interactive
    neofetch
end

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
