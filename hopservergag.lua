function hopserver()
    local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
    module:Teleport(game.PlaceId)
end
print("version is:", game.PlaceVersion)
function checkver()
    if table.find({1233,1231},game.PlaceVersion)
    then
        wait(5)
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6105653ae2e11cc9691254d2cec961a4.lua"))()
    else
        print("not ver 1233 or 1231")
        wait(0.1)
        hopserver()
    end
end
checkver()
