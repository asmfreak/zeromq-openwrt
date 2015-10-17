# zeromq
To build. Assuming you have OpenWRT buildroot in `<somedir>`
1. `cd <somedir>/package/`
2. `git clone https://github.com/ASMfreaK/zeromq-openwrt.git`
3. `cd ../`
4. `make menuconfig`
5. Select in `Libraries` category `zeromq` package and exit
6. `make package/zeromq/compile`
