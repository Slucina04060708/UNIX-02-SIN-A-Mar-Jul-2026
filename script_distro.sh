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