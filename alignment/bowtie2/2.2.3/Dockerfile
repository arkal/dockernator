# ProTECT Dockerfile for bowtie2
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/bowtie:2.2.3 - < Dockerfile

# Use pimmuno
FROM aarjunrao/pimmuno

# Install bowtie2
RUN curl -L http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.3/bowtie2-2.2.3-source.zip/download > bowtie2-2.2.3-source.zip
RUN unzip bowtie2-2.2.3-source.zip && rm bowtie2-2.2.3-source.zip ; cd bowtie2-2.2.3 && make
RUN cp bowtie2-2.2.3/bowtie2* /usr/local/bin
