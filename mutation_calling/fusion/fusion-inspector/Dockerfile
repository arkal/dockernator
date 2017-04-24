# ProTECT Dockerfile for STAR-Fusion
#
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/fusion-inspector:1.0.1 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/fusion-inspector:1.0.1 <parameters>

# Use samtools
FROM aarjunrao/samtools:1.3.1

MAINTAINER Jacob Pfeil, jpfeil@ucsc.edu

RUN apt-get update --fix-missing && \
    apt-get install -y dpkg zlib1g-dev gzip perl libdb-dev build-essential make

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer

RUN cpan App::cpanminus && cpanm Set::IntervalTree && cpanm DB_File && cpanm URI

WORKDIR /opt

RUN wget -qO- https://github.com/FusionInspector/FusionInspector/releases/download/v1.0.1/FusionInspector-v1.0.1.FULL.tar.gz | tar xz && \
    wget -qO- https://github.com/alexdobin/STAR/archive/2.5.2b.tar.gz | tar xz && \
    wget -qO- https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.4.0.tar.gz | tar xz && \
    cd trinityrnaseq-Trinity-v2.4.0 && make && cd /opt && \
    wget -qO- http://research-pub.gene.com/gmap/src/gmap-gsnap-2016-11-07.tar.gz | tar xz && \
    cd gmap-2016-11-07 && ./configure && make && make check && make install

# FusionInspector needs the TRINITY_HOME environment variable
ENV TRINITY_HOME "/opt/trinityrnaseq-Trinity-v2.4.0/"
ENV PATH "/opt/FusionInspector-v1.0.1:/opt/STAR-2.5.2b/bin/Linux_x86_64:$PATH"

WORKDIR /data

# Download Wrappers 
RUN git clone https://github.com/arkal/toil_docker_wrappers.git /home/docker_wrappers

ENTRYPOINT ["sh", "/home/docker_wrappers/fusion_inspector_wrapper.sh"]
CMD ["--help"]
