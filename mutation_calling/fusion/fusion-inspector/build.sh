set -e 

if [ "$(basename $(pwd))" != "fusion-inspector" ]
then
  echo "Cannot run this script unless we are in the fusion-inspector base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/fusion-inspector:${version} - < Dockerfile && \
     cd -
done

