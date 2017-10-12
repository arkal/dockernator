set -e 

if [ "$(basename $(pwd))" != "bowtie2" ]
then
  echo "Cannot run this script unless we are in the bowtie2 base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/bowtie2:${version} - < Dockerfile && \
     cd -
done

