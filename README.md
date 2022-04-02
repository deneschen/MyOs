# 哪吒D1

单板配置文件
configs/d1_defconfig

修改配置文件
./build.sh target=menuconfig BOARD=d1

编译镜像
./build.sh BOARD=d1 target=d1

# 树莓派4B

单板配置文件
configs/raspi4b_defconfig

修改配置文件
./build.sh target=menuconfig BOARD=raspi4b

编译镜像
./build.sh BOARD=raspi4b target=raspi4b
