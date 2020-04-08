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

; turns to be 1 when ctrl-x is pressed
is_pre_x = 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc = 0

ReloadScript() {
  MsgBox, 4, AutoHotkey RELOAD, Note: all loaded AutoHotkey scripts will be reloaded!
  sleep 1000
  Reload
  return
} 

^!r::ReloadScript() ; Reload script with Ctrl+Alt+R
^!e::Suspend        ; Continue/Stop hotkeys with ctrl+alt+e

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}



delete_char()
{
  Send {Del}
  global is_pre_spc = 0
  Return
}
delete_backward_char()
{
  Send {BS}
  global is_pre_spc = 0
  Return
}
kill_line_after()
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_pre_spc = 0
  Return
}
kill_before()
{
  Send {ShiftDown}{HOME}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_pre_spc = 0
  Return
} 
go_left_tab()
{
  Send ^+{Tab}
  global is_pre_spc = 0
  Return
}
go_right_tab()
{
  Send ^{Tab}
  global is_pre_spc = 0
  Return
}
left_kill_word()
{
  Send ^+{Left}
  Send {Del}
  global is_pre_spc = 0
  Return
}
kill_ring_save()
{
  Send ^c
  global is_pre_spc = 0
  Return
}
find_file()
{
  Send ^o
  global is_pre_x = 0
  Return
}
move_beginning_of_line()
{
  global
  if is_pre_spc
    Send +{HOME}
  Else
    Send {HOME}
  Return
}
move_end_of_line()
{
  global
  if is_pre_spc
    Send +{END}
  Else
    Send {END}
  Return
}
previous_line()
{
  global
  if is_pre_spc
    Send +{Up}
  Else
    Send {Up}
  Return
}
next_line()
{
  global
  if is_pre_spc
    Send +{Down}
  Else
    Send {Down}
  Return
}
forward_char()
{
  global
  if is_pre_spc
    Send +{Right}
  Else
    Send {Right}
  Return
}
backward_char()
{
  global
  if is_pre_spc
    Send +{Left} 
  Else
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
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_beginning_of_line()
  Return
!a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^a
  Return 


^b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    backward_char()
  Return


^f::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_x
      find_file()
    Else
      forward_char()
  }
  Return  
!f::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^f
  Return 




+!]::
  If is_target()
    Send %A_ThisHotkey%
  Else
    go_right_tab()
  Return
+![::
  If is_target()
    Send %A_ThisHotkey%
  Else
    go_left_tab()
  Return


^w::
  If is_target()
    Send %A_ThisHotkey%
  Else
    left_kill_word()
  Return

  

^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_end_of_line()
  Return


^p::
  If is_target()
    Send %A_ThisHotkey%
  Else
    previous_line()
  Return
^n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    next_line()
  Return

^d::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_char()
  Return
^h::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_backward_char()
  Return 
^u::
  If is_target()
    Send %A_ThisHotkey%
  Else
    kill_before()
  Return
^k::
  If is_target()
    Send %A_ThisHotkey%
  Else
    kill_line_after()
  Return



;=====================================================================
; Start MAC-like hotkeys M+*
;---------------------------------------------------------------------

!c::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^c
  Return 
!x::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^x
  Return 
!v::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^v
  Return 
!t::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^t
  Return 
!w::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^w
  Return
!n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^n
  Return
!s::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^s
  Return 
!r::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^r
  Return 
!+r::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^+r
  Return 
!l::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^l
  Return
