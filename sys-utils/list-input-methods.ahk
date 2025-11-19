; === AHK v2 一键诊断：显示你当前正使用的输入法 KLID ===
#SingleInstance Force
#Requires AutoHotkey v2.0

; 获取前台窗口当前真正的输入法句柄
hwnd := WinActive("A")
hkl := DllCall("GetKeyboardLayout", "Ptr", DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "Ptr", 0))
klid := Format("0x{:08X}", hkl)

MsgBox("你现在正在用的输入法 KLID 是：`n`n" klid 
     . "`n`n请把这个数字复制，替换到你切换脚本里的 WB_KLID！", 
     "当前输入法诊断结果")

SoundBeep 1500, 200   ; 成功运行会叮一声