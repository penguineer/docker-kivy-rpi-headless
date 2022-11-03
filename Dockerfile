FROM debian:bullseye
MAINTAINER Stefan Haun <mail@tuxathome.de>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget python3-pip python3 \
    build-essential \
    python3-setuptools git-core python3-dev \
    pkg-config libgl1-mesa-dev libgles2-mesa-dev \
    libgstreamer1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-omx gstreamer1.0-alsa libmtdev-dev \
    xclip xsel libjpeg-dev \
    libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev git build-essential \
    gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://libsdl.org/release/SDL2-2.0.10.tar.gz \
    && tar -zxvf SDL2-2.0.10.tar.gz \
    && cd SDL2-2.0.10 \
    && ./configure --enable-video-kmsdrm --disable-video-opengl --disable-video-x11 --disable-video-rpi \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf SDL2-2.0.10 SDL2-2.0.10.tar.gz

RUN wget https://libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz \
    && tar -zxvf SDL2_image-2.0.5.tar.gz \
    && cd SDL2_image-2.0.5 \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && cd ..  \
    && rm -rf SDL2_image-2.0.5 SDL2_image-2.0.5.tar.gz

RUN wget https://libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz \
    && tar -zxvf SDL2_mixer-2.0.4.tar.gz \
    && cd SDL2_mixer-2.0.4 \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf SDL2_mixer-2.0.4 SDL2_mixer-2.0.4.tar.gz

RUN wget https://libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.15.tar.gz \
    && tar -zxvf SDL2_ttf-2.0.15.tar.gz \
    && cd SDL2_ttf-2.0.15 \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf SDL2_ttf-2.0.15 SDL2_ttf-2.0.15.tar.gz

RUN ldconfig

RUN python3 -m pip install Cython==0.29.32 --no-input --no-cache-dir
RUN KIVY_RPI_VERSION=3 python3 -m pip install "kivy[base]==2.1.0" --no-binary kivy --no-input --no-cache-dir
