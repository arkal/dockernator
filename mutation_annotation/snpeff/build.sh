set -e 

if [ "$(basename $(pwd))" != "snpeff" ]
then
  echo "Cannot run this script unless we are in the snpeff base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/snpeff:${version} - < Dockerfile && \
     cd -
done
