# GodIsGNU GNU/Linux

GodIsGNU is a free-software-oriented GNU/Linux system scaffold: **GNU Shepherd** as init, **GNU Guix** for package management (usable imperatively), and a GNU-heavy userland.

This project aims to follow the [GNU Free System Distribution Guidelines (FSDG)](https://www.gnu.org/distros/free-system-distribution-guidelines.html) as closely as possible.

## Freedom status (important)

- **Current (transitional):** May use a mainline Linux kernel and minimal nonfree firmware required for some hardware. Because of this, the current system is **not** a fully free system and is **not** endorsed by the Free Software Foundation.
- **Goal:** Move to **Linux-libre** and remove all nonfree software/firmware so the system can be fully free in line with the FSDG.

## Components

- **Init:** [GNU Shepherd](https://www.gnu.org/software/shepherd/)
- **Package manager:** [GNU Guix](https://guix.gnu.org/) (supports imperative use: `guix install`, `guix remove`, `guix upgrade`, with generation rollbacks)
- **Preferred userland:** GNU libc, GNU Coreutils, Bash, GCC, GNU Binutils, GNU Make, GRUB, Emacs, etc.
- **Name:** Please call the system **“GodIsGNU GNU/Linux”** to acknowledge the role of the GNU operating system.

## Repository layout

- `bootstrap/` — host preparation and bootstrap notes/scripts
- `etc/` — system configuration templates (e.g. Shepherd)
- `manifests/` — Guix manifests for core/user profiles
- `docs/` — install notes and nonfree firmware audit

## Contributing

Contributions that advance software freedom are welcome: replace nonfree components, improve reproducibility, and align with the GNU FSDG. Please use and promote free software.

## License

The configuration files, manifests, scripts, and documentation in this repository are licensed under the GNU General Public License v3.0 or later. See [COPYING](COPYING).
