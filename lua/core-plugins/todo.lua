--  nice TODO/FIXME/HACK/BUG/ISSUE management
 return {'folke/todo-comments.nvim',
 event = 'VeryLazy',
dependencies = {
	"nvim-lua/plenary.nvim",
},
config = function()
	require('configs.todo-comments')
end
}
