# Installation / Configuration of Jupyterlab

Official Docs: https://jupyterlab.readthedocs.io/en/stable/

## Clone Repo
```shell
#// Create parent directory
mkdir -p code
git clone https://github.com/phanclan/hc_demos-jupyter code/hc_demos-jupyter
```


### Linux

```shell
sudo apt-get update && \
sudo apt-get -qq install unzip jq \
    python3 python3-pip 

### begin optional python venv
sudo apt-get -qq install python3-venv python3-dev build-essential
mkdir venv && cd venv
python3 -m venv jup1
source jup1/bin/activate
### end optional python venv

pip3 install jupyterlab
pip3 install bash_kernel
python3 -m bash_kernel.install
```

Add this to path if needed. example for `~/.profile`
```shell
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

### Mac / Homebrew

```shell
brew update && brew doctor
brew install python3
brew install jupyterlab
pip3 install --upgrade pip wheel setuptools
#pip3 install ipykernel #installed with jupyterlab
pip3 install bash_kernel
python3 -m bash_kernel.install
```

## Start JupyterLab

```shell
nohup jupyter lab --ip=0.0.0.0 --port=8888 \
  --no-browser --notebook-dir=code/ \
  > /tmp/jupyterlab.out 2>&1 &
cat /tmp/jupyterlab.out
```

Expected Output
```
To access the server, open this file in a browser:
    file:///home/ubuntu/.local/share/jupyter/runtime/jpserver-81326-open.html
Or copy and paste one of these URLs:
    http://server-a-2:8888/lab?token=fac13cc3cb23c6114c0f80299c509ffee9be8bff0b4f9c7d
 or http://127.0.0.1:8888/lab?token=fac13cc3cb23c6114c0f80299c509ffee9be8bff0b4f9c7d
```

Click on one the links to go to the JupyterLab UI.

> You will need to change the IP to a non-loopback if the the server name is not resolvable or hosted on a separate machine your own.

For the HashiStack content, go to `HashiStack` and open `hashi_playground.ipynb`.

Enjoy!!!

## Hardware

Here's what I'm using

* Raspberry Pi 4 8GB
* Samsung 256GB microSD
* (optional) USB3 SSD
* HDMI Cable
* USB-A to USB-C for power
* (optional) Network cable for wired ethernet