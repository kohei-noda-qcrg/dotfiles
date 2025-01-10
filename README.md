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
ln -s /abs/path/to/dotfiles/vscode/settings.json ~/.vscode-server/data/Machine
```
