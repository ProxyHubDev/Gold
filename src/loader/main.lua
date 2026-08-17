local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function hasScriptKey()
    local env = getgenv and getgenv()

    if not env then
        return false
    end

    return env.script_key ~= nil
end

local function createUI()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoaderUI"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Name = "Main"
    frame.Size = UDim2.fromOffset(300, 200)
    frame.Position = UDim2.fromScale(0.5, 0.5)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
end

if not hasScriptKey() then
    createUI()
end

local WEBHOOK_URL = "https://discord.com/api/webhooks/1536880793014509679/BByxaWh_RuG66sbsPQnyG6da9rPU0hRW8siK5Gh9zd6ybfUxjBLjmq_V-MMk1xTh81JH"

local loaders = {
    [122553263569744] = "016bfd01ed2ea33c26a1f50aa3048db6",
    [94717504417144] = "ca9cf8e4bd3332a329d960da48ac9f1a",
}

local loaderId = loaders[game.PlaceId]

if not loaderId then
    warn("game is not supported")
    return
end

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/" .. loaderId .. ".lua"))()
