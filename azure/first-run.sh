# 初めての起動か否かを判定する
# bashrc の一番下に設置する

source ~/nemtus

if [ $FIRSTRUN -eq 0 ]; then
    # パスワードの設定を求める
    passwd user
    echo FIRSTRUN=1 > ~/nemtus

    # symbol-bootstrapの初期設定を開始する（別途手順書を用意）
    symbol-bootstrap wizard


    # 一旦止めてCustom-presetを修正時最実行する
    symbol-bootstrap stop

    echo ハーベスト報酬の振込先Symbol Addressを入力して下さい:
    read beneficiaryAddress

    echo "      $beneficiaryAddress" >> ~/custom-preset.yaml

    # TODO: dualかapiか、voting nodeかはどのように判定し、可変にするか？
    symbol-bootstrap config -p mainnet -a dual -c ~/custom-preset.yaml
    symbol-bootstrap run --detached

    # 状態確認を行なって終了
    symbol-bootstrap healthCheck
fi
