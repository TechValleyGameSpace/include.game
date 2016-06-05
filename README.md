What Taro Omiya got working so far:

1) Make sure you have VirtualBox (a virtual machine) and Vagrant (program that downloads, configures, and runs virtual machines) installed.

2) On command line (Powershell, Terminal, etc.), change directory to this project's "vagrant" folder.

3) Run "vagrant up && vagrant reload"

4) Once the commands above runs to completion, you can SSH into that virtual machine via "vagrant ssh"

5) Doing so, you'll find folder "include.game", which links directly to the "rubyonrails" folder in this project.

That's it for now.  The virtual machine doesn't even host the Ruby on Rails website yet, so that's still in the works.


For your own development:
Gemfile - After Ruby is installed in your system, run "bundle install" to install all ruby dependencies necessary to get this project started.