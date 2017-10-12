# ProTECT Dockerfile for transgene
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/transgene:2.2.1 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/transgene <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

RUN apt-get install -y python-pip liblzma-dev libbz2-dev
RUN pip install pysam==0.10.0 swalign==0.3.3

# Get transgene
RUN git clone https://github.com/arkal/Transgene.git \
    && cd Transgene \
    && git checkout releases/2.2.1 \
    && chmod +x transgene.py \
    && cp transgene.py /usr/local/bin

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/transgene_wrapper.sh"]
CMD ["--help"]
