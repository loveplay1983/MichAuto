; ==============================================================================
; AUTO-ADMIN & SETTINGS
; ==============================================================================
#Requires AutoHotkey v2.0
#SingleInstance Force

; Your IDs (From your provided code)
EN_KLID := 0x04090409      ; English US
WB_KLID := 0x08040804      ; Target (Wubi/Chinese)

; ==============================================================================
; HOTKEY 1: Ctrl + Alt + UP -> Force English
; ==============================================================================
^!Up:: {
    try {
        ; Send the message to the active window ("A") to switch language
        PostMessage(0x0050, 0, EN_KLID, , "A")
        
        ; Audio Feedback: High Pitch "Ding"
        SoundBeep(1500, 200)
        
        ; Visual Feedback: Tooltip (Optional)
        ToolTip("English Mode")
        SetTimer () => ToolTip(), -1000 ; Hide after 1 second
    }
}

; ==============================================================================
; HOTKEY 2: Ctrl + Alt + DOWN -> Force Target (Wubi)
; ==============================================================================
^!Down:: {
    try {
        ; Send the message to the active window ("A") to switch language
        PostMessage(0x0050, 0, WB_KLID, , "A")
        
        ; Audio Feedback: Low Pitch "Dong"
        SoundBeep(600, 200)
        
        ; Visual Feedback: Tooltip (Optional)
        ToolTip("Target Mode")
        SetTimer () => ToolTip(), -1000 ; Hide after 1 second
    }
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