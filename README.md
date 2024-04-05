# Automating-Light-Client

The Bash script provided here offers a solution tailored for maintaining the availability of the Avail light client by automating the detection and rerun process in case of failure.This script utilizes screen sessions to monitor the client's status and intelligently reruns it upon encountering specific error conditions. By defining intervals and error handling mechanisms, the script facilitates uninterrupted operation, ensuring the smooth functioning of the Avail light client in decentralized environments.

Requirements:

1. Install screen (apt install screen)
2. Already running avail light client in screen session named "avail"
3. Remember to save your Seed phrase in other directory (cat .avail/identity/identity.toml) before running this script

