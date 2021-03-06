# One Liner Tips

# Development
## See a full list of compiler defined symbols
> gcc -dM -E - < /dev/null

## Simple HTTP server ( current directory ? )
### serve current directory tree at http://$HOSTNAME:8000/
> python -m SimpleHTTPServer

## Python smtp server
> python -m smtpd -n -c DebuggingServer localhost:1025

## 32 bits or 64 bits?
> getconf LONG_BIT


# Networking
## Lists all listening ports together with the PID of the associated process
> netstat -tlnp


# Misc
## 一括で特定のファイルのパーミッションを設定する。(ex. *.rbを700に)
> find ./ -type f -name "*.rb" -exec chmod 700 {} \;

## git の設定
### ユーザ名とメールアドレスの設定
> git config --global user.name "Kouki Ooyatsu"

> git config --global user.email "hoge@hoge.com"

## git status, git diff のカラーリングをする
> git config --global color.ui auto

## CPU 時間を消費している Top 5
> ps -eo user, pcpu, pid, cmd | sort -r -k2 | head -6

 * ps
   * -o オプションで表示対象の列を指定
 * sort
   * -r 逆順ソート
   * -k2 二列目でソート

## for を使ってまとめて処理
> for file in *.rb; do cp $file $file.bkp; done

# 簡易ダウンローダ(jpg のみ)
> perl -MLWP::Simple -MFile::Basename -e 'map{mirror($_,basename($_))} get($ARGV[0]) =~ m{<a.*?href="(http://[^"]+\.jpg)"}gi; http://hoge.com/hoge.html

# Run the last command as root
> sudo !!

## Save a file you edited in vim without the needed permissions
### I ofeten forget to sudo before editing a file I don't have
### write perimssions on.
### running vim ...
> :w !sudo tee %

## quickly backup or copy a file with bash.
> cp filename{,.bak}

## Display which distro is installed
> cat /etc/issue

## ダウンロードした tar.gz を展開
> wget -qO - "http://www.tarball.com/tarball.gz" | tar zxvf -

## save command output to image
> ifconfig | convert label:@- ip.png


# Docker
## nsenter
> sudo nsenter --mount --uts --ipc --net --pid --target <Docker Pid>

 * Pid の調べ方(効率がいい方法ありそう)
   * docker ps で得た container ID を docker inspect して grep Pid(効率悪)
 

## 削除系
> docker ps -a | awk '{print $1}' | xargs --no-run-if-empty docker rm

> docker rm `docker ps -a | grep Exited | awk '{print $1 }'`
> docker rmi `docker images -aq`
