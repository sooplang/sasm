if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "sat"
syn region Fold start="{" end="}" transparent fold

syn match satNumber "\d*" contained 
syn match satVariable "\v(var|list|broadcast)@<=\s+(\w+|'.{-1,}\\@<!'|\".{-1,}\\@<!\")" contained 
syn match satKeyword "\(var\|list\|broadcast\)" contained
syn match satNull "null" contained
syn region satString start="'" end="\\\@<!'" contained
syn region satString start="\"" end="\\\@<!\"" contained

syn match satFieldReserved "_\(mouse\|stage\|edge\|myself\|random\)_" contained
syn match satInputBlockIdentifier "\$\w*" contained
syn match satInputInputIdentifier "\v\#(\w+|'.{-1,}\\@<!'|\".{-1,}\\@<!\")" contained


syn match satBlockIdentifier /^\s*\($\w\+\)\?\s*/ nextgroup=satPrototype, satBlockMotion, satBlockLooks, satBlockSound, satBlockEvent, satBlockControl, satBlockSensing, satBlockOperator, satBlockData, satBlockCustom, satBlockExtention, satBlockUnknown, satBlockPrototype, satBlockCall


syn match satBlockMotion /@\?motion_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockLooks /@\?looks_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockSound /@\?sound_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockEvent /@\?event_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockControl /@\?control_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockSensing /@\?sensing_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockOperator /@\?operator_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockData /@\?data_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockCustom /@\?procedures_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockExtention /@\?extention_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockUnknown /@\?unknown_\w*/ contained nextgroup=satFieldName, satInputName 
syn match satBlockPrototype /@\?procedures_prototype/ contained nextgroup=satPrototypeProccode
syn match satBlockCall /@\?procedures_call/ contained nextgroup=satBlockCallIdentifier

syn match satInputName "\v\s+(\w+|'([^']|\\')*'|\"([^\"]|\\\")*\")\(@=" contained nextgroup=satInputType, satInput
syn region satInput start="(" end=")" contained contains=satInputName, satInputType, satNumber, satString, satNull, satInputBlockIdentifier, satKeyword, satVariable, satInputInputIdentifier nextgroup=satInputName, satFieldName
syn match satInputType "(\@<=\d\{-1,}:" contained

syn match satFieldName "\v\s+(\w+|'([^']|\\')*'|\"([^\"]|\\\")*\")\[@=" contained nextgroup=satField
syn region satField start="\[" end="\]" contained contains=satString, satFieldReserved, satNull, satKeyword, satvariable nextgroup=satInputName, satFieldName

 
syn match satPrototypeProccode "\v\s+('.{-1,}\\@<!'|\".{-1,}\\@<!\")" contained contains=satPrototypeProccodeInput nextgroup=satPrototypeInput
syn match satPrototypeProccodeInput "\\\@<!%\(s\|b\)" contained 
syn match satPrototypeInput "\v\s*\#(\w+|'.{-1,}\\@<!'|\".{-1,}\\@<!\")" contained nextgroup=satPrototypeInput
syn match satBlockCallIdentifier "\s\+\$\w\+" contained nextgroup=satInputName, satFieldName


hi satBlockMotion ctermfg=39 guifg=#4C97FF
hi satBlockLooks ctermfg=99 guifg=#9966FF
hi satBlockSound ctermfg=135 guifg=#CF63CF
hi satBlockEvent ctermfg=178 guifg=#DE9E2E
hi satBlockControl ctermfg=184 guifg=#FFBF00
hi satBlockSensing ctermfg=111 guifg=#5CB1D6
hi satBlockOperator ctermfg=42 guifg=#59C059
hi satBlockData ctermfg=172 guifg=#FF661A
hi satBlockCustom ctermfg=135 guifg=#5F49D8
hi satBlockExtention ctermfg=43 guifg=#0FBD8C
hi satBlockUnknown ctermfg=79 guifg=#29BEB8
hi def link satBlockPrototype satBlockCustom
hi def link satBlockCall satBlockCustom

hi satBlockIdentifier ctermfg=197 guifg=#29BEB8
hi def link satInputBlockIdentifier satBlockIdentifier
hi def link satInputInputIdentifier satBlockIdentifier
hi def link satBlockCallIdentifier satBlockIdentifier

hi satInputName ctermfg=255 guifg=#eeeeee
hi def link satFieldName satInputName

hi satInputType ctermfg=14 guifg=#00FFFF
hi def link satFieldReserved Keyword
hi def link satNull Keyword

hi def link satString String
hi def link satNumber Number
hi def link satKeyword Keyword
hi satVariable ctermfg=195 guifg=#d7ffff

hi def link satPrototypeProccode satVariable
hi def link satPrototypeInput satBlockIdentifier
hi def link satPrototypeProccodeInput satBlockIdentifier

" vim: ts=4
