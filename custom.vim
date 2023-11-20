" =============================================================================
" Filename: autoload/lightline/colorscheme/custom.vim
" Version: 1.1
" Author: Calon Xu
" License: MIT License
" Last Change: 2023-11-16
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['gray2', 'gray10'], ['gray2', 'gray8'], ['gray2', 'gray6'], ['gray9', 'gray4'] ]
let s:p.normal.right = [ ['gray2', 'gray10'], ['gray2', 'gray8'], ['gray2', 'gray6'], ['gray9', 'gray4'], ['gray9', 'gray2'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
" let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.left = [ ['gray2', 'gray9'], ['gray2', '#ff0000'], ['gray2', '#ff8700'], ['gray2', '#ffd300'], ['gray2', '#deff0a'] ]
" let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.insert.right = [ ['gray2', '#be0aff'], ['gray2', '#580aff'], ['gray2', '#147df5'], ['gray2', '#0aefff'], ['gray2', '#0aff99'] ]
" let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.insert.middle = [ [ 'gray2', '#a1ff0a' ] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.replace.right = s:p.normal.right
let s:p.replace.middle = s:p.normal.middle
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]

let g:lightline#colorscheme#custom#palette = lightline#colorscheme#fill(s:p)
