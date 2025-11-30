menu_state={}

function menu_state:init()
    self.selected=1
end

function menu_state:update()
    if btnp(4) then
        gamestate.set(game_state)
    end
end

function menu_state:draw()
    cls()
    print("gamestate project", 40, 40, 7)
    print("Press c", 40, 60, 7)
end