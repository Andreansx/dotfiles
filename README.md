<div align="center">
<h1>My dotfiles</h1>
<h4>In this repository you will find my configuration files for terminal emulators, window managers, code editors, color themes etc.</h4>
<img alt="Static Badge" src="https://img.shields.io/badge/arch-%231793D1?style=for-the-badge&logo=archlinux&logoColor=white&logoSize=auto">
<img alt="Static Badge" src="https://img.shields.io/badge/gnome-%234A86CF?style=for-the-badge&logo=gnome&logoColor=white&logoSize=auto">
<img alt="Static Badge" src="https://img.shields.io/badge/kde_Plasma-1D99F3?style=for-the-badge&logo=gnome&logoColor=white&logoSize=auto">

<h3>Main Device</h3>
<h4>My main device is a Lenovo ThinkPad T450s. Currently running Windows 11 Pro. However, I will replace it with Arch Linux soon.</h4>

<h3>Prompts</h3>
</div>

When using the PowerShell prompts like **[`win11-main.omp.json`](./prompts/win11-main.omp.json)**, you need to create a file like `Microsoft.PowerShell_profile.ps1` and place something like this in it:
```powershell
oh-my-posh init pwsh --config 'C:\Users\...\my-prompt.omp.json' | Invoke-Expression
```
