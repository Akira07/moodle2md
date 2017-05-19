# Moodle2md

Moodleに提出されたオンラインテキストをマークダウンファイルに変換します


## ディレクトリ説明
- submit_files : 提出されたオンラインテキストを一括DLしたものを格納するディレクトリ


## 実行方法

1. `$ bundle install --path vendor/bundle`
2. `$ ruby run.rb`


現状，submit_files 内の全ての onlinetext.html を1つのマークダウンファイルに変換します