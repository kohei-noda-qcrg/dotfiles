# dotfiles

```
NAME=yourname
EMAIL=youremail@example.com
sed -e "s/@USERNAME@/$NAME/" -e "s/@USEREMAIL@/$EMAIL/" ./git/.gitconfig.in > .gitconfig
bash setup.sh
```

## VSCode setting

- You must specify in absolute path
```sh
ln -s /abs/path/to/this/repo/vscode/settings.json ~/.vscode-server/data/Machine
```

## GitHub CLI

```sh
gh alias import /path/to/this/repo/github/github-cli/alias
```
