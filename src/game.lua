
game_state={}

function game_state:init()
    --spawn joueur
    p = player:new()
--[[     g = gui:new()
 ]]    l = level:new()
    
end

function game_state:update()
    --update joueur
    p:update()

    --PAUSE + Reset
    if btnp(4) then
        gamestate.set(splashscreen_state)
    end
    if btnp(5) then
        gamestate.set(pause_state)
    end
end

function game_state:draw()
    cls(1)
    --affichage GUI
--[[     g.draw()
 ]]
    --affichage layout niveau
    --brique (10x6. rectangle + ligne)
    
    
    --affichage pad
    p:draw()

    l:draw()

end
