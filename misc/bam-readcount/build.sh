set -e 

if [ "$(basename $(pwd))" != "bam-readcount" ]
then
  echo "Cannot run this script unless we are in the bam-readcount base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/bam-readcount:${version} - < Dockerfile && \
     cd -
done
