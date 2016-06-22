# What Taro Omiya got working so far:

### Log

* 6/22/16: Finally got a working development vagrant configuration that works for Ruby on Rails!

### Local Development Notes

Taro Omiya is using [Eclipse](https://eclipse.org/downloads/) + [Aptana plugin](https://marketplace.eclipse.org/content/aptana-studio-3).
You can open this project by importing a pre-existing project, and selecting this folder for import.

## First-Time Setup

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html).
2. Open Powershell, and change directory (using `cd [path/to/directory]`) to this project's `vagrant` directory.
3. Install Vagrant's vbguest plugin, by running the following command: `vagrant plugin install vagrant-vbguest`.
4. Run `vagrant up`. This will take a long time (couple of minutes to a few hours).
5. Once the commands above runs to completion, you can SSH into that virtual machine via `vagrant ssh`.
6. Once connected, Powershell will switch to Ubuntu commands. Change directory to this project using `cd /var/www/include`.
7. Run `./setup.sh`.
8. Open your favorite web browser on Windows, and go to the URL, `localhost:3000`.

## Closing Virtual Machine

1. On Powershell, make sure you're not SSHing to the virtual machine.  If you are, run `exit`.
2. Run `vagrant halt`.

## Opening Virtual Machine After Setup

1. On Powershell, change directory to this project's `vagrant` folder.
2. Run `vagrant reload`.
5. Once the commands above runs to completion, you can SSH into that virtual machine via `vagrant ssh`.
6. Once connected, change directory to this project using `cd /var/www/include`.
7. Run `./server.sh`.
8. Open your favorite web browser on Windows, and go to the URL, `localhost:3000`.
9. When you're done testing, enter `Ctrl+C` to stop the server.

## Setting Up The Website's Database Fresh Again

1. Run and SSH to the virtual machine, if you haven't already (see above steps).
2. If the Webbrick server is running (SSH basically doesn't take any commands), hit the `Ctrl+C` shortcut to stop it.
3. Run `./reset.sh`.
8. Open your favorite web browser on Windows, and go to the URL, `localhost:3000`.
9. When you're done testing, enter `Ctrl+C` to stop the server.

## Setting Up The Virtual Machine Fresh Again

1. On Powershell, change directory to this project's `vagrant` folder.
2. Run `vagrant destroy`.
3. Accept the prompt to destroy the box.
4. Run `vagrant up`. This will take a long time (couple of minutes to a few hours).
5. Once the commands above runs to completion, you can SSH into that virtual machine via `vagrant ssh`.
6. Once connected, change directory to this project using `cd /var/www/include`.
7. Run `./setup.sh`.
8. Open your favorite web browser on Windows, and go to the URL, `localhost:3000`.
9. When you're done testing, enter `Ctrl+C` to stop the server.
