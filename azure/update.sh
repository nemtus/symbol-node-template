# updateし再実行する
symbol-bootstrap stop
npm install -g symbol-bootstrap
symbol-bootstrap run --detached
symbol-bootstrap healthCheck