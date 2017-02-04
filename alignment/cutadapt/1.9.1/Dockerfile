# ProTECT Dockerfile for cutadapt
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/cutadapt:1.9.1 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/cutadapt <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Install pip
RUN wget -c https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Install cutadapt
RUN pip install cutadapt==1.9.1

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/cutadapt_wrapper.sh"]
CMD ["--help"]
