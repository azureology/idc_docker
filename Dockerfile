FROM jlesage/baseimage-gui:ubuntu-22.04-v4
ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY_WIDTH=1280 DISPLAY_HEIGHT=720 \
    TZ=Asia/Shanghai APP_NAME=XMT \
    DISPLAY=:0 SERVICES_GRACETIME=500 \
    WEB_LISTENING_PORT=-1
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    apt update && apt install -y --no-install-recommends \
    libqt5printsupport5 libqt5charts5 xdotool && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists && \
    ln -sf /home/ubuntu/zx/run_prediction.sh /startapp.sh
