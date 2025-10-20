-- if a link is internal (no scheme, not an anchor, no extension),
-- append .html for html builds and .pdf for pdf/latex builds.
function Link(el)
  local url = el.target
  -- skip external links and pure anchors
  if url:match('^https?://') or url:match('^#') then return el end
  -- skip if it already has an extension
  if url:match('%.%w+$') then return el end

  if FORMAT:match('html') then
    el.target = url .. '.html'
  elseif FORMAT:match('latex') or FORMAT:match('pdf') then
    el.target = url .. '.pdf'
  end
  return el
end
