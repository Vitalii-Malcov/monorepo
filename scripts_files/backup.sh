#!/bin/bash

mkdir -p /home/ec2-user/backups

tar -czvf /home/ec2-user/backups/backup_$(date +%F_%H-%M-%S).tar.gz \
/opt/060326-ptm \
/home/ec2-user
