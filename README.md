# git-semver-plugin-update-keepachangelog-bitbucket

A [git-semver](https://github.com/markchalloner/git-semver) plugin that updates a CHANGELOG.md according to [keep a changelog](https://github.com/olivierlacan/keep-a-changelog) standards, with [Bitbucket](https://bitbucket.org/) links for the compares.

## Installation

After cloning, copy `update_keepachangelog_bitbucket.sh` to one of these dirs: 

|Location                        | 
|------------------------------- | 
|`./.git-semver/plugins`         | 
|`${HOME}/.git-semver/plugins/`  | 

Example:

```bash
cp /path/to/git-semver-plugin-update-keepachangelog-bitbucket/update_keepachangelog_bitbucket.sh ~/.git-semver/plugins/update_keepachangelog_bitbucket.sh
```

Make sure its executable. 

See [git-semver](https://github.com/markchalloner/git-semver) for more on how to install and use plugins. 
