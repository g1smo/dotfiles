;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce.

(use-modules (gnu) (srfi srfi-1) (gnu system nss))
(use-service-modules desktop networking)
(use-package-modules bootloaders certs shells ssh version-control emacs vim wm freedesktop xorg fontutils)

;; ZSH location G-expr
(define zsh-location
  #~(string-append #$zsh "/bin/zsh"))

;; Replace wicd with NetworkManager
(define %desktop-services-nm
   (cons* (service network-manager-service-type (network-manager-configuration))
          (service wpa-supplicant-service-type)
          ;;(service account-service-type)
          (remove (lambda (service) (eq? wicd-service-type (service-kind service))) %desktop-services)))


(operating-system
  (host-name "gpnx")
  (timezone "Europe/Ljubljana")
  (locale "en_US.UTF-8")

  ;; Assuming /dev/sdX is the target hard disk, and "my-root"
  ;; is the label of the target root file system.
  (bootloader (grub-configuration (grub grub);;-efi) 
                                  ;;(device "/dev/sda1")))
                                  (device "/dev/sda")))
  (file-systems (cons* (file-system
                        (device "gpnx")
                        (title "GNU Guix SD pnx")
                        (mount-point "/")
                        (type "ext4"))
                       (file-system
                        (device "/dev/sda1")
                        (mount-point "/boot/efi")
                        (type "vfat"))
                      %base-file-systems))

  (users (cons* (user-account
                  (name "yuri")
                  (comment "Silly Yuri")
                  (group "users")
                  (shell zsh-location)
                  (supplementary-groups '("wheel" "netdev"
                                          "audio" "video"))
                  (home-directory "/home/yuri"))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (cons* nss-certs         ;for HTTPS access
                   zsh               ;Z shell
                   openssh
                   git
                   emacs
                   vim
                   bspwm
                   libinput
                   xf86-input-libinput
                   freetype
                   %base-packages))

  ;; Add GNOME and/or Xfce---we can choose at the log-in
  ;; screen with F1.  Use the "desktop" services, which
  ;; include the X11 log-in service, networking with Wicd,
  ;; and more.

  (services (cons* ;;(xfce-desktop-service)
                   (gnome-desktop-service)
                   %desktop-services-nm))

  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
