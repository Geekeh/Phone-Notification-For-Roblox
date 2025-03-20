local PushOverModule = {}
PushOverModule.__index = PushOverModule


local HttpService = game:GetService("HttpService")

-- Start the module with your specific info
function PushOverModule:Init(UserKey: string, ApiToken: string)
	self.UserKey = UserKey
	self.ApiToken = ApiToken
end

-- Just pass through the message you want to send
function PushOverModule:SendMessage(message: string)
	
	local data = {
		user = self.UserKey,
		token = self.ApiToken,
		message = message
	}
	local Url = "https://api.pushover.net/1/messages.json"
	local encodeData = HttpService:JSONEncode(data)
	local response = HttpService:PostAsync(Url, encodeData, Enum.HttpContentType.ApplicationJson)
end

return PushOverModule
