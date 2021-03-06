#!/bin/bash

cd /compile/source/linux-rockchip-rk322x

./scripts/config -d CONFIG_EXT2_FS
./scripts/config -d CONFIG_EXT3_FS
./scripts/config --set-val CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE 0
./scripts/config -d CONFIG_BLK_DEV_RAM
./scripts/config -d CONFIG_BLK_DEV_RAM_COUNT
./scripts/config -d CONFIG_BLK_DEV_RAM_SIZE

for i in `cat /compile/doc/rockchip-rk322x/misc.322/options/additional-options-yes.txt`; do
  echo $i
  ./scripts/config -e $i
done

for i in `cat /compile/doc/rockchip-rk322x/misc.322/options/additional-options-mod.txt`; do
  echo $i
  ./scripts/config -m $i
done
