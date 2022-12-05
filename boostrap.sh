

os_version=$(( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1)
echo $os_version

arch=$(dpkg --print-architecture)
echo $arch

if  [[ "$os_version" == "Ubuntu 20.04"* ]] && [[ $arch == "arm64"* ]] ;
then
    sudo apt install qtcreator
    cd /tmp
    wget -O libROSProjectManager.so https://github.com/CiRA-AMI/cira-ros-qt-creator-plugin/raw/main/arm64/ubuntu_20.04/libROSProjectManager.so
    sudo cp -r -v libROSProjectManager.so /usr/lib/aarch64-linux-gnu/qtcreator/plugins/
fi
