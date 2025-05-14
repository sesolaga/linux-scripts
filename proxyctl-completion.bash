# Completion script for proxyctl
_proxyctl_completions()
{
    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    local opts="enable disable status"

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

    return 0
}
complete -F _proxyctl_completions proxyctl
