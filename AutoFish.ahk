Process, Priority, , Realtime
#MenuMaskKey vkE8
#WinActivateForce
#InstallKeybdHook
#Persistent
#SingleInstance Force
#MaxHotkeysPerInterval 2000
SendMode Input
SetBatchLines, -1
SetKeyDelay, -1, 50
CoordMode Mouse, Screen
CoordMode ToolTip, Screen

Menu, Tray, NoStandard
Menu, Tray, Add, 启动
Menu, Tray, Add, 停止
Menu, Tray, Add, 退出

#Include Lib\FindText.ahk

; F2 启动
; F3 退出

F2::
启动:
  loop {
    ToolTip 自动钓鱼中, 10, 10
    Send {E Down}
    Sleep 1.5*1000
    Send {E Up}
    loop {
      ToolTip 等待上钩中, 10, 10
      Found:=0
      X:=Y:=""
      Text:="|<>*155$19.zzzs00w00S00D7zzXzzlzzszzwTzyDzz00TU07k03szzwTzyDzz7zzXzzlzzszzw00S00D007zzzU" ;2560*1600 E键
      Text.="|<>*146$14.zzs0601XzszyDzXzs0C03XzszyDzXzszyDzU0M07zzU" ;1920*1200 E键

      if (FindText(X, Y, 1200, 950, 1270, 1100, 0.02, 0.02, Text) or FindText(X, Y, 850, 600, 950, 820, 0.05, 0.05, Text)) {
        ; 检测到收杆，启动收杆
        Send {E}
        ToolTip 收杆, 10, 10
        Found := 1
      }
    } until Found=1
    Sleep 3*1000
  }

F3::
停止:
  Critical, On
  ToolTip 脚本已暂停,10,10
  Reload
  Critical, Off

F4::
退出:
  Critical, On
  ToolTip
ExitApp
Critical, Off
