gamestate={}

local current = nil

function gamestate.set(state)
    --
    current = state
    if current.init then current:init() end
end

function gamestate.update()
    if current and current.update then current:update() end
end

function gamestate.draw()
    if current and current.draw then current:draw() end
end