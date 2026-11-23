-- Outside revealjs, keep only the last image of a .r-stack div
local function has_image(blk)
  local found = false
  pandoc.walk_block(blk, { Image = function() found = true end })
  return found
end

function Div(el)
  if FORMAT:match("revealjs") or not el.classes:includes("r-stack") then
    return nil
  end
  local last
  for i, blk in ipairs(el.content) do
    if has_image(blk) then last = i end
  end
  local out = {}
  for i, blk in ipairs(el.content) do
    if i == last or not has_image(blk) then
      table.insert(out, blk)
    end
  end
  return out
end
