# UNIX-02-SIN-A-Mar-Jul-2026
Repo for intro to UNIX
Execute [ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" both in the Codespace and within QEMU. What result do you get and why? 
    
    Both the Codespace and QEMU return "BIOS". This occurs because the /sys/firmware/efi directory does not exist in either environment, indicating that both systems are emulating a traditional boot process based on Legacy BIOS instead of the modern UEFI standard.

Inside QEMU, execute ls / and compare it with the directory structure we saw in class. Which directories are missing and why? 

    Standard directories of the Linux Filesystem Hierarchy Standard (FHS), such as /home, /var, /tmp, /opt, /lib, and /usr, are missing. This is because the compiled system is minimalistic, containing only the essential folders required for the Kernel and BusyBox to function.

Inside QEMU, execute ls -la /bin/ and observe that all commands are symbolic links to the same binary. What advantage does this have for an embedded system? 

    The primary advantage for an embedded system is that symbolic links pointing to a single file (/busybox) are used instead of multiple binaries that duplicate code. This approach drastically reduces the filesystem size on devices with limited storage capacity.

In the Codespace, create a file with echo "hola" > test.txt and then execute stat test.txt. Identify the actual size vs. allocated blocks. Is there internal fragmentation? 

    The test.txt file has an actual size of 5 bytes, but the system has allocated 8 disk blocks. Since the I/O block size is 4096 bytes, there is evident internal fragmentation because the file is significantly smaller than the minimum space the system can allocate, leaving most of the 4 KB block wasted.

Execute sudo parted -l && echo -e "\n---\n" && lsblk -f in the Codespace. Identify which disks use GPT vs. MBR, and which filesystems are in use. 

    The 32.2GB /dev/sda disk and the 550GB /dev/sdc disk use a GPT partition table, while the 48.3GB /dev/sdb disk employs the MBR (msdos) format. Regarding filesystems, ext4 is used in the main partitions (/dev/sda1, /dev/sdb1, and /dev/sdc1), alongside a fat32 partition on /dev/sda15 intended for booting.