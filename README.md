# MyOs project start

pushd cmake/scripts
rm -rf kconfig && git clone https://github.com/ulfalizer/Kconfiglib.git kconfig
popd

# How to build?

example: d1

do menuconfig to enable some CONFIG_XXX

./build.sh target=menuconfig BOARD=d1

do build binary

./build.sh target=d1 BOARD=d1

example: raspi4b

... ...

./build.sh BOARD=raspi4b target=raspi4b
