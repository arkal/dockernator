# ProTECT Dockerfile for STAR-Fusion
#
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/star-fusion:1.0.0 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/star-fusion:1.0.0 <parameters>

# Use samtools
FROM aarjunrao/samtools

MAINTAINER Jacob Pfeil, jpfeil@ucsc.edu

RUN apt-get update --fix-missing && \
    apt-get install -y zlib1g-dev gzip perl libdb-dev 

RUN cpan App::cpanminus && cpanm Set::IntervalTree && cpanm DB_File && cpanm URI

WORKDIR /opt

RUN wget -qO- https://github.com/alexdobin/STAR/archive/2.5.2b.tar.gz | tar xz

RUN wget -qO- https://github.com/STAR-Fusion/STAR-Fusion/releases/download/v1.0.0/STAR-Fusion-v1.0.0.FULL.tar.gz | tar xz

ENV PATH "/opt/STAR-2.5.2b/bin/Linux_x86_64:/opt/STAR-Fusion-v1.0.0:$PATH"

# Download Wrappers 
RUN git clone https://github.com/arkal/toil_docker_wrappers.git /home/docker_wrappers

WORKDIR /data

ENTRYPOINT ["sh", "/home/docker_wrappers/star_fusion_wrapper.sh"]
CMD ["--help"]
