# ProTECT Dockerfile for samtools
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/samtools:1.2 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/samtools <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Install samtools, bcftools and htslib
RUN curl -L http://sourceforge.net/projects/samtools/files/samtools/1.2/samtools-1.2.tar.bz2/download > samtools.tar.bz2; \
    curl -L http://sourceforge.net/projects/samtools/files/samtools/1.2/bcftools-1.2.tar.bz2/download > bcftools.tar.bz2; \
    curl -L http://sourceforge.net/projects/samtools/files/samtools/1.2/htslib-1.2.1.tar.bz2/download > htslib.tar.bz2; \
    bunzip2 samtools.tar.bz2 bcftools.tar.bz2 htslib.tar.bz2
RUN tar -xvf samtools.tar && rm samtools.tar; \
    tar -xvf bcftools.tar && rm bcftools.tar; \
    tar -xvf htslib.tar && rm htslib.tar
RUN cd samtools* ; make prefix=/usr/local/bin; make install
RUN cd bcftools* ; make prefix=/usr/local/bin; make install
RUN cd htslib* ; ./configure;  make prefix=/usr/local/bin; make install

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/samtools_wrapper.sh"]
CMD ["--help"]
