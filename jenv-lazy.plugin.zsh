# Try to find jenv, if it's not on the path
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
    export PATH="${JENV_ROOT}/bin:${PATH}"
fi

# Lazy load jenv
if type jenv > /dev/null; then
    export PATH="${JENV_ROOT}/bin:${JENV_ROOT}/shims:${PATH}"
    function jenv() {
        unset -f jenv
        eval "$(command jenv init -)"
        jenv $@
    }
fi
