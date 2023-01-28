if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ "${OSTYPE}" == "cygwin" ] || [ "${OSTYPE}" == "msys" ]; then
    #     Window title                      Command prompt
    #     |----------|            |-------------------------------|
    PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\n\$ "
else
    #        Window title                       Command prompt
    #     |----------------|          |-------------------------------|
    PS1="\[\e]0;\u@\h \W\a\]\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\n\$ "
fi