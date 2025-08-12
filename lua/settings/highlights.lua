vim.cmd([[hi! link SignColumn  Normal]])
-- vim.api.nvim_set_hl(0, 'SignColumn', {'Normal'})

-- Create a dedicated namespace. This is crucial for managing our highlights
local ns = vim.api.nvim_create_namespace("LatexTheoremTags")

local function highlight_theorem_tags(bufnr)
  -- 1. Get a parser for the buffer.
  local parser = vim.treesitter.get_parser(bufnr, 'latex')
  if not parser then return end

  -- 2. Clear any old highlights
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local tree = parser:parse()[1]
  if not tree then return end

  -- 3. Get custom query file.
  local query = vim.treesitter.query.get('latex', 'highlights')
  if not query then return end

  -- 4. Iterate over the captures from our query.
  for id, node in query:iter_captures(tree:root(), bufnr) do
    local capture_name = query.captures[id]

    -- 5. If tag found
    if capture_name == 'texTheoremTag' then
      local row1, col1, row2, col2 = node:range()
      vim.api.nvim_buf_set_extmark(bufnr, ns, row1, col1, {
        end_row = row2,
        end_col = col2,
        hl_group = 'texRefArg',
        spell = false,
      })
    end
  end
end

local augroup = vim.api.nvim_create_augroup('ManualLatexTSHighlight', { clear = true })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePost' }, {
  group = augroup,
  pattern = '*.tex',
  callback = function(args)
    highlight_theorem_tags(args.buf)
  end,
})
