

os_version=$(( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1)
echo $os_version

arch=$(dpkg --print-architecture)
echo $arch
