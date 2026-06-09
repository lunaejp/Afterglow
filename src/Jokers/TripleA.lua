SMODS.Joker {
    key = 'TripleA',
    atlas = 'placeholders',
    pos = {
        x = 1, 
        y = 0
    },
    config = {
        extra = {
            xmult = 2
        },
        weight = 0.25
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == "Three of a Kind" then
            local aceshand = true
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].base.value ~= 'Ace' then
                    aceshand = false
                    break
                end
            end

            if aceshand then
                return{
                xmult = card.ability.extra.xmult
            }
        end
    end
end
}