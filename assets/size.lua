-- Beamer: turn pixel sizes into fractions of the 1050x700 reveal slide,
-- so images keep their relative size instead of overflowing the frame
local slide = { width = 1050, height = 700 }

local function to_percent(value, total)
  local px = value and (value:match("^(%d+%.?%d*)px$") or value:match("^(%d+%.?%d*)$"))
  if not px then return value end
  return string.format("%d%%", math.min(100, math.floor(100 * tonumber(px) / total)))
end

function Image(img)
  if not (FORMAT:match("latex") or FORMAT:match("beamer")) then return nil end
  for dim, total in pairs(slide) do
    img.attributes[dim] = to_percent(img.attributes[dim], total)
  end
  return img
end
