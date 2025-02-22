# Codemeter

Codemeter runtime inside .net9.0 ubuntu container in non-privileged mode.

## Build an image

```powershell
PS> git clone https://github.com/max-ieremenko/codemeter.git c:\codemeter
PS> cd c:\codemeter
PS> docker build -f .\.dockerfile -t codemeter-aspnet:9.0 .
```

## Run a container

```powershell
PS> docker run -d -p 22350:22350 -p 22351:22351 -p 22352:22352 codemeter-aspnet:9.0
```

Open http://127.0.0.1:22352/dashboard.html in the browser:

![img](https://github.com/max-ieremenko/codemeter/blob/main/docs/http-web-admin.png)

## File reference

* .dockerfile
* codemeter_8.20.6558.501_amd64.deb: CodeMeter Runtime for Linux, see [download page](https://www.wibu.com/support/user/user-software.html).
* entrypoint.sh: docker container entry point
* Server.ini: codemeter configuration file