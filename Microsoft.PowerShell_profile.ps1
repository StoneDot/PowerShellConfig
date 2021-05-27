# 参考資料: https://blog.mamansoft.net/2020/05/31/windows-terminal-and-power-shell-makes-beautiful/

Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PoshPrompt -Theme powerlevel10k_rainbow
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord
function l { Get-ChildItem | Format-Wide Name -AutoSize }
function cdr() { fd -H -t d -E .git -E node_modules | fzf | Set-Location }
function cdz() { z -l | oss | Select-Object -skip 3 | ForEach-Object { $_ -split " +" } | Select-String -raw '^[a-zA-Z].+' | fzf | Set-Location }


# PowerShell Core7でもConsoleのデフォルトエンコーディングはsjisなので必要
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# git logなどのマルチバイト文字を表示させるため (絵文字含む)
$env:LESSCHARSET = "utf-8"