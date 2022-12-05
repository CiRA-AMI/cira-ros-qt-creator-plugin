

os_version=$(( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1)
echo $os_version

arch=$(dpkg --print-architecture)
echo $arch

if  [[ "$os_version" == "Ubuntu 20.04"* ]] && [[ $arch == "arm64"* ]] ;
then
    sudo apt install qtcreator -y
    cd /tmp
    wget -O libROSProjectManager.so https://github.com/CiRA-AMI/cira-ros-qt-creator-plugin/raw/main/arm64/ubuntu_20.04/libROSProjectManager.so
    sudo cp -rf -v libROSProjectManager.so /usr/lib/aarch64-linux-gnu/qtcreator/plugins/
    
    if [ -d CiRA_CORE_Dev_Template ]; then rm -Rf CiRA_CORE_Dev_Template*; fi
    wget -O CiRA_CORE_Dev_Template.zip https://github.com/CiRA-AMI/cira-ros-qt-creator-plugin/raw/main/template/CiRA_CORE_Dev_Template.zip
    unzip CiRA_CORE_Dev_Template.zip
    
    if [ -d ~/CiRA_CORE_Dev_Template ]; then rm -Rf ~/CiRA_CORE_Dev_Template; fi
    cp -rf CiRA_CORE_Dev_Template ~/
fi

echo "****************************"
echo "cira_ros_qt_creator_plugin install complete"
echo "****************************"
