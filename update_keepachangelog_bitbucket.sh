#!/bin/bash

function run() {

    # TODO: Check for "## [Unreleased]" header in CHANGELOG and fail if not found.
    # TODO: If version_current is blank, don't add "[ ]" around new version.

    # Parameters
    local version_new="$1"
    local version_current="$2"
    # local git_hash="$3"
    # local git_branch="$4"
    # local git_root="$5"

    local git_origin
    git_origin=$(git config --get remote.origin.url | sed 's#^\([^@]\+@\|https\?://\)\([^:/]\+\)[:/]\([^\.]\+\)\..*$#\2/\3#g')

    local git_compare="https://${git_origin}/branches/compare"

    # Find Unreleased section, and add new version section below it.
    # eg:
    # "## [Unreleased]"
    #
    # ->
    #
    # "## [Unreleased]
    #
    # ## [v0.2.0] - 2018-08-02"
    local heading_pattern="## \\[Unreleased\\]"
    local heading_format
    heading_format="## \\[Unreleased\\]\\n\\n## \\[${version_new}\\] - $(date +%Y-%m-%d)"

    sed -i -e "s/${heading_pattern}/${heading_format}/g" CHANGELOG.md

    # Update unreleased link to point to newest version
    # eg:
    # "%0D0.1.0" -> "%0D0.2.0"
    local unreleased_link_pattern="%0D${version_current}"
    local unreleased_link_format="%0D${version_new}"

    sed -i -e "s/${unreleased_link_pattern}/${unreleased_link_format}/g" CHANGELOG.md

    # Find the end of unreleased link, then add a new version link after it.
    # eg:
    # "%0D$0.2.0"
    #
    # ->
    #
    # "%0D$0.2.1
    # [v0.2.1]: https://bitbucket.org/vendor/repo/branches/compare/v0.2.1%0Dv0.2.0"
    local new_version_link_pattern="%0D${version_new}"
    local new_version_link_format="%0D${version_new}\\n\\[${version_new}\\]\\: ${git_compare}\\/${version_new}%0D${version_current}"

    sed -i -e "s@${new_version_link_pattern}@${new_version_link_format}@g" CHANGELOG.md

    # Exit codes
    return 0   # No error
    #return 111 # Warning: continue processing plugins and apply version
    #return 112 # Error: continue processing plugins (to allow other generated errors) but stop before applying version
    # return 113 # Fatal error: stop immediately
}

case "${1}" in
    --about)
        echo -n "Update CHANGELOG.md following keepachangelog format with bitbucket compare links."
        ;;
    *)
        run "$@"
        ;;
esac
