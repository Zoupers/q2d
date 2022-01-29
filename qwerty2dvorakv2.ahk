#SingleInstance force
#MaxHotkeysPerInterval 100
#UseHook
Process, Priority,, Realtime
SetKeyDelay -1

Menu, Tray, NoStandard
Menu, Tray, Tip, 键盘布局 - Dvorak
Menu, Tray, Add, 切换 (&Q), MenuSuspend
Menu, Tray, Add, 切换 (&Q), MenuSuspend
Menu, Tray, Add, 退出 (&E), MenuExit
Menu, Tray, Default, 切换 (&Q)
Menu, Tray, Click, 1
Suspend Off
Menu, Tray, Icon, D.ico, 1, 1


return

MenuExit:
  ExitApp

MenuSuspend:
  Suspend Permit
  if (A_IsSuspended) {
    Suspend Off
    Menu, Tray, Icon, D.ico, 1, 1
    Menu, Tray, Tip, 键盘布局 - Dvorak
  } else {
    Suspend On
    Menu, Tray, Icon, Q.ico, 1, 1
    Menu, Tray, Tip, 键盘布局 - QWERTY
  }
  return

~RControl::
  Suspend Permit
  if (!p) {
    p := true
    ck := A_TimeSincePriorHotkey
    plclick := A_PriorHotkey = "*RControl up"
  }
  ; Send {RControl}
  return

*RControl up::
  Suspend Permit
  
  p := false
  if ((ck < 200) && (ck > 0) && plclick) {
    if(q){
      Suspend Off
      Menu, Tray, Icon, D.ico, 1, 1
      Menu, Tray, Tip, 键盘布局 - Dvorak
      q := false
    }else{
      Suspend On
      Menu, Tray, Icon, Q.ico, 1, 1
      Menu, Tray, Tip, 键盘布局 - QWERTY
      q := true
    }
  }
  ; Send {RControl Up}
  return

-::[
=::]
q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
[::/
]::=
a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
'::-
z::`;
x::q
c::j
v::k
b::x
n::b
m::m
,::w
.::v
/::z