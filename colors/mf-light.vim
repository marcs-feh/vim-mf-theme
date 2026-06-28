let g:colors_name = 'mf-light'
set background=light
hi! clear

if exists('syntax_on')
  syntax reset
endif

let s:telescopeIntegration = v:true

let s:uiForeground = '#000000'
let s:uiBackground = '#fff8bf'
let s:uiSubtleBackground = '#f9e9a1'

if exists('g:mf_light_transparent') && g:mf_light_transparent
	let s:uiBackground = 'NONE'
endif

let s:uiLineWeak = '#efe17d' " '#efbf94' " '#F5E1DA'
let s:uiLine = '#FCDBCB'
let s:uiLineStrong = '#E3AB9A'
let s:uiTextMuted = '#8A5D55'

let s:uiSelection = '#f5d78b'
let s:uiSearchForeground = s:uiForeground
let s:uiSearchBackground = s:uiSelection
let s:uiSpecialKey = '#92533F'

let s:x = 600 + 100 + 599

let s:synKeyword = '#6c2302'
let s:synType = '#263d00'
let s:synFunction = s:uiForeground
let s:synIdentifier = s:uiForeground
let s:synString = '#a03d10'
let s:synNumber = '#005143'
let s:synConstant = s:uiForeground
let s:synComment = '#67503e'
let s:synPreProc = s:synKeyword
let s:synNamespace =s:uiForeground

let s:diagnosticError = '#ff0000'
let s:diagnosticWarn = '#ffbf00'
let s:diagnosticInfo = s:uiTextMuted
let s:diagnosticHint = s:uiTextMuted
let s:diagnosticOk = '#00ffce'
let s:diagnosticUnnecessary = s:uiLine

let s:diffAdd =    '#6E644D'
let s:diffChange = '#92533F'
let s:diffDelete = '#A44737'

function! s:hi(group, fg)
  execute 'hi! ' . a:group . ' guifg=' . a:fg . ' guibg=NONE'
endfunction

function! s:link(ga, gb)
  execute 'hi! link ' . a:ga . ' ' . a:gb
endfunction

function! s:hiEx(group, fg, bg, style = 'NONE')
  execute 'hi! ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . ' cterm=' a:style . ' gui=' a:style
endfunction

function! s:clear(group)
  execute 'hi! clear ' . a:group
endfunction

call s:hiEx('Normal', s:uiForeground, s:uiBackground)
call s:hiEx('Bold', 'NONE', 'NONE', 'bold')
call s:hiEx('Italic', 'NONE', 'NONE', 'italic')
call s:hiEx('Underlined', 'NONE', 'NONE', 'underline')

call s:hiEx('Visual', s:uiForeground, s:uiSelection)

call s:hiEx('SignColumn', s:uiLineWeak, s:uiBackground)
call s:hiEx('ColorColumn', 'NONE', s:uiLineWeak)
call s:hi('LineNr', s:uiForeground)

call s:clear('CursorLineNr')
call s:hiEx('CursorLine', 'NONE', 'NONE', 'NONE')
call s:hiEx('CursorLineNr', s:uiForeground, 'NONE', 'bold')
call s:hiEx('CursorLineSign', 'NONE', 'NONE')

call s:link('Directory', 'Type')

call s:hiEx('WinBar', 'NONE', s:uiTextMuted)
call s:hiEx('WinSeparator', 'NONE', s:uiSubtleBackground)
call s:hiEx('Todo', s:uiForeground, 'NONE', 'bold')
call s:link('Title', 'Type')
call s:clear('Question')
call s:clear('NonText')

call s:hiEx('Pmenu', s:uiForeground, s:uiSubtleBackground)
call s:hiEx('PmenuSel', s:uiForeground, s:uiLineWeak)
call s:hiEx('PmenuSBar', 'NONE', s:uiLineWeak)
call s:hiEx('PmenuThumb', s:uiLineStrong, s:uiLine)
call s:link('NormalFloat', 'Pmenu')

