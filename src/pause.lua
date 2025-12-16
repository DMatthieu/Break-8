pause_state={}

--[[ if btnp(5) then
        gamestate.set(pause_state)
    end ]]

function pause_state:init()
    --spawn joueur, reset score
end

function pause_state:update()
    --logique gameplay
    if btnp(5) then
        gamestate.set(game_state)
    end
end

function pause_state:draw()
    cls()
    --affichage gameplay
    print("pause !", 40, 40, 7)
end