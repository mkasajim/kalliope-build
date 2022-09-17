FROM debian:latest

RUN apt-get update 
RUN apt-get install -y \
    git python3-dev libpython3-dev libsmpeg0 flac \
    libffi-dev libssl-dev portaudio19-dev build-essential \
    libatlas3-base mplayer wget vim sudo locales \
    pulseaudio-utils libasound2-plugins python3-pyaudio libasound-dev \
    libportaudio2 libportaudiocpp0 ffmpeg

RUN wget http://ubuntu.mirrors.tds.net/ubuntu/pool/multiverse/s/svox/libttspico-data_1.0+git20130326-8_all.deb
RUN wget http://http.us.debian.org/debian/pool/non-free/s/svox/libttspico0_1.0+git20130326-9_amd64.deb
RUN wget http://ftp.us.debian.org/debian/pool/non-free/s/svox/libttspico-utils_1.0+git20130326-9_amd64.deb
RUN dpkg -i libttspico-data_1.0+git20130326-8_all.deb
RUN dpkg -i libttspico0_1.0+git20130326-9_amd64.deb
RUN apt-get install -y -f ./libttspico-utils_1.0+git20130326-9_amd64.deb
RUN wget https://bootstrap.pypa.io/get-pip.py

RUN python3 get-pip.py

RUN pip3 install -U setuptools

RUN pip3 install kalliope

RUN cd /

RUN git clone https://github.com/kalliope-project/kalliope_starter_en.git

RUN cd kalliope_starter_en

WORKDIR /kalliope_starter_en

CMD kalliope start
