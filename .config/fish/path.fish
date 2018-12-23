# Some packages (mtr) add binaries to /usr/local/sbin
# set -x PATH $PATH ~/usr/local/sbin # Not needed anymore - it's solved with `omf install brew`
set -x PATH $PATH /anaconda3/bin
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
# For OpenSSL
set -x LDFLAGS -L/usr/local/opt/openssl/lib
set -x CPPFLAGS -I/usr/local/opt/openssl/include
set -x PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig
# Add poetry to path
set -x PATH $PATH /usr/local/sbin
