%w[ build-essential wget libpcre3-dev luarocks git-core cpanminus curl ].each do |p|
  package p
end

execute "cpanm install Test::Nginx" do
  not_if "perl -mTest::Nginx -e'1'"
end

openresty_version = "1.4.3.6"

check_nginx_version = "/usr/local/sbin/nginx -v 2>&1 | grep 'ngx_openresty/#{openresty_version}'"

remote_file "/home/vagrant/ngx_openresty-#{openresty_version}.tar.gz" do
  source "http://openresty.org/download/ngx_openresty-#{openresty_version}.tar.gz"
  notifies :run, "execute[install openresty]"
  not_if check_nginx_version
end

execute "install openresty" do
  cwd "/home/vagrant"
  command <<EOF
 tar -zxvf ngx_openresty-#{openresty_version}.tar.gz
cd ngx_openresty-#{openresty_version}
./configure --with-luajit --prefix=/usr/local --sbin-path=/usr/local/sbin/nginx
make
make install
EOF
  not_if check_nginx_version
end
