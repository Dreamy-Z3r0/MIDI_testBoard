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
L 74xx:CD74HC4067M IC1A1
U 1 1 603473BC
P 2750 3850
F 0 "IC1A1" V 2650 3550 50  0000 C CNN
F 1 "CD74HC4067M" V 2750 3750 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 3650 2850 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4067.pdf" H 2400 4700 50  0001 C CNN
	1    2750 3850
	1    0    0    -1  
$EndComp
Text GLabel 2250 4450 0    50   Input ~ 0
INH1
Text GLabel 2250 3750 0    50   Input ~ 0
A
Text GLabel 2250 3850 0    50   Input ~ 0
B
Text GLabel 2250 3950 0    50   Input ~ 0
C
Text GLabel 2250 4050 0    50   Input ~ 0
D
$Comp
L Device:R R17
U 1 1 6034F720
P 1950 3350
F 0 "R17" V 1743 3350 50  0000 C CNN
F 1 "4k7" V 1834 3350 50  0000 C CNN
F 2 "" V 1880 3350 50  0001 C CNN
F 3 "~" H 1950 3350 50  0001 C CNN
	1    1950 3350
	0    1    1    0   
$EndComp
Text GLabel 1600 3350 0    50   Output ~ 0
OUT1
$Comp
L Device:R R18
U 1 1 603510D9
P 1700 3700
F 0 "R18" H 1770 3746 50  0000 L CNN
F 1 "10k" H 1770 3655 50  0000 L CNN
F 2 "" V 1630 3700 50  0001 C CNN
F 3 "~" H 1700 3700 50  0001 C CNN
	1    1700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3350 2100 3350
Wire Wire Line
	1800 3350 1700 3350
Wire Wire Line
	1700 3350 1700 3550
Connection ~ 1700 3350
Wire Wire Line
	1700 3350 1600 3350
$Comp
L power:Earth #PWR0110
U 1 1 6035716D
P 1700 3850
F 0 "#PWR0110" H 1700 3600 50  0001 C CNN
F 1 "Earth" H 1700 3700 50  0001 C CNN
F 2 "" H 1700 3850 50  0001 C CNN
F 3 "~" H 1700 3850 50  0001 C CNN
	1    1700 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 6036F293
P 3550 3150
F 0 "#PWR0111" H 3550 3000 50  0001 C CNN
F 1 "VCC" H 3565 3323 50  0000 C CNN
F 2 "" H 3550 3150 50  0001 C CNN
F 3 "" H 3550 3150 50  0001 C CNN
	1    3550 3150
	1    0    0    -1  
$EndComp
Connection ~ 3550 3150
$Comp
L power:VCC #PWR0112
U 1 1 60371125
P 2750 2850
F 0 "#PWR0112" H 2750 2700 50  0001 C CNN
F 1 "VCC" H 2765 3023 50  0000 C CNN
F 2 "" H 2750 2850 50  0001 C CNN
F 3 "" H 2750 2850 50  0001 C CNN
	1    2750 2850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0113
U 1 1 60372793
P 2750 4950
F 0 "#PWR0113" H 2750 4700 50  0001 C CNN
F 1 "Earth" H 2750 4800 50  0001 C CNN
F 2 "" H 2750 4950 50  0001 C CNN
F 3 "~" H 2750 4950 50  0001 C CNN
	1    2750 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:CD74HC4067M IC2A1
U 1 1 60372E58
P 5750 3850
F 0 "IC2A1" V 5650 3550 50  0000 C CNN
F 1 "CD74HC4067M" V 5750 3750 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 6650 2850 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4067.pdf" H 5400 4700 50  0001 C CNN
	1    5750 3850
	1    0    0    -1  
$EndComp
$Comp
L fsr:FSR RF1
U 1 1 6037CB30
P 3400 3150
F 0 "RF1" V 3400 3600 50  0000 C CNN
F 1 "FSR" V 3400 3400 50  0000 C CNN
F 2 "" H 3400 2900 50  0001 C TNN
F 3 "" H 3400 2800 50  0001 C TNN
	1    3400 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3150 3550 3250
