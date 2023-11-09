---
title: "Bash"
date: 2022-09-19T15:10:31+03:00
draft: false
---

## Varibales
`NAME=Hello`
> without any spaces

To make it global
`export NAME=WORLD`

## Comands

head
tail -f
cut -d" , " -f 2 file.name
uniq
sort
tr
sed 'regex' name.txt

wc - shows number of lines words characters

## Streams
0 Stdin 
1 Stdout 
2 Stderr

### Redirect
\> to a file 
\>\> append if exists
2\> redirect error
&\> stdout and stderr

\< std in 
<> std in from file and redirect to it

> cat file.name > newfile.name 2> &1
> &1 -> wherever stdin is redirecting


> cat file.name &> /dev/null
> vanishes data

> cat << my_name
> \> this is a here-doc
> \> another here-doc is here!
> \> my_name

## Pipes
|
xargs -> writes in the end
xargs -I here another text here

## Processes
xeyes
ctrl + z -> stops the program
jobs -> show jobs
fg %1 -> continue stoped job
bg -> continue stoped jobs in the background
my_command & -> to run program in the background
nohup -> continue to run a program even after shell was killed

kill -1 -> hup -> when shell is closed, kill the process
kill -15 -> politely ask to terminate
kill -9 -> kill the program

killall
pkill -> kill all procesed that has in name your input

ps -> show processes
ps -e -> all
ps -ef

pgrep

uptime
free

watch -> update every 2s

df -h -> disk status
