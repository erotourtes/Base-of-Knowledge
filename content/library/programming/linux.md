---
title: "Linux"
date: 2023-09-06T12:24:00+03:00
draft: true
---

##### Marks
9 labs - 10points = 90points
1 module - 10points = 100points

60+ - pass

Exam - 0.6(lab + mkr) + 36


### lab 1
```bash
#!/bin/bash

echo kernel version is $(uname -r)

echo system architecture is $(uname -m)

echo distribution version is $(cat /etc/os-release | grep "NAME=")

echo Variant 6

man passwd

sudo su -

cd /home
pwd

cd ~/
pwd

env | less

echo $LANG

export kkk=iii
echo kkk is $kkk

printenv kkk

unset kkk

env | grep kkk

history

!1
```
### lab 2
```
cat file file1 file2
wc *param* *file* //show count of -l=>lines, -w=>words (look --help for more)

cut -d: --fields=1,7 pass.txt
awk -F ':' '{ for (i=1; i<=NF; i++) if ($i != 1) printf("%s%s", $i, (i<NF) ? ", " : "\n") }' pass.txt


head/tail -n *count of rows* *file* 
sort -r city.txt


sed 's/first/second/g; s/third/fourth/g' city.txt
sed -E 's/(Spain)/-- \1 --/g;' city.txt

rg -v Exclude it file.txt
rg Austria city.txt | cut -d ' ' --fields 1,2
rg -o # exact match

split -l *number of lines* *filenames* 
```

### lab 3
```
stdin <

stdout 1>, >, >>

stderr 2>


xargs -L 2 # breaks on newlines
xargs -n 2 # after receiving 2 arguments

tee # creates 2 different streams -> stdout
                                  -> file

ls | tee file.txt
ls | tee -a file.txt # append to the file

2>&1 pipe stderr to stdout

xargs -L 2>>&1 >> log1 # error to the stdout descriptor

xargs -n1 # 1 parameter at a time
xargs -t # show command which would be executed
xargs -p # interactive mode


variant F
1) sudo cat /etc/passwd | rg "/bin/fish" | cut -d: -f6 | sudo xargs ls
2) fd .conf\$ --max-depth 1 /etc/ | xargs wc -l
4) done
ls | xargs -I{} rg {} {}

for file in *; do
  if [ -f "$file" ]; then
    grep -o "$file" "$file"
  fi
done 2> error.txt


6)done
cat filelist.txt | xargs -I{} sed s/A/{}/g {}

for file in $(cat ./filelist.txt); do
  cat $file | sed "s/[aA]/$file/g"
done 2> error.txt


7) ls | xargs -I{} rg {} /etc/passwd
8) rg -v "^#" shells | xargs -I{} rg {} /etc/passwd
9) rg "/bin/fish" /etc/passwd | cut -d: -f1 | xargs -I{} rg {} /var/log/auth.log

10) done
cat city.txt | sort | uniq | rg -v "B" | cut -d' ' -f1 | xargs -I{} sh -c "echo {} > tmp/{}"

# needed tmp dir
for line in  $(cat city.txt | sort | uniq | rg -v "B" | cut -d' ' -f1)
do
  echo $line > tmp/"$line"
done

11) echo $PATH | xargs -n 1
or
echo $PATH | tr " " "\n"

12)  done
rg "/bin/fish" /etc/passwd | cut -d: -f1 | xargs -I{} sh -c "id -u {} | xargs echo {}"

for user in $(rg "/bin/fish" /etc/passwd | cut -d: -f1); do
  user_id=$(id -u $user)
  echo $user $user_id
done
```

