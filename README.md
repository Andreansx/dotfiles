<div align="center">
<h1>My dotfiles</h1>
  <img alt="Static Badge" src="https://img.shields.io/badge/arch-%231793D1?style=for-the-badge&logo=archlinux&logoColor=white&logoSize=auto">
<img alt="Static Badge" src="https://img.shields.io/badge/gnome-%234A86CF?style=for-the-badge&logo=gnome&logoColor=white&logoSize=auto">
<h4>In this repository you will find my configuration files for terminal emulators, window managers, code editors, color themes etc.</br> Everything is done on Arch Linux</h4>

</div>

>[!IMPORTANT]
>I will try to make the repository as organised as I can but the themes and styles need to be installed manually. Maybe in some time I will make a script for installation

# 01 - main rice:

<img src="./media/preview.png">

## Files
*   **[kitty.conf](./kitty/kitty.conf)**
*   **[.bashrc](./Bash/01.bashrc)**
*   **[wallpaper](./wallpapers/IMG_3151.jpeg)**
*   **[fastfetch](./fastfetch/config1.jsonc)**

#
*   Hardware:   **ThinkPad T450s**  
*   OS: **Arch Linux**  
*   DE: **GNOME 48.2**  
*   Terminal: **Kitty 0.42.1**  
*   Terminal font: **BlexMonoNF**  
*   Cursor: **Bibata cursor Ice**

# 02:

![preview02](./media/preview2.png)

## Files
*   **[kitty.conf](./kitty/kitty.conf)**
*   **[.bashrc](./Bash/02.bashrc)**
*   **[fastfetch](./fastfetch/config2.jsonc)**
*   **[gnome-extensions](./gnome-extensions/)**
*   **[font](./fonts/BlexMonoNerdFont-Regular.ttf)**
*   **[kitty-theme](./kitty/)**
<h2>Fonts</h2>
</div>

The configuration files for Kitty require a **Nerd Font**. You can install one using `pacman`:

```bash
pacman -S ttf-meslo-nerd
```

>[!TIP]
>If the font you like isn't available in the Arch extras repository, you can grab it using `yay` or `paru`

```bash
yay -S ttf-ibmplex-mono-nerd
```
<div align="center">
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
