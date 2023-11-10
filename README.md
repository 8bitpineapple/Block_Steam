# Block_Steam
A Batch file script to toggle steams access to the internet.

To use:
Download the batch file Block_Steam.bat
Run as Admin - This should disable steam from the internet.
Run as Admin again - This should renable steam to the internet.

For ease of use you can create a windows shortcut that runs as admin:
Right-click on the batch file and select "Create shortcut." (Show more options on Windows 11)
Right-click on the shortcut and choose "Properties."
In the "Shortcut" tab, click the "Advanced" button.
Check the box that says "Run as administrator."

How it works:
The script checks if you have the firewall rule "Steam_Internet"
If you do it toggles it on and off. (Whichever it isn't)

If you do not have the rule, it fetches the steam.exe location from the windows registry.
It then adds the firewall rule