$Comp
L fsr:FSR RF2
U 1 1 60386619
P 3400 3250
F 0 "RF2" V 3400 3700 50  0000 C CNN
F 1 "FSR" V 3400 3500 50  0000 C CNN
F 2 "" H 3400 3000 50  0001 C TNN
F 3 "" H 3400 2900 50  0001 C TNN
	1    3400 3250
	0    1    1    0   
$EndComp
Connection ~ 3550 3250
Wire Wire Line
	3550 3250 3550 3350
$Comp
L fsr:FSR RF3
U 1 1 60387533
P 3400 3350
F 0 "RF3" V 3400 3800 50  0000 C CNN
F 1 "FSR" V 3400 3600 50  0000 C CNN
F 2 "" H 3400 3100 50  0001 C TNN
F 3 "" H 3400 3000 50  0001 C TNN
	1    3400 3350
	0    1    1    0   
$EndComp
Connection ~ 3550 3350
Wire Wire Line
	3550 3350 3550 3450
$Comp
L fsr:FSR RF4
U 1 1 60387853
P 3400 3450
F 0 "RF4" V 3400 3900 50  0000 C CNN
F 1 "FSR" V 3400 3700 50  0000 C CNN
F 2 "" H 3400 3200 50  0001 C TNN
F 3 "" H 3400 3100 50  0001 C TNN
	1    3400 3450
	0    1    1    0   
$EndComp
Connection ~ 3550 3450
Wire Wire Line
	3550 3450 3550 3550
$Comp
L fsr:FSR RF5
U 1 1 6038854F
P 3400 3550
F 0 "RF5" V 3400 4000 50  0000 C CNN
F 1 "FSR" V 3400 3800 50  0000 C CNN
F 2 "" H 3400 3300 50  0001 C TNN
F 3 "" H 3400 3200 50  0001 C TNN
	1    3400 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3650 3550 3750
$Comp
L fsr:FSR RF7
U 1 1 603888D1
P 3400 3750
F 0 "RF7" V 3400 4200 50  0000 C CNN
F 1 "FSR" V 3400 4000 50  0000 C CNN
F 2 "" H 3400 3500 50  0001 C TNN
F 3 "" H 3400 3400 50  0001 C TNN
	1    3400 3750
	0    1    1    0   
$EndComp
Connection ~ 3550 3750
Wire Wire Line
	3550 3750 3550 3850
$Comp
L fsr:FSR RF8
U 1 1 60388B56
P 3400 3850
F 0 "RF8" V 3400 4300 50  0000 C CNN
F 1 "FSR" V 3400 4100 50  0000 C CNN
F 2 "" H 3400 3600 50  0001 C TNN
F 3 "" H 3400 3500 50  0001 C TNN
	1    3400 3850
	0    1    1    0   
$EndComp
Connection ~ 3550 3850
Wire Wire Line
	3550 3850 3550 3950
$Comp
L fsr:FSR RF9
U 1 1 60388F17
P 3400 3950
F 0 "RF9" V 3400 4400 50  0000 C CNN
F 1 "FSR" V 3400 4200 50  0000 C CNN
F 2 "" H 3400 3700 50  0001 C TNN
F 3 "" H 3400 3600 50  0001 C TNN
	1    3400 3950
	0    1    1    0   
$EndComp
Connection ~ 3550 3950
Wire Wire Line
	3550 3950 3550 4050
$Comp
L fsr:FSR RF10
U 1 1 60389242
P 3400 4050
F 0 "RF10" V 3400 4500 50  0000 C CNN
F 1 "FSR" V 3400 4300 50  0000 C CNN
F 2 "" H 3400 3800 50  0001 C TNN
F 3 "" H 3400 3700 50  0001 C TNN
	1    3400 4050
	0    1    1    0   
$EndComp
Connection ~ 3550 4050
Wire Wire Line
	3550 4050 3550 4150
