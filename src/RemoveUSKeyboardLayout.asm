format PE GUI 4.0
entry start

include 'win32a.inc'

section '.text' code readable executable
  start:
	invoke LoadKeyboardLayout, str_us_keyboard, 1
	invoke UnloadKeyboardLayout, eax
  exit:
	invoke	ExitProcess, 0

  str_us_keyboard:
    db "00000409", 0

section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
	  user32,'USER32.DLL'

  import kernel,\
	 ExitProcess,'ExitProcess'

  import user32,\
	 LoadKeyboardLayout,'LoadKeyboardLayoutA',\
	 UnloadKeyboardLayout,'UnloadKeyboardLayout'
