

os_version=$(( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1)
echo $os_version

arch=$(dpkg --print-architecture)
echo $arch

if  [[ "$os_version" == "Ubuntu 20.04"* ]] && [[ $arch == "arm64"* ]] ;
then
    sudo apt install qtcreator libqtermwidget5-0 -y
    cd /tmp
    wget -O libROSProjectManager.so https://github.com/CiRA-AMI/cira-ros-qt-creator-plugin/raw/main/arm64/ubuntu_20.04/libROSProjectManager.so
    sudo cp -rf -v libROSProjectManager.so /usr/lib/aarch64-linux-gnu/qtcreator/plugins/
    
fi

if  [[ "$os_version" == "Ubuntu 24.04"* ]] && [[ $arch == "arm64"* ]] ;
then
    sudo apt install qtcreator libqtermwidget5-1 -y
    cd /tmp
    wget -O libROSProjectManager.so https://github.com/CiRA-AMI/cira-ros-qt-creator-plugin/raw/main/arm64/ubuntu_24.04/libROSProjectManager.so
    sudo cp -rf -v libROSProjectManager.so /usr/lib/aarch64-linux-gnu/qtcreator/plugins/
    
fi

echo "****************************"
echo "cira_ros_qt_creator_plugin install complete"
echo "****************************"