$Comp
L fsr:FSR RF11
U 1 1 603896E0
P 3400 4150
F 0 "RF11" V 3400 4600 50  0000 C CNN
F 1 "FSR" V 3400 4400 50  0000 C CNN
F 2 "" H 3400 3900 50  0001 C TNN
F 3 "" H 3400 3800 50  0001 C TNN
	1    3400 4150
	0    1    1    0   
$EndComp
Connection ~ 3550 4150
Wire Wire Line
	3550 4150 3550 4250
$Comp
L fsr:FSR RF12
U 1 1 6038993F
P 3400 4250
F 0 "RF12" V 3400 4700 50  0000 C CNN
F 1 "FSR" V 3400 4500 50  0000 C CNN
F 2 "" H 3400 4000 50  0001 C TNN
F 3 "" H 3400 3900 50  0001 C TNN
	1    3400 4250
	0    1    1    0   
$EndComp
Connection ~ 3550 4250
Wire Wire Line
	3550 4250 3550 4350
$Comp
L fsr:FSR RF13
U 1 1 60389A96
P 3400 4350
F 0 "RF13" V 3400 4800 50  0000 C CNN
F 1 "FSR" V 3400 4600 50  0000 C CNN
F 2 "" H 3400 4100 50  0001 C TNN
F 3 "" H 3400 4000 50  0001 C TNN
	1    3400 4350
	0    1    1    0   
$EndComp
Connection ~ 3550 4350
Wire Wire Line
	3550 4350 3550 4450
$Comp
L fsr:FSR RF14
U 1 1 60389C04
P 3400 4450
F 0 "RF14" V 3400 4900 50  0000 C CNN
F 1 "FSR" V 3400 4700 50  0000 C CNN
F 2 "" H 3400 4200 50  0001 C TNN
F 3 "" H 3400 4100 50  0001 C TNN
	1    3400 4450
	0    1    1    0   
$EndComp
Connection ~ 3550 4450
Wire Wire Line
	3550 4450 3550 4550
$Comp
L fsr:FSR RF15
U 1 1 60389E71
P 3400 4550
F 0 "RF15" V 3400 5000 50  0000 C CNN
F 1 "FSR" V 3400 4800 50  0000 C CNN
F 2 "" H 3400 4300 50  0001 C TNN
F 3 "" H 3400 4200 50  0001 C TNN
	1    3400 4550
	0    1    1    0   
$EndComp
Connection ~ 3550 4550
Wire Wire Line
	3550 4550 3550 4650
$Comp
L fsr:FSR RF16
U 1 1 6038A085
P 3400 4650
F 0 "RF16" V 3400 5100 50  0000 C CNN
F 1 "FSR" V 3400 4900 50  0000 C CNN
F 2 "" H 3400 4400 50  0001 C TNN
F 3 "" H 3400 4300 50  0001 C TNN
	1    3400 4650
	0    1    1    0   
$EndComp
$Comp
L fsr:FSR RF6
U 1 1 6038A29E
P 3400 3650
F 0 "RF6" V 3400 4100 50  0000 C CNN
F 1 "FSR" V 3400 3900 50  0000 C CNN
F 2 "" H 3400 3400 50  0001 C TNN
F 3 "" H 3400 3300 50  0001 C TNN
	1    3400 3650
	0    1    1    0   
$EndComp
Connection ~ 3550 3550
Wire Wire Line
	3550 3550 3550 3650
Connection ~ 3550 3650
$Comp
L Device:R R19
U 1 1 6039A78B
P 5100 3350
F 0 "R19" V 4893 3350 50  0000 C CNN
F 1 "4k7" V 4984 3350 50  0000 C CNN
F 2 "" V 5030 3350 50  0001 C CNN
F 3 "~" H 5100 3350 50  0001 C CNN
	1    5100 3350
	0    1    1    0   
