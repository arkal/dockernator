# ProTECT Dockerfile for vcftools
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/vcftools:0.1.14 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/vcftools <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get some essentials
RUN apt-get install -y autoconf \
    autogen \
    intltool\
    pkg-config

# Get vcftools
RUN git clone https://github.com/vcftools/vcftools.git \
    && cd vcftools\
    && git checkout v0.1.14
RUN cd vcftools && ./autogen.sh \
    && ./configure \
    && make \
    && make install

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["bash", "/home/toil_docker_wrappers/vcftools_wrapper.sh"]
CMD ["-h"]
