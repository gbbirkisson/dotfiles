if set -q FISH_DEBUG
    echo (status --current-filename)
end

if command -v mise >/dev/null
    setenv MISE_NOT_FOUND_AUTO_INSTALL false
    setenv MISE_DISABLE_TOOLS direnv
    # setenv MISE_PYTHON_COMPILE 1
    # setenv MISE_EXPERIMENTAL 1
    # setenv MISE_DEBUG 1

    # For gcloud
    setenv CLOUDSDK_PYTHON /usr/bin/python3

    mise activate fish | source
end
