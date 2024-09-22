run: build
	#
	# -drive             # Tell qemu to configure a virtual drive
	# -file=textfile.txt # Use the textfile to act as the virtual disk
	# -format=raw        # Treat the file as a raw image (block device)
	# -index=1           # drive index (act as the primary drive)
	# -media=disk        # Treat this file as as a hard disk or floppy disk (block device), not a CD-ROM (or any other type of media)
	#
	qemu-system-i386 \
		-nographic \
		-drive file=textfile.txt,index=1,format=raw,media=disk \
		os


build:
	nasm -f bin -l list.lst os.asm -o os

