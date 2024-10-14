FROM balenalib/rpi-raspbian:bookworm

RUN useradd -ms /bin/bash chromium

RUN sudo apt-get update

RUN sudo apt-get install wget curl 

RUN sudo apt-get install ttf-mscorefonts-installer chromium

RUN sudo apt-get install dbus

# RUN curl -sSL https://raw.githubusercontent.com/CraigBurden/rpi-kiosk/master/tools/install-chromium-browser.sh | bash

USER chromium