### lab 4
```
1)
### create many directories
mkdir q{00..99}
-- or
echo q$(seq -f "%02g" 0 99) | xargs mkdir


## etc
fd . --max-depth=1 -td /etc/ | cut -c6- | xargs mkdir

## 0/0/0
for i in $(seq 0 9)
  for j in $(seq 0 9)
    for k in $(seq 0 9)
      echo $i/$j/$k
    end
  end
end

2)
## B: останні слова з рядківз файлу city.txt
## C: повних шлях до файлу та ім’я файлу
for dir in ./tmp/*
  set -l fileNames $(rg -o "[A-z ]+" city.txt | cut -d' ' -f2 | sort | uniq)

  for fileName in $fileNames
   echo "$dir/$fileName" :: $(realpath "$file")/$fileName
# echo $(realpath "$file")/$fileName > "$dir/$fileName"
  end
end

## C: парні рядки з city.txt
sed -n '2~2p' city.txt
sed -n 'n;p' city.txt # even

4исло, яке показує рівень підкаталогу (відносно abc), в якому створюється файл 
realpath --relative-to="./" ./tmp/q00/Austria | rg -o '/' | wc -l | awk '{print $1 + 1}

3)
## file size
fd . -tf --size +5b --size -55b ./tmp/
## файли, які містяться у каталогах 2-го рівня відносно abc
fd . --min-depth 2 --max-depth 2 ./tmp/
--------------------------------> ## have duplicate numbers
9)

## 0/0/0
for i in $(seq 0 9)
  for j in $(seq 0 9)
    for k in $(seq 0 9)
      echo $i/$j/$k
    end
  end
end

fd "([0-9]).+$1.+" -tf ./tmp/

fd . -td ./tmp1 | grep -P '([0-9]).*\1'

fd . /etc/ -tf -x sh - c 'echo {}'

-- or 

fd . -tf | rg -P "([0-9].+\1.+)"
--------------------------------
## знайти каталоги найбільшого рівня вкладеності відносно abc, 
fd . -td |  awk -F/ '{print NF-1,$0}' | sort -n
# working
fd . -td | awk -F/ '{depth = NF - 1; if (depth > maxDepth) maxDepth = depth; lines[depth] = lines[depth] $0 RS} END {print lines[maxDepth]}'

## more then 7 chars
fd . -tf ./tmp/ | awk -F/ '{if (length($NF) > 7) print $0 }
or
find . -not -name '?????*'

-x for execute
EX: fd . -tf --size -22b ./tmp/ -x cp {} {.}.bak

4)
fd "\.log\$" -tf /var | head -2 | xargs -I{} sh -c "echo {} && head -2 {}"

for f in (bash -c "echo {a..f}" | tr ' ' '\n')
  echo $f
end

fd . --changed-within 1d -tf /
fd . --changed-within 5d --changed-before 3d -tf /


fd . /etc/ -tf -x echo {/}
fd . /etc/ -td -x echo {/}

fd ".conf\$" -tf /etc -x wc -l {} 2> /dev/null | sort -nr | head -10
```

### lab 5
```fish
# processes

top
# ? help
# R renice
# M sort on memory

# show how many ram is using (memory)
free -h

watch free
watch df -h
watch -n seconds df -h
watch "ls -ltrh | wc -l"

uptime
uptime -p


### -------------------------------------------- ###
### -------------------------------------------- ###
ps
# show current processes
ps -e # all the processes
ps -f # full info
ps -l # long  `man [PROCESS STATE CODES]`
ps -aux # all the info

# find a process with this name (like `ps -ef | rg name`)
pgrep name


### -------------------------------------------- ###
### -------------------------------------------- ###
nice 
# [-20 to 19] => nicenes [hungry to nice]
# default nicenes is 0, 
# default user can't change nicenes below 0
# => if you're nicer, you allow more resources to other (19)

nice -n 15 ls # run program with nicenes 15
nice ls # run program with nicenes 10

renice
# change priority of the runnign process
# default user can only change process to be nicer


### -------------------------------------------- ###
### -------------------------------------------- ###
# ^C breaks the program
# ^Z stops the program
jobs  # show jobs in the cur session
fg %1 # run the first job in the foreground
bg %1 # run the first job in the bachground

### -------------------------------------------- ###
### -------------------------------------------- ###
nohup command # runs the commnad even if session is terminated

### -------------------------------------------- ###
### -------------------------------------------- ###
# sends signal to process id PID
kill -15 # terminate politely
kill -9  # KILL

# sends -15 signal to all the processes with the given name
killall name

# sends -15 signal to all the processes with the specific pattern
pkill pattern
```

