# ProTECT Dockerfile for rsem
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/rsem:1.2.20 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/rsem <parameters>

# Use bowtie
FROM aarjunrao/bowtie:2.2.3

# Get the essentials
RUN apt-get install -y r-base perl-doc

# Get rsem 
RUN git clone -b v1.2.20 https://github.com/deweylab/RSEM.git
RUN cd RSEM && make && cp rsem* WHAT_IS_NEW /usr/local/bin/

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/rsem_wrapper.sh"]
CMD ["-h"]
