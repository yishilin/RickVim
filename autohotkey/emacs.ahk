;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;; from https://github.com/usi3/emacs.ahk
;;
; + Shift
; ^ Ctrl
; # Win
; ! Alt
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0


ReloadScript() {
  MsgBox, 4, AutoHotkey Reloaded, Note: all loaded AutoHotkey scripts will be reloaded!
  sleep 1000
  Reload
  return
} 

^!r::ReloadScript() ; Reload script with Ctrl+Alt+R
^!e::Suspend        ; Continue/Stop hotkeys with ctrl+alt+e


; Applications you want to disable emacs-like keybindings
; return 1: not use autohotkey
; return 0: use au tohotkey
NotUseAutohotkey()
{
  SetTitleMatchMode,RegEx


  ;title include onenote, case insensitive
  IfWinActive, i)onenote
    Return 0


  IfWinActive,ahk_exe msedge.exe
    Return 0


  ;ahk_class Notepad
  ;ahk_exe notepad.exe
  IfWinActive,ahk_exe notepad.exe
    Return 0


  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 

  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1

  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1

  ;ahk_class Vim
  ;ahk_exe gvim.exe
  IfWinActive,ahk_class Vim ; GVIM
    Return 1


  ;Merlin, Cygwin
  ;ahk_class ConsoleWindowClass
  ;ahk_exe powershell.exe
  
  ;ahk_class ConsoleWindowClass
  ;ahk_exe powershell.exe
  
  ;ahk_class ConsoleWindowClass
  ;ahk_exe vim.exe

  ;ahk_class ConsoleWindowClass
  ;ahk_exe cmd.exe

  IfWinActive, ahk_class ConsoleWindowClass
    Return 1

  ;ahk_class mintty  ;git bash
  ;ahk_exe mintty.exe
  IfWinActive, ahk_class mintty
    Return 1


  ;ahk_class PX_WINDOW_CLASS
  ;ahk_exe sublime_text.exe
  IfWinActive, ahk_exe sublime
    Return 1
  
  ;ahk_class HwndWrapper[PowerShell_ISE.exe;;2743ac2d-9a77-4ebb-8283-b6ac2472d810]
  ;ahk_exe PowerShell_ISE.exe
  IfWinActive, ahk_exe PowerShell
    Return 1
  
  ;ahk_class Chrome_WidgetWin_1
  ;ahk_exe Code.exe
  IfWinActive, ahk_exe Code.exe
    Return 1
  
  ;ahk_exe WindowsTerminal.exe
  ;ahk_class CASCADIA_HOSTING_WINDOW_CLASS
  IfWinActive, ahk_exe WindowsTerminal.exe 
    Return 1

  ;defualt not use autohotkey
  Return 1 
}



copy()
{
  ;Send ^c
  ;MsgBox, %A_ThisHotkey% was pressed.
  send {CTRLDOWN}c{CTRLUP}
  Return
}

delete_char()
{
  Send {Del}
  Return
}
delete_backward_char()
{
  Send {BS}
  Return
}
kill_line_after()
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  Return
}
kill_before()
{
  Send {ShiftDown}{HOME}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  Return
} 
go_left_tab()
{
  Send ^+{Tab}
  Return
}
go_right_tab()
{
  Send ^{Tab}
  Return
}
left_kill_word()
{
  Send ^+{Left}
  Send {Del}
  Return
}
move_beginning_of_line()
{
  Send {HOME}
  Return
}
move_end_of_line()
{
  Send {END}
  Return
}
previous_line()
{
  Send {Up}
  Return
}
next_line()
{
  Send {Down}
  Return
}
forward_char()
{
  Send {Right}
  Return
}
backward_char()
{
  Send {Left}
  Return
}

;=====================================================================
; Start the configuration
;---------------------------------------------------------------------

;https://www.autohotkey.com/boards/viewtopic.php?t=69154
;remap ctrl-a to new command and alt-a to original select all
if((A_PtrSize=8&&A_IsCompiled="")||!A_IsUnicode){ ;32 bit=4  ;64 bit=8
    SplitPath,A_AhkPath,,dir
    if(!FileExist(correct:=dir "\AutoHotkeyU32.exe")){
	    MsgBox error
	    ExitApp
    }
    Run,"%correct%" "%A_ScriptName%",%A_ScriptDir%
    ExitApp
    return
}

^a::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    ;MsgBox, 4, test
    move_beginning_of_line()
  Return
!a::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^a
  Return 




^b::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    backward_char()
  Return


^f::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
  {
    forward_char()
  }
  Return  
!f::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^f
  Return 




+!]::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    go_right_tab()
  Return
+![::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    go_left_tab()
  Return


^w::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    left_kill_word()
  Return

  

^e::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    move_end_of_line()
  Return


^p::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    previous_line()
  Return
^n::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    next_line()
  Return


^d::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    delete_char()
  Return
^h::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    delete_backward_char()
  Return 
^u::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    kill_before()
  Return
^k::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    kill_line_after()
  Return



;=====================================================================
; Start MAC-like hotkeys M+*, Alt+*
;---------------------------------------------------------------------

!c::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    copy()
  Return 

!x::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^x
  Return 

!v::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^v
  Return 
!t::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^t
  Return 
!w::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^w
  Return
!n::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^n
  Return
!s::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^s
  Return 
!r::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^r
  Return 
!+r::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^+r
  Return 
!l::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^l
  Return
!g::
  If NotUseAutohotkey()
    Send %A_ThisHotkey%
  Else
    Send ^g
  Return 
