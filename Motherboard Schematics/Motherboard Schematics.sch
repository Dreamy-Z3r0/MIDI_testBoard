EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Teensy:Teensy4.0 U1
U 1 1 602E3810
P 4100 3900
F 0 "U1" H 4100 5605 50  0000 C CNN
F 1 "Teensy4.0" H 4100 5514 50  0000 C CNN
F 2 "Teensy40" H 4100 5423 50  0000 C CNN
F 3 "" H 3700 4100 50  0001 C CNN
	1    4100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5150 3000 5150
Text GLabel 5350 4100 2    50   Output ~ 0
D
Wire Wire Line
	5200 4100 5350 4100
Text GLabel 5350 4000 2    50   Output ~ 0
C
Text GLabel 2900 3700 0    50   Output ~ 0
B
Wire Wire Line
	5200 4000 5350 4000
Wire Wire Line
	3000 3700 2900 3700
Text GLabel 2900 3950 0    50   Output ~ 0
INH1
Text GLabel 2900 4050 0    50   Output ~ 0
INH3
Text GLabel 2900 3600 0    50   Output ~ 0
INH2
Wire Wire Line
	2900 3600 3000 3600
Wire Wire Line
	2900 3950 3000 3950
Wire Wire Line
	2900 4050 3000 4050
Text GLabel 5350 4400 2    50   Output ~ 0
A
Text GLabel 5300 2650 2    50   Input ~ 0
OUT4
Text GLabel 5300 2750 2    50   Input ~ 0
OUT1
Text GLabel 5300 3050 2    50   Input ~ 0
OUT3
Wire Wire Line
	5200 2650 5300 2650
Wire Wire Line
	5200 2750 5300 2750
Wire Wire Line
	5200 3050 5300 3050
Wire Wire Line
	5200 3150 5300 3150
Wire Wire Line
	5200 4400 5350 4400
$Comp
L Connector:Conn_01x08_Female CN1
U 1 1 602EC0AF
P 6500 3600
F 0 "CN1" H 6528 3576 50  0000 L CNN
F 1 "74HC4067" H 6528 3485 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 6500 3600 50  0001 C CNN
F 3 "~" H 6500 3600 50  0001 C CNN
	1    6500 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female CN4
U 1 1 602F2DA6
P 9700 3400
F 0 "CN4" H 9728 3426 50  0000 L CNN
F 1 "CN4" H 9728 3335 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9700 3400 50  0001 C CNN
F 3 "~" H 9700 3400 50  0001 C CNN
	1    9700 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 602F3C07
P 6150 3300
F 0 "#PWR0102" H 6150 3150 50  0001 C CNN
F 1 "VCC" H 6165 3473 50  0000 C CNN
F 2 "" H 6150 3300 50  0001 C CNN
F 3 "" H 6150 3300 50  0001 C CNN
	1    6150 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 602F43EE
P 7250 3300
F 0 "#PWR0103" H 7250 3150 50  0001 C CNN
F 1 "VCC" H 7265 3473 50  0000 C CNN
F 2 "" H 7250 3300 50  0001 C CNN
F 3 "" H 7250 3300 50  0001 C CNN
	1    7250 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 602F4E73
P 8350 3300
F 0 "#PWR0104" H 8350 3150 50  0001 C CNN
F 1 "VCC" H 8365 3473 50  0000 C CNN
F 2 "" H 8350 3300 50  0001 C CNN
F 3 "" H 8350 3300 50  0001 C CNN
	1    8350 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 602F5936
P 9350 3300
F 0 "#PWR0105" H 9350 3150 50  0001 C CNN
F 1 "VCC" H 9365 3473 50  0000 C CNN
F 2 "" H 9350 3300 50  0001 C CNN
F 3 "" H 9350 3300 50  0001 C CNN
	1    9350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3300 6300 3300
Wire Wire Line
	7250 3300 7400 3300
Wire Wire Line
	8350 3300 8500 3300
Wire Wire Line
	9350 3300 9500 3300
Text GLabel 6150 3400 0    50   Output ~ 0
OUT1
Text GLabel 7250 3400 0    50   Output ~ 0
OUT2
Text GLabel 8350 3400 0    50   Output ~ 0
OUT3
Wire Wire Line
	6150 3400 6300 3400
