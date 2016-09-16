# ldpreload-disable
disable LD_PRELOAD on linux, modifying ld-linux shared library

##Testing:

```
$ sudo chroot $HOME/fedora-chroot
bash-4.3# cd /tmp
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
bash-4.3#
```
