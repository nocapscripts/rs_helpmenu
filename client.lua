local ui = false;

function UI()
    if not ui then 

        SetDisplay(true)
    else 
        SetDisplay(not ui)
    end

end

RegisterCommand('help', function()
    UI()

end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "tablet",
        status = bool,
    })
end

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)





