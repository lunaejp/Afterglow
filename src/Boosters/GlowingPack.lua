SMODS.Booster {
    key = 'glowing_pack',
    loc_txt = {
        name = "Glowing Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}3',
            [2] = 'Glowing Cards{} to use {C:attention}instantly{}'
        },
        group_name = "Select 1 card to use."
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 2,
    atlas = "vouchers",
    pos = { x = 0, y = 0 },
    kind = 'glowing',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "glowing",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("88e6ff"))
        ease_background_colour({ new_colour = HEX('88e6ff'), special_colour = HEX("c5bf71"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end
}
