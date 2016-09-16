# ldpreload-disable
disable LD_PRELOAD on linux, modifying ld-linux shared library

##Testing:

64 bits
```
$ sudo chroot $HOME/fedora-chroot
bash-4.3# LD_PRELOAD=$PWD/hook.so ./test
hook...
kamehameha
bash-4.3# exit
$ sudo bash ldpreload-disable.sh $HOME/fedora-chroot/lib64/ld-2.22.so 64
4+0 records in
4+0 records out
4 bytes (4 B) copied, 6.6798e-05 s, 59.9 kB/s
$ sudo chroot $HOME/fedora-chroot
bash-4.3# LD_PRELOAD=$PWD/hook.so ./test
kamehameha
```
32 bits

```
bash-4.3# LD_PRELOAD=$PWD/hook32.so ./test32 
hook...
kamehameha
bash-4.3# exit
$ sudo bash ldpreload-disable.sh $HOME/fedora-chroot/lib/ld-2.22.so 32
3+0 records in
3+0 records out
3 bytes (3 B) copied, 8.1387e-05 s, 36.9 kB/s
$ sudo chroot $HOME/fedora-chroot
bash-4.3# LD_PRELOAD=$PWD/hook32.so ./test32 
kamehameha
```
