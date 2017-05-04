#!/usr/bin/env ruby
#==================================================================================================
def $user_logname::nil
end
def $os_config::nil
end	
def $kodi::nil
end
def $reinstall::nil
end
def $uninstall::nil
end

def check_user_dir
	print "User Login(default is pi): " ; $user_logname = gets.chomp
	if Dir.exists?("/home/#{$user_logname}")
	make_rubian_dir
	else
		puts "User Login is incorrect.  Try again."
		check_user_dir
	end
end

def uninstall
	
	Dir.chdir("/home/pi/Desktop/test-pi")
	Dir.pwd
	File.delete("/home/pi/Desktop/test-pi/Rubian_core.rb") if File.exists?("/home/pi/Desktop/test-pi/Rubian_core.rb")
	puts "deleting Rubian_Core."
	sleep(1)
	File.delete("/home/pi/Desktop/test-pi/.bash_aliases") if  File.exists?("/home/pi/Desktop/test-pi/.bash_aliases")
	puts "deleting .bash_aliases."
	sleep(1)
	Dir.chdir("/home/pi/Desktop/test-pi/Rubian")
	File.delete("/home/pi/Desktop/test-pi/Rubian/Rubian_cmd.rb") if  File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian_cmd.rb")
	puts "deleting Rubian_cmd."
	sleep(1)
	File.delete("/home/pi/Desktop/test-pi/Rubian/Rubian_dir.rb") if File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian_dir.rb")
	puts "deleting Rubian_dir."
	sleep(1)
	File.delete("/home/pi/Desktop/test-pi/Rubian/Color.rb") if  File.exists?("/home/pi/Desktop/test-pi/Rubian/Color.rb")
	puts "deleting Color."
	sleep(1)
	File.delete("/home/pi/Desktop/test-pi/Rubian/Rubian_cmdlist_menu.rb") if  File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian_cmdlist_menu.rb")
	puts "deleting Rubian_cmdlist_menu."
	sleep(1)
	File.delete("/home/pi/Desktop/test-pi/Rubian/Install_utility_menu.rb") if  File.exists?("/home/pi/Desktop/test-pi/Rubian/Install_utility_menu.rb")
	puts "deleting Install_utility_menu."
	sleep(1)
	File.delete("/home/pi/Desktop/test-pi/Rubian/Rubian_main_menu.rb") if  File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian_main_menu.rb")
	puts "deleting Rubian_main_menu."
	sleep(1)
	Dir.chdir("/home/pi/Desktop/test-pi")
	Dir.rmdir("/home/pi/Desktop/test-pi/Rubian") if  Dir.exists?("/home/pi/Desktop/test-pi/Rubian")
	puts "deleting ./Rubian diretory."
	sleep(1)
	puts "Uninstall Complete."
	sleep(1)
	exit(0)
end


def is_rubian_installed
	
	$dir1 = Dir.exists?("/home/pi/Desktop/test-pi/Rubian")
	$file1 = File.exists?("/home/pi/Desktop/test-pi/Rubian_core.rb ")
	$file2 = File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian/Rubian_cmd.rb")
	$file3 = File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian/Rubian_dir.rb")
	$file4 = File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian/Color.rb")
	$file5 = File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian/Rubian_cmdlist_menu.rb")
	$file6 = File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian/Install_utility_menu.rb")
	$file7 = File.exists?("/home/pi/Desktop/test-pi/Rubian/Rubian/Rubian_main_menu.rb")
	$file8 = File.exists?("/home/pi/Desktop/test-pi/Rubian/.bash_aliases")
	if $dir1 || $file1 || $file2 || $file3 || $file4 || $file5 || $file6 || $file7 == true
		
puts "Rubian files found, do you wish to remove all files are reinstall? [Y/n]"
print "==> " ; $uninstall = gets.chomp
 uninstall if $uninstall =~ /Y|y/
 exit(0) if $uninstall =~/N|n/
