-- suppress-format-render.lua

-- Meta function to process frontmatter and set suppression formats
function Meta(meta)
  meta.suppress_formats = meta["suppress-formats"] or {}
  return meta
end

-- Pandoc function to suppress rendering for specified formats
function Pandoc(doc)
  -- Access the suppress_formats from the metadata
  local suppress_formats = doc.meta.suppress_formats or {}

  -- Convert suppress_formats to a list of strings
  if type(suppress_formats) == "table" then
    local formats = {}
    for _, fmt in ipairs(suppress_formats) do
      if type(fmt) == "string" then
        table.insert(formats, fmt)
      elseif type(fmt) == "table" and fmt[1] and fmt[1].t == "Str" then
        table.insert(formats, fmt[1].text)
      end
    end
    suppress_formats = formats
  end

  -- Check and suppress format
  for _, fmt in ipairs(suppress_formats) do
    if quarto.doc.isFormat(fmt) then
      io.stderr:write("Suppressing format: ", fmt, "\n")
      return pandoc.Pandoc({}, doc.meta)  -- Return an empty Pandoc document
    end
  end

  return doc
end
