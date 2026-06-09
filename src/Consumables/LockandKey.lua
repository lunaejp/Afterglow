SMODS.Consumable {
    key = 'LockandKey',
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 1
    },
    config = {
        card_limit = 0
    },
    set = 'glowing',
    hidden = false,
    soul_set = 'Tarot',
    soul_rate = 0.5,
    use = function(self, card, area, copier)
        local target_joker = G.jokers.highlighted[1]

        play_sound('card1')

        target_joker:juice_up(0.3,0.5)

        target_joker.ability.eternal = true
    end,
    can_use = function(self, card)
        if G.jokers and #G.jokers.highlighted == 1 then
            local target_joker = G.jokers.highlighted[1]
            if not target_joker.ability.eternal then
                return true
            end
        end
        return false
    end
}