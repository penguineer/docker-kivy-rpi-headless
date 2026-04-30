FROM python:3.10-bookworm
MAINTAINER Stefan Haun <mail@tuxathome.de>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    build-essential \
    cmake \
    git \
    pkg-config libgl1-mesa-dev libgles2-mesa-dev \
    libgstreamer1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-omx-generic gstreamer1.0-alsa libmtdev-dev \
    xclip xsel libjpeg-dev \
    libfreetype6-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libtiff-dev libwebp-dev \
    libopus-dev libopusfile-dev \
    gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev \
    x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://github.com/libsdl-org/SDL/releases/download/release-2.30.2/SDL2-2.30.2.tar.gz \
    && tar -zxvf SDL2-2.30.2.tar.gz \
    && cd SDL2-2.30.2 \
    && ./configure --enable-video-kmsdrm --disable-video-opengl --disable-video-x11 \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf SDL2-2.30.2 SDL2-2.30.2.tar.gz

RUN wget https://github.com/libsdl-org/SDL_image/releases/download/release-2.8.2/SDL2_image-2.8.2.tar.gz \
    && tar -zxvf SDL2_image-2.8.2.tar.gz \
    && cd SDL2_image-2.8.2 \
    && mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . -j$(nproc) \
    && cmake --install . \
    && cd ../.. \
    && rm -rf SDL2_image-2.8.2 SDL2_image-2.8.2.tar.gz

RUN wget https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.8.0/SDL2_mixer-2.8.0.tar.gz \
    && tar -zxvf SDL2_mixer-2.8.0.tar.gz \
    && cd SDL2_mixer-2.8.0 \
    && mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . -j$(nproc) \
    && cmake --install . \
    && cd ../.. \
    && rm -rf SDL2_mixer-2.8.0 SDL2_mixer-2.8.0.tar.gz

RUN wget https://github.com/libsdl-org/SDL_ttf/releases/download/release-2.22.0/SDL2_ttf-2.22.0.tar.gz \
    && tar -zxvf SDL2_ttf-2.22.0.tar.gz \
    && cd SDL2_ttf-2.22.0 \
    && mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . -j$(nproc) \
    && cmake --install . \
    && cd ../.. \
    && rm -rf SDL2_ttf-2.22.0 SDL2_ttf-2.22.0.tar.gz

RUN ldconfig

RUN python3 -m pip install Cython==0.29.37 --no-input --no-cache-dir
RUN KIVY_RPI_VERSION=3 python3 -m pip install "kivy[base]==2.1.0" --no-binary kivy --no-input --no-cache-dir
