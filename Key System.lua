local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 200)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local topBar = Instance.new("TextLabel")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
topBar.Font = Enum.Font.GothamSemibold
topBar.Text = "Key System"
topBar.TextColor3 = Color3.fromRGB(255, 255, 255)
topBar.TextSize = 16
topBar.Parent = mainFrame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 35)
textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
textBox.TextColor3 = Color3.fromRGB(200, 200, 200)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 16
textBox.Parent = mainFrame

local confirmButton = Instance.new("TextButton")
confirmButton.Size = UDim2.new(0.8, 0, 0, 35)
confirmButton.Position = UDim2.new(0.1, 0, 0.55, 0)
confirmButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.Font = Enum.Font.GothamSemibold
confirmButton.Text = "Confirm"
confirmButton.TextSize = 16
confirmButton.Parent = mainFrame

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0.8, 0, 0, 35)
copyButton.Position = UDim2.new(0.1, 0, 0.75, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamSemibold
copyButton.Text = "Copy Key Link"
copyButton.TextSize = 16
copyButton.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.8, 0, 0, 25)
statusLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
statusLabel.Font = Enum.Font.GothamSemibold
statusLabel.TextSize = 14
statusLabel.Text = ""
statusLabel.Parent = mainFrame

local correctKey = "NovaHubRework"

local function smoothFade(object, targetTransparency)
    local tween = TweenService:Create(object, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = targetTransparency})
    tween:Play()
end

confirmButton.MouseButton1Click:Connect(function()
    if textBox.Text == correctKey then
        statusLabel.Text = "Key Correct!"
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        print("Correct Key: " .. textBox.Text)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EncryptedV10/Nova-Hub/refs/heads/main/Nova%20Hub%20loader.lua"))()
        wait(1)
        gui:Destroy()
    else
        statusLabel.Text = "Incorrect Key!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        smoothFade(statusLabel, 0)
        wait(1)
        smoothFade(statusLabel, 1)
    end
end)

copyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/Tk9gsP4kGf")
    statusLabel.Text = "Key Link Copied!"
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    smoothFade(statusLabel, 0)
    wait(1)
    smoothFade(statusLabel, 1)
end)
