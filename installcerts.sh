#!/bin/bash
# Author : kemy
# Github : kemyke
# Version : 0.1

mkdir /certs
mount -t cifs //nexogencontent.file.core.windows.net/contents/certs /certs -o vers=3.0,username=nexogencontent,password=jVWE/tNDWXTmLzxC6xzhS6bfreuUI4Q6WMjHhYjehnOq4x3SFt3ugozGWdgUBL7Bqffro1G0lwXCbOrNx1swMg==,dir_mode=0777,file_mode=0777
update-ca-trust force-enable
cp /certs/nexogen-root-ca.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract
mkdir /etc/docker/certs.d
mkdir /etc/docker/certs.d/dockerrepo.nexogen.hu:5000
cat /etc/pki/tls/certs/ca-bundle.crt /certs/dockerreponexogenhu.crt.pem >> /ca.crt
cp /ca.crt /etc/docker/certs.d/dockerrepo.nexogen.hu:5000/ca.crt
service docker stop
service docker start
rm /ca.crt
umount /certs
rm /certs -r