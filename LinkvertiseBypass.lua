local bypassURL = "https://linkvertisebypasser.herokuapp.com/api?url="
local baconLib = loadstring(game:HttpGet("https://bit.ly/baconlib"))()

local bypassWindow = baconLib:CreateWindow("Ad-link Bypass", Enum.KeyCode.RightShift)
local bypassTextBox = baconLib:CreateTextBox(bypassWindow, Enum.Font.Legacy, "URL", "")
local bypassButton =
    baconLib:CreateButton(
    bypassWindow,
    "Bypass URL",
    function()
        if bypassTextBox.Text == "" then
            baconLib:CreateNotification("Error", "No URL Given.")
        else
            setclipboard(bypassURL .. bypassTextBox.Text)
            baconLib:CreateNotification("Bypassed!", "Bypassed link set to clipboard.")
        end
    end
)
local button =
    baconLib:CreateButton(
    bypassWindow,
    "Clear",
    function()
        bypassTextBox.Text = ""
    end
)
