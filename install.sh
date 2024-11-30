#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[1mInstalling packages, please wait! Install time will depend on your device and network speed.\033[0m"
# Upgrade for latest packages and install relevant packages
pkg upgrade -y
pkg install x11-repo -y
pkg install xfce4 tigervnc pulseaudio xfce4-goodies pavucontrol-qt -y
# Configuring it
clear
echo -e "\033[1mLet's setup the VNC server now. It will ask for a password. Put "n" and then press enter when asked for a view-only password\033[0m"
vncserver && vncserver -kill :1 && echo "#!/data/data/com.termux/files/usr/bin/bash
startxfce4 &" > /data/data/com.termux/files/home/.vnc/xstartup # sets up vncserver and writes xstartup
chmod +x /data/data/com.termux/files/home/.vnc/xstartup # makes xstartup executable
echo -e "\033[1mXFCE has been installed!\033[0m"
clear
#Installing apps for optimal experience
echo -e "\033[1mInstalling 3 more apps for an optimal experience\033[0m"
echo -e "\033[1mInstalling Firefox\033[0m"
apt install firefox -y
echo -e "\033[1mInstalling XFCE Terminal Emulator\033[0m"
apt install xfce4-terminal -y
echo -e "\033[1mInstalling Parole Media Player\033[0m"
apt install parole -y
echo -e "\033[1mCreating directories...\033[0m"
cd
mkdir Downloads
mkdir Documents
mkdir Pictures
mkdir Music
mkdir Videos
echo -e "\033[1mConfiguring scripts...\033[0m"
cd
mkdir .termux-xfce
cd termux-xfce
cp startvnc stopvnc ~/.termux-xfce
cd
if [ "$SHELL" == "/data/data/com.termux/files/usr/bin/fish" ]
then  
    fish_add_path ~/.termux-xfce
fi
if [ "$SHELL" == "/data/data/com.termux/files/usr/bin/bash" ]
then  
    touch .bashrc
    echo export PATH="~/.termux-xfce/:$PATH" > .bashrc
fi
if [ "$SHELL" == "/data/data/com.termux/files/usr/bin/zsh" ]
then  
    echo export PATH="~/.termux-xfce/:$PATH" > .zshrc
fi
echo -e "\033[1mRun extras.sh if you want a preconfigured desktop layout with themes!\033[0m"
echo -e "\033[1mRestart Termux and then type startvnc to start the server and stopvnc to stop it.\033[0m"
