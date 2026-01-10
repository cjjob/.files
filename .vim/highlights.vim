hi Comment ctermfg=grey
hi clear LineNr

" EasyMotion
hi EasyMotionTarget         ctermbg=none ctermfg=red
hi EasyMotionTarget2First   ctermbg=none ctermfg=red
hi EasyMotionTarget2Second  ctermbg=none ctermfg=lightred
hi EasyMotionShade          ctermbg=none ctermfg=black


" LSP Diagnostics
hi Red    ctermfg=red
hi Orange ctermfg=lightred
hi Yellow ctermfg=yellow
hi Blue   ctermfg=blue
hi Grey   ctermfg=grey
" Gutter signs
hi link LspDiagSignErrorText   Red
hi link LspDiagSignWarningText Yellow
hi link LspDiagSignInfoText    Blue
hi link LspDiagSignHintText    Grey
" Code
hi link LspDiagInlineError   Red
hi link LspDiagInlineWarning Yellow
hi link LspDiagInlineInfo    Blue
hi link LspDiagInlineHint    Grey
" Virtual text
hi link LspDiagVirtualTextError   Grey
hi link LspDiagVirtualTextWarning Grey
hi link LspDiagVirtualTextInfo    Grey
hi link LspDiagVirtualTextHint    Grey
