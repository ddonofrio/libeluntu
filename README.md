# libeluntu
### An Ubuntu-based distribution optimized to run Minecraft Servers


Docker Pull Command for the latest image:
```
$ docker pull ddonofrio/libeluntu
```

Build Instructions:

1. Download the Dockerfile.
2. Download the latest Oracle Server JRE (Java SE Runtime Environment) 8 from [this link]( http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html).
3. Put both files in the same directory (do not decompress the tgz).
4. Run the following command:
```
$ docker build -t libeluntu:latest
```

