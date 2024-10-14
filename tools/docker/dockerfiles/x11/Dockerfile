FROM balenalib/rpi-raspbian:bookworm

RUN sudo apt-get update

RUN sudo apt-get install --no-install-recommends -y \
    menu openbox \
    xserver-xorg \
    xinit \
    xserver-xorg-video-fbdev \
    xserver-xorg-input-evdev \
    xserver-xorg-input-all

COPY x.sh /

RUN chmod 700 /x.sh

CMD ["/x.sh"]
