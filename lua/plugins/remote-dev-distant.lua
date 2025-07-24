-- useful command: ssh example.com 'curl -L https://sh.distant.dev | sh -s -- --on-conflict overwrite'
-- see https://distant.dev/editors/neovim/quickstart/#2-install-distant-on-your-local-machine
-- https://www.youtube.com/watch?v=0K5Y9T1mGIU
return {
	--NOTE: it's here in case I'll use it later
	enabled = false,
    'chipsenkbeil/distant.nvim',
	cmd = 'DistantConnect',
    branch = 'v0.3',
    config = function()
        require('distant'):setup()
    end
}
