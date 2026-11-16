# GodIsGNU GNU/Linux

A GNU-loving, Guix-powered, Shepherd-inited distro scaffold.

## Principles
- **Init:** GNU Shepherd (PID 1)
- **Packages:** GNU Guix used imperatively (`guix install/remove/upgrade`) with generation rollbacks
- **Kernel (transitional):** Mainline Linux + minimal required nonfree firmware (to be replaced with Linux-libre when hardware allows)
- **Userland:** Prefer GNU (glibc, coreutils, bash, GCC/binutils, make, GRUB, Emacs, etc.)
- **Goal:** Align with [GNU FSDG](https://www.gnu.org/distros/free-system-distribution-guidelines.html) as far as current hardware permits

## Layout
- `bootstrap/` - host preparation and bootstrap steps/scripts
- `etc/` - system configuration templates (Shepherd, profile/env)
- `manifests/` - Guix manifests for core/user profiles
- `docs/` - install notes and hardware/firmware audit

## Quick start (from a running Linux host)
1. Read `docs/INSTALL.md` and adjust for your disk/firmware.
2. Run host prep steps in `bootstrap/01-host-prep.md`.
3. Bootstrap rootfs and Guix per `bootstrap/02-bootstrap.md`.
4. Install Shepherd config from `etc/shepherd.scm` and enable services.
5. Install bootloader, reboot, then `guix pull && guix package -m /etc/godisgnu/gnu-core.scm`.

*Hallelujah. Make it free.*
