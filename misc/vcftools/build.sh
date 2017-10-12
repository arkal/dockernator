set -e 

if [ "$(basename $(pwd))" != "vcftools" ]
then
  echo "Cannot run this script unless we are in the vcftools base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/vcftools:${version} - < Dockerfile && \
     cd -
done
