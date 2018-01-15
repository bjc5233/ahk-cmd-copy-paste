;说明
;  终端窗口原始并没有复制粘贴相关快捷键操作, 此脚本增加该特性
;  cmd console
;    Ctrl + A ==> 全选复制
;    Ctrl + C ==> 复制最后一行命令内容
;    Ctrl + V ==> 粘贴
;    Ctrl + Z ==> 删除一个字符
;  git bash
;    Ctrl + V ==> 粘贴
;    Ctrl + Z ==> 删除一个字符
;注意
;  由于Ctrl + C在console中一般用于强制结束命令，因此转为Ctrl + K

#SingleInstance,Force

;========================= cmd console =========================
#IfWinActive ahk_class ConsoleWindowClass
^A::
SendInput {RButton}S{Enter}
return

^K::
SendInput {RButton}S{Enter}
lastLine =
Loop, parse, Clipboard, `n, `r
{
    lastLine := A_LoopField
}
lastLine := RegExReplace(lastLine, "U)^.*>", "")
Clipboard := lastLine
return

^V::
SendInput {Raw}%clipboard%
return

^Z::
SendInput {Backspace}
return
#IfWinActive
;========================= cmd console =========================




;========================= git bash =========================
#IfWinActive ahk_class mintty
^V::
SendInput {Raw}%clipboard%
return

^Z::
SendInput {Backspace}
return
#IfWinActive
;========================= git bash =========================