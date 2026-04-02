#Change the current working directory to the system's root directory.
cd /
# List the files and directories in the current location, adding a trailing character to indicate the file type.
ls -F
lib64@ #Libraries and applications compiled for 64-bit architectures. In the Filesystem Hierarchy Standard (FHS), the @ symbol often indicates a symbolic link to another directory containing 64-bit library files.
init ram disk #The boot engine for the operating system.
# load basic drivers (disk, USB, etc.)
# prepares the system.
#1. loads the firmware 
# POST (Power-On-Self-Test)
# Boot device search (MBR = 2 TB, 4 disk partitions; BIOS = the fundamental firmware installed on a computer's motherboard; UEFI = modern firmware that replaces traditional BIOS in new computers. It acts as an interface between the hardware and the operating system, offering faster booting, increased security (Secure Boot), support for large-capacity hard drives (>2 TB) via GPT (GUID Partition Table), and a more intuitive graphical interface).
# Finds and mounts the real file system.
POST #Verifies that all hardware is connected and functioning correctly to allow the operating system to start.
FHS #Establishes a unified hierarchy under the root directory / to improve application interoperability, system management, and consistency across Linux distributions.
sudo apt update # Update the local package index to reflect the latest versions available in the repositories.
sudo apt upgrade # Install the newest versions of all packages currently installed on the system.
sudo apt install parted # Download and install the 'parted' utility for manipulating disk partitions.
Dependency Hell # A situation where the conflicting requirements of different software packages make it difficult or impossible to install or update them. his happens when Program A needs Version 1 of a library, but Program B needs Version 2 of that same library. You can't have both, so the system gets stuck.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n"
#sudo: Runs the command with root (administrator) privileges, which is required to read hardware partition tables.
#parted: Invokes the GNU Parted partition manipulation program.
#-l (list): Tells the program to list the partition layouts for all block devices (hard drives, SSDs, USBs) it can find. It shows the model, size, partition table type (MBR/GPT), and individual partitions.
#AND (&&): This ensures the next command only runs if the previous one finished successfully (without errors).
#echo -e "\n---\n"
#echo: Prints text to the terminal.
#-e: Enables the interpretation of backslash escapes.
#\n---\n: Prints a newline, a dashed line separator, and another newline to visually separate the outputs of the two main commands.
#lsblk -f
#lsblk: List Block Devices. It displays a tree-like structure of your disks.
#-f (filesystems): Adds specific info about filesystems. It shows what each partition is formatted as (ext4, fat32, ntfs), its UUID (unique ID), and where it is currently mounted in the system.