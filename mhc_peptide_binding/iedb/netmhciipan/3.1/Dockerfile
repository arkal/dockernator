# ProTECT Dockerfile for netmhcIIpan
#
#
# This image requires the netMHCIIpan3.1 binary to exist in the
# dockernator/mhc_peptide_prediction/iedb/netmhciipan/3.1 directory. The
# folder needs to contain the auxillary `data` folder obtainable from
# http://www.cbs.dtu.dk/services/NetMHCIIpan-3.1/data.tar.gz. The following
# variables must be changed `NMHOME  /home/netMHCIIpan-3.1` and
# `setenv  TMPDIR  /data`
#
#
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/netmhciipan:3.1 .
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/netmhciipan:3.1 <parameters>

# Use mhcbase
FROM aarjunrao/mhcbase

COPY netMHCIIpan-3.1/ /home/netMHCIIpan-3.1/
RUN ln netMHCIIpan-3.1/netMHCIIpan /usr/local/bin/netMHCIIpan

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/netmhcii_wrapper.sh"]
CMD ["-h"]