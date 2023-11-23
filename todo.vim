" File:        todo.txt.vim
" Description: Todo.txt filetype detection
" Author:      Calon Xu <calon.xu@gmail.com>
" License:     Vim license
" Website:     http://github.com/freitass/todo.txt-vim
" Version:     0.2

autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=markdown.todo
autocmd BufNewFile,BufRead [Tt]odo.md set filetype=markdown.todo
autocmd BufNewFile,BufRead *.[Tt]odo.txt set filetype=markdown.todo
autocmd BufNewFile,BufRead *.[Tt]odo.md set filetype=markdown.todo
autocmd BufNewFile,BufRead [Dd]one.txt set filetype=markdown.todo
autocmd BufNewFile,BufRead [Dd]one.md set filetype=markdown.todo
autocmd BufNewFile,BufRead *.[Dd]one.txt set filetype=markdown.todo
autocmd BufNewFile,BufRead *.[Dd]one.md set filetype=markdown.todo

