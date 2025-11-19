; === AutoHotkey v2 永久版：中英文↔五笔切换（上下箭头专用）===
; 适用于所有已把 Left/Right 占用的用户（比如你）

#SingleInstance Force          ; 防止多开
#Requires AutoHotkey v2.0      ; 强制 v2 语法

EN_KLID := 0x04090409          ; 英文 US 键盘（固定值，99.999% 用户相同）
WB_KLID := 0x08040804        ; ← 务必改成你自己五笔的 KLID（必须带 0x！！！）

; Ctrl + Alt + ↑ → 强制切到英文
;^!Up:: PostMessage(0x0050, 0, EN_KLID, , "A")

; Ctrl + Alt + ↓ → 强制切到五笔
;^!Down:: PostMessage(0x0050, 0, WB_KLID, , "A")


^!Up:: {
    PostMessage(0x0050, 0, EN_KLID, , "A")
    SoundBeep 1000, 80   ; 高频“叮” → 表示切到英文
}

^!Down:: {
    PostMessage(0x0050, 0, WB_KLID, , "A")
    SoundBeep 600, 120   ; 低频“咚” → 表示切到五笔
}