; v1
; Ubuntu-style workspace switching on Windows
;!Right::Send, ^#{Right}    ; Alt + → → Next desktop
;!Left::Send,  ^#{Left}     ; Alt + ← → Previous desktop
;return


;v2
; Ubuntu-style workspace switching on Windows (AHK v2)
!^Right::Send("^#{Right}")   ; Alt + → → Next desktop
!^Left::Send("^#{Left}")     ; Alt + ← → Previous desktop
