SMODS.Booster {
    key = 'glowing_pack',
    kind = 'glowing',
    atlas = 'placeholders.png',
    pos = { 
        x = 3, 
        y = 2 
    },
    config = { 
        extra = 3, 
        choose = 1 
    },
    cost = 6,
    weight = 0.5,
    
    loc_txt = {
        name = "Glowing Pack",
        group_name = "Booster Pack",
        text = { "Choose {C:attention}#1#{} of up to", "{C:attention}#2# Glowing Cards{} to add", "to your area" }
    },
    
    create_card = function(self, card)
        return create_card('Glowing', G.pack_cards, nil, nil, nil, nil, nil, 'glow')
    end
}