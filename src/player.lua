--player.lua
player = {}
player.__index = player

function player:new()
    local player={
        x=54,
        y=114,
        --l=10,
        w=20,
        h=5,
        color=7,
        moving="true",
        spd=4,
        extGauche=2,
        extDroite=105,
        nbLifes=3
    }
    setmetatable(player, self)
    return player
end

function player:update()
    self:inputs()--permet d'appeller une des méthode de l'objet player, au sein de lui même


end

function player:draw()
    --draw pad
    rectfill(self.x, self.y, self.x+self.w, self.y+self.h, self.color)
    --pad's shadow
    line(self.x, self.y+self.h, self.x+self.w, self.y+self.h,self.color-1)


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
    
end