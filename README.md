# Phonecall Collection Wizard v1.0
# by Jim Mirra

**What it does.**
  Phonecall Collection Wizard is a simple program which records all phone records that go through the local PBX. PCW writes all phone records to both the terminal and to a file on your hard disk.  The file on disk is usually `C:\PHONE\PHONE.DAT` .  PCW also saves each month of data in a sperate file.  So if you are in June, and want July records, you will find it in `C:\PHONE\JULPAK.DAT` if you are at Packer and the year is 97. (PAK is Packer and GLO is Gloucester).
  
**How it does it.**
  Phonecall Collection Wizard simply opens the communications port that your PBX is connected to.  PCW opens each port with a specified set of parameters. Here are your two settings:
  
    PAK
      com:........1
      baud:.......1200
      parity:.....Odd
      data bits:..7
      stop bits:..1
     
    GLO
      com:........1
      baud:.......300
      parity:.....None
      data bits:..7
      stop bits:..1
 
PCW saves all your month's current data in your data file: `C:\PHONE\PHONE.DAT`.  PCW closes and saves each day's records at midnight, to ensure only minimal data loss in case of a power outage or computer lockup.  At the end of each month PCW saves all current data in `C:\PHONE\PHONE.DAT` to a filename representative to that months data. For more information on 'How it does it.' please see the attached commented QuickBasic 4.5 source code.

**How to Back up Data**

  Press Q to quit PCW.  It may take a few seconds for PCW to shut down.  To quicken this process make a quick toll free call; PCW waits for one more call after 'Q' is pressed.
IMPORTANT NOTE: ALways exit PCW by pressing 'Q' and letting it exit properly.
  Failure to do so will result in data loss of the current day's data.
  
After out of PCW just copy the filename you want onto a floppy and you are on your way.
Just run the file through your current report generator.  Reboot the PC after file transfers are complete, and PCW will load automatically.


-Jim Mirra
