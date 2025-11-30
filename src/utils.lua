-- utils.lua
-- petit toolbox générique pour pico-8

utils = {}

--------------------------------------------------
-- 🔢 maths de base
--------------------------------------------------

-- clamp une valeur entre min et max
function utils.clamp(x, min, max)
  if x < min then return min end
  if x > max then return max end
  return x
end

-- approche une cible par pas "step"
-- très utile pour lisser un mouvement, une vitesse, etc.
function utils.approach(value, target, step)
  if value < target then
    value += step
    if value > target then value = target end
  elseif value > target then
    value -= step
    if value < target then value = target end
  end
  return value
end

-- interpolation linéaire
-- t entre 0 et 1
function utils.lerp(a, b, t)
  return a + (b - a) * t
end

-- signe d'un nombre (-1, 0 ou 1)
function utils.sign(x)
  if x < 0 then return -1 end
  if x > 0 then return 1 end
  return 0
end

--------------------------------------------------
-- 🎲 random helpers
--------------------------------------------------

-- nombre aléatoire dans [min, max[
function utils.rnd_range(min, max)
  return min + rnd(max - min)
end

-- renvoie true avec une probabilité p (entre 0 et 1)
function utils.chance(p)
  return rnd(1) < p
end

-- pioche un élément dans une liste
function utils.pick(t)
  return t[flr(rnd(#t)) + 1]
end

--------------------------------------------------
-- 📏 distances & géométrie
--------------------------------------------------

-- distance au carré entre deux points (x1,y1) et (x2,y2)
-- plus rapide si tu n'as pas besoin de la vraie distance
function utils.dist2(x1, y1, x2, y2)
  local dx = x1 - x2
  local dy = y1 - y2
  return dx*dx + dy*dy
end

-- vraie distance (avec sqrt)
function utils.dist(x1, y1, x2, y2)
  return sqrt(utils.dist2(x1, y1, x2, y2))
end

--------------------------------------------------
-- 💥 collisions simples
--------------------------------------------------

-- collision point vs rectangle
-- p = (px, py)
-- r = (rx, ry, rw, rh)
function utils.pt_in_rect(px, py, rx, ry, rw, rh)
  return px >= rx and px < rx+rw
     and py >= ry and py < ry+rh
end

-- collision rectangle vs rectangle (AABB)
-- a = (ax, ay, aw, ah)
-- b = (bx, by, bw, bh)
function utils.rect_rect(ax, ay, aw, ah, bx, by, bw, bh)
  return ax < bx+bw and
         ax+aw > bx and
         ay < by+bh and
         ay+ah > by
end

-- collision cercle vs cercle
-- (cx1,cy1,r1) et (cx2,cy2,r2)
function utils.circle_circle(cx1, cy1, r1, cx2, cy2, r2)
  local r = r1 + r2
  return utils.dist2(cx1, cy1, cx2, cy2) <= r*r
end

--------------------------------------------------
-- 🌍 écran & coordonnées
--------------------------------------------------

-- fait "tourner" une coordonnée dans les bornes [min, max)
-- pratique pour des objets qui sortent de l'écran
function utils.wrap(x, min, max)
  local range = max - min
  while x < min do x += range end
  while x >= max do x -= range end
  return x
end

-- version spéciale écran pico-8 (0..127)
function utils.wrap_screen(x)
  return utils.wrap(x, 0, 128)
end