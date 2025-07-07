# If you have docker in a vm or a bare metal machine with sufficient resources, you can spin up any number of instances.
# You can use this bash script to create 20 warrior instances.
# Copy, change your DOWNLOADER="yournamehere" name, open nano or vi and save as warriorgenerator.sh.
# Then chmod +x warriorgenerator.sh and ./warriorgenerator.sh to generate them. 


# /bin/bash
docker pull atdr.meo.ws/archiveteam/warrior-dockerfile:latest
for i in {1..99}; do
  docker stop archiveteam_$i; docker rm archiveteam_$i
  docker run -d --name archiveteam_$i --env DOWNLOADER="Brockoly" --env SELECTED_PROJECT="auto" --env CONCURRENT_ITEMS="6" -p 80$i:8001 --restart=on-failure -e PUID=1002 -e PGID=1002 atdr.meo.ws/archiveteam/warrior-dockerfile:latest
done
exit 0
