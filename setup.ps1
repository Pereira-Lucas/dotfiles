New-Item -Path "~\AppData\Local\nvim" -Value ".\nvim" -ItemType SymbolicLink -Force

New-Item -Path "~\.config\starship.toml" -Value ".\.config\starship.toml" -ItemType SymbolicLink -Force
New-Item -Path "~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Value ".\.config\terminal\settings.json" -ItemType SymbolicLink -Force