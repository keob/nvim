syn match     rustAsync       "\<async\%(\s\|\n\)\@="
syn keyword   rustAwait       await

hi def link rustAsync         rustKeyword
hi def link rustAwait         rustKeyword
