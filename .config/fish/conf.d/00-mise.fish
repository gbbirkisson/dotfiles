if command -v mise >/dev/null
    setenv MISE_NOT_FOUND_AUTO_INSTALL false
    setenv MISE_DISABLE_TOOLS direnv
    setenv MISE_PYTHON_COMPILE 1
    setenv MISE_EXPERIMENTAL 1
    # setenv MISE_DEBUG 1

    mise activate fish | source
    mise completions fish | tail -n +9 | source

    if mise which kubectl >/dev/null
        eval (mise which kubectl) completion fish | source
    end
end
