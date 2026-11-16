;; GodIsGNU GNU/Linux core GNU userland manifest
;; Install imperatively: guix package -m /etc/godisgnu/manifests/gnu-core.scm

(specifications->manifest
 '("bash"
   "coreutils"
   "findutils"
   "grep"
   "sed"
   "gawk"
   "diffutils"
   "tar"
   "gzip"
   "xz"
   "less"
   "which"
   "procps"
   "util-linux"
   "inetutils"
   "iproute2"
   "gcc-toolchain"
   "binutils"
   "make"
   "glibc-locales"
   "grub"
   "emacs-minimal"
   "shepherd"))
