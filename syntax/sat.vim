if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "sat"
syn region Fold start="{" end="}" transparent fold


syn match satBlock /\(\(^\s*\$\w* \)\@<=\|^\s*\).*$/ contains=satBlockMotion, satBlockLooks, satBlockSound, satBlockEvent, satBlockControl, satBlockSensing, satBlockOperator, satBlockData, satBlockCustom, satBlockExtention, satBlockUnknown, satFields, satInputs

syn match satBlockMotion /@\?motion_\w*/ contained
syn match satBlockLooks /@\?looks_\w*/ contained
syn match satBlockSound /@\?sound_\w*/ contained
syn match satBlockEvent /@\?event_\w*/ contained
syn match satBlockControl /@\?control_\w*/ contained
syn match satBlockSensing /@\?sensing_\w*/ contained
syn match satBlockOperator /@\?operator_\w*/ contained
syn match satBlockData /@\?data_\w*/ contained
syn match satBlockCustom /@\?custom_\w*/ contained
syn match satBlockExtention /@\?extention_\w*/ contained
syn match satBlockUnknown /@\?unknown_\w*/ contained

syn match satBlockIdentifier /^\s*$\w* /


syn region satInputs start="(" end=")" contained contains=satInputType, satNumber, satString, satInputBlockIdentifier, satKeyword, satVariable

syn region satFields start="\[" end="\]" contained contains=satString, satFieldsReserved, satFieldsNull, satKeyword, satvariable

syn match satFieldsReserved "_\(mouse\|stage\|edge\|myself\|random\)_" contained
syn match satFieldsNull "null" contained


syn match satNumber "\d*" contained 
syn match satVariable "\(var\|list\|broadcast\)\@<=\s\s*\w*" contained 
syn region satString start="'" end="\\\@<!'" contained
syn region satString start="\"" end="\\\@<!\"" contained
syn match satKeyword "\(var\|list\|broadcast\)" contained

syn match satInputType "(\@<=\d*:" contained
syn match satInputBlockIdentifier "\$\w*" contained


hi satBlockMotion ctermfg=39  guifg=#4C97FF
hi satBlockLooks ctermfg=99  guifg=#9966FF
hi satBlockSound ctermfg=135 guifg=#CF63CF
hi satBlockEvent ctermfg=178 guifg=#DE9E2E
hi satBlockControl ctermfg=184 guifg=#FFBF00
hi satBlockSensing ctermfg=111 guifg=#5CB1D6
hi satBlockOperator ctermfg=42 guifg=#59C059
hi satBlockData ctermfg=172 guifg=#FF661A
hi satBlockCustom ctermfg=135 guifg=#5F49D8
hi satBlockExtention ctermfg=43 guifg=#0FBD8C
hi satBlockUnknown ctermfg=79 guifg=#29BEB8
hi satBlockIdentifier ctermfg=197 guifg=#29BEB8


hi satInputType ctermfg=14 guifg=#00ffff
hi def link satInputBlockIdentifier satBlockIdentifier
hi def link satFieldsReserved Keyword
hi def link satFieldsNull Keyword

hi def link satString String
hi def link satNumber Number
hi def link satKeyword Keyword

" vim: ts=4