else
check_user_dir
	
end
end

def make_rubian_dir
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi") ;}
	a.call
	b = proc{Dir.mkdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
	b.call	
	 
       end

def ruby_update
system 'sudo apt-get install ruby-full'
end

def write_bash_aliases
 a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi") ;}
 b = proc{file = File.new(".bash_aliases" , "w") ;
          file.puts("#!/usr/bin/bash
ruby /home/pi/Rubian_core.rb")   ;
	  file.close                             }
	  a.call
	  b.call
end

def write_rubian_core
 a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi") ;}
 b = proc{file = File.new("Rubian_core.rb" , "w") ;
          file.puts("#!/usr/bin/env ruby
require 'irb'
require './Rubian/Rubian_cmd.rb'
require './Rubian/Rubian_dir.rb'
require './Rubian/Color.rb'
require './Rubian/Rubian_cmdlist_menu.rb'
require './Rubian/Install_utility_menu.rb'
require './Rubian/Rubian_main_menu.rb'
IRB.start ")   ;
	  file.close                             }
	  a.call
	  b.call
  
end

def write_color
 a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
 b = proc{file = File.new("Color.rb" , "w") ;
          file.puts('#!/usr/bin/env ruby
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end ')   ;
	  file.close                             }
	  a.call
	  b.call
end

def write_rubian_dir
 a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
 b = proc{file = File.new("Rubian_dir.rb" , "w") ;
 file.puts('#!/usr/bin/env ruby	 
def mdir
 $mdir = proc{Dir.mkdir(%Q|#{print Dir.pwd + %q|/|}#{ARGF.gets.chomp}|) ; puts %Q|Directory was created! | }
 $mdir.call
end

def cdir
 $cdir = proc{Dir.chdir(%Q|#{print %q|/home/pi/| }/home/pi/#{ARGF.gets.chomp}|) ; puts %Q|You are now in #{Dir.pwd} Directory!| }
 $cdir.call
end

def deldir
 $deldir = proc{Dir.rmdir(%Q|#{print Dir.pwd + "/"}#{ARGF.gets.chomp}|) ; "#{Dir.pwd}" ; puts %Q|Directory was Deleted! |}
 $deldir.call
 end
 
 def ls
 	 system "ls"
 end
         	                                ')   ;
	  file.close                             }
	  a.call
	  b.call
end

def write_raspbian_standalone
	
 a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
 b = proc{file = File.new("Rubian_cmd.rb" , "w") ;
	
file.puts('#!/usr/bin/env ruby
class Rubian_cmd
$startx = proc{`startx`}
$update = proc{system %Q\sudo apt-get update && -y upgrade \}
$nano = proc{system %Q\nano #{ARGF.gets.chomp}\}
$sudonano = proc{system %Q\sudo nano #{ARGF.gets.chomp}\}
$raspi_config = proc{system %Q\sudo raspi-config\}
$disk_space = proc{system %Q\df -h\}
$free_mem = proc{system %Q\free -m\}
$mem_split = proc{system %Q\vcgencmd get_mem arm && vcgencmd get_mem gpu\}
$mem_info = proc{system %Q\cat /proc/meminfo\}
$rpi_temp = proc{system %Q\vcgencmd measure_temp\}
$reboot = proc{system %Q\`sudo reboot`\}
end
def startx
$startx.call
end
def update
$update.call
end
def nano
$nano.call
end
def sudonano
$sudonano.call
end
def raspiconfig
$raspi_config.call
end
def disk_space
$disk_space.call
end
def free_mem
$free_mem.call
end
def mem_split
$mem_split.call
end
def mem_info
$mem_info.call
end
def rpitemp
$rpi_temp.call
end
def reboot
$reboot.call
 end') ; file.close}
a.call
b.call
end
	  
  
 
def write_retropie_standalone  
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
b = proc{file = File.new("Rubian_cmd.rb" , "w") ; 	
file.puts('#!/usr/bin/env ruby
class Rubian_cmd
$retropie = proc{`emulationstation`}
$update = proc{system %Q\sudo apt-get update && -y upgrade \}
$nano = proc{system %Q\nano #{ARGF.gets.chomp}\}
$sudonano = proc{system %Q\sudo nano #{ARGF.gets.chomp}\}
$raspi_config = proc{system %Q\sudo raspi-config\}
$disk_space = proc{system %Q\df -h\}
$free_mem = proc{system %Q\free -m\}
$mem_split = proc{system %Q\vcgencmd get_mem arm && vcgencmd get_mem gpu\}
$mem_info = proc{system %Q\cat /proc/meminfo\}
$rpi_temp = proc{system %Q\vcgencmd measure_temp\}
$reboot = proc{system %Q\`sudo reboot`\}
end
def emulationstation
$retropie.call
end
def retropie
$retropie.call
end
def update
$update.call
end
def nano
$nano.call
end
def sudonano
$sudonano.call
end
def raspiconfig
$raspi_config.call
end
def disk_space
$disk_space.call
end
def free_mem
$free_mem.call
end
def mem_split
$mem_split.call
end
def mem_info
$mem_info.call
end
def rpitemp
$rpi_temp.call
end
def reboot
$reboot.call
end	
') ; file.close }
a.call
b.call
end
	  
 
def write_raspbian_retro
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
b = proc{file = File.new("Rubian_cmd.rb" , "w") ;
file.puts('#!/usr/bin/env ruby
class Rubian_cmd
$startx = proc{`startx`}
$retropie = proc{`emulationstation`}
$update = proc{system %Q\sudo apt-get update && -y upgrade \}
$nano = proc{system %Q\nano #{ARGF.gets.chomp}\}
$sudonano = proc{system %Q\sudo nano #{ARGF.gets.chomp}\}
$raspi_config = proc{system %Q\sudo raspi-config\}
$disk_space = proc{system %Q\df -h\}
$free_mem = proc{system %Q\free -m\}
$mem_split = proc{system %Q\vcgencmd get_mem arm && vcgencmd get_mem gpu\}
$mem_info = proc{system %Q\cat /proc/meminfo\}
$rpi_temp = proc{system %Q\vcgencmd measure_temp\}
$reboot = proc{system %Q\`sudo reboot`\}

#install commands
$rubian_addons

end
def startx
$startx.call
end
def retropie
$retropie.call
end
def emulationstation
$retropie.call
end
def update
$update.call
end
def nano
$nano.call
end
def sudonano
$sudonano.call
end
def raspiconfig
$raspi_config.call
end
def disk_space
$disk_space.call
end
def free_mem
$free_mem.call
end
def mem_split
$mem_split.call
end
def mem_info
$mem_info.call
end
def rpitemp
$rpi_temp.call
end
def reboot
$reboot.call
end	
') ;
	  file.close}
  	  a.call
	  b.call

end
def add_kodi
add_kodi = File.open("Rubian_cmd.rb" , "a") 
	add_kodi.puts('def kodi
a = proc{`kodi`}
a.call
end')
	add_kodi.close
end
#==================================================================================================
def rubian_main_menu
 a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}
 b = proc{file = File.new("Rubian_main_menu.rb" , "w") ;
          file.puts(%q|#!/usr/bin/env ruby
require "./Rubian/Color.rb"
def main_menu

puts "=========================================================================".yellow
puts "---------------------------RUBIAN MAIN MENU------------------------------".yellow
puts "=========================-BETA  VERSION: 1.0-============================".yellow
puts "#{Time.now}                                                              ".light_blue 
puts "Rubian IRB Beta 1.0 for Raspberry Pi:                                    ".yellow 
puts  " cmd_list ".green + ":System Command List.                              ".yellow
puts  " main_menu ".green + ":Call Main Menu                                   ".yellow
puts " install_utility  ".green + ":RPI add-ons and software installation:     ".yellow
puts  " help ".green + "For IRB help:                                          ".yellow
puts "=========================================================================".yellow

end
main_menu |)   ; file.close}
	  a.call
	  b.call
end

def rubian_cmdlist_raspbian
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}	
b = proc{file = File.new("Rubian_cmdlist_menu.rb" , "w") ;
          file.puts(%Q|#!/usr/bin/env ruby
require './Rubian/Color.rb'
          	  
def cmd_list          	  
puts " startx ".green + ":Starts Desktop Enviorment.  ".yellow
puts " kodi ".green + ":Starts Kodi Media Center.".yellow #{if $kodi =~ /Y|y/ ; end}
puts " cdir " .green + ":change current Directory. ".yellow
puts " mdir ".green + ":make a new Directory."
puts " deldir".green + ":delete a Directory.".yellow
puts " ls ".green + ": List all files in current Directory.".yellow
puts " update ".green + ":update and upgrade RPI systems.  ".yellow 
puts " reboot  ".green + ":Reboot RPI.  ".yellow 
puts " raspiconfig ".green + ":Starts raspi-config.  ".yellow 
puts " disk_space ".green + ":Check availible disk space.  ".yellow
puts " mem_split ".green + ":Check CPU/GPU memory split.  ".yellow 
puts " mem_info ".green + ":List all details of Memory.  ".yellow 
puts " free_mem ".green + ":Check Memory Use.  ".yellow ;
puts " rpitemp ".green + ":Check Core Temp.  ".yellow ; 
puts " nano ".green + ":Starts up Nano Editer. ( nano filename)  ".yellow 
puts " sudonano ".green + ":Starts Nano as Super User. (sudonano filename)  ".yellow 
puts " main_menu ".green + ":Calls up Rubian Main Menu List.  ".yellow ; 
puts " install_utility ".green + ":Starts Rubian Install Utility  ".yellow ; 
puts " exit ".green + ":Exit Rubian IRB Back to Linux Bash Shell CLI.  ".yellow 
end | ) ; file.close}
	  a.call
	  b.call
  end

    def rubian_cmdlist_retro
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ; }	
b = proc{file = File.new("Rubian_cmdlist_menu.rb" , "w") ;
          file.puts(%Q|#!/usr/bin/env ruby
require './Rubian/Color.rb'
          	  
def cmd_list          	  
puts " retropie ".green + "or ".yellow + "emulationstation ".green + ":Starts Retropie.  ".yellow 
puts "kodi ".green + ":Starts Kodi Media Center.".yellow #{if $kodi =~ /Y|y/ ; end} 
puts " cdir " .green + ":change current Directory. ".yellow
puts " mdir ".green + ":make a new Directory."
puts " deldir".green + ":delete a Directory.".yellow
puts " ls ".green + ": List all files in current Directory.".yellow
puts " update ".green + ":update and upgrade RPI systems.  ".yellow 
puts " reboot  ".green + ":Reboot RPI.  ".yellow 
puts " raspiconfig ".green + ":Starts raspi-config.  ".yellow 
puts " disk_space ".green + ":Check availible disk space.  ".yellow
puts " mem_split ".green + ":Check CPU/GPU memory split.  ".yellow 
puts " mem_info ".green + ":List all details of Memory.  ".yellow 
puts " free_mem ".green + ":Check Memory Use.  ".yellow ;
puts " rpitemp ".green + ":Check Core Temp.  ".yellow ; 
puts " nano ".green + ":Starts up Nano Editer. ( nano filename)  ".yellow 
puts " sudonano ".green + ":Starts Nano as Super User. (sudonano filename)  ".yellow 
puts " main_menu ".green + ":Calls up Rubian Main Menu List.  ".yellow ; 
puts " install_utility ".green + ":Starts Rubian Install Utility  ".yellow ; 
puts " exit ".green + ":Exit Rubian IRB Back to Linux Bash Shell CLI.  ".yellow 
end | ) ; file.close}
	  a.call
	  b.call
  end
  
  def rubian_cmdlist_raspbian_retro
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}	
b = proc{file = File.new("Rubian_cmdlist_menu.rb" , "w") ;
          file.puts(%Q|#!/usr/bin/env ruby
require './Rubian/Color.rb'
          	  
def cmd_list          	  
puts " startx ".green + ":Starts Desktop Enviorment.  ".yellow 
puts " retropie ".green + "or ".yellow + "emulationstation ".green + ":Starts Retropie.  ".yellow 
puts "kodi ".green + ":Starts Kodi Media Center.".yellow #{if $kodi =~ /Y|y/ ; end} 
puts " cdir " .green + ":change current Directory. ".yellow
puts " mdir ".green + ":make a new Directory."
puts " deldir".green + ":delete a Directory.".yellow
puts " ls ".green + ": List all files in current Directory.".yellow
puts " update ".green + ":update and upgrade RPI systems.  ".yellow 
puts " reboot  ".green + ":Reboot RPI.  ".yellow 
puts " raspiconfig ".green + ":Starts raspi-config.  ".yellow 
puts " disk_space ".green + ":Check availible disk space.  ".yellow
puts " mem_split ".green + ":Check CPU/GPU memory split.  ".yellow 
puts " mem_info ".green + ":List all details of Memory.  ".yellow 
puts " free_mem ".green + ":Check Memory Use.  ".yellow ;
puts " rpitemp ".green + ":Check Core Temp.  ".yellow ; 
puts " nano ".green + ":Starts up Nano Editer. ( nano filename)  ".yellow 
puts " sudonano ".green + ":Starts Nano as Super User. (sudonano filename)  ".yellow 
puts " main_menu ".green + ":Calls up Rubian Main Menu List.  ".yellow ; 
puts " install_utility ".green + ":Starts Rubian Install Utility  ".yellow ; 
puts " exit ".green + ":Exit Rubian IRB Back to Linux Bash Shell CLI.  ".yellow 
end | ) ; file.close}
	  a.call
	  b.call
  end
  
  def write_install_utility  
a = proc{Dir.chdir("/home/#{$user_logname}/Desktop/test-pi/Rubian") ;}	
b = proc{file = File.new("Install_utility_menu.rb" , "w") ;
          file.puts(%q|#!/usr/bin/env ruby
require './Rubian/Color.rb'
def install_utility
puts "=========================================================================".yellow
puts "--------------------------RUBIAN INSTALL UTILITY-------------------------".yellow
puts "=========================INSTALL UTILTY BETA V1.0========================".yellow
puts "#{Time.now}                                                              ".light_blue
puts "rubian_addons ".green + ":Install/Manage Rubian programs                 ".yellow
puts "other_addons  ".green + ":Install 3rd party scripts/programs.            ".yellow
puts "uninstall     ".green + ":Uninstall Rubian/3rd party scripts.            ".yellow
end |) ; file.close }
	  a.call
	  b.call
  end
  


  
#==================================================================================================

module Installer
	loop do
	puts "              ================================================================== "
	puts "                             WELCOME TO THE RUBIAN INSTALLATION!                 "
	puts "                    THANK YOU FOR CHOOSING RUBIAN FOR YOUR RASPBERRY PI!         "
	puts "                 RUBIAN IS DEVELOPED FOR MAKING YOUR RPI BUILDS EASIER TO USE.   "
	puts "                 AFTER THE CORE FINNISHES INSTALLING, PLEASE CONTENUE WITH THE   "
	puts "                    PROMPTS TO CONFIGURE RUBYPI TO YOUR UNIQUE RPI BUILD.        "
	puts "                                      ((RUBIAN BETA 1.0))			       "
	puts "              ==================================================================="
	puts "                                                                                 "
	puts "               TO CONTENUE WITH THE INSTALL, PRESS [Y/y] AND 'ENTER'.            "
	puts "               TO ABORT INSTALL, PRESS [N/n] AND 'ENTER'.                        "
	
	def $user_input::nil 
	end
	
	print "               Contenue Install? => " ; $user_input = gets.chomp
	 
	
		$start_install = true if $user_input =~ /Y|y/
		
		exit(0) if $user_input =~ /N|n/
                
	break if $user_input=~/Y|y|N|n/
	end
		if $start_install == true
		#puts "what is your user log in name?(pi is default)"
		is_rubian_installed
		#check_user_dir
		
		puts "STARTING RUBIAN CORE INSTALL" ; sleep(1) ; print '...3...'; sleep(1)  ; print '...2...' ; sleep(1) ; print '...1...'  "\n"
		sleep(0.5)  
		puts "updating the ruby Interpreter"
		sleep(0.5)
		#ruby_update
		sleep(0.5)
		puts "creating .bash_aliases"
		write_bash_aliases
		sleep(0.5)
		puts "Creating Rubian Core..."
		write_rubian_core
		sleep(0.5)
		puts "Building Treasure Chest..."
		write_rubian_dir
		sleep(1)
		puts "Adding Gems to Treasure Chest"
		write_color
		write_install_utility
		sleep(1)
		sleep(0.5)
		end #end of if statment
		
		loop do
		puts "=========================================================="
		puts "          Rubian Installation Configuration               "
		puts "=========================================================="
		puts "                                                          "
		puts "Please read the following Carefully.                      "
		puts "What Operating System(s) do you have?                     "
		puts "==> 1  Raspbian(or other Debian Desktop)                  "
		puts "==> 2  Retropie(standalone)                               "
		puts "==> 3  Debian Desktop & Retropie (duelboot)               "
		
		print "==> " ; $os_config = gets.chomp
				
		write_raspbian_standalone if $os_config =~ /1/
		write_retropie_standalone if $os_config=~ /2/
		write_raspbian_retro if $os_config =~ /3/
		break if $os_config =~/1|2|3/
				
	        end#end of if statment
 puts "Generating Rubian Commands For Your RPI Settings" ;
 sleep(0.5) ; print "."; sleep(0.5) ; print "." ; sleep(0.5) ; print ".";  sleep(0.5) ; print "." ; sleep(0.5) ; print "." ; print "Rubian_cmd writting complete!" "\n"
	 loop do	 
	puts "Is Kodi installed? [Y/n]"
	print "==> " ; $kodi = gets.chomp
	add_kodi if $kodi =~ /Y|y/
	sleep(0.5)
        break if $kodi =~ /Y|y|N|n/
 end

 puts "Almost halfway!"
 puts "Rubian is now generating CLI menus"
 rubian_main_menu
sleep(0.5) ; print "."; sleep(0.5) ; print "." ; sleep(0.5) ; print ".";  sleep(0.5) ; print "." ; sleep(0.5) ; print "." ; "\n"
puts "treasure chest almost full"
rubian_cmdlist_raspbian if $os_config =~ /1/
rubian_cmdlist_retro if $os_config =~ /2/
rubian_cmdlist_raspbian_retro if $os_config =~ /3/

sleep(0.5) ; print "."; sleep(0.5) ; print "." ; sleep(0.5) ; print ".";  sleep(0.5) ; print "." ; sleep(0.5) ; print "." ; "\n"
puts "Capt'n said bury the BOOTY!"
sleep(0.5) ; print "."; sleep(0.5) ; print "." ; sleep(0.5) ; print ".";  sleep(0.5) ; print "." ; sleep(0.5) ; print "." ; "\n"
puts "Time to have some Raspberry rum!....is the rum gone?"
sleep(0.5) ; print "."; sleep(0.5) ; print "." ; sleep(0.5) ; print ".";  sleep(0.5) ; print "." ; sleep(0.5) ; print "." ; "\n"
puts "CONTRATS!  INSTALLATION COMPLETE!"

end #end of module


