--#region Atlases

SMODS.Atlas {
    key = 'jokers',
    path = 'jokers.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'placeholders',
    path = 'placeholders.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'consumables',
    path = 'consumables.png',
    px = 71,
    py = 95
}

--#endregion

--#region File Loading

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

local consumables_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/Consumables")
for _, file in ipairs(consumables_src) do
    assert(SMODS.load_file("src/Consumables/" ..file))()
end

--#endregion

--#region Consumable Sets

SMODS.ConsumableType {
    key = 'glowing',
    primary_type = 'Consumable',
    loc_txt = {
        name = "Glowing",
        collection = "Glowing",
        undiscovered = {
            name = "Undiscovered Card",
            text = { "Discover this card", "in a run to unlock" }
        }
    },

    primary_colour = HEX("ffffff"), 
    secondary_colour = HEX("00ffff"),


    badge_colour = HEX("00ffff"),
    text_colour = HEX("ffffff"),
    

    config = {

    }, 
    shop_rate = 1
}

rawset(_G, "glowing_rate", 0.25)

local native_create_shop = create_card_for_shop
function create_card_for_shop(area, forced_tag)
    if G.GAME then
        G.GAME.glowing_rate = G.GAME.glowing_rate or 0.25
        if G.GAME.current_round then
            G.GAME.current_round.glowing_rate = G.GAME.current_round.glowing_rate or 0.25
        end
    end
    _G.glowing_rate = 0.25
    return native_create_shop(area, forced_tag)
end


--#endregion