-- put nice boxes around comment
return{ "LudoPinelli/comment-box.nvim",
event = 'VeryLazy',
config = function()
	require('configs.comment-box')
end
}
