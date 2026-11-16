# 02 - Bootstrap GodIsGNU

## Chroot and seed Guix
1. Bind mounts: proc/sys/dev/run into target and chroot `/mnt/godisgnu`.
2. Ensure `/gnu/store` exists and `guix-daemon` runs (system service or manual start).
3. Authorize substitutes/keys as per Guix manual and run `guix pull`.

## Imperative GNU userland
```sh
mkdir -p /etc/godisgnu
cp /path/to/GodIsGNU/manifests/gnu-core.scm /etc/godisgnu/
guix package -m /etc/godisgnu/gnu-core.scm
# Rollbacks available: guix package --list-generations / --roll-back
```

## Shepherd init
1. Install/copy `etc/shepherd.scm` to target `/etc/shepherd.scm`.
2. Wire boot so PID 1 becomes shepherd (e.g. init symlink/exec or kernel init param depending on bootstrap).
3. Enable and test `guix-daemon` service under Shepherd.

## Bootloader & finalize
1. Install GRUB: `grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GodIsGNU`.
2. Generate config: `grub-mkconfig -o /boot/grub/grub.cfg`.
3. Set hostname/os-release to **GodIsGNU GNU/Linux**, reboot, and audit `docs/FIRMWARE.md`.
