--ball.lua
ball = {}
ball.__index = ball

function ball:new(x,y,spr,vx,vy)
    local ball={}
        ball.x= x
        ball.y= y
        ball.spr= spr or 0
        ball.vx=vx or 0
        ball.vy=vy or 0
        ball.diam=8
    
    setmetatable(ball, self)
    return ball
end

--appellée dans la classe Joueur
function ball:update()
    printh("Nb lifes: "..p.nbLifes)


    --Decolage de la balle
    if player.sticky==false then
        self.x = self.x + self.vx
        self.y = self.y + self.vy
    else
        self.x = player.x + (player.w/2 - player.ballDiam/2)+1
        self.y = player.y - (player.ballDiam)
    end

    --Rebonds murs doit, haut, et gauche.
    --DROITE
    if self.x > (128 - self.diam) then
        self.vx = 0 - self.vx
        sfx(0)
    end
    if self.y < 0 then
        self.vy = 0 - self.vy
        sfx(0)
    end
    if self.x < 0 then
        self.vx = 0 - self.vx
        sfx(0)
    end

    --bottom + game over
    if self.y > 128 and not p.doResetBall then
        
        --bip damage
        sfx(1)
        --pad sticky + ball immobilized
        p.sticky=true
        --reset pos balle
        p.doResetBall=true
        -- -1 vie 
        p.nbLifes-=1
    
    end
end

function ball:draw()
    spr(self.spr, self.x, self.y)
end