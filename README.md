# git-semver-plugin-update-keepachangelog-bitbucket

A [git-semver](https://github.com/markchalloner/git-semver) plugin that updates a CHANGELOG.md according to [keep a changelog](https://github.com/olivierlacan/keep-a-changelog) standards, with [Bitbucket](https://bitbucket.org/) links for the compares.

## Installation

After cloning, either copy `update_keepachangelog_bitbucket.sh` to `${HOME}/.git-semver/plugins/` or your local git repo's `.git-semver/plugins` dir.

You could also symlink it to your home so you can easily update it with git:

```bash
$ ln -sv /path/to/git-semver-plugin-update-keepachangelog-bitbucket/update_keepachangelog_bitbucket.sh ${HOME}/.git-semver/plugins/update_keepachangelog_bitbucket.sh
```

See [git-semver](https://github.com/markchalloner/git-semver) for more on how to install and use plugins. 
