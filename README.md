# OSX-live-wallpaper
Live wallpaper changer for MAC. Inspired from [thedevsaddam](https://github.com/thedevsaddam/ubuntu-live-wallpaper)


### Installation

Open terminal ( ctrl+alt+t ) and go to __Home__ directory

```bash
cd ~
```
Install __jq__ dependency.

```bash
brew install jq
```

Clone the repository

```bash
git clone https://github.com/mkromi/osx-live-wallpaper.git
```
or download the zip file manually and unzip to __Home__ directory

Change permission to 777

```bash
sudo chmod -R 777 osx-live-wallpaper
```

Run for the first time

```bash
bash /Users/YOUR_USER_NAME/osx-live-wallpaper/app.sh
```

Replace YOUR_USER_NAME by your username.

_Note:  To get username type `whoami` in terminal_

To change wallpaper automatically open crontab in edit mode

```bash
crontab -e
```

Copy the line below and paste
```bash
*/5 * * * * /bin/bash /Users/YOUR_USER_NAME/osx-live-wallpaper/app.sh
```

The Cron job will run the script every five minutes and change the wallpaper. You can configure the Cron job to change the refresh time.

__If  you want set wallpaper tags__
```bash
cd ~
cd osx-live-wallpaper
```
then run the command below:

```bash
bash configure.sh
```

#### These tags are already configured.
* food
* nature
* people
* technology
* buildings
* objects

__Note:__ Tags are the keyword to find specific wallpapers.

### Dependencies:
* [jq](https://formulae.brew.sh/formula/jq)

### Credits:
* [Image source](https://source.unsplash.com)

### **License**
The **osx-live-wallpaper** is an open-source application licensed under the [MIT License](LICENSE).
