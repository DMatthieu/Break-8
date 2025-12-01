--ball.lua
ball = {}
ball.__index = ball

function ball:new()
    local ball={
        x=0,
        y=0,
        spr=0
    }
    setmetatable(ball, self)
    return ball
end