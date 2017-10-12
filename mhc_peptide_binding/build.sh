set -e 

if [ "$(basename $(pwd))" != "mhc_peptide_binding" ]
then
  echo "Cannot run this script unless we are in the mhc_peptide_binding base directory"
  exit 1
fi

# First build the base image
docker build --force-rm --no-cache -t aarjunrao/mhcbase - < base_Dockerfile

ls | while read tool
do
  ls ${tool} | grep -v build.sh | while read version
  do
  	cd ${tool}/${version} && \
     docker build --force-rm --no-cache -t aarjunrao/${tool}:${version} - < Dockerfile && \
     cd -
  done
done
