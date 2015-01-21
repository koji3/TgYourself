# TgYourself
Send yourself any file from contextual menu

## Dependencies

* [Telegram-cli](https://github.com/vysheng/tg)
* notify-send
 
## Installation
### Thunar

  mkdir home/USER/.local/share/Thunar/sendto
  mv TelegramYourself.desktop home/USER/.local/share/Thunar/sendto/
  mv to_telegram.sh home/USER/.local/share/Thunar/sendto/
  
### More soon...
  please help me trying this in others file managers
## Configuration
Edit the .desktop file and set the correct path in the field "Path"
Edit the .sh file and set the variable "username" to your telegram user (Name Lastname with all spaces changed to underscores. You can see the correct format if you simply run 'telegram'). This user will receive your files.
Execute at least one time 'telegram' for the initial configuration.
