#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; don't run multiple instance of this script
#SingleInstance force

;;CapsLock is a new Ctrl
;;----------------------
+Capslock::Capslock
Capslock::Ctrl

;; Win+, Win+. & Win+/ to control Volume
;;--------------------------------------
#,::Send {Volume_Down 5}
#.::Send {Volume_Up 5}
;#/::Volume_Mute

;; Menor que y mayor que en teclado americano
;;-------------------------------------------
ç::SendInput {<}
+ç::SendInput {>}

;;Rearrange Home, End, Supr & Insert
;;----------------------------------
;Insert::Send {Home}
;+Insert::
;  SendInput {Shift down}
;  SendInput {Home}
;  SendInput {Shift up}
;  return

;Home::Send {End}
;+Home::
;  SendInput {Shift down}
;  SendInput {End}
;  SendInput {Shift up}
;  return

;End::Send {Insert}
;+End::
;  SendInput {Shift down}
;  SendInput {Insert}
;  SendInput {Shift up}
;  return

;;More ergonomics Alt,Ctrl & WinKey
;;---------------------------------
;LAlt::LCtrl
;LWin::LAlt
;LCtrl::LWin

;; Win-H Minimize
;;----------------
#h::WinMinimize,A

;; Don't activate when in ErgoEmacs (because ErgoEmacs already defines them)
;;--------------------------------------------------------------------------

#IfWinNotActive ahk_class Emacs

^q::
  SendInput {Alt down}
  SendInput {F4}
  SendInput {Alt up}
  return

  
;; make arrow keys on righthand home position
!i::
  SendInput {Up}
  return

!+i::
  SendInput {Shift down}
  SendInput {Up}
  SendInput {Shift up}
  return

!j::
  SendInput {Left}
  return

!+j::
  SendInput {Shift down}
  SendInput {Left}
  SendInput {Shift up}
  return

!k::
  SendInput {Down}
  return

!+k::
  SendInput {Shift down}
  SendInput {Down}
  SendInput {Shift up}
  return

!l::
  SendInput {Right}
  return

!+l::
  SendInput {Shift down}
  SendInput {Right}
  SendInput {Shift up}
  return


  
;; move by word
!u::
  SendInput {Ctrl down}
  SendInput {Left}
  SendInput {Ctrl up}
  return

!+u::
  SendInput {Ctrl down}
  SendInput {Shift down}
  SendInput {Left}
  SendInput {Shift up}
  SendInput {Ctrl up}
  return

!o::
  SendInput {Ctrl down}
  SendInput {Right}
  SendInput {Ctrl up}
  return

!+o::
  SendInput {Ctrl down}
  SendInput {Shift down}
  SendInput {Right}
  SendInput {Shift up}
  SendInput {Ctrl up}
  return

;; move to home/end
!h::
  SendInput {Home}
  return
+!h::
  SendInput {End}
  return

;; delete char forwards/backwards (no yank needed)
!f::
  SendInput {Delete} 
  return
!d::
  SendInput {Backspace}
  return

;; kill rest of line forwards
!g::
  SendInput {Shift down}
  SendInput {End}
  SendInput {Shift up}
  SendInput {Ctrl down}
  SendInput {x}
  SendInput {Ctrl up}
  return

;; kill line backwards (shift-home key combo mapped to a !+-key causes trouble)
!b::
  SendInput {Shift down}
  SendInput {Home}
  SendInput {Shift up}
  SendInput {Ctrl down}
  SendInput {x}
  SendInput {Ctrl up}
  return 

;; kill word backwards
!e::
  SendInput {Ctrl down}
  SendInput {Shift down}
  SendInput {Left}
  SendInput {Ctrl up}
  SendInput {Shift up}
  SendInput {Ctrl down}
  SendInput {x}
  SendInput {Ctrl up}
  return

;; delete word forwards
!r::
  SendInput {Ctrl down}
  SendInput {Shift down}
  SendInput {Right}
  SendInput {Ctrl up}
  SendInput {Shift up}
  SendInput {Ctrl down}
  SendInput {x}
  SendInput {Ctrl up}
  return

;; cut copy paste
!x::
  SendInput {Ctrl down}
  SendInput {x}
  SendInput {Ctrl up}
  return
!c::
  SendInput {Ctrl down}
  SendInput {c}
  SendInput {Ctrl up}
  return
!v::
  SendInput {Ctrl down}
  SendInput {v}
  SendInput {Ctrl up}
  return

;; undo/redo
!z::
  SendInput {Ctrl down}
  SendInput {z}
  SendInput {Ctrl up}
  return

!+z::
  SendInput {Ctrl down}
  SendInput {Shift down}
  SendInput {z}
  SendInput {Shift up}
  SendInput {Ctrl up}
  return

!y::
  SendInput {Ctrl down}
  SendInput {y}
  SendInput {Ctrl up}
  return


;;Not quite ergo-emacs but still useful to have globally:

;; put parens around a word
;!n::
;  SendInput {Ctrl down}
;  SendInput {Left}
;  SendInput {Ctrl up}
;  SendInput {(}
;  SendInput {Ctrl down}
;  SendInput {Right}
;  SendInput {Ctrl up}
;  SendInput {)}
;  return

;; deletes first and last char of a word (removing parens)
;!+n::
;  SendInput {Ctrl down}
;  SendInput {Left}
;  SendInput {Ctrl up}
;  SendInput {Del}
;  SendInput {Ctrl down}
;  SendInput {Right}
;  SendInput {Ctrl up}
;  SendInput {BS}
;  return

;; copy rest of line (broken because of '!+' again)
; !+g::				  
;   SendInput {Shift down}
;   SendInput {End}
;   SendInput {Shift up}
;   SendInput {Ctrl down}
;   SendInput {x}
;   SendInput {Ctrl up}
;   return


;;Ctrl-Spc && Alt-Spc Set Mark
;global keystate:= down

;!Space::
;  SendInput {Shift %keystate%}
;  if keystate = down
;  SetEnv, keystate, up
;  else if keystate = up
;  SetEnv, keystate, down
;  return


