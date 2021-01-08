#!/bin/bash
source /home/minecraft0/MinecraftAdminScripts/includes.conf
sudo rm /etc/systemd/system/stopmcservers.service

sudo printf "[Unit]\n
Description=Stops minecraft servers on shutdown\n\
Before=shutdown.target reboot.target halt.target\n\
\n\
[Service]\n\
User=root\n\
Type=oneshot\n\
RemainAfterExit=true\n\
ExecStop=" > /etc/systemd/system/stopmcserver.service
sudo printf "$scriptsdir" >> /etc/systemd/system/stopmcserver.service
sudo printf "/stopmcservers.sh\n\
\n\
[Install]\n\
WantedBy=multi-user.target\n\
" >> /etc/systemd/system/stopmcserver.service

sudo systemctl daemon-reload
sudo systemctl enable stopmcservers.service
sudo systemctl start stopmcservers.service