> in `man ps` look for `STANDARD FORMAT SPECIFIERS` and `STATE CODES`


```fish
# 1
ps -eo stat,pid,cmd | rg "^R"

# 2
# --sort -vsz means reversed
ps -eo pid,cmd,%mem,vsz --sort=-vsz | head -11 

# 3 
ps aux | tr -s " " | awk -F' '  '{print $1}' | sort | uniq -c | sed '$d'
# or
ps -e u | sort | cut -d" " -f1 | uniq -c | head -n -1
# ps -ef

# 4
ps -eo pid,cmd,%cpu --sort=-%cpu | head -11

# 5
ps -u $(id -u) -o pid | xargs #kill

# 6 (-F == extra long format)
ps -u $(id -u) -F

# 7 
ps -eo pid,user,cmd,time

# 8
ps -eo pid,user,cmd,lstart

# 9 
tty # to show current tty
pkill -t pts/6 #your tty

# 10
# 11
# 12
# you can use `watch`
top -> press F -> navigate using alt-vim -> to order use alt-left (to select)

# 13
sleep 100 &
ps | rg sleep
renice -n 10 -p pid

# 14
ps -eo state,pid,cmd | rg "^S"

# 15
ps -eo pri,pid,cmd --sort=-pri
# or 
ps -eo pri,pid,cmd  | sed 's/[ \t]*//' | sort -n -k1
```

### lab 6
#### Explanation
```fish

## USER ##
useradd <newuser> # creates with no password, no owned directory
useradd -d /path/to/home <newuser>
useradd -m  <newuser> # creates home automatically

# An easier choice is `adduser`


usermod # modifies the user
usermod -L <user> # lock this account
usermod -aG sudo super # adding super user to sudo group


userdel <user>
userdel -r <user> # removes all data with the user (home dir etc.)


passwd # changes your password
sudo passwd <username> # allows to change to a weak password


## GROUP ##
groupadd <newgroup>
groupadd -g 1200 <newgroup> # with group id 1200


groupmod -g 500 <mygroup> # modify group id


whoami
chage -l <username> # change user password expiry information
id <username> # shows info about user id, groups
groups # shows only groups for cur user
```

