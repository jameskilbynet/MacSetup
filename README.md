# MacSetup

A couple of scripts I use to setup a factory fresh Mac with some of the settings and software I use.
```shell
cd ~/Downloads

curl -sL https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/defaults.sh | bash
curl -O https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/brew.sh
curl -O https://raw.githubusercontent.com/jameskilbynet/MacSetup/master/brew-apps.sh
chmod +x brew.sh
./brew.sh
chmod +x brew-apps.sh
./brew-apps.sh
```
