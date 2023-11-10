# Block_Steam
A Batch file script to toggle steams access to the internet.

#To use:
Download the batch file Block_Steam.bat
Right click Run as Admin - This should disable steam from the internet.
Run as Admin again - This should renable steam to the internet.

#Windows Shortcut to run as admin by default.
For ease of use you can create a windows shortcut that runs as admin:
Right-click on the batch file and select "Create shortcut." (Show more options on Windows 11)
Right-click on the shortcut and choose "Properties."
In the "Shortcut" tab, click the "Advanced" button.
Check the box that says "Run as administrator."

#How it works
The script checks if you have the firewall rule "Steam_Internet"
If you do it toggles it and the script ends.

If you do not have the rule, it fetches the steam.exe location from the windows registry.
It then adds the firewall rule

If for some reason Steams directory is not found in the registy and the rule needs to be made, it will just say echo Steam not found in the registry.
