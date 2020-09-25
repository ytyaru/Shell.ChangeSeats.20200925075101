[en](./README.md)

# ChangeSeats

　TSVの行順序を入れ替える（席替え）。

# デモ

```sh
run.sh 7 | ChangeSeats.sh -m a
3	つるひさ	ゆのあ	鶴久	優乃愛	f
5	まえはた	まさと	前畠	鷹斗	m
4	ひらくぼ	れいら	平久保	玲良	f
7	りゅうぞうじ	しゅんせい	竜造寺	舜成	m
6	もとのぶ	さいか	元信	彩叶	f
2	こみやま	あとむ	込山	阿斗無	m
1	こうじな	うい	神品	羽唯	f
```
```sh
real	0m0.689s
user	0m0.606s
sys	0m0.163s
```

# 特徴

* 出席番号順
* ランダム
* ランダム（男女交互）

# 開発環境

* <time datetime="2020-09-25T07:50:58+0900">2020-09-25</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspbian](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2019-09-26 <small>[setup](http://ytyaru.hatenablog.com/entry/2019/12/25/222222)</small>
* bash 5.0.3(1)-release

```sh
$ uname -a
Linux raspberrypi 4.19.97-v7l+ #1294 SMP Thu Jan 30 13:21:14 GMT 2020 armv7l GNU/Linux
```

# インストール

```sh
cd /tmp
git clone https://github.com/ytyaru/Sqlite3.JapaneseNames.Rate.20200924163636
git clone https://github.com/ytyaru/Shell.ChangeSeats.20200925075101
```

# 使い方

```sh
cd Shell.ChangeSeats.20200925075101/src
Sqlite3.JapaneseNames.Rate.20200924163636/src/run.sh | ./ChangeSeats.sh -m a
```

# 著者

　ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# ライセンス

　このソフトウェアはCC0ライセンスである。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)

