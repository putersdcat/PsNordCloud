# iex (iwr http://bit.do/ePmhY)
# "☁Nordcloud"
# https://manytools.org/hacker-tools/convert-images-to-ascii-art/go
# Using cloud image cut from https://nordcloud.com/wp-content/uploads/2018/07/Logo-blue.png
#
# http://patorjk.com/software/taag/#p=testall&f=Big&t=Nordcloud
# https://www.ascii-code.com/
#
<#   

[string[]]$NordcloudLogo = `
"`n`n           @@@@        _   _               _      _                 _            ",
"       @@@%    @.     | \ | | ___  _ __ __| | ___| | ___  _   _  __| |           ",
"     ‰@@    Å  °@&    |  \| |/ _ \| `'__/ _`` |/ __| |/ _ \| | | |/ _`` |           ",
"    &@     /_\   @&   | |\  | (_) | | | (_| | (__| | (_) | |_| | (_| |           ",
"     °@@&‰, \\@@@%    |_| \_|\___/|_|  \__,_|\___|_|\___/ \__,_|\__,_|           `n`n";
$EncodedLogo = @(); foreach ($Line in $NordcloudLogo) { [string[]]$EncodedLogo += [string]$([system.convert]::tobase64string([system.text.encoding]::unicode.getBytes("$Line"))) }
$EncodedLogo[0..$EncodedLogo.Count] | %{ Write-Host -foregroundcolor White -BackgroundColor Black $([System.Text.Encoding]::UNICODE.GetString([System.Convert]::FromBase64String($_))) } 

#>

function Set-WindowToMyStyle{ 
# Function to Set desired window color and size and title and buffer size
param([string]$WindowTitle,[int]$WindowDivisorWidth=3,[int]$WindowDivisorHeight=4);
function Size($width, $height) {New-Object System.Management.Automation.Host.Size($width, $height)}
[int]$width = $host.ui.rawui.MaxPhysicalWindowSize.Width - $($host.ui.rawui.MaxPhysicalWindowSize.Width / $WindowDivisorWidth)
[int]$height = $host.ui.rawui.MaxPhysicalWindowSize.Height - $($host.ui.rawui.MaxPhysicalWindowSize.Height / $WindowDivisorHeight)
$ui = $Host.UI.RawUI
$ui.BufferSize = size $width '9999'
$ui.BufferSize = size $width '9999'
$ui.WindowSize = size $width $height
$ui.WindowSize = size $width $height
$ui.BackgroundColor = "Black"
$ui.ForegroundColor = "White"
if($WindowTitle) { # If a WindowTitle parameter has been passed to the script, then set it.
    $ui.WindowTitle = $WindowTitle
} elseif ($($ui.WindowTitle).split(":")[1] -eq " Windows PowerShell") { 
    # If window title is powershell default, "USERNAME: Windows PowerShell", then set something else.
    $ui.WindowTitle = "MGMT Tool"
} # Else nothing is done preserving the current setting.
Clear-Host
}

Function WriteNordcloudLogoEncoded {
[string[]]$EncodedLogo = "CgAKACAAIAAgACAAIAAgACAAIAAgACAAIABAAEAAQABAACAAIAAgACAAIAAgACAAIABfACAAIAAgAF8AIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAXwAgACAAIAAgACAAIABfACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIABfACAAIAAgACAAIAAgACAAIAAgACAAIAAgAA==",
"IAAgACAAIAAgACAAIABAAEAAQAAlACAAIAAgACAAQAAuACAAIAAgACAAIAB8ACAAXAAgAHwAIAB8ACAAXwBfAF8AIAAgAF8AIABfAF8AIABfAF8AfAAgAHwAIABfAF8AXwB8ACAAfAAgAF8AXwBfACAAIABfACAAIAAgAF8AIAAgAF8AXwB8ACAAfAAgACAAIAAgACAAIAAgACAAIAAgACAA",
"IAAgACAAIAAgADAgQABAACAAIAAgACAAxQAgACAAsABAACYAIAAgACAAIAB8ACAAIABcAHwAIAB8AC8AIABfACAAXAB8ACAAJwBfAF8ALwAgAF8AYAAgAHwALwAgAF8AXwB8ACAAfAAvACAAXwAgAFwAfAAgAHwAIAB8ACAAfAAvACAAXwBgACAAfAAgACAAIAAgACAAIAAgACAAIAAgACAA",
"IAAgACAAIAAmAEAAIAAgACAAIAAgAC8AXwBcACAAIAAgAEAAJgAgACAAIAB8ACAAfABcACAAIAB8ACAAKABfACkAIAB8ACAAfAAgAHwAIAAoAF8AfAAgAHwAIAAoAF8AXwB8ACAAfAAgACgAXwApACAAfAAgAHwAXwB8ACAAfAAgACgAXwB8ACAAfAAgACAAIAAgACAAIAAgACAAIAAgACAA",
"IAAgACAAIAAgALAAQABAACYAMCAsACAAXABcAEAAQABAACUAIAAgACAAIAB8AF8AfAAgAFwAXwB8AFwAXwBfAF8ALwB8AF8AfAAgACAAXABfAF8ALABfAHwAXABfAF8AXwB8AF8AfABcAF8AXwBfAC8AIABcAF8AXwAsAF8AfABcAF8AXwAsAF8AfAAgACAAIAAgACAAIAAgACAAIAAgACAACgAKAA==";
$EncodedLogo[0..$EncodedLogo.Count] | %{ Write-Host -foregroundcolor White -BackgroundColor Black $([System.Text.Encoding]::UNICODE.GetString([System.Convert]::FromBase64String($_))) } 
}

#Measure-Command{WriteNordcloudLogo}
#Measure-Command{WriteNordcloudLogoEncoded}

#Set-WindowToMyStyle -WindowTitle '☁Nordcloud'
Set-WindowToMyStyle -WindowTitle $($([char]0x2601)+"Nordcloud")
WriteNordcloudLogoEncoded
