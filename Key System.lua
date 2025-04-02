local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local correctKey = "NovaHubRework"
local player = Players.LocalPlayer

local KeyUI = Instance.new("ScreenGui")
KeyUI.Name = "ScriptKeyUI"
KeyUI.Parent = player:WaitForChild("PlayerGui") 
KeyUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = KeyUI
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 400, 0, 150)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Visible = true

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Parent = Main
KeyLabel.Text = "Enter Your Key Below"
KeyLabel.Size = UDim2.new(1, 0, 0, 30)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Font = Enum.Font.Gotham
KeyLabel.TextSize = 14
KeyLabel.TextColor3 = Color3.fromRGB(225, 225, 225)

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = Main
KeyBox.Size = UDim2.new(1, -20, 0, 30)
KeyBox.Position = UDim2.new(0, 10, 0, 40)
KeyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyBox.Font = Enum.Font.Gotham
KeyBox.Text = ""
KeyBox.PlaceholderText = "Enter your key here"
KeyBox.TextColor3 = Color3.fromRGB(225, 225, 225)

local SubmitButton = Instance.new("TextButton")
SubmitButton.Parent = Main
SubmitButton.Size = UDim2.new(0.5, -15, 0, 30)
SubmitButton.Position = UDim2.new(0.5, 5, 0, 80)
SubmitButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SubmitButton.Font = Enum.Font.Gotham
SubmitButton.Text = "Submit Key"
SubmitButton.TextColor3 = Color3.fromRGB(225, 225, 225)

SubmitButton.MouseButton1Click:Connect(function()
    print("Entered Key:", KeyBox.Text)
    if KeyBox.Text == correctKey then
        print("Correct Key, Welcome To Nova Hub")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EncryptedV10/Nova-Hub/refs/heads/main/Nova%20Hub%20loader.lua"))()
        wait(1)
        KeyUI:Destroy()
    else
        print("Incorrect Key, Try Again")
    end
end)

local uihide = false
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        uihide = not uihide
        Main.Visible = not uihide
    end
end)
