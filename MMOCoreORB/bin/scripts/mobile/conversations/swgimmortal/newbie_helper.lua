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
        {"Can you buff me please?", "buff_screen"}, 
        {"I need some stuff.", "buy_screen"}, 
        {"I'm fine, thank you!.", "deny_quest"}, 
    }
}
newbie_helper_conversation:addScreen(newbie_helper_first_screen);

newbie_helper_buff_screen = ConvoScreen:new {
    id = "buff_screen",
    leftDialog = "",
    customDialogText = "Of course!",
    stopConversation = "false",
    options = { 
        {"Starter buffs (5000 Credits)", "starter_buffs"}, 
        {"I'm fine, thank you!.", "deny_quest"}, 
    }
}
newbie_helper_conversation:addScreen(newbie_helper_buff_screen);

newbie_helper_buy_screen = ConvoScreen:new {
    id = "buy_screen",
    leftDialog = "",
    customDialogText = "Alright, what do you need?",
    stopConversation = "false",
    options = { 
        {"Speederbike (20000 Credits)", "speederbike"}, 
        {"I'm fine, thank you!.", "deny_quest"}, 
    }
}
newbie_helper_conversation:addScreen(newbie_helper_buy_screen);

newbie_helper_starter_buffs = ConvoScreen:new {    
    id = "starter_buffs",
    leftDialog = "",
    customDialogText = "Take care out there!",
    stopConversation = "true",
    options = { }
}
newbie_helper_conversation:addScreen(newbie_helper_starter_buffs);

newbie_helper_speederbike = ConvoScreen:new {    
    id = "speederbike",
    leftDialog = "",
    customDialogText = "Enjoy that Speeder!",
    stopConversation = "true",
    options = { }
}
newbie_helper_conversation:addScreen(newbie_helper_speederbike);

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