$EndComp
Text GLabel 4750 3350 0    50   Output ~ 0
OUT3
$Comp
L Device:R R20
U 1 1 6039AF68
P 4850 3600
F 0 "R20" H 4780 3554 50  0000 R CNN
F 1 "10k" H 4780 3645 50  0000 R CNN
F 2 "" V 4780 3600 50  0001 C CNN
F 3 "~" H 4850 3600 50  0001 C CNN
	1    4850 3600
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR0114
U 1 1 6039B592
P 4850 3750
F 0 "#PWR0114" H 4850 3500 50  0001 C CNN
F 1 "Earth" H 4850 3600 50  0001 C CNN
F 2 "" H 4850 3750 50  0001 C CNN
F 3 "~" H 4850 3750 50  0001 C CNN
	1    4850 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3350 4850 3350
Wire Wire Line
	4850 3350 4850 3450
Connection ~ 4850 3350
Wire Wire Line
	4850 3350 4950 3350
$Comp
L power:VCC #PWR0115
U 1 1 6039E5F5
P 5750 2850
F 0 "#PWR0115" H 5750 2700 50  0001 C CNN
F 1 "VCC" H 5765 3023 50  0000 C CNN
F 2 "" H 5750 2850 50  0001 C CNN
F 3 "" H 5750 2850 50  0001 C CNN
	1    5750 2850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0116
U 1 1 6039F19A
P 5750 4950
F 0 "#PWR0116" H 5750 4700 50  0001 C CNN
F 1 "Earth" H 5750 4800 50  0001 C CNN
F 2 "" H 5750 4950 50  0001 C CNN
F 3 "~" H 5750 4950 50  0001 C CNN
	1    5750 4950
	1    0    0    -1  
$EndComp
Text GLabel 6250 3150 2    50   Input ~ 0
I0
Text GLabel 6250 3250 2    50   Input ~ 0
I1
Text GLabel 6250 3350 2    50   Input ~ 0
I2
Text GLabel 6250 3450 2    50   Input ~ 0
I3
Text GLabel 6250 3550 2    50   Input ~ 0
I4
Text GLabel 5250 3750 0    50   Input ~ 0
A
Text GLabel 5250 3850 0    50   Input ~ 0
B
Text GLabel 5250 3950 0    50   Input ~ 0
C
Text GLabel 5250 4050 0    50   Input ~ 0
D
$Comp
L Switch:SW_MEC_5G FixedVelocity1
U 1 1 603A0A11
P 9250 3150
F 0 "FixedVelocity1" H 9250 3435 50  0000 C CNN
F 1 "SW_MEC_5G" H 9250 3344 50  0000 C CNN
F 2 "" H 9250 3350 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 9250 3350 50  0001 C CNN
	1    9250 3150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_MEC_5G Scales1
U 1 1 603A1D03
P 9250 3750
F 0 "Scales1" H 9250 4035 50  0000 C CNN
F 1 "SW_MEC_5G" H 9250 3944 50  0000 C CNN
F 2 "" H 9250 3950 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=488" H 9250 3950 50  0001 C CNN
	1    9250 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 603A2617
P 8750 3300
F 0 "R21" H 8680 3254 50  0000 R CNN
F 1 "330" H 8680 3345 50  0000 R CNN
F 2 "" V 8680 3300 50  0001 C CNN
F 3 "~" H 8750 3300 50  0001 C CNN
	1    8750 3300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R22
U 1 1 603A3078
P 8750 3600
F 0 "R22" H 8680 3554 50  0000 R CNN
F 1 "330" H 8680 3645 50  0000 R CNN
F 2 "" V 8680 3600 50  0001 C CNN
F 3 "~" H 8750 3600 50  0001 C CNN
	1    8750 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9050 3150 8750 3150
Connection ~ 8750 3150
Wire Wire Line
	8750 3150 8600 3150
Wire Wire Line
	9050 3750 8750 3750
Connection ~ 8750 3750
Wire Wire Line
	8750 3750 8600 3750
Text GLabel 8600 3150 0    50   Output ~ 0
I0
Text GLabel 8600 3750 0    50   Output ~ 0
I1
Wire Wire Line
	8750 3450 8350 3450
