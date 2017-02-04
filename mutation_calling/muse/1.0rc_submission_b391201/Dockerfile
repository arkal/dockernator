# ProTECT base Dockerfile for muse
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/muse:1.0rc_submission_b391201 - < Dockerfile

# Use pimmuno 
FROM aarjunrao/pimmuno

# Install MuSE
RUN wget -c http://bioinformatics.mdanderson.org/Software/MuSE/MuSEv1.0rc_submission_b391201 && \
    mv MuSEv1.0rc_submission_b391201 /usr/local/bin/ && \
    chmod +x /usr/local/bin/MuSEv1.0rc_submission_b391201

WORKDIR /home
# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/muse_wrapper.sh"]

