📄 *Setup*
* Make an account at https://pushover.net/
![image](https://github.com/user-attachments/assets/6013197b-23cd-4ff0-b6f6-38a7472830e2)
This is your user key, you will need it for setting this up
* Download the push over app on your phone
* Sign into the same account you made on the push over website
```
local NotiHandler = require(ReplicatedStorage.PushOverHandler)
NotiHandler:Init("user key or group key", "api token")

NotiHandler:SendMessage(`Sent from a roblox game!`)
```
