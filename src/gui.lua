--player.lua
gui = {}
gui.__index = gui

function gui:new()
    local gui={
        
    }
    setmetatable(gui, self)
    return gui
end

function gui:update()

end

function gui:draw()
    --bordure de niveau de couleur 7 (blanche)
    gui:level_border(7)



end

function gui:level_border(color)
    line(0,0,127,0,color)
    line(127,0,127,127,color)
    line(127,127,0,127,color)
    line(0,127,0,0,color)
end