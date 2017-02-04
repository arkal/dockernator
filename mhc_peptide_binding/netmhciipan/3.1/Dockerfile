# ProTECT Dockerfile for netmhcIIpan
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/netmhciipan:3.1 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/netmhciipan:final <parameters>

# Use netmhcii:temp
FROM aarjunrao/netmhcii:temp

LABEL description="This image was created by manually downloading netmhcIIpan from \
http://www.cbs.dtu.dk/services/NetMHCIIpan/ and placing it in aarjunrao/mhcbase in \
/home . The netmhciipan3.1 binary must be symlinked to /usr/local/bin/netMHCIIpan. \
The folder needs to contain the data tarball for running.  This can be obtained at \
http://www.cbs.dtu.dk/services/NetMHCIIpan-3.1/data.tar.gz and it needs to be in   \
the netMHCIIpan-3.1 folder."

MAINTAINER Arjun Rao aarjunrao@soe.ucsc.edu

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/netmhcii_wrapper.sh"]
CMD ["-h"]
