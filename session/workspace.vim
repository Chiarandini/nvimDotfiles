let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/3rd\ semester/NSERC/EYNTKA
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1394 ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/3rd\ semester/NSERC/Notes\ and\ Journal/Journal/Journal.tex
badd +11314 ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/2nd\ semester/MAT415/EYTNKA/EYNTKA_MAT415.tex
badd +136 EYNTKA_Differential_Geometry.tex
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/3rd\ semester/NSERC/Notes\ and\ Journal/Journal/Journal.tex
argglobal
balt ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/3rd\ semester/NSERC/Notes\ and\ Journal/Journal/Journal.tex
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
imap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
inoremap <buffer> <silent> <expr> <Plug>(vimtex-delim-close) vimtex#delim#close()
inoremap <buffer> <silent> <Plug>(vimtex-cmd-create) =vimtex#cmd#create_insert()
inoremap <buffer> <silent> <C-L> u[s1z=`]au
xnoremap <buffer> <silent>  :lua require'nvim-treesitter.incremental_selection'.node_incremental()
omap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
xmap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
nmap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
vmap <buffer> ( S(lxh%hx%
nmap <buffer> <nowait> <silent> ,lm <Plug>(vimtex-imaps-list)
nmap <buffer> <nowait> <silent> ,lv <Plug>(vimtex-view)
nmap <buffer> <nowait> <silent> ,lT <Plug>(vimtex-toc-toggle)
nmap <buffer> <nowait> <silent> ,lt <Plug>(vimtex-toc-open)
nmap <buffer> <nowait> <silent> ,lG <Plug>(vimtex-status-all)
nmap <buffer> <nowait> <silent> ,lg <Plug>(vimtex-status)
nmap <buffer> <nowait> <silent> ,lC <Plug>(vimtex-clean-full)
nmap <buffer> <nowait> <silent> ,lc <Plug>(vimtex-clean)
nmap <buffer> <nowait> <silent> ,le <Plug>(vimtex-errors)
nmap <buffer> <nowait> <silent> ,lK <Plug>(vimtex-stop-all)
nmap <buffer> <nowait> <silent> ,lk <Plug>(vimtex-stop)
xmap <buffer> <nowait> <silent> ,lL <Plug>(vimtex-compile-selected)
nmap <buffer> <nowait> <silent> ,lL <Plug>(vimtex-compile-selected)
nmap <buffer> <nowait> <silent> ,lo <Plug>(vimtex-compile-output)
nmap <buffer> <nowait> <silent> ,ll <Plug>(vimtex-compile)
nmap <buffer> <nowait> <silent> ,la <Plug>(vimtex-context-menu)
nmap <buffer> <nowait> <silent> ,lq <Plug>(vimtex-log)
nmap <buffer> <nowait> <silent> ,ls <Plug>(vimtex-toggle-main)
nmap <buffer> <nowait> <silent> ,lX <Plug>(vimtex-reload-state)
nmap <buffer> <nowait> <silent> ,lx <Plug>(vimtex-reload)
nmap <buffer> <nowait> <silent> ,lI <Plug>(vimtex-info-full)
nmap <buffer> <nowait> <silent> ,li <Plug>(vimtex-info)
omap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
omap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
xmap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
xmap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
nmap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
nmap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
omap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
omap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
xmap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
xmap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
nmap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
nmap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
omap <buffer> <nowait> <silent> [n <Plug>(vimtex-[n)
omap <buffer> <nowait> <silent> [N <Plug>(vimtex-[N)
xmap <buffer> <nowait> <silent> [n <Plug>(vimtex-[n)
xmap <buffer> <nowait> <silent> [N <Plug>(vimtex-[N)
omap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
omap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
xmap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
xmap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
nmap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
nmap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
omap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
omap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
xmap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
xmap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
nmap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
nmap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
vmap <buffer> [ S[lxh%hx%
nnoremap <buffer> <silent> [c ?\chapter{
nnoremap <buffer> <silent> \vw <Cmd>VimtexCountWords
nnoremap <buffer> <silent> \eb :vs *.bib
omap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
omap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
xmap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
xmap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
nmap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
nmap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
omap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
omap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
xmap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
xmap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
nmap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
nmap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
omap <buffer> <nowait> <silent> ]n <Plug>(vimtex-]n)
omap <buffer> <nowait> <silent> ]N <Plug>(vimtex-]N)
xmap <buffer> <nowait> <silent> ]n <Plug>(vimtex-]n)
xmap <buffer> <nowait> <silent> ]N <Plug>(vimtex-]N)
omap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
omap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
xmap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
xmap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
nmap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
nmap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
omap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
omap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
xmap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
xmap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
nmap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
nmap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
" nnoremap <buffer> <silent> ]c /\chapter{
omap <buffer> <nowait> <silent> ac <Plug>(vimtex-ac)
xmap <buffer> <nowait> <silent> ac <Plug>(vimtex-ac)
omap <buffer> <nowait> <silent> ae <Plug>(vimtex-ae)
xmap <buffer> <nowait> <silent> ae <Plug>(vimtex-ae)
omap <buffer> <nowait> <silent> am <Plug>(vimtex-am)
xmap <buffer> <nowait> <silent> am <Plug>(vimtex-am)
omap <buffer> <nowait> <silent> aP <Plug>(vimtex-aP)
xmap <buffer> <nowait> <silent> aP <Plug>(vimtex-aP)
omap <buffer> <nowait> <silent> a$ <Plug>(vimtex-a$)
xmap <buffer> <nowait> <silent> a$ <Plug>(vimtex-a$)
omap <buffer> <nowait> <silent> ad <Plug>(vimtex-ad)
xmap <buffer> <nowait> <silent> ad <Plug>(vimtex-ad)
nmap <buffer> <nowait> <silent> csd <Plug>(vimtex-delim-change-math)
nmap <buffer> <nowait> <silent> csc <Plug>(vimtex-cmd-change)
nmap <buffer> <nowait> <silent> cse <Plug>(vimtex-env-change)
nmap <buffer> <nowait> <silent> cs$ <Plug>(vimtex-env-change-math)
nmap <buffer> <nowait> <silent> dsd <Plug>(vimtex-delim-delete)
nmap <buffer> <nowait> <silent> dsc <Plug>(vimtex-cmd-delete)
nmap <buffer> <nowait> <silent> dse <Plug>(vimtex-env-delete)
nmap <buffer> <nowait> <silent> ds$ <Plug>(vimtex-env-delete-math)
xnoremap <buffer> <silent> grc :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
omap <buffer> <nowait> <silent> ic <Plug>(vimtex-ic)
xmap <buffer> <nowait> <silent> ic <Plug>(vimtex-ic)
omap <buffer> <nowait> <silent> ie <Plug>(vimtex-ie)
xmap <buffer> <nowait> <silent> ie <Plug>(vimtex-ie)
omap <buffer> <nowait> <silent> im <Plug>(vimtex-im)
xmap <buffer> <nowait> <silent> im <Plug>(vimtex-im)
omap <buffer> <nowait> <silent> iP <Plug>(vimtex-iP)
xmap <buffer> <nowait> <silent> iP <Plug>(vimtex-iP)
omap <buffer> <nowait> <silent> i$ <Plug>(vimtex-i$)
xmap <buffer> <nowait> <silent> i$ <Plug>(vimtex-i$)
omap <buffer> <nowait> <silent> id <Plug>(vimtex-id)
xmap <buffer> <nowait> <silent> id <Plug>(vimtex-id)
xmap <buffer> <nowait> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
nmap <buffer> <nowait> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
xmap <buffer> <nowait> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
nmap <buffer> <nowait> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
xmap <buffer> <nowait> <silent> tsf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> <nowait> <silent> tsf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> <nowait> <silent> tsc <Plug>(vimtex-cmd-toggle-star)
nmap <buffer> <nowait> <silent> ts$ <Plug>(vimtex-env-toggle-math)
nmap <buffer> <nowait> <silent> tse <Plug>(vimtex-env-toggle-star)
xnoremap <buffer> <silent> <BS> :lua require'nvim-treesitter.incremental_selection'.node_decremental()
nmap <buffer> <nowait> <silent> <F8> <Plug>(vimtex-delim-add-modifiers)
xmap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
nmap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
xmap <buffer> <nowait> <silent> <F6> <Plug>(vimtex-env-surround-visual)
nmap <buffer> <nowait> <silent> <F6> <Plug>(vimtex-env-surround-line)
nnoremap <buffer> <Plug>(vimtex-view) :VimtexView
nnoremap <buffer> <Plug>(vimtex-toc-toggle) :call b:vimtex.toc.toggle()
nnoremap <buffer> <Plug>(vimtex-toc-open) :call b:vimtex.toc.open()
onoremap <buffer> <silent> <Plug>(vimtex-am) :call vimtex#text_obj#items(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-im) :call vimtex#text_obj#items(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-am) :call vimtex#text_obj#items(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-im) :call vimtex#text_obj#items(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 0,'math')
onoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 0,'math')
xnoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 1,'math')
xnoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 1,'math')
onoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 0,'normal')
onoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 0,'normal')
xnoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 1,'normal')
xnoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 1,'normal')
onoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 0,'delims')
onoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 0,'delims')
xnoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 1,'delims')
xnoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 1,'delims')
onoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 1)
nnoremap <buffer> <Plug>(vimtex-reload-state) :VimtexReloadState
nnoremap <buffer> <Plug>(vimtex-toggle-main) :VimtexToggleMain
nnoremap <buffer> <Plug>(vimtex-errors) :call vimtex#qf#toggle()
xnoremap <buffer> <silent> <SNR>130_(vimtex-[*) :call vimtex#motion#comment(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[/) :call vimtex#motion#comment(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]*) :call vimtex#motion#comment(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]/) :call vimtex#motion#comment(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[*) :call vimtex#motion#comment(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[/) :call vimtex#motion#comment(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]*) :call vimtex#motion#comment(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]/) :call vimtex#motion#comment(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[R) :call vimtex#motion#frame(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[r) :call vimtex#motion#frame(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]R) :call vimtex#motion#frame(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]r) :call vimtex#motion#frame(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[R) :call vimtex#motion#frame(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[r) :call vimtex#motion#frame(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]R) :call vimtex#motion#frame(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]r) :call vimtex#motion#frame(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[M) :call vimtex#motion#environment(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[m) :call vimtex#motion#environment(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]M) :call vimtex#motion#environment(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]m) :call vimtex#motion#environment(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[M) :call vimtex#motion#environment(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[m) :call vimtex#motion#environment(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]M) :call vimtex#motion#environment(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]m) :call vimtex#motion#environment(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[N) :call vimtex#motion#math(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[n) :call vimtex#motion#math(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]N) :call vimtex#motion#math(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]n) :call vimtex#motion#math(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[N) :call vimtex#motion#math(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[n) :call vimtex#motion#math(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]N) :call vimtex#motion#math(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]n) :call vimtex#motion#math(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[[) :call vimtex#motion#section(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[]) :call vimtex#motion#section(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-][) :call vimtex#motion#section(1,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]]) :call vimtex#motion#section(0,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[[) :call vimtex#motion#section(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[]) :call vimtex#motion#section(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-][) :call vimtex#motion#section(1,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]]) :call vimtex#motion#section(0,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-%) :call vimtex#motion#find_matching_pair(1)
nnoremap <buffer> <silent> <Plug>(vimtex-%) :call vimtex#motion#find_matching_pair()
nnoremap <buffer> <SNR>130_(V) V
nnoremap <buffer> <SNR>130_(v) v
nnoremap <buffer> <Plug>(vimtex-reload) :VimtexReload
nnoremap <buffer> <Plug>(vimtex-log) :VimtexLog
nnoremap <buffer> <Plug>(vimtex-info-full) :VimtexInfo!
nnoremap <buffer> <Plug>(vimtex-info) :VimtexInfo
nnoremap <buffer> <Plug>(vimtex-imaps-list) :call vimtex#imaps#list()
xnoremap <buffer> <silent> <Plug>(vimtex-env-surround-visual) :call vimtex#env#surround_opfunc('visual')
nmap <buffer> <silent> <Plug>(vimtex-env-surround-line) <Plug>(vimtex-env-surround-operator)_
nnoremap <buffer> <silent> <expr> <Plug>(vimtex-env-surround-operator) vimtex#env#surround_opfunc('operator')
nnoremap <buffer> <Plug>(vimtex-doc-package) :VimtexDocPackage
nnoremap <buffer> <silent> <Plug>(vimtex-delim-add-modifiers) :call vimtex#delim#add_modifiers()
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier-reverse) :call vimtex#delim#toggle_modifier_visual({'dir': -1})
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier) :call vimtex#delim#toggle_modifier_visual()
nnoremap <buffer> <Plug>(vimtex-context-menu) :VimtexContextMenu
nnoremap <buffer> <Plug>(vimtex-status-all) :call vimtex#compiler#status(1)
nnoremap <buffer> <Plug>(vimtex-status) :call vimtex#compiler#status(0)
nnoremap <buffer> <Plug>(vimtex-clean-full) :call vimtex#compiler#clean(1)
nnoremap <buffer> <Plug>(vimtex-clean) :call vimtex#compiler#clean(0)
nnoremap <buffer> <Plug>(vimtex-stop-all) :call vimtex#compiler#stop_all()
nnoremap <buffer> <Plug>(vimtex-stop) :call vimtex#compiler#stop()
nnoremap <buffer> <Plug>(vimtex-compile-output) :call vimtex#compiler#output()
xnoremap <buffer> <Plug>(vimtex-compile-selected) :call vimtex#compiler#compile_selected('visual')
nnoremap <buffer> <Plug>(vimtex-compile-selected) :set opfunc=vimtex#compiler#compile_selectedg@
nnoremap <buffer> <Plug>(vimtex-compile-ss) :call vimtex#compiler#compile_ss()
nnoremap <buffer> <Plug>(vimtex-compile) :call vimtex#compiler#compile()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-toggle-frac) :call vimtex#cmd#toggle_frac_visual()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-create) :call vimtex#cmd#create_visual()
inoremap <buffer> <silent>  u[s1z=`]au
inoremap <buffer> <nowait> <silent> <expr> #B vimtex#imaps#wrap_math("#B", vimtex#imaps#style_math("mathbb"))
inoremap <buffer> <nowait> <silent> <expr> #- vimtex#imaps#wrap_math("#-", vimtex#imaps#style_math("overline"))
inoremap <buffer> <nowait> <silent> <expr> #c vimtex#imaps#wrap_math("#c", vimtex#imaps#style_math("mathcal"))
inoremap <buffer> <nowait> <silent> <expr> #f vimtex#imaps#wrap_math("#f", vimtex#imaps#style_math("mathfrak"))
inoremap <buffer> <nowait> <silent> <expr> #b vimtex#imaps#wrap_math("#b", vimtex#imaps#style_math("mathbf"))
inoremap <buffer> <nowait> <silent> <expr> #/ vimtex#imaps#wrap_math("#/", vimtex#imaps#style_math("slashed"))
imap <buffer> <nowait> <silent> ]] <Plug>(vimtex-delim-close)
inoremap <buffer> <nowait> <silent> <expr> `` vimtex#imaps#wrap_trivial("``", '``')
inoremap <buffer> <nowait> <silent> <expr> `vr vimtex#imaps#wrap_math("`vr", '\varrho')
inoremap <buffer> <nowait> <silent> <expr> `vq vimtex#imaps#wrap_math("`vq", '\vartheta')
inoremap <buffer> <nowait> <silent> <expr> `vk vimtex#imaps#wrap_math("`vk", '\varkappa')
inoremap <buffer> <nowait> <silent> <expr> `vf vimtex#imaps#wrap_math("`vf", '\varphi')
inoremap <buffer> <nowait> <silent> <expr> `ve vimtex#imaps#wrap_math("`ve", '\varepsilon')
inoremap <buffer> <nowait> <silent> <expr> `Y vimtex#imaps#wrap_math("`Y", '\Psi')
inoremap <buffer> <nowait> <silent> <expr> `X vimtex#imaps#wrap_math("`X", '\Xi')
inoremap <buffer> <nowait> <silent> <expr> `W vimtex#imaps#wrap_math("`W", '\Omega')
inoremap <buffer> <nowait> <silent> <expr> `U vimtex#imaps#wrap_math("`U", '\Upsilon')
inoremap <buffer> <nowait> <silent> <expr> `S vimtex#imaps#wrap_math("`S", '\Sigma')
inoremap <buffer> <nowait> <silent> <expr> `Q vimtex#imaps#wrap_math("`Q", '\Theta')
inoremap <buffer> <nowait> <silent> <expr> `P vimtex#imaps#wrap_math("`P", '\Pi')
inoremap <buffer> <nowait> <silent> <expr> `L vimtex#imaps#wrap_math("`L", '\Lambda')
inoremap <buffer> <nowait> <silent> <expr> `G vimtex#imaps#wrap_math("`G", '\Gamma')
inoremap <buffer> <nowait> <silent> <expr> `F vimtex#imaps#wrap_math("`F", '\Phi')
inoremap <buffer> <nowait> <silent> <expr> `D vimtex#imaps#wrap_math("`D", '\Delta')
inoremap <buffer> <nowait> <silent> <expr> `x vimtex#imaps#wrap_math("`x", '\xi')
inoremap <buffer> <nowait> <silent> <expr> `z vimtex#imaps#wrap_math("`z", '\zeta')
inoremap <buffer> <nowait> <silent> <expr> `w vimtex#imaps#wrap_math("`w", '\omega')
inoremap <buffer> <nowait> <silent> <expr> `u vimtex#imaps#wrap_math("`u", '\upsilon')
inoremap <buffer> <nowait> <silent> <expr> `y vimtex#imaps#wrap_math("`y", '\psi')
inoremap <buffer> <nowait> <silent> <expr> `t vimtex#imaps#wrap_math("`t", '\tau')
inoremap <buffer> <nowait> <silent> <expr> `s vimtex#imaps#wrap_math("`s", '\sigma')
inoremap <buffer> <nowait> <silent> <expr> `r vimtex#imaps#wrap_math("`r", '\rho')
inoremap <buffer> <nowait> <silent> <expr> `q vimtex#imaps#wrap_math("`q", '\theta')
inoremap <buffer> <nowait> <silent> <expr> `p vimtex#imaps#wrap_math("`p", '\pi')
inoremap <buffer> <nowait> <silent> <expr> `n vimtex#imaps#wrap_math("`n", '\nu')
inoremap <buffer> <nowait> <silent> <expr> `m vimtex#imaps#wrap_math("`m", '\mu')
inoremap <buffer> <nowait> <silent> <expr> `l vimtex#imaps#wrap_math("`l", '\lambda')
inoremap <buffer> <nowait> <silent> <expr> `k vimtex#imaps#wrap_math("`k", '\kappa')
inoremap <buffer> <nowait> <silent> <expr> `i vimtex#imaps#wrap_math("`i", '\iota')
inoremap <buffer> <nowait> <silent> <expr> `h vimtex#imaps#wrap_math("`h", '\eta')
inoremap <buffer> <nowait> <silent> <expr> `g vimtex#imaps#wrap_math("`g", '\gamma')
inoremap <buffer> <nowait> <silent> <expr> `f vimtex#imaps#wrap_math("`f", '\phi')
inoremap <buffer> <nowait> <silent> <expr> `e vimtex#imaps#wrap_math("`e", '\epsilon')
inoremap <buffer> <nowait> <silent> <expr> `d vimtex#imaps#wrap_math("`d", '\delta')
inoremap <buffer> <nowait> <silent> <expr> `c vimtex#imaps#wrap_math("`c", '\chi')
inoremap <buffer> <nowait> <silent> <expr> `b vimtex#imaps#wrap_math("`b", '\beta')
inoremap <buffer> <nowait> <silent> <expr> `a vimtex#imaps#wrap_math("`a", '\alpha')
inoremap <buffer> <nowait> <silent> <expr> `jL vimtex#imaps#wrap_math("`jL", '\Rightarrow')
inoremap <buffer> <nowait> <silent> <expr> `jl vimtex#imaps#wrap_math("`jl", '\rightarrow')
inoremap <buffer> <nowait> <silent> <expr> `jH vimtex#imaps#wrap_math("`jH", '\Leftarrow')
inoremap <buffer> <nowait> <silent> <expr> `jh vimtex#imaps#wrap_math("`jh", '\leftarrow')
inoremap <buffer> <nowait> <silent> <expr> `jK vimtex#imaps#wrap_math("`jK", '\Uparrow')
inoremap <buffer> <nowait> <silent> <expr> `jk vimtex#imaps#wrap_math("`jk", '\uparrow')
inoremap <buffer> <nowait> <silent> <expr> `jJ vimtex#imaps#wrap_math("`jJ", '\Downarrow')
inoremap <buffer> <nowait> <silent> <expr> `jj vimtex#imaps#wrap_math("`jj", '\downarrow')
inoremap <buffer> <nowait> <silent> <expr> `N vimtex#imaps#wrap_math("`N", '\nabla')
inoremap <buffer> <nowait> <silent> <expr> `E vimtex#imaps#wrap_math("`E", '\exists')
inoremap <buffer> <nowait> <silent> <expr> `B vimtex#imaps#wrap_math("`B", '\boldsymbol')
inoremap <buffer> <nowait> <silent> <expr> `A vimtex#imaps#wrap_math("`A", '\forall')
inoremap <buffer> <nowait> <silent> <expr> `) vimtex#imaps#wrap_math("`)", '\supset')
inoremap <buffer> <nowait> <silent> <expr> `( vimtex#imaps#wrap_math("`(", '\subset')
inoremap <buffer> <nowait> <silent> <expr> `] vimtex#imaps#wrap_math("`]", '\supseteq')
inoremap <buffer> <nowait> <silent> <expr> `[ vimtex#imaps#wrap_math("`[", '\subseteq')
inoremap <buffer> <nowait> <silent> <expr> `+ vimtex#imaps#wrap_math("`+", '\dagger')
inoremap <buffer> <nowait> <silent> <expr> `H vimtex#imaps#wrap_math("`H", '\hbar')
inoremap <buffer> <nowait> <silent> <expr> `> vimtex#imaps#wrap_math("`>", '\rangle')
inoremap <buffer> <nowait> <silent> <expr> `< vimtex#imaps#wrap_math("`<", '\langle')
inoremap <buffer> <nowait> <silent> <expr> `* vimtex#imaps#wrap_math("`*", '\times')
inoremap <buffer> <nowait> <silent> <expr> `. vimtex#imaps#wrap_math("`.", '\cdot')
inoremap <buffer> <nowait> <silent> <expr> `\ vimtex#imaps#wrap_math("`\\", '\setminus')
inoremap <buffer> <nowait> <silent> <expr> `= vimtex#imaps#wrap_math("`=", '\equiv')
inoremap <buffer> <nowait> <silent> <expr> `8 vimtex#imaps#wrap_math("`8", '\infty')
inoremap <buffer> <nowait> <silent> <expr> `6 vimtex#imaps#wrap_math("`6", '\partial')
inoremap <buffer> <nowait> <silent> <expr> `2 vimtex#imaps#wrap_math("`2", '\sqrt')
inoremap <buffer> <nowait> <silent> <expr> `0 vimtex#imaps#wrap_math("`0", '\emptyset')
inoreabbr <buffer> bc because
inoreabbr <buffer> BC BECAUSE
inoreabbr <buffer> Bc Because
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=min:5,shift:10
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=sO:%\ -,mO:%\ \ ,eO:%%,:%
setlocal commentstring=%\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=\\v\\\\%(([egx]|mathchar|count|dimen|muskip|skip|toks)?def|font|(future)?let|new(count|dimen|skip|muskip|box|toks|read|write|fam|insert)|(re)?new(boolean|command|counter|environment|font|if|length|savebox|theorem(style)?)|DeclareMathOperator|bibitem%(\\[[^]]*\\])?)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'tex'
setlocal filetype=tex
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=vimtex#format#formatexpr()
setlocal formatoptions=tq1jn
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\v^\\c\\s*\\%\\s*!?\\s*tex\\s+root\\s*[=:]\\s*\\zs.*\\ze\\s*$|\\v^\\s*\\zs%(\\v\\\\%(input|include|includeonly)\\s*\\{|\\v\\\\%(subfile%(include)?|%(sub)?%(import|%(input|include)from)\\*?\\{[^\\}]*\\})\\s*\\{)\\zs[^\\}]*\\ze\\}?|\\v\\\\%(usepackage|RequirePackage)%(\\s*\\[[^]]*\\])?\\s*\\{\\zs[^}]*\\ze\\}
setlocal includeexpr=vimtex#include#expr()
setlocal indentexpr=VimtexIndentExpr()
setlocal indentkeys=!^F,o,O,0(,0),],},&,0=\\item\ ,0=\\item[,0=\\else,0=\\fi,0=\\rangle,0=\\rbrace,0=\\rvert,0=\\rVert,0=\\rfloor,0=\\rceil,0=\\urcorner
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=
setlocal linebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=vimtex#complete#omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
setlocal spelllang=en_us
setlocal spelloptions=
setlocal statuscolumn=
setlocal statusline=%#lualine_a_normal#\ \ \ %<%#lualine_c_normal#%=%#lualine_c_normal#\ 60.5k\ |%#lualine_x_filetype_DevIconTex_normal#\ ó°™©%#lualine_c_normal#\ tex\ %#lualine_b_normal#\ 97%%\ %#lualine_a_normal#\ 1394:50\
setlocal suffixesadd=.tex,.sty,.cls
setlocal noswapfile
setlocal synmaxcol=5000
if &syntax != 'tex'
setlocal syntax=tex
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=90
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 1394 - ((24 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1394
normal! 050|
tabnext
edit ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/2nd\ semester/MAT415/EYTNKA/EYNTKA_MAT415.tex
argglobal
balt ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/3rd\ semester/NSERC/Notes\ and\ Journal/Journal/Journal.tex
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
imap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
inoremap <buffer> <silent> <expr> <Plug>(vimtex-delim-close) vimtex#delim#close()
inoremap <buffer> <silent> <Plug>(vimtex-cmd-create) =vimtex#cmd#create_insert()
inoremap <buffer> <silent> <C-L> u[s1z=`]au
xnoremap <buffer> <silent>  :lua require'nvim-treesitter.incremental_selection'.node_incremental()
omap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
xmap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
nmap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
vmap <buffer> ( S(lxh%hx%
nmap <buffer> <nowait> <silent> ,lm <Plug>(vimtex-imaps-list)
nmap <buffer> <nowait> <silent> ,lv <Plug>(vimtex-view)
nmap <buffer> <nowait> <silent> ,lT <Plug>(vimtex-toc-toggle)
nmap <buffer> <nowait> <silent> ,lt <Plug>(vimtex-toc-open)
nmap <buffer> <nowait> <silent> ,lG <Plug>(vimtex-status-all)
nmap <buffer> <nowait> <silent> ,lg <Plug>(vimtex-status)
nmap <buffer> <nowait> <silent> ,lC <Plug>(vimtex-clean-full)
nmap <buffer> <nowait> <silent> ,lc <Plug>(vimtex-clean)
nmap <buffer> <nowait> <silent> ,le <Plug>(vimtex-errors)
nmap <buffer> <nowait> <silent> ,lK <Plug>(vimtex-stop-all)
nmap <buffer> <nowait> <silent> ,lk <Plug>(vimtex-stop)
xmap <buffer> <nowait> <silent> ,lL <Plug>(vimtex-compile-selected)
nmap <buffer> <nowait> <silent> ,lL <Plug>(vimtex-compile-selected)
nmap <buffer> <nowait> <silent> ,lo <Plug>(vimtex-compile-output)
nmap <buffer> <nowait> <silent> ,ll <Plug>(vimtex-compile)
nmap <buffer> <nowait> <silent> ,la <Plug>(vimtex-context-menu)
nmap <buffer> <nowait> <silent> ,lq <Plug>(vimtex-log)
nmap <buffer> <nowait> <silent> ,ls <Plug>(vimtex-toggle-main)
nmap <buffer> <nowait> <silent> ,lX <Plug>(vimtex-reload-state)
nmap <buffer> <nowait> <silent> ,lx <Plug>(vimtex-reload)
nmap <buffer> <nowait> <silent> ,lI <Plug>(vimtex-info-full)
nmap <buffer> <nowait> <silent> ,li <Plug>(vimtex-info)
omap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
omap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
xmap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
xmap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
nmap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
nmap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
omap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
omap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
xmap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
xmap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
nmap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
nmap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
omap <buffer> <nowait> <silent> [n <Plug>(vimtex-[n)
omap <buffer> <nowait> <silent> [N <Plug>(vimtex-[N)
xmap <buffer> <nowait> <silent> [n <Plug>(vimtex-[n)
xmap <buffer> <nowait> <silent> [N <Plug>(vimtex-[N)
omap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
omap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
xmap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
xmap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
nmap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
nmap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
omap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
omap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
xmap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
xmap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
nmap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
nmap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
vmap <buffer> [ S[lxh%hx%
nnoremap <buffer> <silent> [c ?\chapter{
nnoremap <buffer> <silent> \vw <Cmd>VimtexCountWords
nnoremap <buffer> <silent> \eb :vs *.bib
omap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
omap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
xmap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
xmap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
nmap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
nmap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
omap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
omap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
xmap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
xmap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
nmap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
nmap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
omap <buffer> <nowait> <silent> ]n <Plug>(vimtex-]n)
omap <buffer> <nowait> <silent> ]N <Plug>(vimtex-]N)
xmap <buffer> <nowait> <silent> ]n <Plug>(vimtex-]n)
xmap <buffer> <nowait> <silent> ]N <Plug>(vimtex-]N)
omap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
omap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
xmap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
xmap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
nmap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
nmap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
omap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
omap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
xmap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
xmap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
nmap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
nmap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
nnoremap <buffer> <silent> ]c /\chapter{
omap <buffer> <nowait> <silent> ac <Plug>(vimtex-ac)
xmap <buffer> <nowait> <silent> ac <Plug>(vimtex-ac)
omap <buffer> <nowait> <silent> ae <Plug>(vimtex-ae)
xmap <buffer> <nowait> <silent> ae <Plug>(vimtex-ae)
omap <buffer> <nowait> <silent> am <Plug>(vimtex-am)
xmap <buffer> <nowait> <silent> am <Plug>(vimtex-am)
omap <buffer> <nowait> <silent> aP <Plug>(vimtex-aP)
xmap <buffer> <nowait> <silent> aP <Plug>(vimtex-aP)
omap <buffer> <nowait> <silent> a$ <Plug>(vimtex-a$)
xmap <buffer> <nowait> <silent> a$ <Plug>(vimtex-a$)
omap <buffer> <nowait> <silent> ad <Plug>(vimtex-ad)
xmap <buffer> <nowait> <silent> ad <Plug>(vimtex-ad)
nmap <buffer> <nowait> <silent> csd <Plug>(vimtex-delim-change-math)
nmap <buffer> <nowait> <silent> csc <Plug>(vimtex-cmd-change)
nmap <buffer> <nowait> <silent> cse <Plug>(vimtex-env-change)
nmap <buffer> <nowait> <silent> cs$ <Plug>(vimtex-env-change-math)
nmap <buffer> <nowait> <silent> dsd <Plug>(vimtex-delim-delete)
nmap <buffer> <nowait> <silent> dsc <Plug>(vimtex-cmd-delete)
nmap <buffer> <nowait> <silent> dse <Plug>(vimtex-env-delete)
nmap <buffer> <nowait> <silent> ds$ <Plug>(vimtex-env-delete-math)
xnoremap <buffer> <silent> grc :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
omap <buffer> <nowait> <silent> ic <Plug>(vimtex-ic)
xmap <buffer> <nowait> <silent> ic <Plug>(vimtex-ic)
omap <buffer> <nowait> <silent> ie <Plug>(vimtex-ie)
xmap <buffer> <nowait> <silent> ie <Plug>(vimtex-ie)
omap <buffer> <nowait> <silent> im <Plug>(vimtex-im)
xmap <buffer> <nowait> <silent> im <Plug>(vimtex-im)
omap <buffer> <nowait> <silent> iP <Plug>(vimtex-iP)
xmap <buffer> <nowait> <silent> iP <Plug>(vimtex-iP)
omap <buffer> <nowait> <silent> i$ <Plug>(vimtex-i$)
xmap <buffer> <nowait> <silent> i$ <Plug>(vimtex-i$)
omap <buffer> <nowait> <silent> id <Plug>(vimtex-id)
xmap <buffer> <nowait> <silent> id <Plug>(vimtex-id)
xmap <buffer> <nowait> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
nmap <buffer> <nowait> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
xmap <buffer> <nowait> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
nmap <buffer> <nowait> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
xmap <buffer> <nowait> <silent> tsf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> <nowait> <silent> tsf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> <nowait> <silent> tsc <Plug>(vimtex-cmd-toggle-star)
nmap <buffer> <nowait> <silent> ts$ <Plug>(vimtex-env-toggle-math)
nmap <buffer> <nowait> <silent> tse <Plug>(vimtex-env-toggle-star)
xnoremap <buffer> <silent> <BS> :lua require'nvim-treesitter.incremental_selection'.node_decremental()
nmap <buffer> <nowait> <silent> <F8> <Plug>(vimtex-delim-add-modifiers)
xmap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
nmap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
xmap <buffer> <nowait> <silent> <F6> <Plug>(vimtex-env-surround-visual)
nmap <buffer> <nowait> <silent> <F6> <Plug>(vimtex-env-surround-line)
nnoremap <buffer> <Plug>(vimtex-view) :VimtexView
nnoremap <buffer> <Plug>(vimtex-toc-toggle) :call b:vimtex.toc.toggle()
nnoremap <buffer> <Plug>(vimtex-toc-open) :call b:vimtex.toc.open()
onoremap <buffer> <silent> <Plug>(vimtex-am) :call vimtex#text_obj#items(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-im) :call vimtex#text_obj#items(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-am) :call vimtex#text_obj#items(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-im) :call vimtex#text_obj#items(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 0,'math')
onoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 0,'math')
xnoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 1,'math')
xnoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 1,'math')
onoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 0,'normal')
onoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 0,'normal')
xnoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 1,'normal')
xnoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 1,'normal')
onoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 0,'delims')
onoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 0,'delims')
xnoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 1,'delims')
xnoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 1,'delims')
onoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 1)
nnoremap <buffer> <Plug>(vimtex-reload-state) :VimtexReloadState
nnoremap <buffer> <Plug>(vimtex-toggle-main) :VimtexToggleMain
nnoremap <buffer> <Plug>(vimtex-errors) :call vimtex#qf#toggle()
xnoremap <buffer> <silent> <SNR>130_(vimtex-[*) :call vimtex#motion#comment(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[/) :call vimtex#motion#comment(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]*) :call vimtex#motion#comment(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]/) :call vimtex#motion#comment(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[*) :call vimtex#motion#comment(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[/) :call vimtex#motion#comment(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]*) :call vimtex#motion#comment(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]/) :call vimtex#motion#comment(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[R) :call vimtex#motion#frame(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[r) :call vimtex#motion#frame(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]R) :call vimtex#motion#frame(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]r) :call vimtex#motion#frame(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[R) :call vimtex#motion#frame(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[r) :call vimtex#motion#frame(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]R) :call vimtex#motion#frame(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]r) :call vimtex#motion#frame(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[M) :call vimtex#motion#environment(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[m) :call vimtex#motion#environment(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]M) :call vimtex#motion#environment(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]m) :call vimtex#motion#environment(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[M) :call vimtex#motion#environment(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[m) :call vimtex#motion#environment(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]M) :call vimtex#motion#environment(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]m) :call vimtex#motion#environment(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[N) :call vimtex#motion#math(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[n) :call vimtex#motion#math(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]N) :call vimtex#motion#math(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]n) :call vimtex#motion#math(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[N) :call vimtex#motion#math(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[n) :call vimtex#motion#math(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]N) :call vimtex#motion#math(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]n) :call vimtex#motion#math(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[[) :call vimtex#motion#section(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[]) :call vimtex#motion#section(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-][) :call vimtex#motion#section(1,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]]) :call vimtex#motion#section(0,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[[) :call vimtex#motion#section(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[]) :call vimtex#motion#section(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-][) :call vimtex#motion#section(1,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]]) :call vimtex#motion#section(0,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-%) :call vimtex#motion#find_matching_pair(1)
nnoremap <buffer> <silent> <Plug>(vimtex-%) :call vimtex#motion#find_matching_pair()
nnoremap <buffer> <SNR>130_(V) V
nnoremap <buffer> <SNR>130_(v) v
nnoremap <buffer> <Plug>(vimtex-reload) :VimtexReload
nnoremap <buffer> <Plug>(vimtex-log) :VimtexLog
nnoremap <buffer> <Plug>(vimtex-info-full) :VimtexInfo!
nnoremap <buffer> <Plug>(vimtex-info) :VimtexInfo
nnoremap <buffer> <Plug>(vimtex-imaps-list) :call vimtex#imaps#list()
xnoremap <buffer> <silent> <Plug>(vimtex-env-surround-visual) :call vimtex#env#surround_opfunc('visual')
nmap <buffer> <silent> <Plug>(vimtex-env-surround-line) <Plug>(vimtex-env-surround-operator)_
nnoremap <buffer> <silent> <expr> <Plug>(vimtex-env-surround-operator) vimtex#env#surround_opfunc('operator')
nnoremap <buffer> <Plug>(vimtex-doc-package) :VimtexDocPackage
nnoremap <buffer> <silent> <Plug>(vimtex-delim-add-modifiers) :call vimtex#delim#add_modifiers()
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier-reverse) :call vimtex#delim#toggle_modifier_visual({'dir': -1})
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier) :call vimtex#delim#toggle_modifier_visual()
nnoremap <buffer> <Plug>(vimtex-context-menu) :VimtexContextMenu
nnoremap <buffer> <Plug>(vimtex-status-all) :call vimtex#compiler#status(1)
nnoremap <buffer> <Plug>(vimtex-status) :call vimtex#compiler#status(0)
nnoremap <buffer> <Plug>(vimtex-clean-full) :call vimtex#compiler#clean(1)
nnoremap <buffer> <Plug>(vimtex-clean) :call vimtex#compiler#clean(0)
nnoremap <buffer> <Plug>(vimtex-stop-all) :call vimtex#compiler#stop_all()
nnoremap <buffer> <Plug>(vimtex-stop) :call vimtex#compiler#stop()
nnoremap <buffer> <Plug>(vimtex-compile-output) :call vimtex#compiler#output()
xnoremap <buffer> <Plug>(vimtex-compile-selected) :call vimtex#compiler#compile_selected('visual')
nnoremap <buffer> <Plug>(vimtex-compile-selected) :set opfunc=vimtex#compiler#compile_selectedg@
nnoremap <buffer> <Plug>(vimtex-compile-ss) :call vimtex#compiler#compile_ss()
nnoremap <buffer> <Plug>(vimtex-compile) :call vimtex#compiler#compile()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-toggle-frac) :call vimtex#cmd#toggle_frac_visual()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-create) :call vimtex#cmd#create_visual()
inoremap <buffer> <silent>  u[s1z=`]au
inoremap <buffer> <nowait> <silent> <expr> #B vimtex#imaps#wrap_math("#B", vimtex#imaps#style_math("mathbb"))
inoremap <buffer> <nowait> <silent> <expr> #- vimtex#imaps#wrap_math("#-", vimtex#imaps#style_math("overline"))
inoremap <buffer> <nowait> <silent> <expr> #c vimtex#imaps#wrap_math("#c", vimtex#imaps#style_math("mathcal"))
inoremap <buffer> <nowait> <silent> <expr> #f vimtex#imaps#wrap_math("#f", vimtex#imaps#style_math("mathfrak"))
inoremap <buffer> <nowait> <silent> <expr> #b vimtex#imaps#wrap_math("#b", vimtex#imaps#style_math("mathbf"))
inoremap <buffer> <nowait> <silent> <expr> #/ vimtex#imaps#wrap_math("#/", vimtex#imaps#style_math("slashed"))
imap <buffer> <nowait> <silent> ]] <Plug>(vimtex-delim-close)
inoremap <buffer> <nowait> <silent> <expr> `` vimtex#imaps#wrap_trivial("``", '``')
inoremap <buffer> <nowait> <silent> <expr> `vr vimtex#imaps#wrap_math("`vr", '\varrho')
inoremap <buffer> <nowait> <silent> <expr> `vq vimtex#imaps#wrap_math("`vq", '\vartheta')
inoremap <buffer> <nowait> <silent> <expr> `vk vimtex#imaps#wrap_math("`vk", '\varkappa')
inoremap <buffer> <nowait> <silent> <expr> `vf vimtex#imaps#wrap_math("`vf", '\varphi')
inoremap <buffer> <nowait> <silent> <expr> `ve vimtex#imaps#wrap_math("`ve", '\varepsilon')
inoremap <buffer> <nowait> <silent> <expr> `Y vimtex#imaps#wrap_math("`Y", '\Psi')
inoremap <buffer> <nowait> <silent> <expr> `X vimtex#imaps#wrap_math("`X", '\Xi')
inoremap <buffer> <nowait> <silent> <expr> `W vimtex#imaps#wrap_math("`W", '\Omega')
inoremap <buffer> <nowait> <silent> <expr> `U vimtex#imaps#wrap_math("`U", '\Upsilon')
inoremap <buffer> <nowait> <silent> <expr> `S vimtex#imaps#wrap_math("`S", '\Sigma')
inoremap <buffer> <nowait> <silent> <expr> `Q vimtex#imaps#wrap_math("`Q", '\Theta')
inoremap <buffer> <nowait> <silent> <expr> `P vimtex#imaps#wrap_math("`P", '\Pi')
inoremap <buffer> <nowait> <silent> <expr> `L vimtex#imaps#wrap_math("`L", '\Lambda')
inoremap <buffer> <nowait> <silent> <expr> `G vimtex#imaps#wrap_math("`G", '\Gamma')
inoremap <buffer> <nowait> <silent> <expr> `F vimtex#imaps#wrap_math("`F", '\Phi')
inoremap <buffer> <nowait> <silent> <expr> `D vimtex#imaps#wrap_math("`D", '\Delta')
inoremap <buffer> <nowait> <silent> <expr> `x vimtex#imaps#wrap_math("`x", '\xi')
inoremap <buffer> <nowait> <silent> <expr> `z vimtex#imaps#wrap_math("`z", '\zeta')
inoremap <buffer> <nowait> <silent> <expr> `w vimtex#imaps#wrap_math("`w", '\omega')
inoremap <buffer> <nowait> <silent> <expr> `u vimtex#imaps#wrap_math("`u", '\upsilon')
inoremap <buffer> <nowait> <silent> <expr> `y vimtex#imaps#wrap_math("`y", '\psi')
inoremap <buffer> <nowait> <silent> <expr> `t vimtex#imaps#wrap_math("`t", '\tau')
inoremap <buffer> <nowait> <silent> <expr> `s vimtex#imaps#wrap_math("`s", '\sigma')
inoremap <buffer> <nowait> <silent> <expr> `r vimtex#imaps#wrap_math("`r", '\rho')
inoremap <buffer> <nowait> <silent> <expr> `q vimtex#imaps#wrap_math("`q", '\theta')
inoremap <buffer> <nowait> <silent> <expr> `p vimtex#imaps#wrap_math("`p", '\pi')
inoremap <buffer> <nowait> <silent> <expr> `n vimtex#imaps#wrap_math("`n", '\nu')
inoremap <buffer> <nowait> <silent> <expr> `m vimtex#imaps#wrap_math("`m", '\mu')
inoremap <buffer> <nowait> <silent> <expr> `l vimtex#imaps#wrap_math("`l", '\lambda')
inoremap <buffer> <nowait> <silent> <expr> `k vimtex#imaps#wrap_math("`k", '\kappa')
inoremap <buffer> <nowait> <silent> <expr> `i vimtex#imaps#wrap_math("`i", '\iota')
inoremap <buffer> <nowait> <silent> <expr> `h vimtex#imaps#wrap_math("`h", '\eta')
inoremap <buffer> <nowait> <silent> <expr> `g vimtex#imaps#wrap_math("`g", '\gamma')
inoremap <buffer> <nowait> <silent> <expr> `f vimtex#imaps#wrap_math("`f", '\phi')
inoremap <buffer> <nowait> <silent> <expr> `e vimtex#imaps#wrap_math("`e", '\epsilon')
inoremap <buffer> <nowait> <silent> <expr> `d vimtex#imaps#wrap_math("`d", '\delta')
inoremap <buffer> <nowait> <silent> <expr> `c vimtex#imaps#wrap_math("`c", '\chi')
inoremap <buffer> <nowait> <silent> <expr> `b vimtex#imaps#wrap_math("`b", '\beta')
inoremap <buffer> <nowait> <silent> <expr> `a vimtex#imaps#wrap_math("`a", '\alpha')
inoremap <buffer> <nowait> <silent> <expr> `jL vimtex#imaps#wrap_math("`jL", '\Rightarrow')
inoremap <buffer> <nowait> <silent> <expr> `jl vimtex#imaps#wrap_math("`jl", '\rightarrow')
inoremap <buffer> <nowait> <silent> <expr> `jH vimtex#imaps#wrap_math("`jH", '\Leftarrow')
inoremap <buffer> <nowait> <silent> <expr> `jh vimtex#imaps#wrap_math("`jh", '\leftarrow')
inoremap <buffer> <nowait> <silent> <expr> `jK vimtex#imaps#wrap_math("`jK", '\Uparrow')
inoremap <buffer> <nowait> <silent> <expr> `jk vimtex#imaps#wrap_math("`jk", '\uparrow')
inoremap <buffer> <nowait> <silent> <expr> `jJ vimtex#imaps#wrap_math("`jJ", '\Downarrow')
inoremap <buffer> <nowait> <silent> <expr> `jj vimtex#imaps#wrap_math("`jj", '\downarrow')
inoremap <buffer> <nowait> <silent> <expr> `N vimtex#imaps#wrap_math("`N", '\nabla')
inoremap <buffer> <nowait> <silent> <expr> `E vimtex#imaps#wrap_math("`E", '\exists')
inoremap <buffer> <nowait> <silent> <expr> `B vimtex#imaps#wrap_math("`B", '\boldsymbol')
inoremap <buffer> <nowait> <silent> <expr> `A vimtex#imaps#wrap_math("`A", '\forall')
inoremap <buffer> <nowait> <silent> <expr> `) vimtex#imaps#wrap_math("`)", '\supset')
inoremap <buffer> <nowait> <silent> <expr> `( vimtex#imaps#wrap_math("`(", '\subset')
inoremap <buffer> <nowait> <silent> <expr> `] vimtex#imaps#wrap_math("`]", '\supseteq')
inoremap <buffer> <nowait> <silent> <expr> `[ vimtex#imaps#wrap_math("`[", '\subseteq')
inoremap <buffer> <nowait> <silent> <expr> `+ vimtex#imaps#wrap_math("`+", '\dagger')
inoremap <buffer> <nowait> <silent> <expr> `H vimtex#imaps#wrap_math("`H", '\hbar')
inoremap <buffer> <nowait> <silent> <expr> `> vimtex#imaps#wrap_math("`>", '\rangle')
inoremap <buffer> <nowait> <silent> <expr> `< vimtex#imaps#wrap_math("`<", '\langle')
inoremap <buffer> <nowait> <silent> <expr> `* vimtex#imaps#wrap_math("`*", '\times')
inoremap <buffer> <nowait> <silent> <expr> `. vimtex#imaps#wrap_math("`.", '\cdot')
inoremap <buffer> <nowait> <silent> <expr> `\ vimtex#imaps#wrap_math("`\\", '\setminus')
inoremap <buffer> <nowait> <silent> <expr> `= vimtex#imaps#wrap_math("`=", '\equiv')
inoremap <buffer> <nowait> <silent> <expr> `8 vimtex#imaps#wrap_math("`8", '\infty')
inoremap <buffer> <nowait> <silent> <expr> `6 vimtex#imaps#wrap_math("`6", '\partial')
inoremap <buffer> <nowait> <silent> <expr> `2 vimtex#imaps#wrap_math("`2", '\sqrt')
inoremap <buffer> <nowait> <silent> <expr> `0 vimtex#imaps#wrap_math("`0", '\emptyset')
inoreabbr <buffer> bc because
inoreabbr <buffer> BC BECAUSE
inoreabbr <buffer> Bc Because
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=min:5,shift:10
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=sO:%\ -,mO:%\ \ ,eO:%%,:%
setlocal commentstring=%\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=\\v\\\\%(([egx]|mathchar|count|dimen|muskip|skip|toks)?def|font|(future)?let|new(count|dimen|skip|muskip|box|toks|read|write|fam|insert)|(re)?new(boolean|command|counter|environment|font|if|length|savebox|theorem(style)?)|DeclareMathOperator|bibitem%(\\[[^]]*\\])?)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'tex'
setlocal filetype=tex
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=vimtex#format#formatexpr()
setlocal formatoptions=tq1jn
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\v^\\c\\s*\\%\\s*!?\\s*tex\\s+root\\s*[=:]\\s*\\zs.*\\ze\\s*$|\\v^\\s*\\zs%(\\v\\\\%(input|include|includeonly)\\s*\\{|\\v\\\\%(subfile%(include)?|%(sub)?%(import|%(input|include)from)\\*?\\{[^\\}]*\\})\\s*\\{)\\zs[^\\}]*\\ze\\}?|\\v\\\\%(usepackage|RequirePackage)%(\\s*\\[[^]]*\\])?\\s*\\{\\zs[^}]*\\ze\\}
setlocal includeexpr=vimtex#include#expr()
setlocal indentexpr=VimtexIndentExpr()
setlocal indentkeys=!^F,o,O,0(,0),],},&,0=\\item\ ,0=\\item[,0=\\else,0=\\fi,0=\\rangle,0=\\rbrace,0=\\rvert,0=\\rVert,0=\\rfloor,0=\\rceil,0=\\urcorner
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=
setlocal linebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=vimtex#complete#omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
setlocal spelllang=en_us
setlocal spelloptions=
setlocal statuscolumn=
setlocal statusline=%#lualine_a_normal#\ \ \ %#lualine_b_diagnostics_error_normal#\ ó°…š\ 2\ %#lualine_b_diagnostics_warn_normal#ó°€ª\ 10\ %<%#lualine_c_normal#%=%#lualine_c_normal#\ 2.6m\ |%#lualine_x_filetype_DevIconTex_normal#\ ó°™©%#lualine_c_normal#\ tex\ %#lualine_b_normal#\ 21%%\ %#lualine_a_normal#\ 11314:4\ \
setlocal suffixesadd=.tex,.sty,.cls
setlocal noswapfile
setlocal synmaxcol=5000
if &syntax != 'tex'
setlocal syntax=tex
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=90
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 11314 - ((24 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11314
normal! 0
tabnext
edit EYNTKA_Differential_Geometry.tex
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/2nd\ semester/MAT415/EYTNKA/EYNTKA_MAT415.tex
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
imap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
inoremap <buffer> <silent> <expr> <Plug>(vimtex-delim-close) vimtex#delim#close()
inoremap <buffer> <silent> <Plug>(vimtex-cmd-create) =vimtex#cmd#create_insert()
inoremap <buffer> <silent> <C-L> u[s1z=`]au
xnoremap <buffer> <silent>  :lua require'nvim-treesitter.incremental_selection'.node_incremental()
omap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
xmap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
nmap <buffer> <nowait> <silent> % <Plug>(vimtex-%)
vmap <buffer> ( S(lxh%hx%
nmap <buffer> <nowait> <silent> ,lm <Plug>(vimtex-imaps-list)
nmap <buffer> <nowait> <silent> ,lv <Plug>(vimtex-view)
nmap <buffer> <nowait> <silent> ,lT <Plug>(vimtex-toc-toggle)
nmap <buffer> <nowait> <silent> ,lt <Plug>(vimtex-toc-open)
nmap <buffer> <nowait> <silent> ,lG <Plug>(vimtex-status-all)
nmap <buffer> <nowait> <silent> ,lg <Plug>(vimtex-status)
nmap <buffer> <nowait> <silent> ,lC <Plug>(vimtex-clean-full)
nmap <buffer> <nowait> <silent> ,lc <Plug>(vimtex-clean)
nmap <buffer> <nowait> <silent> ,le <Plug>(vimtex-errors)
nmap <buffer> <nowait> <silent> ,lK <Plug>(vimtex-stop-all)
nmap <buffer> <nowait> <silent> ,lk <Plug>(vimtex-stop)
xmap <buffer> <nowait> <silent> ,lL <Plug>(vimtex-compile-selected)
nmap <buffer> <nowait> <silent> ,lL <Plug>(vimtex-compile-selected)
nmap <buffer> <nowait> <silent> ,lo <Plug>(vimtex-compile-output)
nmap <buffer> <nowait> <silent> ,ll <Plug>(vimtex-compile)
nmap <buffer> <nowait> <silent> ,la <Plug>(vimtex-context-menu)
nmap <buffer> <nowait> <silent> ,lq <Plug>(vimtex-log)
nmap <buffer> <nowait> <silent> ,ls <Plug>(vimtex-toggle-main)
nmap <buffer> <nowait> <silent> ,lX <Plug>(vimtex-reload-state)
nmap <buffer> <nowait> <silent> ,lx <Plug>(vimtex-reload)
nmap <buffer> <nowait> <silent> ,lI <Plug>(vimtex-info-full)
nmap <buffer> <nowait> <silent> ,li <Plug>(vimtex-info)
omap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
omap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
xmap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
xmap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
nmap <buffer> <nowait> <silent> [* <Plug>(vimtex-[*)
nmap <buffer> <nowait> <silent> [/ <Plug>(vimtex-[/)
omap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
omap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
xmap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
xmap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
nmap <buffer> <nowait> <silent> [r <Plug>(vimtex-[r)
nmap <buffer> <nowait> <silent> [R <Plug>(vimtex-[R)
omap <buffer> <nowait> <silent> [n <Plug>(vimtex-[n)
omap <buffer> <nowait> <silent> [N <Plug>(vimtex-[N)
xmap <buffer> <nowait> <silent> [n <Plug>(vimtex-[n)
xmap <buffer> <nowait> <silent> [N <Plug>(vimtex-[N)
omap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
omap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
xmap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
xmap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
nmap <buffer> <nowait> <silent> [m <Plug>(vimtex-[m)
nmap <buffer> <nowait> <silent> [M <Plug>(vimtex-[M)
omap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
omap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
xmap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
xmap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
nmap <buffer> <nowait> <silent> [[ <Plug>(vimtex-[[)
nmap <buffer> <nowait> <silent> [] <Plug>(vimtex-[])
vmap <buffer> [ S[lxh%hx%
nnoremap <buffer> <silent> [c ?\chapter{
nnoremap <buffer> <silent> \vw <Cmd>VimtexCountWords
nnoremap <buffer> <silent> \eb :vs *.bib
omap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
omap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
xmap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
xmap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
nmap <buffer> <nowait> <silent> ]* <Plug>(vimtex-]*)
nmap <buffer> <nowait> <silent> ]/ <Plug>(vimtex-]/)
omap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
omap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
xmap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
xmap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
nmap <buffer> <nowait> <silent> ]r <Plug>(vimtex-]r)
nmap <buffer> <nowait> <silent> ]R <Plug>(vimtex-]R)
omap <buffer> <nowait> <silent> ]n <Plug>(vimtex-]n)
omap <buffer> <nowait> <silent> ]N <Plug>(vimtex-]N)
xmap <buffer> <nowait> <silent> ]n <Plug>(vimtex-]n)
xmap <buffer> <nowait> <silent> ]N <Plug>(vimtex-]N)
omap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
omap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
xmap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
xmap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
nmap <buffer> <nowait> <silent> ]m <Plug>(vimtex-]m)
nmap <buffer> <nowait> <silent> ]M <Plug>(vimtex-]M)
omap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
omap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
xmap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
xmap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
nmap <buffer> <nowait> <silent> ][ <Plug>(vimtex-][)
nmap <buffer> <nowait> <silent> ]] <Plug>(vimtex-]])
" nnoremap <buffer> <silent> ]c /\chapter{
omap <buffer> <nowait> <silent> ac <Plug>(vimtex-ac)
xmap <buffer> <nowait> <silent> ac <Plug>(vimtex-ac)
omap <buffer> <nowait> <silent> ae <Plug>(vimtex-ae)
xmap <buffer> <nowait> <silent> ae <Plug>(vimtex-ae)
omap <buffer> <nowait> <silent> am <Plug>(vimtex-am)
xmap <buffer> <nowait> <silent> am <Plug>(vimtex-am)
omap <buffer> <nowait> <silent> aP <Plug>(vimtex-aP)
xmap <buffer> <nowait> <silent> aP <Plug>(vimtex-aP)
omap <buffer> <nowait> <silent> a$ <Plug>(vimtex-a$)
xmap <buffer> <nowait> <silent> a$ <Plug>(vimtex-a$)
omap <buffer> <nowait> <silent> ad <Plug>(vimtex-ad)
xmap <buffer> <nowait> <silent> ad <Plug>(vimtex-ad)
nmap <buffer> <nowait> <silent> csd <Plug>(vimtex-delim-change-math)
nmap <buffer> <nowait> <silent> csc <Plug>(vimtex-cmd-change)
nmap <buffer> <nowait> <silent> cse <Plug>(vimtex-env-change)
nmap <buffer> <nowait> <silent> cs$ <Plug>(vimtex-env-change-math)
nmap <buffer> <nowait> <silent> dsd <Plug>(vimtex-delim-delete)
nmap <buffer> <nowait> <silent> dsc <Plug>(vimtex-cmd-delete)
nmap <buffer> <nowait> <silent> dse <Plug>(vimtex-env-delete)
nmap <buffer> <nowait> <silent> ds$ <Plug>(vimtex-env-delete-math)
xnoremap <buffer> <silent> grc :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
omap <buffer> <nowait> <silent> ic <Plug>(vimtex-ic)
xmap <buffer> <nowait> <silent> ic <Plug>(vimtex-ic)
omap <buffer> <nowait> <silent> ie <Plug>(vimtex-ie)
xmap <buffer> <nowait> <silent> ie <Plug>(vimtex-ie)
omap <buffer> <nowait> <silent> im <Plug>(vimtex-im)
xmap <buffer> <nowait> <silent> im <Plug>(vimtex-im)
omap <buffer> <nowait> <silent> iP <Plug>(vimtex-iP)
xmap <buffer> <nowait> <silent> iP <Plug>(vimtex-iP)
omap <buffer> <nowait> <silent> i$ <Plug>(vimtex-i$)
xmap <buffer> <nowait> <silent> i$ <Plug>(vimtex-i$)
omap <buffer> <nowait> <silent> id <Plug>(vimtex-id)
xmap <buffer> <nowait> <silent> id <Plug>(vimtex-id)
xmap <buffer> <nowait> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
nmap <buffer> <nowait> <silent> tsD <Plug>(vimtex-delim-toggle-modifier-reverse)
xmap <buffer> <nowait> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
nmap <buffer> <nowait> <silent> tsd <Plug>(vimtex-delim-toggle-modifier)
xmap <buffer> <nowait> <silent> tsf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> <nowait> <silent> tsf <Plug>(vimtex-cmd-toggle-frac)
nmap <buffer> <nowait> <silent> tsc <Plug>(vimtex-cmd-toggle-star)
nmap <buffer> <nowait> <silent> ts$ <Plug>(vimtex-env-toggle-math)
nmap <buffer> <nowait> <silent> tse <Plug>(vimtex-env-toggle-star)
xnoremap <buffer> <silent> <BS> :lua require'nvim-treesitter.incremental_selection'.node_decremental()
nmap <buffer> <nowait> <silent> <F8> <Plug>(vimtex-delim-add-modifiers)
xmap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
nmap <buffer> <nowait> <silent> <F7> <Plug>(vimtex-cmd-create)
xmap <buffer> <nowait> <silent> <F6> <Plug>(vimtex-env-surround-visual)
nmap <buffer> <nowait> <silent> <F6> <Plug>(vimtex-env-surround-line)
nnoremap <buffer> <Plug>(vimtex-view) :VimtexView
nnoremap <buffer> <Plug>(vimtex-toc-toggle) :call b:vimtex.toc.toggle()
nnoremap <buffer> <Plug>(vimtex-toc-open) :call b:vimtex.toc.open()
onoremap <buffer> <silent> <Plug>(vimtex-am) :call vimtex#text_obj#items(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-im) :call vimtex#text_obj#items(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-am) :call vimtex#text_obj#items(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-im) :call vimtex#text_obj#items(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-aP) :call vimtex#text_obj#sections(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-iP) :call vimtex#text_obj#sections(1, 1)
onoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 0,'math')
onoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 0,'math')
xnoremap <buffer> <silent> <Plug>(vimtex-a$) :call vimtex#text_obj#delimited(0, 1,'math')
xnoremap <buffer> <silent> <Plug>(vimtex-i$) :call vimtex#text_obj#delimited(1, 1,'math')
onoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 0,'normal')
onoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 0,'normal')
xnoremap <buffer> <silent> <Plug>(vimtex-ae) :call vimtex#text_obj#delimited(0, 1,'normal')
xnoremap <buffer> <silent> <Plug>(vimtex-ie) :call vimtex#text_obj#delimited(1, 1,'normal')
onoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 0,'delims')
onoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 0,'delims')
xnoremap <buffer> <silent> <Plug>(vimtex-ad) :call vimtex#text_obj#delimited(0, 1,'delims')
xnoremap <buffer> <silent> <Plug>(vimtex-id) :call vimtex#text_obj#delimited(1, 1,'delims')
onoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 0)
onoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 0)
xnoremap <buffer> <silent> <Plug>(vimtex-ac) :call vimtex#text_obj#commands(0, 1)
xnoremap <buffer> <silent> <Plug>(vimtex-ic) :call vimtex#text_obj#commands(1, 1)
nnoremap <buffer> <Plug>(vimtex-reload-state) :VimtexReloadState
nnoremap <buffer> <Plug>(vimtex-toggle-main) :VimtexToggleMain
nnoremap <buffer> <Plug>(vimtex-errors) :call vimtex#qf#toggle()
xnoremap <buffer> <silent> <SNR>130_(vimtex-[*) :call vimtex#motion#comment(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[/) :call vimtex#motion#comment(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]*) :call vimtex#motion#comment(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]/) :call vimtex#motion#comment(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[*) :call vimtex#motion#comment(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[/) :call vimtex#motion#comment(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]*) :call vimtex#motion#comment(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]/) :call vimtex#motion#comment(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[R) :call vimtex#motion#frame(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[r) :call vimtex#motion#frame(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]R) :call vimtex#motion#frame(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]r) :call vimtex#motion#frame(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[R) :call vimtex#motion#frame(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[r) :call vimtex#motion#frame(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]R) :call vimtex#motion#frame(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]r) :call vimtex#motion#frame(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[M) :call vimtex#motion#environment(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[m) :call vimtex#motion#environment(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]M) :call vimtex#motion#environment(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]m) :call vimtex#motion#environment(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[M) :call vimtex#motion#environment(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[m) :call vimtex#motion#environment(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]M) :call vimtex#motion#environment(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]m) :call vimtex#motion#environment(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[N) :call vimtex#motion#math(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[n) :call vimtex#motion#math(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]N) :call vimtex#motion#math(0,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]n) :call vimtex#motion#math(1,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[N) :call vimtex#motion#math(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[n) :call vimtex#motion#math(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]N) :call vimtex#motion#math(0,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]n) :call vimtex#motion#math(1,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[[) :call vimtex#motion#section(0,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-[]) :call vimtex#motion#section(1,1,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-][) :call vimtex#motion#section(1,0,1)
xnoremap <buffer> <silent> <SNR>130_(vimtex-]]) :call vimtex#motion#section(0,0,1)
nnoremap <buffer> <silent> <Plug>(vimtex-[[) :call vimtex#motion#section(0,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-[]) :call vimtex#motion#section(1,1,0)
nnoremap <buffer> <silent> <Plug>(vimtex-][) :call vimtex#motion#section(1,0,0)
nnoremap <buffer> <silent> <Plug>(vimtex-]]) :call vimtex#motion#section(0,0,0)
xnoremap <buffer> <silent> <SNR>130_(vimtex-%) :call vimtex#motion#find_matching_pair(1)
nnoremap <buffer> <silent> <Plug>(vimtex-%) :call vimtex#motion#find_matching_pair()
nnoremap <buffer> <SNR>130_(V) V
nnoremap <buffer> <SNR>130_(v) v
nnoremap <buffer> <Plug>(vimtex-reload) :VimtexReload
nnoremap <buffer> <Plug>(vimtex-log) :VimtexLog
nnoremap <buffer> <Plug>(vimtex-info-full) :VimtexInfo!
nnoremap <buffer> <Plug>(vimtex-info) :VimtexInfo
nnoremap <buffer> <Plug>(vimtex-imaps-list) :call vimtex#imaps#list()
xnoremap <buffer> <silent> <Plug>(vimtex-env-surround-visual) :call vimtex#env#surround_opfunc('visual')
nmap <buffer> <silent> <Plug>(vimtex-env-surround-line) <Plug>(vimtex-env-surround-operator)_
nnoremap <buffer> <silent> <expr> <Plug>(vimtex-env-surround-operator) vimtex#env#surround_opfunc('operator')
nnoremap <buffer> <Plug>(vimtex-doc-package) :VimtexDocPackage
nnoremap <buffer> <silent> <Plug>(vimtex-delim-add-modifiers) :call vimtex#delim#add_modifiers()
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier-reverse) :call vimtex#delim#toggle_modifier_visual({'dir': -1})
xnoremap <buffer> <silent> <Plug>(vimtex-delim-toggle-modifier) :call vimtex#delim#toggle_modifier_visual()
nnoremap <buffer> <Plug>(vimtex-context-menu) :VimtexContextMenu
nnoremap <buffer> <Plug>(vimtex-status-all) :call vimtex#compiler#status(1)
nnoremap <buffer> <Plug>(vimtex-status) :call vimtex#compiler#status(0)
nnoremap <buffer> <Plug>(vimtex-clean-full) :call vimtex#compiler#clean(1)
nnoremap <buffer> <Plug>(vimtex-clean) :call vimtex#compiler#clean(0)
nnoremap <buffer> <Plug>(vimtex-stop-all) :call vimtex#compiler#stop_all()
nnoremap <buffer> <Plug>(vimtex-stop) :call vimtex#compiler#stop()
nnoremap <buffer> <Plug>(vimtex-compile-output) :call vimtex#compiler#output()
xnoremap <buffer> <Plug>(vimtex-compile-selected) :call vimtex#compiler#compile_selected('visual')
nnoremap <buffer> <Plug>(vimtex-compile-selected) :set opfunc=vimtex#compiler#compile_selectedg@
nnoremap <buffer> <Plug>(vimtex-compile-ss) :call vimtex#compiler#compile_ss()
nnoremap <buffer> <Plug>(vimtex-compile) :call vimtex#compiler#compile()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-toggle-frac) :call vimtex#cmd#toggle_frac_visual()
xnoremap <buffer> <silent> <Plug>(vimtex-cmd-create) :call vimtex#cmd#create_visual()
inoremap <buffer> <silent>  u[s1z=`]au
inoremap <buffer> <nowait> <silent> <expr> #B vimtex#imaps#wrap_math("#B", vimtex#imaps#style_math("mathbb"))
inoremap <buffer> <nowait> <silent> <expr> #- vimtex#imaps#wrap_math("#-", vimtex#imaps#style_math("overline"))
inoremap <buffer> <nowait> <silent> <expr> #c vimtex#imaps#wrap_math("#c", vimtex#imaps#style_math("mathcal"))
inoremap <buffer> <nowait> <silent> <expr> #f vimtex#imaps#wrap_math("#f", vimtex#imaps#style_math("mathfrak"))
inoremap <buffer> <nowait> <silent> <expr> #b vimtex#imaps#wrap_math("#b", vimtex#imaps#style_math("mathbf"))
inoremap <buffer> <nowait> <silent> <expr> #/ vimtex#imaps#wrap_math("#/", vimtex#imaps#style_math("slashed"))
imap <buffer> <nowait> <silent> ]] <Plug>(vimtex-delim-close)
inoremap <buffer> <nowait> <silent> <expr> `` vimtex#imaps#wrap_trivial("``", '``')
inoremap <buffer> <nowait> <silent> <expr> `vr vimtex#imaps#wrap_math("`vr", '\varrho')
inoremap <buffer> <nowait> <silent> <expr> `vq vimtex#imaps#wrap_math("`vq", '\vartheta')
inoremap <buffer> <nowait> <silent> <expr> `vk vimtex#imaps#wrap_math("`vk", '\varkappa')
inoremap <buffer> <nowait> <silent> <expr> `vf vimtex#imaps#wrap_math("`vf", '\varphi')
inoremap <buffer> <nowait> <silent> <expr> `ve vimtex#imaps#wrap_math("`ve", '\varepsilon')
inoremap <buffer> <nowait> <silent> <expr> `Y vimtex#imaps#wrap_math("`Y", '\Psi')
inoremap <buffer> <nowait> <silent> <expr> `X vimtex#imaps#wrap_math("`X", '\Xi')
inoremap <buffer> <nowait> <silent> <expr> `W vimtex#imaps#wrap_math("`W", '\Omega')
inoremap <buffer> <nowait> <silent> <expr> `U vimtex#imaps#wrap_math("`U", '\Upsilon')
inoremap <buffer> <nowait> <silent> <expr> `S vimtex#imaps#wrap_math("`S", '\Sigma')
inoremap <buffer> <nowait> <silent> <expr> `Q vimtex#imaps#wrap_math("`Q", '\Theta')
inoremap <buffer> <nowait> <silent> <expr> `P vimtex#imaps#wrap_math("`P", '\Pi')
inoremap <buffer> <nowait> <silent> <expr> `L vimtex#imaps#wrap_math("`L", '\Lambda')
inoremap <buffer> <nowait> <silent> <expr> `G vimtex#imaps#wrap_math("`G", '\Gamma')
inoremap <buffer> <nowait> <silent> <expr> `F vimtex#imaps#wrap_math("`F", '\Phi')
inoremap <buffer> <nowait> <silent> <expr> `D vimtex#imaps#wrap_math("`D", '\Delta')
inoremap <buffer> <nowait> <silent> <expr> `x vimtex#imaps#wrap_math("`x", '\xi')
inoremap <buffer> <nowait> <silent> <expr> `z vimtex#imaps#wrap_math("`z", '\zeta')
inoremap <buffer> <nowait> <silent> <expr> `w vimtex#imaps#wrap_math("`w", '\omega')
inoremap <buffer> <nowait> <silent> <expr> `u vimtex#imaps#wrap_math("`u", '\upsilon')
inoremap <buffer> <nowait> <silent> <expr> `y vimtex#imaps#wrap_math("`y", '\psi')
inoremap <buffer> <nowait> <silent> <expr> `t vimtex#imaps#wrap_math("`t", '\tau')
inoremap <buffer> <nowait> <silent> <expr> `s vimtex#imaps#wrap_math("`s", '\sigma')
inoremap <buffer> <nowait> <silent> <expr> `r vimtex#imaps#wrap_math("`r", '\rho')
inoremap <buffer> <nowait> <silent> <expr> `q vimtex#imaps#wrap_math("`q", '\theta')
inoremap <buffer> <nowait> <silent> <expr> `p vimtex#imaps#wrap_math("`p", '\pi')
inoremap <buffer> <nowait> <silent> <expr> `n vimtex#imaps#wrap_math("`n", '\nu')
inoremap <buffer> <nowait> <silent> <expr> `m vimtex#imaps#wrap_math("`m", '\mu')
inoremap <buffer> <nowait> <silent> <expr> `l vimtex#imaps#wrap_math("`l", '\lambda')
inoremap <buffer> <nowait> <silent> <expr> `k vimtex#imaps#wrap_math("`k", '\kappa')
inoremap <buffer> <nowait> <silent> <expr> `i vimtex#imaps#wrap_math("`i", '\iota')
inoremap <buffer> <nowait> <silent> <expr> `h vimtex#imaps#wrap_math("`h", '\eta')
inoremap <buffer> <nowait> <silent> <expr> `g vimtex#imaps#wrap_math("`g", '\gamma')
inoremap <buffer> <nowait> <silent> <expr> `f vimtex#imaps#wrap_math("`f", '\phi')
inoremap <buffer> <nowait> <silent> <expr> `e vimtex#imaps#wrap_math("`e", '\epsilon')
inoremap <buffer> <nowait> <silent> <expr> `d vimtex#imaps#wrap_math("`d", '\delta')
inoremap <buffer> <nowait> <silent> <expr> `c vimtex#imaps#wrap_math("`c", '\chi')
inoremap <buffer> <nowait> <silent> <expr> `b vimtex#imaps#wrap_math("`b", '\beta')
inoremap <buffer> <nowait> <silent> <expr> `a vimtex#imaps#wrap_math("`a", '\alpha')
inoremap <buffer> <nowait> <silent> <expr> `jL vimtex#imaps#wrap_math("`jL", '\Rightarrow')
inoremap <buffer> <nowait> <silent> <expr> `jl vimtex#imaps#wrap_math("`jl", '\rightarrow')
inoremap <buffer> <nowait> <silent> <expr> `jH vimtex#imaps#wrap_math("`jH", '\Leftarrow')
inoremap <buffer> <nowait> <silent> <expr> `jh vimtex#imaps#wrap_math("`jh", '\leftarrow')
inoremap <buffer> <nowait> <silent> <expr> `jK vimtex#imaps#wrap_math("`jK", '\Uparrow')
inoremap <buffer> <nowait> <silent> <expr> `jk vimtex#imaps#wrap_math("`jk", '\uparrow')
inoremap <buffer> <nowait> <silent> <expr> `jJ vimtex#imaps#wrap_math("`jJ", '\Downarrow')
inoremap <buffer> <nowait> <silent> <expr> `jj vimtex#imaps#wrap_math("`jj", '\downarrow')
inoremap <buffer> <nowait> <silent> <expr> `N vimtex#imaps#wrap_math("`N", '\nabla')
inoremap <buffer> <nowait> <silent> <expr> `E vimtex#imaps#wrap_math("`E", '\exists')
inoremap <buffer> <nowait> <silent> <expr> `B vimtex#imaps#wrap_math("`B", '\boldsymbol')
inoremap <buffer> <nowait> <silent> <expr> `A vimtex#imaps#wrap_math("`A", '\forall')
inoremap <buffer> <nowait> <silent> <expr> `) vimtex#imaps#wrap_math("`)", '\supset')
inoremap <buffer> <nowait> <silent> <expr> `( vimtex#imaps#wrap_math("`(", '\subset')
inoremap <buffer> <nowait> <silent> <expr> `] vimtex#imaps#wrap_math("`]", '\supseteq')
inoremap <buffer> <nowait> <silent> <expr> `[ vimtex#imaps#wrap_math("`[", '\subseteq')
inoremap <buffer> <nowait> <silent> <expr> `+ vimtex#imaps#wrap_math("`+", '\dagger')
inoremap <buffer> <nowait> <silent> <expr> `H vimtex#imaps#wrap_math("`H", '\hbar')
inoremap <buffer> <nowait> <silent> <expr> `> vimtex#imaps#wrap_math("`>", '\rangle')
inoremap <buffer> <nowait> <silent> <expr> `< vimtex#imaps#wrap_math("`<", '\langle')
inoremap <buffer> <nowait> <silent> <expr> `* vimtex#imaps#wrap_math("`*", '\times')
inoremap <buffer> <nowait> <silent> <expr> `. vimtex#imaps#wrap_math("`.", '\cdot')
inoremap <buffer> <nowait> <silent> <expr> `\ vimtex#imaps#wrap_math("`\\", '\setminus')
inoremap <buffer> <nowait> <silent> <expr> `= vimtex#imaps#wrap_math("`=", '\equiv')
inoremap <buffer> <nowait> <silent> <expr> `8 vimtex#imaps#wrap_math("`8", '\infty')
inoremap <buffer> <nowait> <silent> <expr> `6 vimtex#imaps#wrap_math("`6", '\partial')
inoremap <buffer> <nowait> <silent> <expr> `2 vimtex#imaps#wrap_math("`2", '\sqrt')
inoremap <buffer> <nowait> <silent> <expr> `0 vimtex#imaps#wrap_math("`0", '\emptyset')
inoreabbr <buffer> bc because
inoreabbr <buffer> BC BECAUSE
inoreabbr <buffer> Bc Because
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=min:5,shift:10
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=sO:%\ -,mO:%\ \ ,eO:%%,:%
setlocal commentstring=%\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=\\v\\\\%(([egx]|mathchar|count|dimen|muskip|skip|toks)?def|font|(future)?let|new(count|dimen|skip|muskip|box|toks|read|write|fam|insert)|(re)?new(boolean|command|counter|environment|font|if|length|savebox|theorem(style)?)|DeclareMathOperator|bibitem%(\\[[^]]*\\])?)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'tex'
setlocal filetype=tex
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=vimtex#format#formatexpr()
setlocal formatoptions=tq1jn
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\v^\\c\\s*\\%\\s*!?\\s*tex\\s+root\\s*[=:]\\s*\\zs.*\\ze\\s*$|\\v^\\s*\\zs%(\\v\\\\%(input|include|includeonly)\\s*\\{|\\v\\\\%(subfile%(include)?|%(sub)?%(import|%(input|include)from)\\*?\\{[^\\}]*\\})\\s*\\{)\\zs[^\\}]*\\ze\\}?|\\v\\\\%(usepackage|RequirePackage)%(\\s*\\[[^]]*\\])?\\s*\\{\\zs[^}]*\\ze\\}
setlocal includeexpr=vimtex#include#expr()
setlocal indentexpr=VimtexIndentExpr()
setlocal indentkeys=!^F,o,O,0(,0),],},&,0=\\item\ ,0=\\item[,0=\\else,0=\\fi,0=\\rangle,0=\\rbrace,0=\\rvert,0=\\rVert,0=\\rfloor,0=\\rceil,0=\\urcorner
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=
setlocal linebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=vimtex#complete#omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
setlocal spelllang=en_us
setlocal spelloptions=
setlocal statuscolumn=
setlocal statusline=%#lualine_a_normal#\ \ \ %<%#lualine_c_normal#\ /Users/nathanaelchwojko-srawkey/Library/CloudStorage/-Personal/Documents/University/undergraduate/2022-2023/3rd\ semester/NSERC/EYNTKA\ %#lualine_c_normal#%=%#lualine_c_normal#\ 567.5k\ |%#lualine_x_filetype_DevIconTex_command#\ ó°™©%#lualine_c_normal#\ tex\ %#lualine_b_normal#\ \ 1%%\ %#lualine_a_normal#\ 136:1\ \
setlocal suffixesadd=.tex,.sty,.cls
setlocal noswapfile
setlocal synmaxcol=5000
if &syntax != 'tex'
setlocal syntax=tex
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=90
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 136 - ((24 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 136
normal! 0
tabnext 3
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
