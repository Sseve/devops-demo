### docker-jenkins

* *说明*
```
  - 宿主机依赖docker和docker-compose
  - 修改宿主机 /var/run/docker.sock的权限和所属组:
    chmod o+rw /var/run/docker.sock
    chown root:root /var/run/docker.sock
```