set -e 

if [ "$(basename $(pwd))" != "star" ]
then
  echo "Cannot run this script unless we are in the star base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/starbase:${version} - < base_Dockerfile && \
     docker build --force-rm --no-cache -t aarjunrao/star:${version} - < star_Dockerfile && \
     docker build --force-rm --no-cache -t aarjunrao/starlong:${version} - < starlong_Dockerfile && \
     cd -
done

