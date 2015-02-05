nginx [engine x] is an HTTP and reverse proxy server, as well as a mail proxy server.
This package provides an `nssm` Windows service wrapper for it which creates a standard Windows
service named `nginx` to manage the server. You can use standard tools like the MMC snap-in to
start the service or change its run mode.

This package also creates a fairly nice configuration directory structure making it easier to manage nginx.

```
C:/ProgramData/nginx/
├── conf
│   ├── fastcgi.conf
│   ├── fastcgi_params
│   ├── koi-utf
│   ├── koi-win
│   ├── mime.types
│   ├── nginx.conf
│   ├── scgi_params
│   ├── uwsgi_params
│   └── win-utf
├── errors
│   └── 50x.html
├── html
│   └── index.html
├── logs
│   ├── default.access.log
│   └── error.log
└── temp
```

See the [nssm documentation](http://nssm.cc) if you'd like to add support for your own service.