Wire Wire Line
	8350 3450 8350 4150
Connection ~ 8750 3450
$Comp
L Device:R_POT FixedVelocityValue1
U 1 1 603AD358
P 9250 4150
F 0 "FixedVelocityValue1" V 9043 4150 50  0000 C CNN
F 1 "R_POT 10K" V 9134 4150 50  0000 C CNN
F 2 "" H 9250 4150 50  0001 C CNN
F 3 "~" H 9250 4150 50  0001 C CNN
	1    9250 4150
	0    1    -1   0   
$EndComp
$Comp
L Device:R_POT StartNoteValue1
U 1 1 603ADB92
P 9250 4600
F 0 "StartNoteValue1" V 9043 4600 50  0000 C CNN
F 1 "R_POT 10K" V 9134 4600 50  0000 C CNN
F 2 "" H 9250 4600 50  0001 C CNN
F 3 "~" H 9250 4600 50  0001 C CNN
	1    9250 4600
	0    1    -1   0   
$EndComp
$Comp
L Device:R_POT StartOctaveValue1
U 1 1 603AE43E
P 9250 5050
F 0 "StartOctaveValue1" V 9043 5050 50  0000 C CNN
F 1 "R_POT 10K" V 9134 5050 50  0000 C CNN
F 2 "" H 9250 5050 50  0001 C CNN
F 3 "~" H 9250 5050 50  0001 C CNN
	1    9250 5050
	0    1    -1   0   
$EndComp
Text GLabel 9000 4000 0    50   Output ~ 0
I2
Text GLabel 9000 4450 0    50   Output ~ 0
I3
Text GLabel 9000 4900 0    50   Output ~ 0
I4
Wire Wire Line
	9100 4150 8350 4150
Connection ~ 8350 4150
Wire Wire Line
	8350 4150 8350 4600
Wire Wire Line
	9100 4600 8350 4600
Connection ~ 8350 4600
Wire Wire Line
	8350 4600 8350 5050
Wire Wire Line
	8350 5050 9100 5050
Connection ~ 8350 5050
Wire Wire Line
	8350 5050 8350 5450
$Comp
L power:Earth #PWR0117
U 1 1 603B6312
P 8350 5450
F 0 "#PWR0117" H 8350 5200 50  0001 C CNN
F 1 "Earth" H 8350 5300 50  0001 C CNN
F 2 "" H 8350 5450 50  0001 C CNN
F 3 "~" H 8350 5450 50  0001 C CNN
	1    8350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3150 9750 3150
Wire Wire Line
	9750 5050 9400 5050
Wire Wire Line
	9750 2750 9750 3150
Connection ~ 9750 3150
Wire Wire Line
	9750 3150 9750 3750
Wire Wire Line
	9450 3750 9750 3750
Connection ~ 9750 3750
Wire Wire Line
	9750 3750 9750 4150
Wire Wire Line
	9400 4150 9750 4150
Connection ~ 9750 4150
Wire Wire Line
	9750 4150 9750 4600
Wire Wire Line
	9400 4600 9750 4600
Connection ~ 9750 4600
Wire Wire Line
	9750 4600 9750 5050
$Comp
L power:VCC #PWR0118
U 1 1 603BEE7F
P 9750 2750
F 0 "#PWR0118" H 9750 2600 50  0001 C CNN
F 1 "VCC" H 9765 2923 50  0000 C CNN
F 2 "" H 9750 2750 50  0001 C CNN
F 3 "" H 9750 2750 50  0001 C CNN
	1    9750 2750
	1    0    0    -1  
$EndComp
Text Notes 7400 7500 0    79   ~ 0
MUX 1&3 Schematic\n
Text Notes 8150 7650 0    59   ~ 0
Feb 24th 2021\n
Text GLabel 5250 4450 0    50   Input ~ 0
INH3
Wire Wire Line
	9000 4000 9250 4000
Wire Wire Line
	9250 4450 9000 4450
Wire Wire Line
	9250 4900 9000 4900
$EndSCHEMATC
