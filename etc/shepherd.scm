;; GodIsGNU GNU/Linux - GNU Shepherd system configuration (template)
;; Adjust paths/services to match your bootstrap.

(use-modules (shepherd service)
             (shepherd service monitoring))

;; Essential virtual filesystems are assumed mounted by early boot/initramfs
;; or add one-shot services here as needed for your setup.

(define syslog
  (service
    '(syslog)
    #:start (make-forkexec-constructor '("/run/current-system/profile/bin/rsyslogd" "-n"))
    #:stop  (make-kill-destructor)))

(define guix-daemon
  (service
    '(guix-daemon)
    #:requirement '()
    #:start (make-forkexec-constructor
             '("/var/guix/profiles/per-user/root/current-guix/bin/guix-daemon"
               "--build-users-group=guixbuild"))
    #:stop  (make-kill-destructor)
    #:respawn? #t))

(define mingetty-tty1
  (service
    '(term-tty1)
    #:start (make-forkexec-constructor '("/run/current-system/profile/sbin/mingetty" "--noclear" "tty1"))
    #:stop  (make-kill-destructor)
    #:respawn? #t))

(register-services guix-daemon mingetty-tty1)
(start-in-the-background '(guix-daemon term-tty1))

;; On hangup, do a clean shutdown/reboot behavior as desired.
(action 'shepherd 'power-off)
