splashscreen_state={}

function splashscreen_state:init()

end

function splashscreen_state:update()
    if btnp(4) then
        gamestate.set(menu_state)
    end
end

function splashscreen_state:draw()
    cls()
    print("t713 presents", 40, 40, 1)
end