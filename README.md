# Remove Empty Directories
Recursively removes empty subdirectories from a specified root directory.

## Description
This script recursively traverses a specified directory tree and deletes empty subdirectories (containing no files or folders). Child directories are processed first, so that directories containing empty subdirectories are also removed (bottom-up recursion).

## Usage
### Step one: download
Extract the entire GitHub repository onto your desktop by selecting `Code` and then `.zip` from the drop down menu. 

### Step two: install
Open a PowerShell console and execute the following command to install the module into your `$env:PSModulePath`
```
Import-Module -Name ./path/RemoveEmptyModule.psm1
```

You can check whether the module has been successfully installed by running:
```
Get-Command Remove-Empty
```

Or alternatively

```
Get-Help Remove-Empty
```

### Step three: run
Enter the below command to use the command `Remove-Empty`:
```
Remove-Empty -Path <Path>
```

**Note:** replace `<Path>` with the parent directory that you wish to clean up. (This is the root directory which will not be removed).

