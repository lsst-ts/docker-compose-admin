# Summit Launchers

The scripts here are used for the summit bare metal deployment. While the configuration directories are owned by root, the launch and shutdown scripts DO NOT need to be run with sudo since they are only using the configuration to execute docker-compose.

Special note: Since the configuration directories are owned by root, the *update_repo* script must be run with *sudo*.
