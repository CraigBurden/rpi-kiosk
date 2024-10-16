#!/bin/bash
set +x
set -e

echo ""
echo "Installing Chromium web browser on HypriotOS/X11"
CHROMIUM_BASEURL=https://ppa.launchpadcontent.net/canonical-chromium-builds/stage/ubuntu/pool/main/c/chromium-browser
CHROMIUM_DEB_FILE1=chromium-codecs-ffmpeg-extra_90.0.4430.93-0ubuntu0.16.04.1_armhf.deb
CHROMIUM_DEB_FILE2=chromium-browser_90.0.4430.93-0ubuntu0.16.04.1_armhf.deb

# --------------------------------------------------------------------
echo ""
echo " STEP 1: download Chromium .deb packages"
if [ ! -f /tmp/${CHROMIUM_DEB_FILE1} ]; then
  wget -O /tmp/${CHROMIUM_DEB_FILE1} ${CHROMIUM_BASEURL}/${CHROMIUM_DEB_FILE1}
fi
if [ ! -f /tmp/${CHROMIUM_DEB_FILE2} ]; then
  wget -O /tmp/${CHROMIUM_DEB_FILE2} ${CHROMIUM_BASEURL}/${CHROMIUM_DEB_FILE2}
fi
echo "...done"

# --------------------------------------------------------------------
echo ""
echo " STEP 2: install Chromium .deb packages, first try"
# deactivate error check for this run!
set +e
sudo dpkg -i \
  /tmp/${CHROMIUM_DEB_FILE1} \
  /tmp/${CHROMIUM_DEB_FILE2}
set -e
echo "...done"

# --------------------------------------------------------------------
echo ""
echo " STEP 3: now install all dependent packages (apt-get install -y -f)"
sudo apt-get install -y -f
echo "...done"

# --------------------------------------------------------------------
echo ""
echo " STEP 4: install Chromium .deb packages, second try"
sudo dpkg -i \
  /tmp/${CHROMIUM_DEB_FILE1} \
  /tmp/${CHROMIUM_DEB_FILE2}
echo "...done"

# --------------------------------------------------------------------
echo ""
echo " STEP 5: remove Chromium .deb packages"
rm -f \
  /tmp/${CHROMIUM_DEB_FILE1} \
  /tmp/${CHROMIUM_DEB_FILE2}
echo "...done"

# --------------------------------------------------------------------
echo ""
echo "...Chromium installation done"
