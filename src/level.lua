--level.lua
level = {}
level.__index = level

function level:new()
    --spawn joueur
    map={
        {1,1},

        
    }
    setmetatable(map, self)
    return map
end


function level:update()

end

function level:draw()

  local cols = 11      -- nombre de colonnes
  local rows = 9       -- nombre de lignes
  local w = 10         -- largeur d'un rectangle
  local h = 5          -- hauteur d'un rectangle
  local spacing = 1    -- espace entre les rectangles
  local margin = 4     -- marge par rapport au bord de l'écran

  for row=0,rows-1 do
    for col=0,cols-1 do
      -- position du coin haut gauche du rectangle
      local x = margin + col * (w + spacing)
      local y = margin + row * (h + spacing)

      -- rectfill(x1,y1, x2,y2, col)
      -- x2 = x + w - 1 car les coordonnées sont inclusives
      rectfill(x, y, x + w - 1, y + h - 1, 14)
    end
  end

end