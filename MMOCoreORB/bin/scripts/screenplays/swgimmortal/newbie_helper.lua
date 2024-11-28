NewbieHelper = ScreenPlay:new {                
    numberOfActs = 1,                
    questString = "newbie_helper_task",                   
    states = {}, 
}
registerScreenPlay("NewbieHelper", true)
function NewbieHelper:start()     
    spawnMobile("tatooine", "newbie_helper", 1, 3529, 5, -4811, 35, 0 ) -- Mos Eisley Starport
    spawnMobile("tatooine", "newbie_helper", 1, 3462, 5, -4854, 35, 0 ) -- Mos Eisley Cantina
end
newbie_helper_conversation_handler = Object:new {
    tstring = "myconversation" 
}
function newbie_helper_conversation_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)            
        -- Assign the player to variable creature for use inside this function.
        local creature = LuaCreatureObject(conversingPlayer)
        -- Get the last conversation to determine whether or not we’re on the first screen      
        local convosession = creature:getConversationSession()  
        lastConversation = nil      
        local conversation = LuaConversationTemplate(conversationTemplate)  
        local nextConversationScreen     
        -- If there is a conversation open, do stuff with it        
        if ( conversation ~= nil ) then  -- check to see if we have a next screen   
            if ( convosession ~= nil ) then             
                local session = LuaConversationSession(convosession)
                if ( session ~= nil ) then                  
                    lastConversationScreen = session:getLastConversationScreen()   
                end         
            end         
            -- Last conversation was nil, so get the first screen
            if ( lastConversationScreen == nil ) then          
                nextConversationScreen = conversation:getInitialScreen()
            else
                -- Start playing the rest of the conversation based on user input               
                local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen) 
                -- Set variable to track what option the player picked and get the option picked                
                local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
                nextConversationScreen = conversation:getScreen(optionLink)
                -- Get some information about the player.
                local credits = creature:getCashCredits()
                local pInventory = creature:getSlottedObject("inventory")
                local inventory = LuaSceneObject(pInventory)
                -- Take action when the player makes a purchase.

                if (SceneObject(pInventory):isContainerFullRecursive()) then
                    -- Bail if the player doesn’t have enough space in their inventory.
                    -- Plays a chat box message from the NPC as well as a system message.
                    nextConversationScreen = conversation:getScreen("insufficient_space")
                    creature:sendSystemMessage("You do not have enough inventory space")

                -- Not enough credits

                elseif (optionLink == "speederbike" and credits < 20000) then
                    -- Bail if the player doesn’t have enough cash on hand.  
                    -- Plays a chat box message from the NPC as well as a system message.
                      nextConversationScreen = conversation:getScreen("insufficient_funds")
                      creature:sendSystemMessage("You have insufficient funds") 

                elseif (optionLink == "starter_buffs" and credits < 5000) then
                        nextConversationScreen = conversation:getScreen("insufficient_funds")
                        creature:sendSystemMessage("You have insufficient funds") 

                elseif (optionLink == "armor" and credits < 20000) then
                        nextConversationScreen = conversation:getScreen("insufficient_funds")
                        creature:sendSystemMessage("You have insufficient funds") 

                -- Enough credits

                elseif (optionLink == "speederbike" and credits >= 20000) then
                    -- Take credits from the player’s cash on hand and give player a speederbike.
                    creature:subtractCashCredits(20000)
                    giveItem(pInventory, "object/tangible/deed/vehicle_deed/speederbike_deed.iff", -1)

                elseif (optionLink == "starter_buffs" and credits >= 5000) then
                    creature:subtractCashCredits(5000)
                    creature:enhanceCharacter()

                elseif (optionLink == "armor" and credits >= 20000) then
                    creature:subtractCashCredits(20000)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_belt.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_bicep_l.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_bicep_r.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_boots.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_bracer_L.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_bracer_r.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_chest_plate.iff", -1)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_gloves.iff", -1)
                    generateCraftedItem(pInventory, "object/draft_schematic/clothing/clothing_armor_padded_helmet.iff", 1, 150)
                    giveItem(pInventory, "object/tangible/wearables/armor/padded/armor_padded_s01_leggings.iff", -1)
                    
                end
            end
        end
        -- end of the conversation logic.
        return nextConversationScreen
    end
    function newbie_helper_conversation_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    -- Plays the screens of the conversation.
    return conversationScreen
end