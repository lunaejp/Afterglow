SMODS.Consumable {
    key = 'LabGrown',
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        card_limit = 0,
        extra = { odds_num = 2, odds_den = 3 }
    },
    set = 'glowing',
    hidden = false,
    soul_set = 'Tarot',
    soul_rate = 0.5,

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, self.config.extra.odds_num, self.config.extra.odds_den, 'heartbreaker_destroy_odds')
        return { vars = { num, den } }
    end,

    use = function(self, card, area, copier)
        local hearts_in_deck = {}
        for _, deck_card in ipairs(G.playing_cards) do
            if deck_card.ability.set == 'Default' and deck_card:is_suit('Diamonds') then
                table.insert(hearts_in_deck, deck_card)
            end
        end

        local cards_to_destroy = {}

        for _, heart_card in ipairs(hearts_in_deck) do
            if SMODS.pseudorandom_probability(card, 'heartbreaker_destroy', self.config.extra.odds_num, self.config.extra.odds_den, 'heartbreaker_destroy_odds') then
                table.insert(cards_to_destroy, heart_card)
            end
        end

        if #cards_to_destroy > 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    for _, target_card in ipairs(cards_to_destroy) do
                        target_card:juice_up()
                        target_card:start_dissolve()
                    end
                    return true
                end
            }))
        end
    end,
    
    can_use = function(self, card)
        if not G.playing_cards then return false end
        for _, deck_card in ipairs(G.playing_cards) do
            if deck_card.ability.set == 'Default' then
                if deck_card:is_suit('Diamonds') then
                    return true
                end
            end
        end

        return false
    end
}