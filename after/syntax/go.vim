" Comments
syn keyword     goTodo              contained NOTE
hi def link     goTodo              Todo

" Fields
syn match       goField             /\.\w\+\
                                    \%(\%([\/\-\+*%]\)\|\
                                    \%([\[\]{}<\>\)]\)\|\
                                    \%([\!=\^|&]\)\|\
                                    \%([\n\r\ ]\)\|\
                                    \%([,\:.]\)\)\@=/hs=s+1
hi def link    goField              Identifier

" Operator
syn match goVarArgs                 /\.\.\./
syn match goOperator                /[-+%<>!&|^*=]=\?/
syn match goOperator                /\/\%(=\|\ze[^/*]\)/
syn match goOperator                /\%(<<\|>>\|&^\)=\?/
syn match goOperator                /:=\|||\|<-\|++\|--/
syn match goReceiverType            /\w\+/ contained
syn match goPointerOperator         /\*/ nextgroup=goReceiverType contained skipwhite skipnl
hi def link     goPointerOperator   goOperator
hi def link     goVarArgs           goOperator
hi def link     goOperator          Operator

" Functions
hi def link     goFunction          Function

" Methods
syn match goMethod                  /\(\.\)\@<=\w\+\((\)\@=/
hi def link     goMethod            Function

" Structs & Interfaces
syn match goTypeConstructor         /\<\w\+{\@=/
syn match goDeclType                /\<\%(interface\|struct\)\>/ skipwhite skipnl
syn match goTypeName                /\w\+/ contained nextgroup=goDeclType skipwhite skipnl
syn match goTypeDecl                /\<type\>/ nextgroup=goTypeName skipwhite skipnl
hi def link     goTypeConstructor   Type
hi def link     goTypeName          Type
hi def link     goTypeDecl          Keyword
hi def link     goDeclType          Keyword

" Build
syn match   goBuildKeyword          display contained "+build"
syn keyword goBuildDirectives       contained
                                    \ android darwin dragonfly freebsd linux nacl netbsd openbsd plan9
                                    \ solaris windows 386 amd64 amd64p32 arm armbe arm64 arm64be ppc64
                                    \ ppc64le mips mipsle mips64 mips64le mips64p32 mips64p32le ppc
                                    \ s390 s390x sparc sparc64 cgo ignore race

syn region  goBuildComment          matchgroup=goBuildCommentStart
                                    \ start="//\s*+build\s"rs=s+2 end="$"
                                    \ contains=goBuildKeyword,goBuildDirectives
hi def link goBuildCommentStart     Comment
hi def link goBuildDirectives       Type
hi def link goBuildKeyword          PreProc
