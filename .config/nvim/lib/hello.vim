function!SayHello()
  echo 'Hello, from vim'
endfunction

command!Hello call SayHello()

nnoremap Q:Hello<CR>
