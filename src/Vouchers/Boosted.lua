SMODS.Voucher {
    key = 'boosted',
    set = 'Voucher',
    atlas = 'placeholders',
    pos = { 
        x = 0, 
        y = 3 
    },
    config = { 
        extra = { booster_slots0 = 3 }
    },
    cost = 10,

    unlocked = true,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card and card.ability.extra.booster_slots0 or self.config.extra.booster_slots0 } }
    end,

    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    local current_booster_slots = (G.GAME.modifiers.extra_boosters or 2)
                    local target_booster_slots = 3
                    local difference = target_booster_slots - current_booster_slots
                    SMODS.change_booster_limit(difference)
                    return true
                end
            }))
        }
    end

}