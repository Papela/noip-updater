# noip-updater
## This is a simple Docker image to keep your No-IP.com Dynamic DNS hosts up to date. 
### Based on: [This repo](https://github.com/Mardiie/noip-update)
Run with Docker:
-------------

To run the image with docker use the following command:
```
    docker run -d \
    -e NOIP_USER=<Your No-IP username or email>
    -e NOIP_PASSWORD=<Your No-IP password> \
    -e NOIP_HOST=<Your No-IP host-name you want to update> \
    -e NOIP_INTERVAL=<The update interval (default: 60 minutes)> \
    papela/noip-updater:latest
```
_To be able to use the image on an armx64 processor, use the image: **papela/noip-updater:armx64latest**_

Correct time in container:
------------- 
For logging purposes you would want to set the correct time in the container.
We link both timezone and localtime to the docker container as such:
```
    -v /etc/timezone:/etc/timezone:ro 
    -v /etc/localtime:/etc/localtime:ro 
```

Using the script file
----------------------------

You can also download the script file and modify it yourself then run outside of Docker. 
The only dependencies required are: curl and sleep (most Linux distros have these preinstalled)

About:
----------
What this does is:

1. Check if you variables are set except for NOIP_INTERVAL since this has been set at 60 minutes by default (_If the time is equal to or less than 0, it will only be executed once and then exit_).
2. It uses curl to update the given No-IP host-name.
3. It sleeps for the given interval (_as long as it is not 0_) and then starts at step 2 again.