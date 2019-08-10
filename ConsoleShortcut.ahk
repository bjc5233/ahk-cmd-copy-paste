;说明
;  增强终端窗口的快捷键支持. 如原始并没有复制粘贴快捷键, 此脚本增加该特性
;  cmd console
;    Ctrl + A ==> 全选复制
;    Ctrl + K ==> 复制最后一行命令内容
;    Ctrl + V ==> 粘贴
;    Ctrl + Z ==> 删除一个字符
;    Ctrl + L ==> 清屏
;    PageUp   ==> 向上滚动窗口
;    PageDn   ==> 向下滚动窗口
;  git bash
;    Ctrl + V ==> 粘贴
;    Ctrl + Z ==> 删除一个字符
;    Ctrl + L ==> 清屏
;    PageUp   ==> 向上滚动窗口
;    PageDn   ==> 向下滚动窗口
;注意
;  由于Ctrl + C在console中一般用于强制结束命令，因此转为Ctrl + K
#SingleInstance, Force

;========================= cmd console =========================
#IfWinActive ahk_class ConsoleWindowClass
    ^A::SendInput {RButton}S{Enter}
    ^K::
        SendInput {RButton}S{Enter}
        Sleep, 100
        lastLine =
        Loop, parse, Clipboard, `n, `r
        {
            lastLine := A_LoopField
        }
        lastLine := RegExReplace(lastLine, "U)^.*>", "")
        Clipboard := lastLine
    return

    ^V::SendInput {Raw}%clipboard%

    ^Z::SendInput {Backspace}
    ^L::SendInput cls{Enter}
    PgUp::SendInput {WheelUp 10}
    PgDn::SendInput {WheelDown 10}
#IfWinActive
;========================= cmd console =========================




;========================= git bash =========================
#IfWinActive ahk_class mintty
    ^V::SendInput {Raw}%clipboard%
    ^Z::SendInput {Backspace}
    ^L::SendInput clear{Enter}
    PgUp::SendInput {WheelUp 10}
    PgDn::SendInput {WheelDown 10}
#IfWinActive
;========================= git bash =========================