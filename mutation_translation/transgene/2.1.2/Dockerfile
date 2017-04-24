# ProTECT Dockerfile for transgene
#
# 
# Build with: sudo docker build --rm --no-cache -t aarjunrao/transgene:2.1.2 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/transgene <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

RUN apt-get install -y python-pip
RUN pip install pysam

# Get transgene
RUN git clone https://github.com/arkal/Transgene.git \
    && cd Transgene \
    && git checkout releases/2.1.2 \
    && chmod +x transgene.py \
    && cp transgene.py /usr/local/bin

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/transgene_wrapper.sh"]
CMD ["--help"]
