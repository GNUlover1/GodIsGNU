# 01 - Host Preparation (independent bootstrap, no Arch ISO)

Run from a minimal existing Linux host with root access, networking, and basic tools.

## Dependencies
Ensure host has: bash, coreutils, tar, xz, wget/curl, gpg, mount, chroot, parted/mkfs tools.

## Get Guix binary for bootstrap
```sh
cd /tmp
# Verify signature/key per https://guix.gnu.org/manual/en/html_node/Binary-Installation.html
wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
chmod +x guix-install.sh
# Review script before running: less guix-install.sh
# ./guix-install.sh  (on host, to seed /gnu/store & daemon; then copy/replicate to target as needed)
```

## Prepare target
- Partition/format/mount target root at `/mnt/godisgnu` (see docs/INSTALL.md).
- Create base dirs: `mkdir -p /mnt/godisgnu/{gnu,etc,var,home,root,tmp,proc,sys,dev,run,boot/efi}`.
- Copy a minimal bootable base (kernel, modules, essential firmware, libc/tools or busybox) sufficient to start Shepherd and guix-daemon.
