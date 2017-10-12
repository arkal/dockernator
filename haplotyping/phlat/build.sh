set -e 

if [ "$(basename $(pwd))" != "phlat" ]
then
  echo "Cannot run this script unless we are in the phlat base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/phlat:${version} - < Dockerfile && \
     cd -
done
