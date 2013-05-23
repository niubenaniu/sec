# install Django
tar -xzvf ./softwares/Django-1.5.tar.gz
cd ./softwares/Django-1.5
python setup.py install

# install flup
cd ../softwares
tar -xzvf flup-1.0.2.tar.gz
cd flup-1.0.2
python setup.py install

# install Nginx 
cd ../softwares
tar -xzvf pcre-8.32.tar.gz
tar -xzvf zlib-1.2.8.tar.gz
tar -xzvf openssl-fips-2.0.4.tar.gz
tar -xzvf nginx-1.4.1.tar.gz

cd ./pcre-8.32
./configure
make
make install

cd ../zlib-1.2.8
./configure
make
make install

cd ../openssl-fips-2.0.4
./Configure
make
make install

cd ../nginx-1.4.1
./configure --with-pcre=/opt/sec/softwares/pcre-8.32 --with-zlib=/opt/sec/softwares/zlib-1.2.8
make
make install

# check result of Nginx install
ps -ef | grep nginx | grep -v "grep"
if [ $? == 0 ]
then
echo nginx installed success!
else
echo nginx installed failed!
fi

########################################################################
# Nginx Configuration summary
#  + using PCRE library: /opt/sec/softwares/pcre-8.32
#  + OpenSSL library is not used
#  + using builtin md5 code
#  + sha1 library is not found
#  + using zlib library: /opt/sec/softwares/zlib-1.2.8
#
#  nginx path prefix: "/usr/local/nginx"
#  nginx binary file: "/usr/local/nginx/sbin/nginx"
#  nginx configuration prefix: "/usr/local/nginx/conf"
#  nginx configuration file: "/usr/local/nginx/conf/nginx.conf"
#  nginx pid file: "/usr/local/nginx/logs/nginx.pid"
#  nginx error log file: "/usr/local/nginx/logs/error.log"
#  nginx http access log file: "/usr/local/nginx/logs/access.log"
#  nginx http client request body temporary files: "client_body_temp"
#  nginx http proxy temporary files: "proxy_temp"
#  nginx http fastcgi temporary files: "fastcgi_temp"
#  nginx http uwsgi temporary files: "uwsgi_temp"
#  nginx http scgi temporary files: "scgi_temp"
########################################################################
#
# Django on nginx:
#
#   django-admin.py startproject www
#   cd www
#   python ./manage.py runfcgi host=127.0.0.1 port=8080 
#
########################################################################