Wire Wire Line
	7250 3400 7400 3400
Wire Wire Line
	8350 3400 8500 3400
Wire Wire Line
	7000 3500 7400 3500
Wire Wire Line
	6300 3500 5900 3500
Text GLabel 6150 3600 0    50   Input ~ 0
A
Text GLabel 7250 3600 0    50   Input ~ 0
A
Text GLabel 8350 3600 0    50   Input ~ 0
A
Wire Wire Line
	6150 3600 6300 3600
Text GLabel 7250 3700 0    50   Input ~ 0
INH2
Text GLabel 8350 3700 0    50   Input ~ 0
INH3
Text GLabel 6150 3800 0    50   Input ~ 0
B
Text GLabel 7250 3800 0    50   Input ~ 0
B
Text GLabel 8350 3800 0    50   Input ~ 0
B
Text GLabel 6150 3900 0    50   Input ~ 0
C
Text GLabel 6150 4000 0    50   Input ~ 0
D
Text GLabel 7250 3900 0    50   Input ~ 0
C
Text GLabel 8350 3900 0    50   Input ~ 0
C
Text GLabel 7250 4000 0    50   Input ~ 0
D
Text GLabel 8350 4000 0    50   Input ~ 0
D
Wire Wire Line
	6150 3700 6300 3700
Wire Wire Line
	6150 3800 6300 3800
Wire Wire Line
	6150 3900 6300 3900
Wire Wire Line
	6150 4000 6300 4000
Wire Wire Line
	7250 3600 7400 3600
Wire Wire Line
	7250 3700 7400 3700
Wire Wire Line
	7250 3800 7400 3800
Wire Wire Line
	7250 3900 7400 3900
Wire Wire Line
	7250 4000 7400 4000
Wire Wire Line
	8350 3600 8500 3600
Wire Wire Line
	8350 3700 8500 3700
Wire Wire Line
	8350 3800 8500 3800
Wire Wire Line
	8350 3900 8500 3900
Wire Wire Line
	8350 4000 8500 4000
Wire Wire Line
	9500 3400 9150 3400
Wire Wire Line
	9500 3500 9450 3500
Wire Wire Line
	8500 3500 8100 3500
$Comp
L Connector:Conn_01x08_Female CN2
U 1 1 602F0401
P 7600 3600
F 0 "CN2" H 7628 3576 50  0000 L CNN
F 1 "74HC4067" H 7628 3485 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 7600 3600 50  0001 C CNN
F 3 "~" H 7600 3600 50  0001 C CNN
	1    7600 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female CN3
U 1 1 602F1B47
P 8700 3600
F 0 "CN3" H 8728 3576 50  0000 L CNN
F 1 "74HC4067" H 8728 3485 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 8700 3600 50  0001 C CNN
F 3 "~" H 8700 3600 50  0001 C CNN
	1    8700 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J1
U 1 1 603E1123
P 1800 4550
F 0 "J1" H 1650 5050 50  0000 C CNN
F 1 "USB_B" H 1700 4950 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 1950 4500 50  0001 C CNN
F 3 " ~" H 1950 4500 50  0001 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
Text GLabel 2100 4550 2    50   BiDi ~ 0
D+
Text GLabel 2100 4650 2    50   BiDi ~ 0
D-
Text GLabel 3000 4850 0    50   BiDi ~ 0
D-
Text GLabel 3000 4750 0    50   BiDi ~ 0
D+
$Comp
L power:VCC #PWR0120
U 1 1 603444CD
P 2100 4350
F 0 "#PWR0120" H 2100 4200 50  0001 C CNN
F 1 "VCC" H 2115 4523 50  0000 C CNN
F 2 "" H 2100 4350 50  0001 C CNN
F 3 "" H 2100 4350 50  0001 C CNN
	1    2100 4350
	1    0    0    -1  
$EndComp
Text GLabel 6150 3700 0    50   Input ~ 0
INH1
Text GLabel 5300 3150 2    50   Input ~ 0
OUT2
Text GLabel 9450 3500 0    50   Output ~ 0
OUT4
$Comp
L Regulator_Linear:LM317_TO-220 U2
U 1 1 60361643
P 2050 2650
F 0 "U2" H 2050 2892 50  0000 C CNN
F 1 "LM317_TO-220" H 2050 2801 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2050 2900 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 2050 2650 50  0001 C CNN
	1    2050 2650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 60362226
