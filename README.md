# power-estimation

import openSTA as a gitmodule

make build folder and build it

get flex (not on codespaces)
libgen3-dev
autoconf automake
```sh
sudo apt-get update
sudo apt-get install flex
sudo apt-get install libeigen3-dev
sudo apt-get install autoconf automake
```


CUDD
clone from git:
```sh
git submodule add https://github.com/ivmai/cudd.git external/cudd
git submodule init
git submodule update
cd external/cudd/
autoreconf -vif
./configure --prefix=/usr/local
sudo make install
```


Then make openSTA
```sh
cd openSTA
mkdir build
cd build
cmake ..
make #make -j$(2) this could be faster
```

Yosys
```sh
sudo apt-get install yosys
```


Check versions
```sh
yosys -V
../app/sta --version
# export PATH=$PATH:/workspaces/power-estimation/external/OpenSTA/app 
# ^ that might be needed to run sta globally, may need to run this again if you close the terminal.
# in order to perma - do this
echo "export PATH=$PATH:/workspaces/power-estimation/external/OpenSTA/app" >> ~/.bashrc

```

To run:
```sh
yosys -s synth.ys
# iverilog -o clocked_adder_tb clocked_adder_tb.v clocked_adder.v
# vvp clocked_adder_tb
sta power_sta.tcl
```