
<#PSScriptInfo

.VERSION 0.0.0.0

.GUID 575efa69-ff85-400c-9968-9654825e8d16

.AUTHOR David Lenihan

.COMPANYNAME

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.DESCRIPTION 
 mk: PowerShell build system 

#> 

Param()


# This is the entry point for the build system. 
"mk: PowerShell Build System"
"By David Lenihan"
""


# To install this script:
# Install-Script mk


# TODO: command line option to force recreate $home/mk.psd1

$rootDataFile = "$HOME/mk.psd1"
if (!(Test-Path $rootDataFile)) {
    if ($IsWindows) {
        Write-Host "Looking for Visual Studio installs..." 
        $vcvarsall = (Get-ChildItem -Path ${env:ProgramFiles(x86)} -Filter vcvarsall.bat -Recurse -ErrorAction SilentlyContinue).FullName
        if ($vcvarsall.count -eq 0) {
            Write-Host "ERROR: Could not find a Visual Studio installation in ${env:ProgramFiles(x86)}" -ForegroundColor Red
            return
        }
        elseif ($vcvarsall.count -ne 1) {
            for ($i = 0; $i -lt $vcvarsall.count; $i++) {
                Write-Host "[$i] $($vcvarsall[$i])"
            }
            $num = Read-Host -Prompt "Multiple installations found. Enter number of installation to use"
            $vcvarsall = $vcvarsall[$num]
        }
        Write-Host "Found: $vcvarsall" -ForegroundColor Green
    }
}


 
        # TODO: path to cl
#Set environment variables for Visual Studio Command Prompt
# pushd 'c:\Program Files (x86)\Microsoft Visual Studio 10.0\VC'
# cmd /c "vcvarsall.bat&set" |
# foreach {
#   if ($_ -match "=") {
#     $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
#   }
# }
# popd
# write-host "`nVisual Studio 2010 Command Prompt variables set." -ForegroundColor Yellow



        # TODO: include path
#         # TODO: lib path
#     }
#     elseif ($IsLinux) {
#         # TODO
#     }
# }

# TODO find all mk.psd1 starting at current directory all the way to $home, store in arraylist
# read all mk.psd1's starting at root down to current
# . $rootDataFile - like this?