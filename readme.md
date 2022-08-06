# File Organizer for FTP via curl
Organizes video files that are named in a specific way by placing them in their respective series folders. All of this happens in FTP and are interfaced upon via curl. 

Uses GitHub Actions to periodically sort.

Could be used for other purposes too, provided the files being organized follows a predictable pattern.

Example:
```
Series Title - 00.mkv
```



# Usage

1. Clone/Fork your own instance of this project and host it in GitHub
2. Provide values to the following variables for your cloned/forked project's secrets
    - FTP_SERVER
    - FTP_SUBDIR
    - FTP_USER
    - FTP_PASSWORD
3. Configure GitHub actions as needed.




[//]: # (Last Updated: 08/06/2022)

