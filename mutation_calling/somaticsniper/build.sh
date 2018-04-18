set -e 

if [ "$(basename $(pwd))" != "somaticsniper" ]
then
  echo "Cannot run this script unless we are in the somaticsniper base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/somaticsniper:${version} - < Dockerfile && \
     docker build --force-rm --no-cache -t aarjunrao/somaticsniper-addons:${version} - < addons_Dockerfile && \
     cd -
done

