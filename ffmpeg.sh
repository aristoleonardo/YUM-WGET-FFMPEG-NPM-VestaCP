#!/bin/bash

#INSTALLING YUM LIBRARY
	#Remove All FFMPEG Related File
	yum erase ffmpeg faac libfaac x264 libx264 libvpx

	#Install GCC-C++
	yum install gcc gcc-c++ automake autoconf libtool nasm git subversion nasm pkgconfig

	#Install GIT
	yum -y install git

	#Install Epel-Release-6.8-noarpm
	yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

	#Enable Repo
	yum -y install --enablerepo=epel yasm

	
#INSTALLING x264
	cd /usr/local/src
	git clone git://git.videolan.org/x264
	cd x264
	./configure --enable-shared --disable-asm
	make
	make install
	make clean
	make distclean

#INSTALLING FDK-AAC
	cd /usr/local/src
	git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
	cd fdk-aac
	autoreconf -fiv
	./configure
	make
	make install
	make clean
	make distclean


#SET LIBRARY PATH
	export LD_LIBRARY_PATH=/usr/local/lib/
	echo /usr/local/lib > /etc/ld.so.conf.d/custom-libs.conf
	ldconfig

#INSTALL FFMPEG
	cd /usr/local/src
	git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
	cd ffmpeg
	./configure --enable-gpl --enable-nonfree --enable-libfdk_aac --enable-libx264 --enable-shared --arch=x86_64 --enable-pthreads
	make
	make install
	make clean
	make distclean
	clear

#INSTALL IMAGEMAGICK
	yum -y install ImageMagick ImageMagick-devel

#FFMPEG VERSION
    ldconfig
	ffmpeg -version
