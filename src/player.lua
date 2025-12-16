--player.lua
player = {}
player.__index = player

function player:new()
    player={
        x=54,
        y=114,
        --l=10,
        w=20,
        h=5,
        color=7,
        sticky=true,
        spd=4,
        extGauche=2,
        extDroite=105,
        nbLifes=3,
        ballSpr=1,
        ballDiam=8,
        doResetBall=false
    }

    
    b = ball:new(player.x + (player.w/2 - player.ballDiam/2)+1, 
                    player.y - (player.ballDiam), 
                    player.balleSpr,
                    1,
                    -1)    


    setmetatable(player, self)
    return player
end

function player:update()
    self:inputs()--permet d'appeller une des méthode de l'objet player, au sein de lui même



    --gère le reset de la balle
    if self.doResetBall then
        self.resetBall()
    end

    --On demande à la balle de se mettre à jour
    b:update()

end

function player:draw()
    --draw pad
    rectfill(self.x, self.y, self.x + self.w, self.y + self.h, self.color)
    --pad's shadow
    line(self.x, self.y + self.h, self.x + self.w, self.y + self.h,self.color-1)

    --Dessine la balle
    b:draw()

    --Ecris le nb de vies en bas à droite de l'écran
    spr(1, 110, 120)
    print("vies: ".. self.nbLifes,80,120)

end

--Handle player movements AND collision of the pad with walls.
function player:inputs()
        --ifplayer not moving:
    self.moving=false

    --move pad
    --LEFT
    if btn(0) then 
        if self.x>self.extGauche then
            self.x-=self.spd 
            self.moving=true
        elseif self.x<=self.extGauche then
            self.x=self.extGauche
            --bip !
        end
    end

    --RIGHT
    if btn(1) then 
        if self.x<self.extDroite then
            self.x+=self.spd 
            self.moving=true
        elseif self.x>=self.extDroite then
            self.x=self.extDroite
            --bip !
        end
    end

    if btnp("4") then
        --la balle ne colle plus à la raquette
        player.sticky = false
    end
    
end

function player:resetBall()

    
    b:new(player.x + (player.w/2 - player.ballDiam/2)+1, 
                    player.y - (player.ballDiam), 
                    player.balleSpr,
                    0.5,
                    -0.5)
    
    player.doResetBall=false

end