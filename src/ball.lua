--ball.lua
ball = {}
ball.__index = ball

function ball:new(x,y,spr,isSticked)
    local ball={}
        ball.x= x
        ball.y= y
        ball.isSticked = isSticked or true
        ball.spr= spr or 0
    
    setmetatable(ball, self)
    return ball
end

function ball:update()
    --physique de la balle
end

function ball:draw()
    spr(ball.spr, ball.x, ball.y)
end