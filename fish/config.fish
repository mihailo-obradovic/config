if status is-interactive
# Commands to run in interactive sessions (i.e. neofetch) can go here
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

# # Uncomment if using pyenv
# # pyenv init - fish | source

set -g theme_display_date no

# set -Ua fish_user_paths (composer global config bin-dir --absolute >/dev/null 2>&1)

# TODO: Fix
# # Auto-run `nvm use` when .nvmrc exists, with fallback (Fish shell)
# function nvm_auto_use --on-event chpwd
#   # Find .nvmrc in current or parent directories (using nvm's built-in helper)
#   set nvmrc_path (nvm_find_nvmrc)
 
#   if test -n "$nvmrc_path"
#     # Extract version from .nvmrc
#     set nvmrc_version (cat "$nvmrc_path")
 
#     # Try to use the .nvmrc version
#     if nvm use "$nvmrc_version" > /dev/null 2>&1
#       echo "nvm: Automatically switched to Node.js $nvmrc_version (from .nvmrc)"
#     else
#       # Fallback 1: Use global default if set
#       set default_version (nvm alias default 2>/dev/null | awk '{print $2}')
#       if test -n "$default_version" && test "$default_version" != "N/A"
#         nvm use default > /dev/null 2>&1
#         echo "nvm: .nvmrc version $nvmrc_version not installed. Falling back to global default ($default_version)"
#       else
#         # Fallback 2: Use latest installed version
#         nvm use node > /dev/null 2>&1  # "node" = latest installed
#         echo "nvm: .nvmrc version $nvmrc_version not installed. Falling back to latest installed version"
#       end
#     end
#   end
# end
