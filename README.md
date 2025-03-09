# 280ZX-Turbo-ECCS
JECS / NISSAN ECCS Motorola 6800 microcode pulled from 1982/1983 Datsun 280ZX ECU

I started out trying to just tune the maps, I succeded.

Now I've gotten interested in learning about fuel injection, microcontrollers and assembly language.

The address locations are verified in software, and in hardware based on how the Chip Enable and Read/Write lines are configured. 

# Details about the 1982/1983 ECCS hardware. 

##### Hitachi HD46802P 
Motorola 6802 MCU clone by Hitachi.

There is plenty of information available in the the motorola datasheet.

There is an external clock crystal on the board. 

Motorola 6800 series was fairly common in the late 70's and 80s, NISSAN / JECS ECCS ECUs used the 6802 processor up until the late 80s. 

The 6802 has 128 bytes of on-board RAM located at hex addresses $0000 to $001F. 
 
##### Hitachi HD46506 ADU (Analog Data Acquisition Unit)

Addressed from 0080 to 009F

I haven't been able to find much information about this chip other than it is an IO extender. 

There is an SAE transaction mentioning early ECCS, it has a 10-bit ADC for the VAFM with 8-bit ADC for other sensors.
Math instructions are included on this chip that are used to extend the capabilities of the 6802, specifically multiplication.
There is no information on how these systems are addressed. 

##### Hitachi HN25089 DIP-24

1K-byte 2708-type ROM 

1024-word x 8-bits 

Addressed from $BB00 to $BFFF

Contains ignition&fuel map data similar to the design of the dual-chip Z31 & R31 ECCS units, the data is redundant and also contained in the main 8K-byte chip. 

For more information, see 'The R31 Complication' at  https://wiki.r31skylineclub.com/index.php/ECU_Chipping 

This 1K ROM can be removed, and the ECU will function with the single 8K ROM as long as the IC-3 HD47LS20P quad-NAND chip is moved from the daughter board to the main board.  This allows the last 8k of data on the 2364 chip to be accessed. 

##### Hitachi HN48364P DIP-24

8k-byte 2364-type ROM

8192-word x 8-bits

Addressed from $A000 to $BAFF

Contains all microcode, fuel and ignition maps are on the last 1K of address space. 

##### Hitachi HM46810P RAM chip

Motorola MCM6810 clone 128-byte SRAM

Addressed from $0100 to $017F

MCU A8 high to RAM CS0, A7 low to CS1 

