sudo apt update #Update the local package index to reflect the latest versions available in the repositories.
sudo apt upgrade #Upgrade all installed packages to their newest versions to ensure system security and stability.
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 #Install essential build tools, compilers, and libraries required for kernel development and virtualization.
git clone --depth 1 https://github.com/torvalds/linux.git #Perform a shallow clone of the Linux kernel source code to save time and disk space by only fetching the latest commit. 
cd linux #Enter the root directory of the cloned Linux kernel source code.
make menuconfig #Launch the terminal-based configuration menu to customize kernel features and modules before compilation.
make -j 2 #Execute the build process using 2 parallel jobs to speed up compilation on multi-core systems.
sudo mkdir /boot-files/initramfs #Create a dedicated staging directory to house the initial RAM filesystem components.
sudo make CONFIG_PREFIX=/boot-files/initramfs install #Install the compiled binaries and scripts into the specified prefix directory to organize the boot structure.
sudo mkdir /boot-files #Create a system directory to store bootable images and kernel binaries.
sudo cp arch/x86/boot/bzImage /boot-files/ #Copy the compressed kernel boot image (bzImage) to the centralized boot-files directory.
cd .. #Step out of the kernel source directory to return to the parent workspace.
git clone --depth 1 https://git.busybox.net/busybox #Fetch the latest BusyBox source code with minimal history to save space.
cd busybox #Enter the BusyBox source directory.
make menuconfig #Configure BusyBox features (ensure 'Build static binary' is selected).
make -j 2 #Compile BusyBox using two parallel processing jobs.
sudo mkdir /boot-files/initramfs #Prepare the directory for the initial RAM filesystem.
sudo make CONFIG_PREFIX=/boot-files/initramfs install #Install BusyBox binaries into the staging initramfs folder.
cd /boot-files/initramfs #Move into the initramfs root.
sudo vi init #Create the first script the kernel will run (init).
#!/bin/sh and /bin/sh #Define the shell interpreter and launch a shell session.
sudo rm linuxrc #Remove the default BusyBox link to use our custom init instead.
sudo chmod +x init #Grant execution permissions to the init script.
sudo find . | cpio -o -H newc > ../init.cpio #Package the filesystem into a CPIO archive format required by the kernel. 
cd .. #Move back to the /boot-files directory.
sudo su #Elevate privileges to root for disk manipulation. 
dd if=/dev/zero of=boot bs=1M count=50 #Create a 50MB empty file named 'boot' filled with zeros.
mkfs -t fat boot #Format the 'boot' file with a FAT filesystem.
syslinux boot #Install the Syslinux bootloader onto the virtual disk.
mkdir m #Create a temporary mount point directory.
mount boot m #Mount the virtual disk 'boot' to the folder 'm'.
cp bzImage init.cpio m #Copy the kernel and the RAM disk into the bootable drive.
umount m #Unmount the drive to flush changes to the file.
qemu-system-x86_64 -nographic -append "console=ttyS0" -kernel bzImage -initrd init.cpio -drive file=boot,format=raw #Boot the custom kernel and initramfs in QEMU without a GUI.
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" #Check for the existence of the EFI directory to detect if the system booted via UEFI or Legacy BIOS.
ls -la /bin/ #List all system binaries with detailed permissions and ownership information.
sudo parted -l && echo -e "\n---\n" && lsblk -f #Display all disk partition tables and verify filesystem types and UUIDs for all block devices.