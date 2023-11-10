# Block_Steam
A Batch file script to toggle Steams access to the internet.

# To use:
[Download](https://github.com/8bitpineapple/Block_Steam/releases/download/v1.0.1/block_steam.bat) the batch file Block_Steam.bat
1. Right click Run as Admin - This should disable steam from the internet.
2. Run as Admin again - This should re-enable steam to the internet.

# Windows Shortcut to run as admin by default.
For ease of use you can create a windows shortcut that runs as admin:
1. Right-click on the batch file and select "Create shortcut." (Show more options on Windows 11)
2. Right-click on the shortcut and choose "Properties."
3. In the "Shortcut" tab, click the "Advanced" button.
4. Check the box that says "Run as administrator."

# How it works
The script checks if you have the firewall rule "Steam_Internet"
If you do it toggles it and the script ends.

If you do not have the rule, it fetches the steam.exe location from the windows registry.
It then adds the firewall rule

If for some reason Steams directory is not found in the registy and the rule needs to be made, it will just say echo Steam not found in the registry.
You will have to manually load your firewall and create the rule "Block_Steam"
