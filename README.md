# Supported tags and respective `Dockerfile` links

- [`sqlite` `3.0.11.4-sqlite` (*sqlite/Dockerfile*)](https://github.com/holblin/teamspeak3-server/blob/e892e8c52485535cce5dbadaba2c579fcc805f21/sqlite/Dockerfile)
- [`mysql` `3.0.11.4-mysql` (*mysql/Dockerfile*)](https://github.com/holblin/teamspeak3-server/blob/e892e8c52485535cce5dbadaba2c579fcc805f21/mysql/Dockerfile)

# What is Teamspeak?

TeamSpeak is proprietary voice-over-Internet Protocol (VoIP) software that allows computer users to speak on a chat channel with fellow computer users, much like a telephone conference call. A TeamSpeak user will often wear a headset with a microphone. Users use the TeamSpeak client software to connect to a TeamSpeak server of their choice, from there they can join chat channels.

> [wikipedia.org/wiki/TeamSpeak](https://en.wikipedia.org/wiki/TeamSpeak)

![logo](https://www.teamspeak.com/assets/logos/teamspeak.png)

# How to use this image

```console
$ docker run --name some-teamspeak3-server --link some-mysql:mysql -d teamspeak3-server
```

The following environment variables are also honored for configuring your Teamspeak instance when you use mysql/mariadb database plugin:

- `-e TS3_DB_HOST=...` (defaults to the IP of the linked `mysql` container)
- `-e TS3_DB_PORT=...` (defaults to the port of the linked `mysql` container)
- `-e TS3_DB_USER=...` (defaults to the value of the `MYSQL_USER` environment variable from the linked `mysql` container or "root" if empty)
- `-e TS3_DB_PASSWORD=...` (defaults to the value of the `$MYSQL_PASSWORD` or `MYSQL_ENV_MYSQL_ROOT_PASSWORD` environment variable from the linked `mysql` container)
- `-e TS3_DB_NAME=...` (defaults to the value of the `MYSQL_DATABASE` environment variable from the linked `mysql` container or "teamspeak3_server" if empty)

If the `TS3_DB_NAME` specified does not already exist on the given MySQL server, this will be crash.
In this case you can launch your mysql/mariadb image with the MYSQL_DATABASE environment variable for create it.

# How i can backup or restore my data

See the following project with lot of tools for teamspeak 3

# Why do an other teamspeak3-server image?

I do this because I need to train my docker practice and because I think I can do some good job.

After some research, I make a more optimized docker image, more light and I think you will love it.

I plan to add lot of tools and for this, I prefre do them on my own docker image.

# Supported Docker versions

This image is officially supported on latest version.

Support for older versions is not provided actually but you can check it and make some pull request for this.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/holblin/teamspeak3-server/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.








# Todo list

- Create github repository (teamspeak3-server + teamspeak3-tools)
- Create docker hub account + associate with gihub account

- Check sqlite and mysql works (voice works, file upload works)
- Test and check backup / restaure, create new docker images / project for that (teamspeak3-server-tools ?)
- Create a docker image / project for fixing encoding (teamspeak3-server-tools ?)
- Create test unit for check image validity and images works

- Check multi-voice server works (maybe do others images with more voice port opens)
- Check mapping different file ports works (and document this)

- Put the automate build with docker hub (https://docs.docker.com/docker-hub/builds/)
- Allow the build / images of previous teamspeak3 version (use ONBUILD for this or use script for generate XXX Dockerfile ?)

- Make exemple of recipee with docker-compose (teamspeak3-server-tools ?)
- Test and maybe create a image / project for importing the whole unity TS3 (maybe document this)

- Add support for mysql socket

