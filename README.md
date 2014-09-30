docker-jenkins-slave-grunt
=========================
Jenkins slave Docker image with grunt and Android SDK.


Overview
--------
See [docker-jenkins-slave-grunt](https://github.com/GrayBullet/docker-jenkins-slave-grunt#README).

Install Android SDK

- Install Ant and Gradle.
- Install All Android SDK Packages.


Using
-----
At first, set `buildagent` password.

```
$ docker pull graybullet/jenkins-slave-androidsdk
$ docker run -it graybullet/jenkins-slave-androidsdk /bin/bash
root@xxxxxxxx# chpasswd buildagent
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
root@xxxxxxxx# exit
$ docker commit xxxxxxxx jenkins-slave-androidsdk
```

Run daemon mode.

```
$ docker -d jenkins-slave-androidsdk
```

License
-------
[MIT License](LICENSE)

