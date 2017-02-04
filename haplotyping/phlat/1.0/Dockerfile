# ProTECT Dockerfile for PHLAT
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/phlat:1.0 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/phlat <parameters>

# Use bowtie
FROM aarjunrao/bowtie:2.2.3

# Get pip and pysam
RUN wget -c https://bootstrap.pypa.io/get-pip.py; python get-pip.py
RUN pip install pysam==0.8.4 ; rm get-pip.py # PHLAT fails with later versions of pysam
 
# Install PHLAT
RUN wget -O /usr/local/bin/gdown.pl  -c https://raw.githubusercontent.com/Nanolx/patchimage/master/tools/gdown.pl && \
    chmod +x /usr/local/bin/gdown.pl
RUN curl -L "https://docs.google.com/uc?export=download&id=0Bz-w5tutuZIYeDU0VDRFWG9IVUE" > phlat-1.0.tar.gz; \
    tar -zxvf phlat-1.0.tar.gz && rm phlat-1.0.tar.gz

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/phlat_wrapper.sh"]
CMD ["-h"]
 