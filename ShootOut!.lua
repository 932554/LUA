function notify(str1,str2,int1)
    game.StarterGui:SetCore("SendNotification", {
        Title = str1,
        Text = str2,
        Duration = int1,
    })
end
notify('Error', "PSU (obfuscator) was offline. Couldn't obfuscate the new update. Coming whenever PSU is back online.", 10)
