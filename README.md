# 280ZX-Turbo-ECCS
JECS / NISSAN ECCS Motorola 6800 microcode pulled from 1982/1983 Datsun 280ZX ECU

# Tuning the early ECCS system

This information is mainly focused on the 82-83 ECUs, these tables may or may not exist in the 81. 

There is a Tunerpro definition supplied in this repository for 82-83, and 81.  The 81 definition has not been maintained in a while. 

## Table Scales

The RPM and Thoretical Pulsewidth (TP, Load) table scales are in 16-bit values.  Each table has 16 values.

The load sclaes can be rescaled when the pre-TP load variables have been altered. 
The RPM scales don't need to be modified for the stock engine.

0x1BA0(16bit) Fuel RPM
0x1B80(16bit) Fuel Load
0x1BE0(16bit) Ignition Timing RPM
0x1BC0(16bit) Ignition Timing Load

## Ignition Timing

The main timing table is in absolute values, it is active when the idle switch is OFF. 

0x1C00(8bit) 256 values, Ignition Timing

### Idle Timing
When the TPS is ON (throttle closed), Idle base timing is a 8-bit value at 0x1F80.
There is a table that is added to this value as RPM increases at 0x1FE0(8bit) 16 values, this table seems to max out around 3000rpm its load scale has not been identified.  

## fuel

### Post-TP modifiers
These tables apply enrichments after the theoretical pulsewidth calculation, and therefore act as total injection multipliers. 
Fueling can be adjusted linearly without effecting the load(TP) scales.

0x1D00(8bit) 256 values, Enrichment Coefficiency (Main fuel table)
0x1E00(8bit) 32 values, Cylinder Head Temperature Sensor (Coolant temp)
0x1B70(8bit) 16 values, Idle Air Temperature Sensor
0x1B60(8bit) 16 values, Barometric Correction Sensor

### The AFM limitation

No airflow tables exist, these early ECUs seem to use the main fuel table for correction.

the AFM uses an 8 volt reference from the ECU, and operates on a 5v-0v scale.  
Idle is somewhere around 3v, full load is close to 0v.  Held wide open manually most factory sealed AFMs stop around 0.082v. 
The HD46506 uses a 10-bit ADC to measure the AFM, giving 1024 steps of resolution. 

A good condition factory calibrated AFM runs out of measurement somewhere around 200-220 hp.
The factory setup is tuned with the majority of the AFM resolution at the lower load regions, this makes it problematic to convert to a MAF sensor with off the shelf conversion boards.  
The computer still runs into a hp limit around 200hp, rescaling the tables is required to gain more resolution at the higher load regions for accurate fueling.

### pre-load(TP) calculation fueling variables, Injector Constant

An injector constant like the Z31 and later nissan ECUs has not been found. 
There are a few values that affect the theoretical pulsewidth calculation.

#### 0x1F44
This value seems to be linear, and have a large effect on fueling.
Halving the value seems to roughly halve theoretical pulsewidth.
Load scales need to be adjusted when this value is changed. 

#### 0x1F45
I initially thought this was the second part of a 16-bit value with 0x1F44, however in certain circumstances I've observed this acting as fueling gain by RPM.  Specifically, when 1F44 is set to a higher than factory value. 

#### 0x1F4C
This one is interesting, as it acts as a fueling offset
Currently theory is that this may be injector dead time. 
Testing is required.


#### Fuel Cut Rev Limiter
Lower it or raise it, fuel will cut for a couple seconds or until revs drop below a certain range when this value is hit. 
0x1F50(16bit) 1 value, default for 82-83 is 6500.  

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

