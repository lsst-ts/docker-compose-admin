# NCSA Test Stand (NTS)

The scripts here are used for the NTS bare metal deployments. 

Special note: Since the configuration directories are a mix of user permissions, the *update_repo* script changes umask before performing any updates to the directories and returns the umask to its original setting before completing.
