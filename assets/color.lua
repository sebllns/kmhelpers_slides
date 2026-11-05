-- Color spans by class: [text]{.red}. Supports HTML and LaTeX/beamer.
local colors = { red = "d62728", blue = "1f77b4", green = "2ca02c" }

function Span(el)
  for name, hex in pairs(colors) do
    if el.classes:includes(name) then
      if FORMAT:match("html") or FORMAT:match("revealjs") then
        el.attributes.style = "color: #" .. hex .. ";"
      elseif FORMAT:match("latex") or FORMAT:match("beamer") then
        table.insert(el.content, 1, pandoc.RawInline("latex", "\\textcolor[HTML]{" .. hex .. "}{"))
        table.insert(el.content, pandoc.RawInline("latex", "}"))
      end
      return el
    end
  end
end
