# GodIsGNU GNU/Linux Install Notes

> This is a scaffold to build from a minimal running Linux host (Debian/Devuan/live environment). No Arch ISO. Review every command before running.

## 1. Hardware & firmware (transitional)
- Record hardware: `lspci -nnk`, `lsusb`, `uname -a`.
- Identify required nonfree firmware blobs (Wi‑Fi/GPU/etc.). Keep them minimal and list them in `docs/FIRMWARE.md`.
- Target future state: replace mainline kernel/firmware with Linux-libre when hardware permits.

## 2. Disk layout (example)
- EFI System Partition: 512M, vfat, mounted at `/boot/efi`
- Root: ext4 (or btrfs), mounted at `/mnt/godisgnu`
- Swap: optional

Example:
```sh
# DANGER: replace /dev/sdX with your disk
mkfs.vfat -F32 /dev/sdX1
mkfs.ext4 -L GODISGNU /dev/sdX2
mount /dev/sdX2 /mnt/godisgnu
mkdir -p /mnt/godisgnu/boot/efi
mount /dev/sdX1 /mnt/godisgnu/boot/efi
```

## 3. Bootstrap base + Guix
- Create minimal FHS dirs under target (`bin,sbin,etc,var,run,home,root,tmp,usr,proc,sys,dev`).
- Install/copy a minimal userspace and kernel+modules+required firmware to boot.
- Install GNU Guix (binary installation) onto target and initialize `/gnu/store` and `guix-daemon`.
- Set Guix profiles first in PATH for a GNU-dominant userland.

## 4. Init: GNU Shepherd
- Install Shepherd via Guix: `guix install shepherd`.
- Place system config at `/etc/shepherd.scm` (see `../etc/shepherd.scm`).
- Ensure PID 1 execs shepherd on boot (via kernel/initramfs or minimal init handoff as per your bootstrap method).

## 5. Bootloader
- Install GNU GRUB to EFI, generate config pointing to your kernel/initrd and root UUID.
- Keep config reproducible where possible.

## 6. Post-install (imperative Guix)
```sh
guix pull
guix package -m /etc/godisgnu/manifests/gnu-core.scm
guix package --list-generations   # inspect/rollback anytime
```

## 7. Audit
- Document remaining nonfree bits in `docs/FIRMWARE.md`.
- Prefer GNU tools and call the system **GodIsGNU GNU/Linux**.
