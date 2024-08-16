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
--- Thank you so much someone23832 and nekojoe for all the help. I really wouldn't have been able to do any of this without y'all.
SMODS.Joker{
  key = 'slots',
  loc_txt = {
      name = 'Slot Machine',
      text = {
          "Gives {C:money}$#1# {}per {C:attention}7 {}",
          "or {C:attention}Lucky Card {}scored.",
          "{S:0.8}{C:inactive}Art by {C:attention}Tuzzo {} {}"
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
  discovered=true,
  unlocked=true,
  calculate = function(self, card, context)
    if context.individual then
      if context.cardarea == G.play then
        if context.other_card.ability.name == 'Lucky Card' or context.other_card:get_id() == 7 then
          G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
          G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
          return {
            dollars = card.ability.extra.money,
            card = card,
          }
        end
      end
    end
  end
}   