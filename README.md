## 初期設定
```shell-script
curl -L https://raw.githubusercontent.com/duza11/dotfiles/refs/heads/master/install.sh | sh
```

## 更新
flake.lockを更新せず、flakeファイルを評価する場合は以下を実行。
```shell-script
./install.sh update
```

flake.lockも更新する場合は以下を実行。
```shell-script
./install.sh update --upgrade
```
