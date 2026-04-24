<#
.SYNOPSIS
	Recursively removes empty subdirectories from a specified root directory.

.DESCRIPTION
	This script traverses a directory tree recursively and deletes empty subdirectories (containing no files or folders).
	
	Child directories are processed first, so that directories containing empty subdirectories are also removed.

.PARAMETER InputPath
	Specifies the root directory (to be processed).

.PARAMETER RootPath
	Internal parameter, used to track the root directory

.EXAMPLE
	Remove-Empty -Path "C:\foo\"

.NOTES
	Version:		1.0
	Author:			Pedro Henrique Mattos
	Creation Date:	23.04.2026
#>
function Remove-Empty {
	[CmdletBinding()]
    param(
		[Parameter(Mandatory = $true)]
		[string]$Path,
		
		[string]$RootPath
    )
	
	if (-not $RootPath) {
		$RootPath = $Path
		Write-Verbose "Processing subdirectories in root: $RootPath"
	}
	
    foreach ($Dir in Get-ChildItem -Force -LiteralPath $Path -Directory -ErrorAction SilentlyContinue) {
        Remove-Empty -Path $Dir.FullName -RootPath $RootPath
    }
	
    if ($Path -ne $RootPath -and -not (Get-ChildItem -Force -LiteralPath $Path -ErrorAction SilentlyContinue)) {
		$RelativePath = [System.IO.Path]::GetRelativePath((Resolve-Path $RootPath), (Resolve-Path $Path))
		Remove-Item -Force -LiteralPath $Path
		Write-Verbose ("Removed: {0}{1}" -f $RootPath, $RelativePath) 
	}
}