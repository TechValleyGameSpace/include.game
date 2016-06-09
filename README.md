What Taro Omiya got working so far:
====

== First-Time Setup ==

1) Make sure you have VirtualBox (a virtual machine) and Vagrant (program that downloads, configures, and runs virtual machines) installed.

2) On command line (Powershell, Terminal, etc.), change directory to this project's "vagrant" folder.

3) If you haven't done it already, download Vagrant's vbguest plugin, via "vagrant plugin install vagrant-vbguest"

4) Run "vagrant up"

5) Once the commands above runs to completion, you can SSH into that virtual machine via "vagrant ssh"

6) Doing so, you'll find folder "include.game", which links directly to the "rubyonrails" folder in this project.

That's it for now.  The virtual machine doesn't even host the Ruby on Rails website yet, so that's still in the works.

== Closing Virtual Machine ==

1) On command line (Powershell, Terminal, etc.), make sure you're not SSHing to the virtual machine.  If you are, run "exit".

2) Run "vagrant halt"

== Opening Virtual Machine After Setup ==

1) On command line (Powershell, Terminal, etc.), change directory to this project's "vagrant" folder.

2) Run "vagrant reload"


== Local Development Notes ==

I'm using Eclipse + Aptana plugin for now.

Gemfile - After Ruby is installed in your system, run "bundle install" to install all ruby dependencies necessary to get this project started.
