📄 *Setup*
* ##**Make an account at** https://pushover.net/
![image](https://github.com/user-attachments/assets/6013197b-23cd-4ff0-b6f6-38a7472830e2)
This is your user key, you will need it for setting this up
* Scroll down to the bottom of the website and click "Create an Application/API Token"
![image](https://github.com/user-attachments/assets/28c59a1c-bf53-4e7c-995b-08ca58c8767f)
* **This will give you your api token and show you all the stats**
![image](https://github.com/user-attachments/assets/7d63db69-7406-4d26-9875-073297e6a8dd)
* **Download the push over app on your phone**
* **Sign into the same account you made on the push over website**
```
local NotiHandler = require(ReplicatedStorage.PushOverHandler)
NotiHandler:Init("user key or group key", "api token")

NotiHandler:SendMessage(`Sent from a roblox game!`)
```
