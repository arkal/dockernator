set -e 

if [ "$(basename $(pwd))" != "bedtools2" ]
then
  echo "Cannot run this script unless we are in the bedtools2 base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/bedtools2:${version} - < Dockerfile && \
     cd -
done
