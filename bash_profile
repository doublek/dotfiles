if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export WORKON_HOME=$HOME/.venv
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

if [ -f ~/.gorc ]; then
    source ~/.gorc
fi

alias show_os_env="env | grep OS_ | grep -v PASSWORD"
alias unset_os_env="unset OS_TENANT_ID; unset OS_TENANT_NAME; unset OS_PROJECT_NAME; unset OS_PROJECT_DOMAIN_NAME; unset OS_PASSWORD; unset OS_USER_DOMAIN_NAME; unset OS_USERNAME; unset OS_REGION_NAME; unset OS_IDENTITY_API_VERSION; unset OS_AUTH_URL;"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
