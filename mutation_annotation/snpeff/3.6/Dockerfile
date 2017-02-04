# ProTECT Dockerfile for snpEFF
#
# 
# Build with: sudo docker build --rm --no-cache -t aarjunrao/snpeff:3.6 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/snpeff <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get snpEFF
RUN curl -L http://sourceforge.net/projects/snpeff/files/snpEff_v3_6_core.zip/download > snpEff_v3_6_core.zip
RUN unzip snpEff_v3_6_core.zip && rm snpEff_v3_6_core.zip
RUN mkdir /opt/pimmuno/ && mv snpEff /opt/pimmuno/snpeff

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/snpeff_wrapper.sh"]
CMD ["-h"]
