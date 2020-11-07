"------------------------------------------------ 
"" typescript unit test
"" TODO: how to install and run see https://github.com/kulshekhar/ts-jest
"" gt: to swith between source/test file
"" tt or tf: run the test file
"---------------------------- 
let g:typescript_test_end_with = ".test.ts"

let g:test#javascript#runner = 'jest'
let g:test#runner_commands = ['jest']
let g:test#ruby#minitest#executable = 'jest'
let g:end_command = " & pause"

augroup typescriptunittest
  autocmd!
  autocmd BufRead,BufNewFile *.ts  nmap <buffer> tf :call g:TypescriptUnitTestFile()<cr>
  autocmd BufRead,BufNewFile *.ts  nmap <buffer> tt :call g:TypescriptUnitTestFile()<cr>
  autocmd BufRead,BufNewFile *.ts  nmap <buffer> gt :call g:TypescriptSwitchTest()<cr>

  function! g:TypescriptSwitchTest()
    :lcd %:p:h
    let file_relative_name = expand("%")
    let file_relative_name_no_ext  = expand("%:r")

    let index_start = match(file_relative_name, g:typescript_test_end_with . "$")
    if -1 != index_start
        "end with .test.ts, ie. current in .test.ts
        let target_file = file_relative_name[0:index_start-1] . ".ts"
        "echo "file_relative_name:". file_relative_name
        "echo "index_start:".index_start 
        "echo "target_file:".target_file
    else
        let target_file = file_relative_name_no_ext . g:typescript_test_end_with
    endif 

    let cmd = "e " . target_file
    silent! :execute cmd
  endfunction


  function! g:TypescriptUnitTestFile()
    :lcd %:p:h
    let file_relative_name = expand("%")
    let file_relative_name_no_ext  = expand("%:r")

    if -1 != match(file_relative_name, g:typescript_test_end_with . "$")
        let test_file = file_relative_name
        let cmd = "!start cmd /c cls & yarn jest " . test_file . g:end_command
        silent! :execute cmd
    else
        let test_file = file_relative_name_no_ext . g:typescript_test_end_with
        let cmd = "!start cmd /c cls & yarn jest " . test_file . g:end_command
        silent! :execute cmd
    endif 
  endfunction
  

"------------------------------------------------ 
"" ruby unit test
"---------------------------- 
let test#ruby#runner = 'm'
let g:test#runner_commands = ['M']
let test#ruby#bundle_exec = 0
let g:test#ruby#minitest#executable = 'm'

"https://github.com/janko-m/vim-test/blob/master/autoload/test/ruby/m.vim

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
"nmap <silent> t<C-n> :TestNearest<CR>
"nmap <silent> t<C-f> :TestFile<CR>
"nmap <silent> t<C-l> :TestLast<CR>
"nmap <silent> t<C-g> :TestVisit<CR>
"nmap <silent> t<C-s> :TestSuite<CR>

augroup rubyunittest
  autocmd!
  "autocmd BufRead,BufNewFile *_test.rb       nmap <buffer> tt :lcd %:p:h <bar> TestNearest<CR>
  "autocmd BufRead,BufNewFile *_test.rb       nmap <buffer> tf :lcd %:p:h <bar> TestFile<CR>
  "autocmd BufRead,BufNewFile *.rb       nmap <buffer> tl :TestLast<cr>

  autocmd BufRead,BufNewFile *.rb  nmap <buffer> tf :call g:RubyUnitTestFile()<cr>
  autocmd BufRead,BufNewFile *.rb  nmap <buffer> tt :call g:RubyUnitTestCase()<cr>
  autocmd BufRead,BufNewFile *.rb  nmap <buffer> gt :call g:RubySwitchTest()<cr>

  function! g:RubySwitchTest()
    :lcd %:p:h
    let file_relative_name = expand("%")
    let file_relative_name_no_ext  = expand("%:r")

    let index_start = match(file_relative_name, "_test.rb$")
    if -1 != index_start
        "end with _test.rb, ie. current in _test.rb
        let target_file = file_relative_name[0:index_start-1] . ".rb"
        "echo "file_relative_name:". file_relative_name
        "echo "index_start:".index_start 
        "echo "target_file:".target_file
    else
        let target_file = file_relative_name_no_ext . "_test.rb"
    endif 

    let cmd = "e " . target_file
    "echo cmd
    :execute cmd
  endfunction


  function! g:RubyUnitTestFile()
    :lcd %:p:h
    let file_relative_name = expand("%")
    let file_relative_name_no_ext  = expand("%:r")

    if -1 != match(file_relative_name, "_test.rb$")
        "end with _test.rb, ie. current in _test.rb
        let test_file = file_relative_name
        let cmd = "!clear && m " . test_file
        :execute cmd
    else
        let test_file = file_relative_name_no_ext . "_test.rb"
        let cmd = "!clear && m " . test_file
        :execute cmd 
    endif 
  endfunction
  
  function! g:RubyUnitTestCase()
    :lcd %:p:h
    let file_relative_name = expand("%")
    let file_relative_name_no_ext  = expand("%:r")

    if -1 != match(file_relative_name, "_test.rb$")
        "end with _test.rb, ie. current in _test.rb
        let test_file = file_relative_name
        let cmd = "!clear && m " . test_file . ":". line(".")
        :execute cmd
    else
        let test_file = file_relative_name_no_ext . "_test.rb"
        let cmd = "!clear && m " . test_file
        :execute cmd 
    endif 
  endfunction

augroup END