##### OWNERSHIP
[youtube](https://youtu.be/HwKz9sX4Waw?si=6hok2CsC7sLmcAR_)  
for user root there is only 1 group, as group root has access to every other groups


`ls -ltrh`
> output:
  ```fish
total 488K  
lrwxrwxrwx.  1 sirmax sirmax ...   
drwxr-xr-x.  1 sirmax sirmax ...   
-rw-r--r--.  1 sirmax sirmax ...   
-rw-r--r--.  1 sirmax sirmax ...   
drwxr-xr-x.  1 sirmax sirmax ...   
-rw-r--r--.  1 sirmax sirmax ...   
-rw-------.  1 sirmax sirmax ...   
drwx------. 13 sirmax sirmax ...   
  ```

   1. files belong to this user (sirmax)  
   2. files belong to this group (sirmax)    



`-rw-r--r--.` combination of 3 points  
1. `-`   indicats if it is a DIRECTORY(d), a FILE(-), a LINK(l)
1. `rw-` tells which permisions the owner(sirmax) has
1. `r--` tells which permisions the group(sirmax) has 
1. `r--` tells which permisions other people has
  > `r` read  
    `w` write  
    `x` execute (rarely it can be `s` it runs with an owner access, not its runner) (`t` very rare. sticky bits (other users can't rm file))


```fish
chown # change ownership

chown user:group ./file.txt


chgrp # change ownership only of the group
chgrp group ./file.txt


chmod # change file mode bits

chmod 755 ./file.txt
chmod -R 755 ./dir # inside dir

# 1. 1 x
# 2. 2 w
# 3. 4 r
#   > 777 (owner can xwr=7, group can xwr=7, others can x-r=5)

-- or 
chmod g+x ./file.txt
chmod o+rw ./file.txt
chmod u+rwx,g=rw,o-xw ./file.txt


umask # defines permision of newly created files
# umask u=rw,g=,0=
# Default : 0002

# 666 - umask = 664
# 6 = 4+2 (user rw)
# 6 = 4+2 (group rw)
# 4 = 4 (others r)
```

#### lab
> in fedora container tehre is no passwd `sudo dnf install -y passwd`
```fish
# variant 1
# 1.
echo Lucia Maria Sofia | xargs -n1 useradd -m
# 2.
passwd Lucia
# 3.
# in /etc/passwd
# Maria:x:1001:1001:Maria Smith:/home/Maria:/bin/bash
# change to Maria Smith 

-- or 
sudo chfn Maria

# 3.
usermod --home /home/Smith Maria && \
sudo mkdir /home/Smith && \
sudo chown Maria:Maria /home/Smith

# note, only user inside sudo group can use `sudo command`, you need to use `su -`

# 4.
usermod -s $(which sh)  Maria

# 5.
groupadd Spanish
# to check if added `cat /etc/group`

# usermod -g GROUP USER # changes users group
# usermod -G GROUP1,GROUP2 USER

echo Lucia Maria Sofia | xargs -n1 usermod -aG Spanish 
# to check groups for user `groups USER`

# 6.
mkdir /home/Spanish
chown Maria:Spanish: /home/Spanish

# 7.
echo hello world >> test.txt
chmod 700 test.txt
-- or 
chmod u=rwx,g=,o= test.txt

# 8.
chgrp Spanish test.txt
chmod g=w test.txt

## DONE ##

# 1. 
chage -E $(date -d "$(date +%Y-%m-%d) - 1day" +%Y-%m-%d) Maria

# 2.
usermod -aG sudo Maria # for some other ditors
usermod -aG wheel Maria # for fedora

# 3.
cat /etc/passwd | cut -d: -f1 | xargs -I{} sh -c 'groups "{}" | sed "s/.*: //" | echo $(wc -w) {}' | sort -n | tail -1

# 4.
cat /etc/passwd | cut -d: -f1 | xargs -I{} sh -c 'groups "{}" | sed "s/.*: //" | echo $(wc -w) {}' | sort -n -r

# 5.
usermod -u $(math $(id -u Lucia) - 125) Lucia

# 6.
# getent passwd "$USER" | cut -d: -f5 | sed "s/$USER//" | tr -d " " | xargs -I{} usermod --login {} "$USER"
getent passwd Maria | cut -d: -f5 | sed "s/Maria//" | tr -d " " | xargs -I{} usermod --login {} "Maria"

# 7
echo Lucia Maria Sofia | tr -s ' ' '\n' | xargs -I{} usermod -g Spanish -aG "{}" "{}"
# or 
echo Lucia Maria Sofia | xargs -n1 sh -c 'usermod -g Spanish -aG $0 $0'

# 8
sudo seq 0 5 | xargs -I{} useradd -d "/home/DIR/" "user{}" 2> /dev/null

# 9
TODO

# 10
# dirs bind to uid, so deleting a user ll would shouw uid

# 11
sudo awk '/^.+:!/' /etc/shadow | cut -d: -f1

# 12
chmod o=w /dir

# 13
groupmod -n hungary OLDGROUP

# 14
TODO

# 15
# Multiple users with same UID is not possible.
```

### lab 7
rpm
yum
ldd
ldconfig

```fish
dnf install mc
# to quite -> alt+0

ldd $(which mc) # shows linked libraries
```

#### Building .rpm
1. install tools `sudo dnf install -y rpmdevtools rpmlint`
1. create project structure `rpmdev-setuptree`
1. tar your source files `tar czf $PCK_NAME.tar.gz $PCK_NAME`
1. move tar file `cp %PCK_NAME.tar.gz  ~/rpmbuild/SOURCES/`
1. generate a .spec file inside ~/rpmbuild/SPEC `cd ~/rpmbuild/SPEC/ && rpmdev-newspec $PCK_NAME` 
1. edit .spec file
1. build the rpm `rpmbuild -ba ~/rpmbuild/SPECS/%PCK_NAME.spec`  
> Build source `rpmbuild -bs ~/rpmbuild/SPECS/my.spec`  .src.rpm  
> Build binary `rpmbuild -bb ~/rpmbuild/SPECS/my.spec`  .rpm

##### Folders Structure
- The BUILD directory is used during the build process of the RPM package. This is where the temporary files are stored, moved around, etc.
- The RPMS directory holds RPM packages built for different architectures and noarch if specified in .spec file or during the build.
- The SOURCES directory, as the name implies, holds sources. This can be a simple script, a complex C project that needs to be compiled, a pre-compiled program, etc. Usually, the sources are compressed as .tar.gz or .tgz files.
- The SPEC directory contains the .spec files. The .spec file defines how a package is built. More on that later.
- The SRPMS directory holds the .src.rpm packages. A Source RPM package doesn't belong to an architecture or distribution. The actual .rpm package build is based on the .src.rpm package.
- <name>-<version>-<release>.<arch>.rpm

##### Macros:
> rpm --eval '%{_bindir}'
- %{_bindir}
- %{name} name of the package (as defined in the Name: field)
- %{version} version of the package (as defined in the Version: field)
- %{_datadir} shared data (/usr/sbin by default)
- %{_sysconfdir} configuration directory (/etc by default)

##### .spec file
```spec
%define version 0.0.1
%define release 1%{?dist}

Name:           lab7_12
Version:        %{version}
-- version for the dnf versioning
Release:        %{release}
Summary:        A lab7_12 script

License:        Apache 2.0
-- how the package name is called (inside ~/rpmbuild/SOURCES/lab7_12-0.0.1.tar.gz)
Source0:        %{name}-%{version}.tar.gz

Vendor: mab.inc
Packager: Ma Sir <ma@mab.com>

BuildRequires: gcc
BuildRequires: make
BuildRequires: libfoobar-devel

Requires: libfoobar >= 1.2.3
Requires: libbaz

%description
Description of the lab7_12 script

-- prepare the code (extract it to the BUILD)
-- In the SOURCES folder should be a file <name>-<version>.tar.gz
-- It should contain folder Source0 (defined above)
-- in which should be source files
%prep
%autosetup


-- build process from (BUILD folder)
%build
make

-- The %install section specifies how the built files should be installed in the build or staging directory (often referred to as the %{buildroot}) within the RPM build environment, not on the target system.
-- from BUILD move BUILDROOT
%install
%make_install

-- clean after installing
%clean
rm -rf $RPM_BUILD_ROOT

-- The %files section lists the files and directories from the %{buildroot} (created during the %install phase) that should be included in the RPM package.
-- FROM (BUILDROOT)
-- Basically it replicates where it would put files in the target machine
%files
%{_bindir}/myprogram
%{_libdir}/mylibrary.so
%{_docdir}/mydocumentation


%changelog
* Thu Oct 19 2023 Super User
0.0.2
- Second version

* Thu Oct 19 2023 Super User
0.0.1
- First version
```

##### example of .spec
```spec
%define version 0.0.1
%define release 1%{?dist}

Name:           lab7_12
Version:        %{version}
Release:        %{release}
Summary:        A lab7_12 script

License:        Apache 2.0
Source0:        %{name}-%{version}.tar.gz

Requires: bash

Vendor: mab.inc
Packager: Ma Sir <ma@mab.com>


%description
Description of the lab7_12 script


%prep
%autosetup


%install
mkdir -p %{buildroot}%{_bindir}
mv script.bash %{buildroot}%{_bindir}/%{name}
chmod +x %{buildroot}%{_bindir}/%{name}


%files
%{_bindir}/%{name}


%changelog
* Thu Oct 19 2023 Super User
0.0.1
- First version
```

The script called `lab7_12-0.0.1/script.bash`
```bash
#!/bin/bash

lines=""

while IFS= read -r line
do
  lines="$lines$line"
done

echo "$lines" | tr -d ' '
```

Script to execute all in 1
```bash
#!/bin/bash

## -------------------------------- ##

PCK_NAME="lab7_12-0.0.1"

script=$(cat << EOF
#!/bin/bash

lines=""

while IFS= read -r line
do
  lines="\$lines\$line"
done

echo "\$lines" | tr -d ' '
EOF
)

spec=$(cat << EOF
%define version 0.0.1
%define release 1%{?dist}

Name:           lab7_12
Version:        %{version}
Release:        %{release}
Summary:        A lab7_12 script

License:        Apache 2.0
Source0:        %{name}-%{version}.tar.gz

Requires: bash

Vendor: mab.inc
Packager: Ma Sir <ma@mab.com>


%description
Description of the lab7_12 script


%prep
%autosetup


%install
mkdir -p %{buildroot}%{_bindir}
mv script.bash %{buildroot}%{_bindir}/%{name}
chmod +x %{buildroot}%{_bindir}/%{name}


%files
%{_bindir}/%{name}


%changelog
* Thu Oct 19 2023 Super User
0.0.1
- First version
EOF
)

## -------------------------------- ##


## Start ##

sudo dnf install -y rpmdevtools rpmlint
rpmdev-setuptree


## Setup SOURCES ##

mkdir ~/"$PCK_NAME"

echo "$script" > ~/"$PCK_NAME"/script.bash

cd ~/ && tar czf ~/rpmbuild/SOURCES/"$PCK_NAME".tar.gz ./"$PCK_NAME"

## Setup SPECS ##

# cd ~/rpmbuild/SPEC/ && rpmdev-newspec $PCK_NAME
echo "$spec" > ~/rpmbuild/SPECS/"$PCK_NAME".spec


## Build ##

rpmbuild -ba ~/rpmbuild/SPECS/"$PCK_NAME".spec

## Install ##
dnf install -y ~/rpmbuild/RPMS/x86_64/lab7_12-0.0.1-1.fc38.x86_64.rpm
```

##### installing & verifying
To install:  
`sudo dnf install ~/rpmbuild/RPMS/noarch/hello-0.0.1-1.el8.noarch.rpm`
or  
`sudo rpm -ivh ~/rpmbuild/RPMS/noarch/hello-0.0.1-1.el8.noarch.rpm`

To verify:
`rpm -qi hello`

To get changelog: 
`rpm -q hello --changelog`

To see which files rpm contains:
`rpm -ql hello` -> /usr/bin/hello.sh


### lab 8
```fish
ip
ifconfig
ping # check avaliability to device
netstat # shows network info (like current listening tcp, udp protocols)
traceroute # show path to device
tracepath
dig # ask dns server for an ip, or namce
nslookup # ask dns server for an ip, or namce
host


# 1 show your ip address
ip addr

# 3: wlp3s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
# --> inet ip/mask brd broadcastip scope global dynamic noprefixroute wlp3s0
#        valid_lft 3996sec preferred_lft 3996sec

# mask /24 means the first 24 bits are taken, so we have 8 bits 2^8=256 - 2 api addreses

# 2 show default gateway
ip route

# 3 get ip address of google.com
nslookup google.com
# or 
dig google.com

# 4 get name of 8.8.8.8
nslookup 8.8.8.8

# 5 
ping 127.0.0.1

# 6
traceroute google.com

# tasks

# 1. avg package time
ping kpi.ua 

# 5. -t tcp -u udp -l listening -n numeric
sudo netstat -tulnp
# or
sudo lsof -i -n

# 7. count tcp
netstat -t | wc -l

# 8.
sudo netstat -t | tail -n +3

# 9.
sudo netstat -tln | rg "(80|443)"

# To add your domain for an ip address edit `/etc/hosts`
```

### lab 9
#### Explnation
*standart layers*
1. Device: physical hard drives (/dev/sda; /dev/sdb; /dev/sdc; ....)
2. Partition: hard drive partitions (/dev/sda ---> /dev/sda1; /dev/sda2/ ...)
*start of lvm layers*
3. Volume: physical volumes (this partition goes to this volume)
4. Volume groups
5. Logical volumes (I'm gonna make a file system on top of a volume group)

```fish
# LVM - logical volume management

dd
losetup
mount

# ======================
# 1. Create a blank file 
# ======================

dd if=/dev/zero of=outputfile bs=1M count=2
# /dev/zero provides endless stream of null bytes
# /dev/urandom for random bytes (use od -A x -t x1z -v)
# bs => block size
# count => copy 2 blocks of block size (2 * 1M = 2M)

#   dd if=/dev/urandom  of=outputFile1 bs=1M count=5
# 5+0 records in --> reads 5blocsk
# 5+0 records out --> writes 5blocks
# 5242880 bytes (5,2 MB, 5,0 MiB) copied, 0,0268615 s, 195 MB/s

# To veriy size `du -sh ./path/file` or `ls -lvrah`

losetup -f /path/to/file # associates an available loop device with the file
losetup -a # to check all created devices

# sudo pvdisplay # show all physical volumes


# ======================
# 2. create volume group
# ======================

# to check all avaliable disks
# lsblk _or_ fdisk -l

sudo vgcreate your_vg_name /dev/mydisk1 /dev/mydisk2
sudo vgdisplay your_vg_name 
# sudo vgdisplay - show all volume groups

# to extend vg
# sudo vgextend vgname /dev/name
# e.x. sudo toDelete2 vgname /dev/loop9


# ======================
# 3. create logical vol.
# ======================

sudo lvcreate -n my-logical-name -L 10G my_vg-name
# e.x. 
# sudo lvcreate -n ln-1 -L 7M my_vg-name
# sudo lvcreate -n ln-2 -L 10M my_vg-name

# sudo lvdisplay - show all logical volumes


# ======================
# 3. create file systems
# ======================

sudo mkfs.ext4 /dev/your_vg_name/your_logical_volume
sudo mkfs.xfs /dev/your_vg_name/your_logical_volume
sudo mkfs.btrfs /dev/your_vg_name/your_logical_volume

sudo apt-get install reiserfsprogs
sudo mkfs.reiserfs /dev/your_vg_name/your_logical_volume

# lsblk - shows all devcies
# df -h - show all mounted filesystems


# ======================
# 3. mount ur filysystem
# ======================

# to check filesystem
sudo file -sL /dev/vg/lv

sudo mount --mkdir /dev/vg/lv /mnt/point


# HOW TO REMOVE IT

sudo umount /mnt/path
# if error, kill the process with pid `fuser -m /mnt/myloopdir`
sudo lvs # or sudo lvdisplay # list all logical volumes
sudo lvchange -an /dev/your_vg_name/your_lv_name # deatcivate logical volume
sudo lvremove /dev/your_vg_name/your_lv_name # remove logical volume

# if error "not found or rejected by a filter"
# sudo vgreduce your_vg_name /dev/69qfSF-qhun-m90w-CopC-EbEP-dU7u-W25K5f

sudo vgchange -an your_vg_name
sudo vgremove your_vg_name


sudo losetup -d /dev/loop#
```

