### Image
`docker pull fpwei/smartfox`

[Docker Hub](https://hub.docker.com/r/fpwei/smartfox/)

### Tag
- 2.13.4-jre8 : SmartFoxServer 2.13.4 && Java 8 ([Dockerfile](https://github.com/fpwei/docker-smartfox/blob/master/Dockerfile))


### How to use
#### Start a smartfox server instance
`$ docker run --name smartfoxserver -d -p 8080:8080 fpwei/smartfox`, then connect to http://localhost:8080/ will show a simple SmartFoxServer page.

#### Add volumes on instance
To deploy our extensions by docker, we can just add volume at command line.
```
$  docker run --name smartfoxserver -d -p 8080:8080 \
 -v /path/to/server.xml:/usr/local/SmartFoxServer_2X/SFS2X/config/server.xml \
 -v /path/to/zones:/usr/local/SmartFoxServer_2X/SFS2X/zones \
 -v /path/to/extensions:/usr/local/SmartFoxServer_2X/SFS2X/extensions \
 fpwei/smartfox 
```

Add `-v /path/to/logs:/usr/local/SmartFoxServer_2X/SFS2X/logs ` is one way to make check log files easier.
In addition, mount files or directories (log4j.properties, www/ ...) according to requirement.
