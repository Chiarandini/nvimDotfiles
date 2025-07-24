vim.cmd([[
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1
let g:tex_indent_brace = 0
let g:vimtex_quickfix_open_on_warning = 0
let g:tex_conceal_frac = 1
let g:vimtex_quickfix_ignore_filters = [
\ 'Underfull \\hbox',
\ 'Overfull \\hbox',
\ 'LaTeX Warning: .\+ float specifier changed to',
\ 'LaTeX hooks Warning',
\ 'Package siunitx Warning: Detected the "physics" package:',
\ 'Package hyperref Warning: Token not allowed in a PDF string',
\]
let g:vimtex_view_method = 'skim'
" let g:vimtex_view_method='zathura'

let g:vimtex_compiler_latexmk = {
	\ 'aux_dir' : '',
	\ 'out_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 1,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}

augroup vimtex_custom_TCBtheorem_highlight
  autocmd!
  autocmd BufRead *.tex syn match texTheoremTag '\(\\begin{\(defn\|prop\|thm\|lem\|titledBox\|cor\|example\)}{[^}]\+}{\)\@<=[^}]\+\(}\)\@='
  autocmd BufRead *.tex hi link texTheoremTag texRefArg
augroup END
]])
