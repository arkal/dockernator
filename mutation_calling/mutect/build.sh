set -e 

if [ "$(basename $(pwd))" != "mutect" ]
then
  echo "Cannot run this script unless we are in the mutect base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/mutect:${version} - < Dockerfile && \
     cd -
done