P 1600 2650
F 0 "#PWR0110" H 1600 2500 50  0001 C CNN
F 1 "VCC" H 1615 2823 50  0000 C CNN
F 2 "" H 1600 2650 50  0001 C CNN
F 3 "" H 1600 2650 50  0001 C CNN
	1    1600 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2650 1600 2650
$Comp
L Device:R R1
U 1 1 60365083
P 2500 2650
F 0 "R1" V 2293 2650 50  0000 C CNN
F 1 "2.7" V 2384 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2430 2650 50  0001 C CNN
F 3 "~" H 2500 2650 50  0001 C CNN
	1    2500 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 2650 2800 2650
Wire Wire Line
	2800 2650 2800 2950
Wire Wire Line
	2800 2950 2050 2950
Connection ~ 2800 2650
Wire Wire Line
	2800 2650 3000 2650
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 6036789C
P 1650 3500
F 0 "J2" H 1758 3781 50  0000 C CNN
F 1 "Conn_01x03_Male" H 1758 3690 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1650 3500 50  0001 C CNN
F 3 "~" H 1650 3500 50  0001 C CNN
	1    1650 3500
	1    0    0    -1  
$EndComp
Text GLabel 1850 3400 2    50   BiDi ~ 0
D+
Text GLabel 1850 3500 2    50   BiDi ~ 0
D-
Text Notes 7400 7500 0    79   ~ 0
Motherboard's Schematic\n
Text Notes 8150 7650 0    59   ~ 0
Feb 24th 2021
$Comp
L power:GND #PWR?
U 1 1 604D6347
P 1850 3600
F 0 "#PWR?" H 1850 3350 50  0001 C CNN
F 1 "GND" H 1855 3427 50  0000 C CNN
F 2 "" H 1850 3600 50  0001 C CNN
F 3 "" H 1850 3600 50  0001 C CNN
	1    1850 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D70B7
P 1700 4950
F 0 "#PWR?" H 1700 4700 50  0001 C CNN
F 1 "GND" H 1650 4800 50  0000 C CNN
F 2 "" H 1700 4950 50  0001 C CNN
F 3 "" H 1700 4950 50  0001 C CNN
	1    1700 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D75BB
P 1800 4950
F 0 "#PWR?" H 1800 4700 50  0001 C CNN
F 1 "GND" H 1850 4800 50  0000 C CNN
F 2 "" H 1800 4950 50  0001 C CNN
F 3 "" H 1800 4950 50  0001 C CNN
	1    1800 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D78B4
P 2800 5150
F 0 "#PWR?" H 2800 4900 50  0001 C CNN
F 1 "GND" H 2800 5000 50  0000 C CNN
F 2 "" H 2800 5150 50  0001 C CNN
F 3 "" H 2800 5150 50  0001 C CNN
	1    2800 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D84C8
P 5900 3500
F 0 "#PWR?" H 5900 3250 50  0001 C CNN
F 1 "GND" H 5800 3500 50  0000 C CNN
F 2 "" H 5900 3500 50  0001 C CNN
F 3 "" H 5900 3500 50  0001 C CNN
	1    5900 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D8AE5
P 7000 3500
F 0 "#PWR?" H 7000 3250 50  0001 C CNN
F 1 "GND" H 6900 3500 50  0000 C CNN
F 2 "" H 7000 3500 50  0001 C CNN
F 3 "" H 7000 3500 50  0001 C CNN
	1    7000 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D9D49
P 8100 3500
F 0 "#PWR?" H 8100 3250 50  0001 C CNN
F 1 "GND" H 8000 3500 50  0000 C CNN
F 2 "" H 8100 3500 50  0001 C CNN
F 3 "" H 8100 3500 50  0001 C CNN
	1    8100 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604DA381
P 9150 3400
F 0 "#PWR?" H 9150 3150 50  0001 C CNN
F 1 "GND" H 9050 3400 50  0000 C CNN
F 2 "" H 9150 3400 50  0001 C CNN
F 3 "" H 9150 3400 50  0001 C CNN
	1    9150 3400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
