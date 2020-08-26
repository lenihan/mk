
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
$mkvar = @{}
$rootDataFile = "$HOME/mk.psd1"
if (!(Test-Path $rootDataFile)) {
    if ($IsWindows) {
        Write-Host "Looking for Visual Studio installs..."
        $vcbatName = "VsDevCmd.bat" 
        $vcbat = (Get-ChildItem -Path ${env:ProgramFiles(x86)} -Filter $vcbatName -Recurse -ErrorAction SilentlyContinue).FullName
        if ($vcbat.count -eq 0) {
            Write-Host "ERROR: Could not find Visual Studio file $vcbatName in ${env:ProgramFiles(x86)}" -ForegroundColor Red
            return
        }
        elseif ($vcbat.count -ne 1) {
            for ($i = 0; $i -lt $vcbat.count; $i++) {
                Write-Host "[$i] $($vcbat[$i])"
            }
            $num = Read-Host -Prompt "Multiple installations found. Enter number of installation to use"
            $vcbat = $vcbat[$num]
        }
        Write-Host "Found: $vcbat" -ForegroundColor Green

        # TODO - # Store mkvar in $rootDataFile
        # TODO find cl path
        # TODO find link path
        $command = '"{0}" & set' -f $bat
        & cmd /c $command | ForEach-Object {
            if ($_ -match "=") {
                $name, $value = $_.split("=")
                $mkvar[$name] = $value
            }
        }
        
        $mkvar
        # TODO
        # WindowsSDKLibVersion
        # INCLUDE
        # LIBPATH
        # VCToolsVersion
        # WindowsSdkVerBinPath
        # NETFXSDKDir
        # WT_SESSION
        # FrameworkVersion32
        # __DOTNET_ADD_32BIT
        # WindowsSdkDir
        # VSCMD_ARG_HOST_ARCH
        # ExtensionSdkDir
        # WindowsLibPath
        # FrameworkVersion
        # VCINSTALLDIR
        # VSINSTALLDIR
        # WindowsSdkBinPath
        # LIB
        # FSHARPINSTALLDIR
        # Framework40Version
        # VSCMD_VER
        # LANG
    }
}




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