<h2>Prompts</h2>
<h2>PowerShell prompt installation</h2>
</div>

>[!NOTE]
>Installing the styles for PowerShell is a bit more compilacted than just copying to **`~/.bashrc`** but it's still easy to do. The difference is that you need another file besides your theme file.

1. First you need to install **Oh My Posh**:  

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```
2. **Oh My Posh** uses special icons which need some type of **Nerd Font**    
Download a font you like from [Nerd Fonts Downloads](https://www.nerdfonts.com/font-downloads),install it globally on your PC and set it as a default font for your PowerShell terminal. I recommend **Fira Code Nerd Font**

4. Clone this repository
```bash
git clone https://github.com/andreansx/dotfiles ./dotfiles
```
4. Find you profile path
```powershell
$PROFILE
```
5. Create a directory for your profile
```powershell
New-Item -ItemType Directory -Path (Split-Path $PROFILE) -Force
```
6. Let's say you cloned this repo to `~/dotfiles`  
You need to clone the profile file, for example the **[`Microsoft.PowerShell_profile.ps1`](./PowerShell/Microsoft.PowerShell_profile.ps1)** if you want to use **[`win11-main.omp.json`](./PowerShell/win11-main.omp.json)**:
```powershell
Copy-Item "./dotfiles/PowerShell/<NAME_OF_FILE_HERE>.ps1" -Destination $PROFILE -Force
```
Every theme needs to have a appropriately modified profile file. Mostly just need to change the file name and thats it  
And clone the theme file like **[`win11-main.omp.json`](./PowerShell/win11-main.omp.json)**
```powershell
Copy-Item "./dotfiles/PowerShell/<NAME_OF_FILE_HERE>.omp.json" -Destination (Join-Path (Split-Path $PROFILE) "<NAME_OF_FILE_HERE>.omp.json") -Force
```
7. Reload PowerShell
```powershell
. $PROFILE
```

