set -e 

if [ "$(basename $(pwd))" != "samtools" ]
then
  echo "Cannot run this script unless we are in the samtools base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/samtools:${version} - < Dockerfile && \
     cd -
done
