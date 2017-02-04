# ProTECT Dockerfile for pindel
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/pindel:0.2.5b6 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/pindel-addons <parameters>

# Use samtools
FROM aarjunrao/samtools

WORKDIR /home
RUN git clone https://github.com/genome/pindel.git
RUN cd pindel \
    && git checkout tags/v0.2.5b6 -b pindel-v0.2.5b6 \
    && ./INSTALL /home/samtools-1.2/htslib-1.2.1 \
    && cp pindel /usr/local/bin/

# Set the wrapper
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/pindel_wrapper.sh"]
CMD ["-h"]