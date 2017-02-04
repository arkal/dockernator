# ProTECT Dockerfile for bam-readcount
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/bam-readcount:0.7.4 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/bam-readcount <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# get the essentials
RUN  apt-get update && \
     apt-get install -y build-essential \
                        cmake \
                        git-core \
                        libncurses-dev \
                        patch \
                        zlib1g-dev

# get bam-readcount
RUN git clone https://github.com/genome/bam-readcount.git && \
    cd bam-readcount && \
    git checkout -b tags/v0.7.4
RUN mkdir /home/bam-readcount/build && \
    cd /home/bam-readcount/build && \
    cmake /home/bam-readcount && \
    make
RUN cp /home/bam-readcount/build/bin/bam-readcount /usr/local/bin/

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["bash", "/home/toil_docker_wrappers/bamreadcount_wrapper.sh"]
CMD ["-h"]
