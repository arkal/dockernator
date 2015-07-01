# Precision Immunotherapy Pipeline Dockerfile
#
# 
# Build with: sudo docker build --rm --no-cache -t pimmuno - < Dockerfile
# Run with: sudo docker run -i -t pimmuno /bin/bash

# Use ubuntu
FROM aarjunrao/ubuntu

MAINTAINER Arjun Rao aarjunrao@soe.ucsc.edu

# Get the essentials
RUN apt-get update
RUN apt-get install -y software-properties-common wget libgomp1 curl build-essential checkinstall git openjdk-7-jre maven python-dev libpng-dev

# Install zlib for samtools
RUN curl -L http://zlib.net/zlib-1.2.8.tar.gz > zlib-1.2.8.tar.gz 
RUN tar -zxvf zlib-1.2.8.tar.gz ; rm zlib-1.2.8.tar.gz
RUN cd zlib-1.2.8 ; ./configure ; make install; cd ../

# Install ncurses for samtools
#RUN wget -c http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
#RUN tar -zxvf ncurses-5.9.tar.gz ; rm ncurses-5.9.tar.gz
#RUN cd ncurses-5.9 ; ./configure ; make ; make install; cd ../
apt-get install ncurses-dev

# Install samtools, bcftools and htslib
RUN curl -L http://sourceforge.net/projects/samtools/files/samtools/1.2/samtools-1.2.tar.bz2/download > samtools.tar.bz2
RUN curl -L http://sourceforge.net/projects/samtools/files/samtools/1.2/bcftools-1.2.tar.bz2/download > bcftools.tar.bz2
RUN curl -L http://sourceforge.net/projects/samtools/files/samtools/1.2/htslib-1.2.1.tar.bz2/download > htslib.tar.bz2
RUN bunzip2 samtools.tar.bz2 bcftools.tar.bz2 htslib.tar.bz2
RUN tar -xvf samtools.tar; rm samtools.tar
RUN tar -xvf bcftools.tar; rm bcftools.tar
RUN tar -xvf htslib.tar  ; rm htslib.tar
RUN cd samtools* ; make prefix=/usr/local/bin; make install; cd ../
RUN cd bcftools* ; make prefix=/usr/local/bin; make install; cd ../
RUN cd htslib* ; ./configure;  make prefix=/usr/local/bin; make install; cd ../

# Install MuTect
RUN mkdir mutect; cd mutect
RUN wget -c http://www.broadinstitute.org/cancer/cga/sites/default/files/data/tools/mutect/muTect-1.1.4-bin.zip
RUN unzip muTect-1.1.4-bin.zipi; cd ../

# Install RADIA
RUN wget -c https://bootstrap.pypa.io/get-pip.py; python get-pip.py
RUN pip install pysam ; rm get-pip.py
RUN wget -c https://users.soe.ucsc.edu/~kent/src/blatSrc.zip
RUN unzip blatSrc.zip; cd blatSrc; mkdir ~/bin ~/lib ~/bin/$MACHTYPE ~/lib/$MACHTYPE;
RUN echo "export PATH=${PATH}:~/bin/$MACHTYPE" >> ~/.bashrc ; source ~/.bashrc
RUN export MACHTYPE=${MACHTYPE} ; make ; cd ../
RUN curl -L http://sourceforge.net/projects/snpeff/files/snpEff_v3_3_core.zip/download > snpeff.zip
RUN unzip snpeff* ; rm snpeff.zip
RUN git clone https://github.com/aradenbaugh/radia.git

# Install PHLAT
RUN wget -c https://raw.githubusercontent.com/Nanolx/patchimage/master/tools/gdown.pl
RUN gdown.pl 'https://drive.google.com/uc?export=download&confirm=yAjx&id=0Bz-w5tutuZIYY3h5YlMzTjhnbGM' index4phlat.gz
RUN curl -L "https://docs.google.com/uc?export=download&id=0Bz-w5tutuZIYeDU0VDRFWG9IVUE" > phlat-1.0.tar.gz
RUN tar -zxvf phlat-1.0.tar.gz; rm phlat-1.0.tar.gz; cd phlat-1.0
RUN mv ../index4phlat.gz . ; rm -rf index4phlat ; gunzip index4phlat.gz


