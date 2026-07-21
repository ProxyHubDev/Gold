local WEBHOOK_URL = "https://discord.com/api/webhooks/1529011782558023680/DpjFNm2LYi9kYC7yeT0_nUmSIIrDgnABgINwXuBTk9QlpOZ6SvkQPGCE8BNXVpfTzGTV"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

local function GetExecutorName()
	local ok, name = pcall(function()
		return identifyexecutor and identifyexecutor() or "Desconhecido"
	end)
	if ok and name then
		return name
	end
	return "Desconhecido"
end

local function SendWebhookLog()
	local placeName = "Desconhecido"
	local ok = pcall(function()
		placeName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	end)

	local now = DateTime.now():FormatLocalTime("DD/MM/YYYY HH:mm:ss", "pt-br")

	local payload = {
		username = "Loader Logs",
		embeds = {
			{
				title = "Script Executado",
				color = 3447003,
				fields = {
					{name = "🎮 Jogo", value = tostring(placeName), inline = false},
					{name = "👤 Nome de Criação", value = tostring(LocalPlayer.Name), inline = true},
					{name = "🏷️ Nome de Exibição", value = tostring(LocalPlayer.DisplayName), inline = true},
					{name = "🕐 Horário", value = tostring(now), inline = false},
					{name = "⚙️ Executor", value = GetExecutorName(), inline = false},
				},
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}

	local body = HttpService:JSONEncode(payload)

	local requester = (syn and syn.request) or http_request or request or (fluxus and fluxus.request)

	if requester then
		pcall(function()
			requester({
				Url = WEBHOOK_URL,
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = body,
			})
		end)
	else
		pcall(function()
			HttpService:PostAsync(WEBHOOK_URL, body, Enum.HttpContentType.ApplicationJson)
		end)
	end
end

pcall(SendWebhookLog)

local Loaders = {
	[135858844777165] = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProxyHubDev/Gold/refs/heads/main/src/scripts/animeduelists.lua"))()
	end,
}

local Loader = Loaders[game.PlaceId]
if Loader then
	Loader()
end
