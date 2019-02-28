# 280ZX-Turbo-ECCS
JECS / NISSAN ECCS Motorola 6800 microcode pulled from 1982/1983 Datsun 280ZX ECU

I started out trying to just tune the maps, I succeded.

Now I've gotten interested in learning about fuel injection, microcontrollers and assembly language.



#### Some details about the 1983/1983 ECCS hardware. 

##### Hitachi HD46802P Motorola 6802 CPU varient

Motorola 6800 series was fairly common in the late 70's and 80s, NISSAN / JECS ECCS ECUs used these chips up until around 1989. 
 
 
##### Hitachi HD46506 ADU (Analog Data Acquisition Unit)

I haven't been able to find any information about this chip other than it is an IO extender. 




##### Hitachi HN25089 DIP-24

1K-byte 2708-type ROM 

1024-word x 8-bits 

Addressed from BB00 to BFFF

Contains ignition&fuel map data similar to the design of the dual-chip Z31 & R31 ECCS units, the data is redundant and also contained in the main 8K-byte chip. 

For more information, see 'The R31 Complication' at  https://wiki.r31skylineclub.com/index.php/ECU_Chipping 

This 1K ROM can be removed, and the ECU will function with the single 8K ROM as long as the IC-3 HD47LS20P quad-NAND chip is moved from the daughter board to the main board.  This allows the last 8k of data on the 2364 chip to be accessed. 



##### Hitachi HN48364P DIP-24

8k-byte 2364-type ROM

8192-word x 8-bits

Addressed from A000 to BAFF

Contains all microcode, fuel and ignition maps are on the last 1K of address space. 

##### Hitachi HM46810P RAM chip
