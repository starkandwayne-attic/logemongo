# logemongo
Websocket client for Sawmill BOSH release.

## Prerequisites

Although no additional packages need to be installed on Mac OS X, if you are using `logemongo` on a Linux distribution you will need to install both the `IO::Socket::SSL` and `YAML` modules:

**Ubuntu**

```
sudo apt-get install libio-socket-ssl-perl
sudo apt-get install libconfig-yaml-perl
```

**Fedora / RHEL / CentOS**

```
yum install "perl(YAML)" -y
yum install "perl(Data::Dumper)" -y
yum install "perl(IO::Socket::SSL)" -y
```

FIXME: `Data::Dumper` install only needed on Fedora but not CentOS... may not even be using this module...?

## How to use

In order to target a specific Sawmill, run the following command:

```
logemongo -H ${host} -P ${port} -u ${username} -p ${password}
```

By default, `logemongo` uses `10.244.73.2:443` as the `host:port` and `admin:admin` for the `user:pass` since these are the values that are used when running a local Sawmill on BOSH lite. If you are testing against a Sawmill running on BOSH lite you will also want to disable SSL with the `--no-ssl` flag as BOSH lite uses self-signed certificates. For a complete list options and syntax, use the `-h` / `--help` flag.
