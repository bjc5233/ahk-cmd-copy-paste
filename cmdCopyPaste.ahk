;说明
;  cmd窗口原始并没有复制粘贴相关快捷键操作, 此脚本增加该特性
;  Ctrl + A ==> 全选复制
;  Ctrl + C ==> 复制最后一行命令内容
;  Ctrl + V ==> 粘贴
;其他
;  第二部分中的mintty是git bash窗口，增加粘贴特性

#SingleInstance,Force
#IfWinActive ahk_class ConsoleWindowClass
^A::
SendInput {RButton}S{Enter}
return

^C::
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
#IfWinActive




#IfWinActive ahk_class mintty
^V::
SendInput {Raw}%clipboard%
return
#IfWinActive