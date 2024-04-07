TriggerEvent("chat:addSuggestion", "/propfix", "Remove prop that is stuck", {})

RegisterCommand("propfix", function()
    local playerPed = PlayerPedId()
    
    local nearbyObjects = GetGamePool("CObject")
    local prop = nil
    for _, object in ipairs(nearbyObjects) do
        if DoesEntityExist(object) then
            local attachedEntity = GetEntityAttachedTo(object)
            if attachedEntity == playerPed then
                prop = object
                break
            end
        end
    end
    
    if prop then
        DetachEntity(prop, true, true)
        DeleteEntity(prop)
        print("Stuck prop removed.")
    else
        print("No prop in hand.")
    end
end, false)
