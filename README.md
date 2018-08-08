# Smoke Tests

## Time Sync for notify

Notify requires the time configuration on the calling machine is not more than 30 seconds out.  The following script will fix an ubunutu/debian installation.

```
sudo apt-get install -y ntpdate
sudo timedatectl set-timezone Europe/London
sudo ntpdate ntp.ubuntu.com
```
