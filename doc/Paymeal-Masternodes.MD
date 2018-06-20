## PAYMEAL MASTERNODE SETUP GUIDE

------------

#### PREPARE
1. Get a VPS from a provider like DigitalOcean, Vultr, Linode, etc.
- Recommended VPS size at least 1gb RAM
- **it must be ubuntu 16.04 (xenial)**
2. Make sure you have a transaction of exactly 1000 POLIS in your desktop cold wallet.

------------

## Cold Wallet Setup Part 1
1. Open your wallet on your desktop.

Click Settings -> Options -> Wallet       
> only for MAC OSX (Click paymeal Core -> Preferences -> Wallet)

Check "Enable coin control features"

Check "Show Masternodes Tab"

Press Ok (you will need to restart the wallet)

------------


![](https://github.com/paymeal/paymeal/blob/master/doc/screen001.png?raw=true)

------------

2.Go to the "Tools" -> "Debug console"
3.Run the following command: masternode genkey
4.You should see a long key that looks like:
> 3HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg

5.This is your private key, keep it safe, **do not share with anyone**

------------

## VPS Setup
1.Log as root into your VPS by SSH.
> - Windows users use putty.exe to ssh connection by root user to VPS.
> - Mac OSX use Terminal to ssh connection by root user to VPS.
- Unix user know how to do it ;-)

2.Copy/paste these commands into the VPS and hit enter:** (One Box At A Time)**

```apt-get -y update```
```apt-get -y upgrade```
```apt-get -y install software-properties-common```
```apt-add-repository -y ppa:bitcoin/bitcoin```
```apt-get -y update```

------------


```apt-get -y install \```

```wget \```

```git \```

```unzip \```

```libevent-dev \```

```libboost-dev \```

```libboost-chrono-dev \```

```libboost-filesystem-dev \```

```libboost-program-options-dev \```

```libboost-system-dev \```

```libboost-test-dev \```

```libboost-thread-dev \```

```libminiupnpc-dev \```

```build-essential \```

```libtool \```

```autotools-dev \```

```automake \```

```pkg-config \```

```libssl-dev \```

```libevent-dev \```

```bsdmainutils \```

```libzmq3-dev \```

```nano```

------------
```apt-get -y update```

```apt-get -y upgrade```

```apt-get -y install libdb4.8-dev```

```apt-get -y install libdb4.8++-dev```

------------
```wget https://github.com/paymeal/paymeal/releases/download/v1.3.0/Paymeal-1.3.0-linux64-shell.tar.gz```

```tar -xvf Paymeal-1.3.0-linux64-shell.tar.gz```

```rm Paymeal-1.3.0-linux64-shell.tar.gz```

```mv paymeal{d,-cli} /usr/local/bin```

------------
```cd /root```

```mkdir .paymealcore```

```nano .paymealcore/paymeal.conf```

------------



**Replace: externalip=VPS_IP_ADDRESS masternodeprivkey=WALLET_GENKEY With your info!**

.create a rpcuser (as you prefer)

.create a rpcpassword (as you prefer)

#### copy and paste this to your **paymeal.conf **file

```> rpcuser=choose-a-fantasy-username
rpcpassword=choose-a-secure-password
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
masternode=1
logtimestamps=1
maxconnections=256
externalip=VPS_IP_ADDRESS
masternodeprivkey=WALLET_GENKEY
addnode=80.240.21.140:25126
addnode=node1.paymeal.org:25126
addnode=104.238.149.141:25126
addnode=node2.paymeal.org:25126
addnode=104.156.232.181:25126
addnode=node3.paymeal.org:25126
addnode=explorer.paymeal.org:25126
addnode=explorer.asia.paymeal.org:25126
addnode=45.77.45.127:25126
addnode=explorer.usa.paymeal.org:25126
addnode=149.28.198.18:25126```

------------

CTRL X to save it. Y for yes, then ENTER.

```paymeald```

use paymeal-cli to check status

```paymeal-cli getinfo```

stop paymeal service

```paymeal-cli stop```

get masternode status

```paymeal-cli masternode status```

**USE watch to repeat command periodically and monitor masternode**

```watch -n 1 paymeal-cli masternode status```


------------


## Cold Wallet Setup Part 1


1. On your local machine open your masternode.conf file. Depending on your operating system you will find it in:

- Windows: %APPDATA%\paymealCore\

```edit %APPDATA%\paymealCore\masternode.conf```

- Mac OS: ~/Library/Application Support/paymealCore/

```nano ~/Library/Application Support/paymealCore/masternode.conf```

- Unix/Linux: ~/.paymealcore/

```nano ~/.paymealcore/masternode.conf```

Leave the file open and go 
to the Paymeal wallet (on local machine)

2.Go to "Tools" -> "Debug console"

3.Run the following command: 

```masternode outputs```

4.You should see output like the following if you have a transaction with exactly 1000 PAYMEAL:

```{

"12345678xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx": "0"

}```

5.The value on the left is your **txid **and the right is the **vout**

6.Add a line to the bottom of the already opened masternode.conf file using the IP of your VPS (with port 25126), **private key**, **txid** and **vout**:

```mn1 192.168.1.1:25126 3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 12345678xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0 ```

7.Save the file, exit your wallet and reopen your wallet.

8.Go to the "Masternodes" tab

9.Click "Start All"

10.You will see "PRE_ENABLED". Just wait few minutes (or check directly on VPS)

Cheers !

------------

## SECURE YOUR VPS SERVER
#### optional
```ufw default deny incoming
ufw default deny outgoing
ufw allow ssh
ufw allow 22
ufw allow 2222
ufw allow 25126
ufw allow 25127
ufw enable```

