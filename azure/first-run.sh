# 初めての起動か否かを判定する
# bashrc の一番下に設置する

source ~/nemtus

if [ $FIRSTRUN -eq 0 ]; then
    # パスワードの設定を求める
    passwd user
    echo FIRSTRUN=1 > nemtus
    symbol-bootstrap wizard
fi
