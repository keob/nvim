" Comments; their contents
syn keyword     goTodo              contained NOTE
hi def link     goTodo              Todo

" Operators;
" syn match goOperator /:=/
" syn match goOperator />=/
" syn match goOperator /<=/
" syn match goOperator /==/
" syn match goOperator />>/
" syn match goOperator /<</
" syn match goOperator /\s>\s/
" syn match goOperator /\s<\s/
" syn match goOperator /\s+\s/
" syn match goOperator /\s-\s/
" syn match goOperator /\s\*\s/
" syn match goOperator /\s\/\s/
" syn match goOperator /\s%\s/
" hi def link     goOperator         Operator

" Functions;
syn match goFunction       /\(func\s\+\)\@<=\w\+\((\)\@=/
syn match goFunction       /\()\s\+\)\@<=\w\+\((\)\@=/
hi def link     goFunction         Function

" Methods;
syn match goMethod         /\(\.\)\@<=\w\+\((\)\@=/
hi def link     goMethod           Function

" Structs;
syn match goStruct         /\(.\)\@<=\w\+\({\)\@=/
syn match goStructDef      /\(type\s\+\)\@<=\w\+\(\s\+struct\s\+{\)\@=/
hi def link     goStruct           Function
hi def link     goStructDef        Function
