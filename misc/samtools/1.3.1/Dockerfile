# ProTECT Dockerfile for samtools
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/samtools:1.3.1 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/samtools:1.3.1 <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Install samtools, bcftools and htslib
RUN wget -qO- https://downloads.sourceforge.net/project/samtools/samtools/1.3.1/samtools-1.3.1.tar.bz2 | tar xj && \
    wget -qO- https://downloads.sourceforge.net/project/samtools/samtools/1.3.1/htslib-1.3.1.tar.bz2 | tar xj && \
    wget -qO- https://downloads.sourceforge.net/project/samtools/samtools/1.3.1/bcftools-1.3.1.tar.bz2 | tar xj

RUN cd samtools* ; make prefix=/usr/local/bin; make install
RUN cd bcftools* ; make prefix=/usr/local/bin; make install
RUN cd htslib* ; ./configure;  make prefix=/usr/local/bin; make install

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/samtools_wrapper.sh"]
CMD ["--help"]