call s:hiEx('SpellBad', s:diagnosticError, 'NONE', 'underline')
call s:hiEx('SpellCap', s:uiForeground, 'NONE')
call s:hiEx('SpellLocal', s:uiForeground, 'NONE')
call s:hiEx('SpellRare', s:uiForeground, 'NONE')

call s:link('VertSplit', 'WinSeparator')
call s:hi('EndOfBuffer', s:uiLine)

call s:hiEx('StatusLineNC', s:uiTextMuted, s:uiSubtleBackground)
call s:hiEx('StatusLine', s:uiForeground, s:uiLineWeak)

call s:hiEx('Tabline', s:uiForeground, s:uiSubtleBackground)
call s:hiEx('TablineSel', s:uiForeground, s:uiLineWeak)
call s:hiEx('TablineFill', s:uiForeground, s:uiBackground)

call s:hi('Folded', s:synType)
call s:hi('FoldColumn', s:synType)

call s:hiEx('Identifier', s:synIdentifier, 'NONE')

call s:clear('Delimiter')
call s:clear('Operator')
call s:clear('Special')
call s:hiEx('SpecialKey', s:uiSpecialKey, s:uiLineWeak)

call s:hi('Function', s:synFunction)

call s:hiEx('Keyword', s:synKeyword, 'NONE', 'bold')
call s:link('Conditional', 'Keyword')
call s:link('Statement', 'Keyword')
call s:link('Repeat', 'Keyword')
call s:link('Exception', 'Keyword')
call s:link('StorageClass', 'Keyword')

call s:hiEx('WildMenu', s:uiForeground, s:uiLine)
call s:hiEx('Search', s:uiSearchForeground, s:uiSearchBackground)
call s:link('IncSearch', 'Search')

call s:hiEx('DiffAdd', s:diffAdd, s:uiLineWeak, 'NONE')
call s:hiEx('DiffChange', s:diffChange, s:uiLineWeak, 'NONE')
call s:hiEx('DiffDelete', s:diffDelete, s:uiLineWeak, 'NONE')
call s:hiEx('DiffText', s:synNumber, s:uiLineWeak, 'NONE')
call s:link('Added', 'DiffAdd')
call s:link('Changed', 'DiffChange')
call s:link('Removed', 'DiffDelete')

call s:hi('MoreMsg', s:uiTextMuted)
call s:hi('WarningMsg', s:diagnosticWarn)
call s:hi('ErrorMsg', s:diagnosticError)
call s:hi('Error', s:diagnosticError)

call s:hi('Namespace', s:synNamespace)
call s:hiEx('Number', s:synNumber, 'NONE')
call s:hi('Constant', s:synConstant)
call s:hi('Boolean', s:synType)
call s:hi('Type', s:synType)
call s:hi('String', s:synString)
call s:hi('Comment', s:synComment)
call s:hi('PreProc', s:synPreProc)
call s:hi('Label', s:synConstant)

" Neovim-only section
if has('nvim')
  call s:hi('DiagnosticError', s:diagnosticError)
  call s:hi('DiagnosticUnnecessary', s:diagnosticUnnecessary)
  call s:hi('DiagnosticWarn', s:diagnosticWarn)
  call s:hi('DiagnosticInfo', s:diagnosticInfo)
  call s:hi('DiagnosticHint', s:diagnosticHint)
  call s:hi('DiagnosticOk', s:diagnosticOk)

  call s:link('@type.builtin', 'Type')
  call s:link('@keyword.modifier.cpp', 'Type')
  call s:link('@keyword.type', 'Keyword')
  call s:link('@constant.builtin', 'Keyword')
  call s:hi('@module', s:synNamespace)

  if s:telescopeIntegration
    call s:hiEx('TelescopeNormal', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopePromptBorder', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopeResultsBorder', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopePreviewBorder', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopeSelection', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopeMultiSelection', s:uiForeground, s:uiBackground, 'bold')
    call s:hiEx('TelescopeMatching', s:uiSearchBackground, s:uiBackground, 'bold')
    call s:hiEx('TelescopePromptPrefix', s:uiForeground, s:uiBackground, 'NONE')
  endif
endif
