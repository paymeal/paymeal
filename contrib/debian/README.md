
Debian
====================
This directory contains files used to package paymeald/paymeal-qt
for Debian-based Linux systems. If you compile paymeald/paymeal-qt yourself, there are some useful files here.

## paymeal: URI support ##


paymeal-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install paymeal-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your paymeal-qt binary to `/usr/bin`
and the `../../share/pixmaps/paymeal128.png` to `/usr/share/pixmaps`

paymeal-qt.protocol (KDE)

