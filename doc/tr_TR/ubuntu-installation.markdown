Ubuntu üzerinde Kanboard Kurulumu
================================

Ubuntu Xenial 16.04 LTS
-----------------------

Apache ve PHP'yi kurun:

```bash
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-php7.0 php7.0-cli php7.0-mbstring php7.0-sqlite3 \
    php7.0-opcache php7.0-json php7.0-mysql php7.0-pgsql php7.0-ldap php7.0-gd
```

Kanboard'u kurun:

```bash
cd /var/www/html

# Download the latest release from https://github.com/kanboard/kanboard/releases
wget https://github.com/kanboard/kanboard/archive/v<version>.zip

unzip kanboard-<version>.zip
chown -R www-data:www-data kanboard-<version>/data
rm kanboard-<version>.zip
```

Ubuntu Trusty 14.04 LTS
-----------------------

Apache ve PHP'yi kurun:

```bash
sudo apt-get update
sudo apt-get install -y php5 php5-sqlite php5-mysql php5-pgsql php5-ldap php5-gd php5-json php5-mcrypt unzip
```

Kanboard'u kurun:

```bash
cd /var/www/html

# Download the latest release from https://github.com/kanboard/kanboard/releases
wget https://github.com/kanboard/kanboard/archive/v<version>.zip

unzip kanboard-<version>.zip
chown -R www-data:www-data kanboard-<version>/data
rm kanboard-<version>.zip
```

Ubuntu Precise 12.04 LTS
------------------------

Apache ve PHP'yi kurun:

```bash
sudo apt-get update
sudo apt-get install -y php5 php5-sqlite php5-mysql php5-pgsql php5-ldap php5-gd php5-json php5-mcrypt unzip
```

Kanboard'u kurun:

```bash
cd /var/www

# Download the latest release from https://github.com/kanboard/kanboard/releases
wget https://github.com/kanboard/kanboard/archive/v<version>.zip

unzip kanboard-<version>.zip
chown -R www-data:www-data kanboard-<version>/data
rm kanboard-<version>.zip
```

Kanboard'un bazı özellikleri, [günlük arka plan işi-cronjob](cronjob.markdown) çalıştırmanızı gerektirir.
