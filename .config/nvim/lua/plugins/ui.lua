---@param range_start integer 上書きする文字コードの開始位置
---@param range_end integer 上書きする文字コードの終了位置
---@param width integer 変更後の文字幅
local function override_width(range_start, range_end, width)
  local widths = vim.fn.getcellwidths()
  local filtered = {}

  for _, w in ipairs(widths) do
    if not (w[1] <= range_end and w[2] >= range_start) then
      table.insert(filtered, w)
    end
  end

  table.insert(filtered, { range_start, range_end, width })
  vim.fn.setcellwidths(filtered)
end

return {
  {
    'rbtnn/vim-ambiwidth',
    config = function()
      -- Powerline用の文字の幅を上書き
      vim.schedule(function()
        override_width(0xe0b0, 0xe0b3, 1)
      end)
    end,
  },
}
