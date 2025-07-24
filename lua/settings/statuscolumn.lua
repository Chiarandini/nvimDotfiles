-- https://www.reddit.com/r/neovim/comments/1djjc6q/statuscolumn_a_beginers_guide/
local border = function ()
  -- See how the characters is larger then the rest? That's how we make the border look like a single line
  return "│";
end

_G.MyStatuscolumn = function ()
  -- We will store the output in a variable so that we can call multiple functions inside here and add their value to the statuscolumn
  local text = "";

  -- This is just a different way of doing
  --
  -- text = text .. statuscolumn.brorder
  --
  -- This will make a lot more sense as we add more things
  text = table.concat({
    border()
  })

  return text;
end

-- With this line we will be able to use myStatuscolumn by requiring this file and calling the function
vim.o.statuscolumn = "%!v:lua.MyStatuscolumn()";
