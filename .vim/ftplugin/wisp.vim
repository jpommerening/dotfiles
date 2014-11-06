
if exists('b:did_ftplugin') || exists('g:slimv_disable_wisp')
  finish
endif

if !exists('g:slimv_wisp_loaded')

let g:slimv_wisp_loaded = 1

function! b:SlimvAutodetect( preferred )
  if executable('wisp')
    return ['wisp', 'clojure']
  endif

  return ['', 'clojure']
endfunction

function! b:SlimvImplementation()
  if exists('g:slimv_impl') && g:slimv_impl != ''
    return tolower(g:slimv_impl)
  endif

  return 'clojure'
endfunction

function! b:SlimvSwankLoader()
  if g:slimv_impl == 'clojure'
    return ''
  endif
  return ''
endfunction

function! b:SlimvInitRepl()
  set filetype=wisp
endfunction

function! b:SlimvHyperspecLookup( word, exact, all )
  let symbol = []
  return symbol
endfunction

runtime ftplugin/**/slimv.vim

endif "!exists('g:slimv_wisp_loaded')

runtime ftplugin/**/clojure.vim

call SlimvInitBuffer()

let b:did_ftplugin = 1
