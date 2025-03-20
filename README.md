# *📝Setup*
* ### **Make an account at** [pushover.net](https://pushover.net/)
![image](https://github.com/user-attachments/assets/6013197b-23cd-4ff0-b6f6-38a7472830e2)
This is your user key, you will need it for setting this up
* ### **Scroll down to the bottom of the website and click "Create an Application/API Token"**
![image](https://github.com/user-attachments/assets/28c59a1c-bf53-4e7c-995b-08ca58c8767f)
* ### **This will give you your api token and show you all the stats**
![image](https://github.com/user-attachments/assets/7d63db69-7406-4d26-9875-073297e6a8dd)
* ### **Download the push over app on your phone**
* ### **Sign into the same account you made on the push over website**

## This is the basic code on how to use the module
```lua
local NotiHandler = require(ReplicatedStorage.PushOverHandler)
NotiHandler:Init("user key or group key", "api token")

NotiHandler:SendMessage(`Sent from a roblox game!`)
```

## This is how you setup notis for dev product purchases
This is using the processReceipt function from the [roblox docs](https://create.roblox.com/docs/reference/engine/classes/MarketplaceService#ProcessReceipt)
```lua
local NotiHandler = require(ReplicatedStorage.PushOverHandler)
NotiHandler:Init("user key or group key", "api token")
local randomGamePassId = 3243599842 -- change with your gamepass

-- Random Game Pass
productFunctions[randomGamePassId] = function(receipt, player)
    local character = player.Character
    local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")

    if humanoid then
        print(`{player.DisplayName} bought a dev product`)
    end
end

local function processReceipt(receiptInfo)
    local userId = receiptInfo.PlayerId
    local productId = receiptInfo.ProductId
    local player = Players:GetPlayerByUserId(userId)
    if player then
        local handler = productFunctions[productId]
        local success, result = pcall(handler, receiptInfo, player)
		
        if success then
            local devProductInfo = MarketplaceService:GetProductInfo(productId, Enum.InfoType.Product)
            NotiHandler:SendMessage(`{player.Name} just bought {devProductInfo.Name} for {devProductInfo.PriceInRobux} Robux`)
            return Enum.ProductPurchaseDecision.PurchaseGranted
        else
          warn("Failed to process receipt:", receiptInfo, result)
        end
    end

    return Enum.ProductPurchaseDecision.NotProcessedYet
end
```
