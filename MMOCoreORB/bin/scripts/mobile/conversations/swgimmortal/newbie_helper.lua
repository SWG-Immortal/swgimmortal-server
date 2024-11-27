newbie_helper_conversation = ConvoTemplate:new {
    initialScreen = "first_screen",
    templateType = "Lua",
    luaClassHandler = "newbie_helper_conversation_handler",
    screens = {}
}

newbie_helper_first_screen = ConvoScreen:new {
    id = "first_screen",
    leftDialog = "",
    customDialogText = "Oh, hello there! How can I help you?",
    stopConversation = "false",
    options = { 
        {"Speederbike – 10,000 Credits", "speederbike"}, 
        {"I'm fine, thank you!.", "deny_quest"}, 
    }
}
newbie_helper_conversation:addScreen(newbie_helper_first_screen);

newbie_helper_accept_quest = ConvoScreen:new {    
    id = "speederbike",
    leftDialog = "",
    customDialogText = "Enjoy that Speederbike!",
    stopConversation = "true",
    options = { }
}
newbie_helper_conversation:addScreen(newbie_helper_accept_quest);

newbie_helper_deny_quest = ConvoScreen:new {
    id = "deny_quest",
    leftDialog = "",
    customDialogText = "Well, have a nice day!",
    stopConversation = "true",
    options = { }
}
newbie_helper_conversation:addScreen(newbie_helper_deny_quest);

newbie_helper_insufficient_funds = ConvoScreen:new {
    id = "insufficient_funds",  
    leftDialog = "", 
    customDialogText = "Sorry, but you don’t have enough credits with you to purchase that. Head on over to the bank. I’ll be here when ya get back!",
    stopConversation = "true",
    options = { }
}
newbie_helper_conversation:addScreen(newbie_helper_insufficient_funds);

newbie_helper_insufficient_space = ConvoScreen:new {
    id = "insufficient_space",
    leftDialog = "", 
    customDialogText = "Sorry, but you don’t have enough space in your inventory to accept the item. Please make some space and try again.",    
    stopConversation = "true",  
    options = { }
}
newbie_helper_conversation:addScreen(newbie_helper_insufficient_space);

addConversationTemplate("newbie_helper_conversation", newbie_helper_conversation);