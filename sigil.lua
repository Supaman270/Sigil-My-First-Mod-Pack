--- STEAMODDED HEADER
--- MOD_NAME: Sigil
--- MOD_ID: SIGIL
--- MOD_AUTHOR: [Supaman270]
--- MOD_DESCRIPTION: Adds mainly some new jokers, maybe more later on as I learn to code
--- LOADER_VERSION_GEQ: 1.0.0
--- BADGE_COLOR: c7638f
--- PREFIX: sgl
----------------------------------------------
------------ MOD CODE ------------------------

SMODS.Atlas{
    key = "jokers",
    path = "jokeratlas.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'slots',
    loc_text = {
        name = 'Slot Machine',
        text = {
            "Gives {C:money}$#1# {} per {C:attention}7 {} scored",
            "{C:inactive}Art by {C:attention}Tuzzo {}"
        }
    },
    config = {extra = {money = 5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.money}}
      end,
    rarity = 2,
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 7,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
              return {
                money = card.ability.extra.money,
                message = localize{type = 'variable', key = 'a_money', vars = {card.ability.extra.money}},
                card = card
              }
            end
          end
    end
}
