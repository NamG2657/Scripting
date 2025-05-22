wait(1)
function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end
function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("wh sent")
end
SendMessage(url)
local embed = {
    ["title"] = "Grow A Garden",
    ["description"] = "GAG Checker",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Game Version",
            ["value"] = game.PlaceVersion
        },
        {
            ["name"] = "Job ID",
            ["value"] = game.JobId
        }
    },
    ["footer"] = {
        ["text"] = "mmbed"
    }
}
SendMessageEMBED(url, embed)
