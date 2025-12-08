
game_state={}

function game_state:init()
    --spawn joueur
    p = player:new()
    l = level:new()
    
end

function game_state:update()
    --update joueur
    p:update()

    if btnp("5") then
        gamestate.set(pause_state)
    end
end

function game_state:draw()
    cls(1)

    --affichage pad
    p:draw()
    l:draw()

end
