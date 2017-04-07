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
#,::Send {Volume_Down 3}
#.::Send {Volume_Up 3}
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

