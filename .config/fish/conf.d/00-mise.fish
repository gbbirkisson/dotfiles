if command -v mise >/dev/null
    setenv MISE_NOT_FOUND_AUTO_INSTALL false
    setenv MISE_DISABLE_TOOLS direnv
    setenv MISE_PYTHON_COMPILE 1
    setenv MISE_EXPERIMENTAL 1
    # setenv MISE_DEBUG 1

    mise activate fish | source
    mise completions fish | source

    if mise which kubectl >/dev/null
        eval (mise which kubectl) completion fish | source
    end

    if mise which gcloud >/dev/null
        setenv CLOUDSDK_PYTHON /usr/bin/python3
    end

    if mise which just >/dev/null
        eval (mise which just) --completions fish | source
    end

    if mise which hk >/dev/null
        eval (mise which hk) completion fish | source
    end
end
