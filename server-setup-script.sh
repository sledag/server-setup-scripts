sed -i 's%#Port 22%Port 900%g; s%#PermitRootLogin yes%PermitRootLogin no%g; s%#RSAAuthentication yes%RSAAuthentication yes%g; s%#PubkeyAuthentication yes%PubkeyAuthentication yes%g; s%#PermitEmptyPasswords%PermitEmptyPasswords%g; s%PasswordAuthentication yes%PasswordAuthentication no%g'  sshd_config 
sed -i 's%#AuthorizedKeysFile     .ssh/authorized_keys/AuthorizedKeysFile      .ssh/id_rsa.pub/g' sshd_config

yum –enablerepo=remi-test install php php-fpm php-pecl-apc php-pecl-apc-devel php-pdo php-devel  php-cli php-mcrypt php-mbstring php-common php-mysql

# character-set
default-character-set=utf8

[client]
default-character-set=utf8
 
[mysql]
default-character-set=utf8
 
[mysqldump]
default-character-set=utf8

	expect -c "
165
        spawn mysql -u ${DBUSER} -p
166
        expect \"Enter password: \"
167
        sleep 1
168
        send \"${DBPASSWD}\r\"
169
        sleep 3
170
        expect \"mysql> \"
171
        sleep 1
172
        send \"create database ${USERNAME};\r\"
173
        sleep 3
174
        expect \"mysql> \"
175
        sleep 1
176
        send \"grant select,insert,update,delete on ${USERNAME}.* to ${USERNAME}@localhost iden
177
tified by '${USERPASSWD}';\r\"
178
        sleep 1
179
        expect \"mysql> \"
180
        sleep 1
181
        send \"flush privileges;\r\"
182
        sleep 1
183
        expect \"mysql> \"
184
        sleep 1
185
        send \"exit\r\"
186
        sleep 1
187
        expect eof
188
        "
