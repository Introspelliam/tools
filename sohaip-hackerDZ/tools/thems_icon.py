import os
from time import sleep


home = '''
0 >> config systime 
1 >> install icon 
2 >> insuall themes 
'''
icon = '''
TOP icon 
1 >> numix

'''
print home
sohaip = input('Enter number >>')
print sohaip
if sohaip == 0:
    os.system('sudo rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}')
    os.system('rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}')
    os.system('rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}')
    os.system('sudo apt-get install autoconf automake pkg-config libgtk-3-dev')
    os.system('apt-get update')
    print home
elif sohaip == 1:
    print icon
    input_icon = input('Enter number>>')
    print input_icon
    if input_icon == 1:
        os.system('sudo apt-add-repository ppa:numix/ppa')
        os.system('sudo apt-get update')
        os.system('sudo apt-get install numix-icon-theme numix-icon-theme-circle')
elif sohaip == 2:
    thems = ''''
    1 >> arc-theme
    '''
    print thems
    thems_in = input('Enter number >>')
    if thems_in == 1:
        os.system('git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme')
        os.system('./autogen.sh --prefix=/usr')
        os.system('sudo make install')


