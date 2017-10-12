set -e 

if [ "$(basename $(pwd))" != "star-fusion" ]
then
  echo "Cannot run this script unless we are in the star-fusion base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/star-fusion:${version} - < Dockerfile && \
     cd -
done

