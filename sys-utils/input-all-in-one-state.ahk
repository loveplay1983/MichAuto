; ==============================================================================
; AUTO-ADMIN & SETTINGS
; ==============================================================================
#Requires AutoHotkey v2.0
#SingleInstance Force

; Your IDs (From your provided code)
EN_KLID := 0x04090409      ; English US
WB_KLID := 0x08040804      ; Target (Wubi/Chinese)

; ==============================================================================
; HOTKEY 1: Ctrl + Space -> toggle English and Chinese based on different states
; ==============================================================================
#Requires AutoHotkey v2
#SingleInstance Force

; ====== 输入法 KLID（必须为 HKL 数值格式 0xXXXXXXXX）======
EN_KLID := 0x04090409   ; English (US)
WB_KLID := 0x08040804   ; Wubi (replace with your Wubi HKL)
; ========================================================

; ---- Ctrl + Space → 中英输入法自动切换 ----
^Space::{
    global EN_KLID, WB_KLID

    hwnd := WinActive("A")
    ThreadID := DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "Ptr", 0)
    cur := DllCall("GetKeyboardLayout", "UInt", ThreadID, "Ptr")

    if (cur = WB_KLID) {
        next := EN_KLID
        SoundBeep(1500, 120)
        ToolTip("EN")
    } else {
        next := WB_KLID
        SoundBeep(600, 120)
        ToolTip("五笔")
    }

    PostMessage(0x0050, 0, next,, "A")
    SetTimer(() => ToolTip(), -600)
}


; ==============================================================================
; DIAGNOSTIC TOOL (Press F1 only if you need to check IDs again)
; ==============================================================================
F1:: {
    hwnd := WinActive("A")
    ThreadID := DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "Ptr", 0)
    hkl := DllCall("GetKeyboardLayout", "UInt", ThreadID, "Ptr")
    klid := Format("0x{:08X}", hkl)
    MsgBox("Current ID: " klid)
}