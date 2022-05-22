EESchema Schematic File Version 4
LIBS:led_display-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "7 seg led display"
Date "2022-03-22"
Rev "1"
Comp "Robert Bicz"
Comment1 "Licensed under CERN-OHL-P v2 or later"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 7800 850  850  1000
U 62139026
F0 "Display" 50
F1 "Display.sch" 50
F2 "DI" I L 7800 1000 50 
F3 "CLK" I L 7800 1100 50 
F4 "LATCH" I L 7800 1200 50 
$EndSheet
Text Label 1750 1150 2    50   ~ 0
C2
Text Label 2250 1150 0    50   ~ 0
C1
Text Label 1750 1250 2    50   ~ 0
C4
Text Label 1750 1350 2    50   ~ 0
C6
Text Label 1750 1450 2    50   ~ 0
C8
Text Label 1750 1550 2    50   ~ 0
C10
Text Label 1750 1650 2    50   ~ 0
C12
Text Label 1750 1750 2    50   ~ 0
C14
Text Label 1750 1850 2    50   ~ 0
C16
Text Label 2250 1250 0    50   ~ 0
C3
Text Label 2250 1350 0    50   ~ 0
C5
Text Label 2250 1450 0    50   ~ 0
C7
Text Label 2250 1550 0    50   ~ 0
C9
Text Label 2250 1650 0    50   ~ 0
C11
Text Label 2250 1750 0    50   ~ 0
C13
Text Label 2250 1850 0    50   ~ 0
C15
Text Label 2250 1950 0    50   ~ 0
R1
Text Label 2250 2050 0    50   ~ 0
R3
Text Label 2250 2150 0    50   ~ 0
R5
Text Label 1750 1950 2    50   ~ 0
R2
Text Label 1750 2050 2    50   ~ 0
R4
Text Label 1750 2150 2    50   ~ 0
R6
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J2
U 1 1 621C295D
P 1950 1750
F 0 "J2" H 2000 2567 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 2000 2476 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x13_P2.54mm_Vertical" H 1950 1750 50  0001 C CNN
F 3 "~" H 1950 1750 50  0001 C CNN
	1    1950 1750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U7
U 1 1 6215752C
P 3550 1400
AR Path="/6215752C" Ref="U7"  Part="1" 
AR Path="/62139026/6215752C" Ref="U?"  Part="1" 
F 0 "U7" H 3300 1950 50  0000 C CNN
F 1 "74HC595" H 3750 1950 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3550 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 3550 1400 50  0001 C CNN
	1    3550 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U10
U 1 1 621581F4
P 5050 1400
AR Path="/621581F4" Ref="U10"  Part="1" 
AR Path="/62139026/621581F4" Ref="U?"  Part="1" 
F 0 "U10" H 4800 1950 50  0000 C CNN
F 1 "74HC595" H 5250 1950 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5050 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 5050 1400 50  0001 C CNN
	1    5050 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6216E58E
P 3550 4700
F 0 "#PWR0101" H 3550 4450 50  0001 C CNN
F 1 "GND" H 3555 4527 50  0000 C CNN
F 2 "" H 3550 4700 50  0001 C CNN
F 3 "" H 3550 4700 50  0001 C CNN
	1    3550 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6216F1BB
P 3550 2100
F 0 "#PWR0102" H 3550 1850 50  0001 C CNN
F 1 "GND" H 3555 1927 50  0000 C CNN
F 2 "" H 3550 2100 50  0001 C CNN
F 3 "" H 3550 2100 50  0001 C CNN
	1    3550 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 6216FA61
P 5050 2100
F 0 "#PWR0103" H 5050 1850 50  0001 C CNN
F 1 "GND" H 5055 1927 50  0000 C CNN
F 2 "" H 5050 2100 50  0001 C CNN
F 3 "" H 5050 2100 50  0001 C CNN
	1    5050 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 6217009E
P 6550 2100
F 0 "#PWR0104" H 6550 1850 50  0001 C CNN
F 1 "GND" H 6555 1927 50  0000 C CNN
F 2 "" H 6550 2100 50  0001 C CNN
F 3 "" H 6550 2100 50  0001 C CNN
	1    6550 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0126
U 1 1 62170E3E
P 3550 2800
F 0 "#PWR0126" H 3550 2650 50  0001 C CNN
F 1 "VDD" H 3550 2950 50  0000 C CNN
F 2 "" H 3550 2800 50  0001 C CNN
F 3 "" H 3550 2800 50  0001 C CNN
	1    3550 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0128
U 1 1 62172826
P 5050 700
F 0 "#PWR0128" H 5050 550 50  0001 C CNN
F 1 "VDD" H 5067 873 50  0000 C CNN
F 2 "" H 5050 700 50  0001 C CNN
F 3 "" H 5050 700 50  0001 C CNN
	1    5050 700 
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0129
U 1 1 6217309D
P 6550 700
F 0 "#PWR0129" H 6550 550 50  0001 C CNN
F 1 "VDD" H 6567 873 50  0000 C CNN
F 2 "" H 6550 700 50  0001 C CNN
F 3 "" H 6550 700 50  0001 C CNN
	1    6550 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 62175662
P 3150 1650
F 0 "#PWR0130" H 3150 1400 50  0001 C CNN
F 1 "GND" H 3155 1477 50  0000 C CNN
F 2 "" H 3150 1650 50  0001 C CNN
F 3 "" H 3150 1650 50  0001 C CNN
	1    3150 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 621760E7
P 4650 1650
F 0 "#PWR0131" H 4650 1400 50  0001 C CNN
F 1 "GND" H 4655 1477 50  0000 C CNN
F 2 "" H 4650 1650 50  0001 C CNN
F 3 "" H 4650 1650 50  0001 C CNN
	1    4650 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 62176DB1
P 6150 1650
F 0 "#PWR0132" H 6150 1400 50  0001 C CNN
F 1 "GND" H 6155 1477 50  0000 C CNN
F 2 "" H 6150 1650 50  0001 C CNN
F 3 "" H 6150 1650 50  0001 C CNN
	1    6150 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1650 6150 1600
Wire Wire Line
	4650 1650 4650 1600
Wire Wire Line
	3150 1650 3150 1600
Text Label 1850 4000 0    50   ~ 0
CLK
Text Label 1850 3900 0    50   ~ 0
DI
Text Label 1850 3800 0    50   ~ 0
DO
Text Label 1850 3700 0    50   ~ 0
~KBD_CS
Text Label 1850 3600 0    50   ~ 0
~LED_CS
$Comp
L 74xGxx:74AHC1G125 U9
U 1 1 6217F39E
P 4550 3100
F 0 "U9" H 4525 2925 50  0000 C CNN
F 1 "74AHC1G125" H 4525 2834 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4550 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4550 3100 50  0001 C CNN
	1    4550 3100
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0133
U 1 1 6218054E
P 3000 1300
F 0 "#PWR0133" H 3000 1150 50  0001 C CNN
F 1 "VDD" H 3017 1473 50  0000 C CNN
F 2 "" H 3000 1300 50  0001 C CNN
F 3 "" H 3000 1300 50  0001 C CNN
	1    3000 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0134
U 1 1 62180EC3
P 4500 1300
F 0 "#PWR0134" H 4500 1150 50  0001 C CNN
F 1 "VDD" H 4517 1473 50  0000 C CNN
F 2 "" H 4500 1300 50  0001 C CNN
F 3 "" H 4500 1300 50  0001 C CNN
	1    4500 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0135
U 1 1 62181AED
P 6000 1300
F 0 "#PWR0135" H 6000 1150 50  0001 C CNN
F 1 "VDD" H 6017 1473 50  0000 C CNN
F 2 "" H 6000 1300 50  0001 C CNN
F 3 "" H 6000 1300 50  0001 C CNN
	1    6000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1300 6000 1300
Wire Wire Line
	4650 1300 4500 1300
Wire Wire Line
	3150 1300 3000 1300
Wire Wire Line
	6150 1000 5900 1000
Wire Wire Line
	5900 1000 5900 1900
Wire Wire Line
	5900 1900 5450 1900
Wire Wire Line
	4650 1000 4400 1000
Wire Wire Line
	4400 1000 4400 1900
Wire Wire Line
	4400 1900 3950 1900
Wire Wire Line
	3950 1000 4000 1000
Wire Wire Line
	3950 1100 4000 1100
Wire Wire Line
	3950 1200 4000 1200
Wire Wire Line
	3950 1300 4000 1300
Wire Wire Line
	3950 1400 4000 1400
Wire Wire Line
	3950 1500 4000 1500
Wire Wire Line
	3950 1600 4000 1600
Wire Wire Line
	3950 1700 4000 1700
Wire Wire Line
	5450 1000 5500 1000
Wire Wire Line
	5450 1100 5500 1100
Wire Wire Line
	5450 1200 5500 1200
Wire Wire Line
	5500 1300 5450 1300
Wire Wire Line
	5450 1400 5500 1400
Wire Wire Line
	5450 1500 5500 1500
Wire Wire Line
	5450 1600 5500 1600
Wire Wire Line
	5450 1700 5500 1700
Wire Wire Line
	6950 1100 7000 1100
Wire Wire Line
	6950 1200 7000 1200
Wire Wire Line
	6950 1300 7000 1300
Text Label 4000 1000 0    50   ~ 0
C1
Text Label 4000 1100 0    50   ~ 0
C2
Text Label 4000 1200 0    50   ~ 0
C3
Text Label 4000 1300 0    50   ~ 0
C4
Text Label 4000 1400 0    50   ~ 0
C5
Text Label 4000 1500 0    50   ~ 0
C6
Text Label 4000 1600 0    50   ~ 0
C7
Text Label 4000 1700 0    50   ~ 0
C8
Text Label 5500 1000 0    50   ~ 0
C9
Text Label 5500 1100 0    50   ~ 0
C10
Text Label 5500 1200 0    50   ~ 0
C11
Text Label 5500 1300 0    50   ~ 0
C12
Text Label 5500 1400 0    50   ~ 0
C13
Text Label 5500 1500 0    50   ~ 0
C14
Text Label 5500 1600 0    50   ~ 0
C15
Text Label 5500 1700 0    50   ~ 0
C16
Text Label 7000 1100 0    50   ~ 0
LED1
Text Label 7000 1200 0    50   ~ 0
LED2
Text Label 7000 1300 0    50   ~ 0
LED3
Wire Wire Line
	3050 3200 3000 3200
Wire Wire Line
	3000 3300 3050 3300
Wire Wire Line
	3000 3400 3050 3400
Wire Wire Line
	3000 3500 3050 3500
Wire Wire Line
	3000 3600 3050 3600
Wire Wire Line
	3050 3700 3000 3700
Wire Wire Line
	3050 3800 3000 3800
Wire Wire Line
	3050 3900 3000 3900
Text Label 3000 3900 2    50   ~ 0
R1
Text Label 3000 3200 2    50   ~ 0
R2
Text Label 3000 3800 2    50   ~ 0
R3
Text Label 3000 3300 2    50   ~ 0
R4
Text Label 3000 3700 2    50   ~ 0
R5
Text Label 3000 3400 2    50   ~ 0
R6
$Comp
L power:GND #PWR0136
U 1 1 6223770B
P 2250 2400
F 0 "#PWR0136" H 2250 2150 50  0001 C CNN
F 1 "GND" H 2255 2227 50  0000 C CNN
F 2 "" H 2250 2400 50  0001 C CNN
F 3 "" H 2250 2400 50  0001 C CNN
	1    2250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2400 2250 2350
Text Label 2250 2250 0    50   ~ 0
LED1
Text Label 1750 2250 2    50   ~ 0
LED2
Text Label 1750 2350 2    50   ~ 0
LED3
NoConn ~ 6950 1400
NoConn ~ 6950 1500
NoConn ~ 6950 1600
NoConn ~ 6950 1700
Wire Wire Line
	3050 2500 4550 2500
Connection ~ 4550 2500
Wire Wire Line
	4550 2500 6050 2500
Text Label 7650 1100 2    50   ~ 0
CLK
Wire Wire Line
	3050 2500 2950 2500
Connection ~ 3050 2500
$Comp
L 74xx:74LS165 U8
U 1 1 62163A52
P 3550 3700
F 0 "U8" H 3300 4450 50  0000 C CNN
F 1 "74LS165" H 3750 4450 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3550 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS165" H 3550 3700 50  0001 C CNN
	1    3550 3700
	1    0    0    -1  
$EndComp
NoConn ~ 4050 3200
Wire Wire Line
	3150 1000 3000 1000
Text Label 3000 1000 0    50   ~ 0
DI
Text Label 7650 1000 2    50   ~ 0
DI
Wire Wire Line
	7650 1100 7800 1100
Wire Wire Line
	7650 1000 7800 1000
Wire Wire Line
	4050 3100 4250 3100
Wire Wire Line
	4800 3100 4900 3100
Text Label 4900 3100 0    50   ~ 0
DO
Wire Wire Line
	4550 2900 4550 2850
Text Label 4550 2850 2    50   ~ 0
~KBD_CS
Text Label 3050 4300 2    50   ~ 0
CLK
Wire Wire Line
	3050 4400 3050 4500
$Comp
L power:GND #PWR0137
U 1 1 6227F555
P 3050 4500
F 0 "#PWR0137" H 3050 4250 50  0001 C CNN
F 1 "GND" H 3055 4327 50  0000 C CNN
F 2 "" H 3050 4500 50  0001 C CNN
F 3 "" H 3050 4500 50  0001 C CNN
	1    3050 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0138
U 1 1 62283FF8
P 2750 3100
F 0 "#PWR0138" H 2750 2850 50  0001 C CNN
F 1 "GND" H 2755 2927 50  0000 C CNN
F 2 "" H 2750 3100 50  0001 C CNN
F 3 "" H 2750 3100 50  0001 C CNN
	1    2750 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3100 3050 3100
Text Label 1350 3600 2    50   ~ 0
~IN_LATCH
Wire Wire Line
	3050 4100 3000 4100
Text Label 3000 4100 2    50   ~ 0
~IN_LATCH
Text Label 2950 2500 2    50   ~ 0
~KBD_CS
$Comp
L 74xx:74HC595 U11
U 1 1 6215B031
P 6550 1400
AR Path="/6215B031" Ref="U11"  Part="1" 
AR Path="/62139026/6215B031" Ref="U?"  Part="1" 
F 0 "U11" H 6300 1950 50  0000 C CNN
F 1 "74HC595" H 6750 1950 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 6550 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 6550 1400 50  0001 C CNN
	1    6550 1400
	1    0    0    -1  
$EndComp
NoConn ~ 6950 1900
Wire Wire Line
	7800 1200 7650 1200
Text Label 7650 1200 2    50   ~ 0
~LED_CS
Wire Wire Line
	1250 4000 1350 4000
Wire Wire Line
	1350 3900 1250 3900
Wire Wire Line
	1350 3800 1250 3800
Wire Wire Line
	1250 3800 1250 3900
Connection ~ 1250 3900
Wire Wire Line
	1250 3900 1250 4000
Wire Wire Line
	1250 4000 1250 4200
Connection ~ 1250 4000
$Comp
L power:GND #PWR0139
U 1 1 622CBC14
P 1250 4200
F 0 "#PWR0139" H 1250 3950 50  0001 C CNN
F 1 "GND" H 1255 4027 50  0000 C CNN
F 2 "" H 1250 4200 50  0001 C CNN
F 3 "" H 1250 4200 50  0001 C CNN
	1    1250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3700 950  3500
Wire Wire Line
	950  3700 1350 3700
$Comp
L power:VDD #PWR0140
U 1 1 622CEB60
P 950 3500
F 0 "#PWR0140" H 950 3350 50  0001 C CNN
F 1 "VDD" H 950 3650 50  0000 C CNN
F 2 "" H 950 3500 50  0001 C CNN
F 3 "" H 950 3500 50  0001 C CNN
	1    950  3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 622D102C
P 950 3800
F 0 "C1" H 1042 3846 50  0000 L CNN
F 1 "1u" H 1042 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 3800 50  0001 C CNN
F 3 "~" H 950 3800 50  0001 C CNN
	1    950  3800
	1    0    0    -1  
$EndComp
Connection ~ 950  3700
$Comp
L power:GND #PWR0141
U 1 1 622D1F12
P 950 3900
F 0 "#PWR0141" H 950 3650 50  0001 C CNN
F 1 "GND" H 955 3727 50  0000 C CNN
F 2 "" H 950 3900 50  0001 C CNN
F 3 "" H 950 3900 50  0001 C CNN
	1    950  3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 622F7AC0
P 6000 3100
F 0 "C2" H 6092 3146 50  0000 L CNN
F 1 "100n" H 6092 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6000 3100 50  0001 C CNN
F 3 "~" H 6000 3100 50  0001 C CNN
	1    6000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 622F898B
P 6500 3100
F 0 "C3" H 6592 3146 50  0000 L CNN
F 1 "100n" H 6592 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6500 3100 50  0001 C CNN
F 3 "~" H 6500 3100 50  0001 C CNN
	1    6500 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 622F8E7C
P 7000 3100
F 0 "C4" H 7092 3146 50  0000 L CNN
F 1 "100n" H 7092 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7000 3100 50  0001 C CNN
F 3 "~" H 7000 3100 50  0001 C CNN
	1    7000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 622F926C
P 7500 3100
F 0 "C5" H 7592 3146 50  0000 L CNN
F 1 "100n" H 7592 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7500 3100 50  0001 C CNN
F 3 "~" H 7500 3100 50  0001 C CNN
	1    7500 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3200 6500 3200
Connection ~ 6500 3200
Wire Wire Line
	6500 3200 7000 3200
Connection ~ 7000 3200
Wire Wire Line
	7000 3200 7500 3200
Wire Wire Line
	7500 3000 7000 3000
Connection ~ 6500 3000
Wire Wire Line
	6500 3000 6200 3000
Connection ~ 7000 3000
Wire Wire Line
	7000 3000 6500 3000
Wire Wire Line
	6000 3000 6000 2950
Connection ~ 6000 3000
Wire Wire Line
	6000 3200 6000 3250
Connection ~ 6000 3200
$Comp
L power:GND #PWR0142
U 1 1 62301CA0
P 6000 3250
F 0 "#PWR0142" H 6000 3000 50  0001 C CNN
F 1 "GND" H 6005 3077 50  0000 C CNN
F 2 "" H 6000 3250 50  0001 C CNN
F 3 "" H 6000 3250 50  0001 C CNN
	1    6000 3250
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0143
U 1 1 623023AA
P 6000 2950
F 0 "#PWR0143" H 6000 2800 50  0001 C CNN
F 1 "VDD" H 6017 3123 50  0000 C CNN
F 2 "" H 6000 2950 50  0001 C CNN
F 3 "" H 6000 2950 50  0001 C CNN
	1    6000 2950
	1    0    0    -1  
$EndComp
NoConn ~ 3000 3500
NoConn ~ 3000 3600
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 6212AA7C
P 1550 3800
F 0 "J1" H 1600 4100 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 1600 4126 50  0001 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 1550 3800 50  0001 C CNN
F 3 "~" H 1550 3800 50  0001 C CNN
	1    1550 3800
	1    0    0    1   
$EndComp
$Comp
L power:VCC #PWR0154
U 1 1 6228EB46
P 6200 2950
F 0 "#PWR0154" H 6200 2800 50  0001 C CNN
F 1 "VCC" H 6217 3123 50  0000 C CNN
F 2 "" H 6200 2950 50  0001 C CNN
F 3 "" H 6200 2950 50  0001 C CNN
	1    6200 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2950 6200 3000
Connection ~ 6200 3000
Wire Wire Line
	6200 3000 6000 3000
NoConn ~ 6950 1000
Wire Wire Line
	3150 1500 3050 1500
Wire Wire Line
	3050 1500 3050 2500
Wire Wire Line
	4650 1500 4550 1500
Wire Wire Line
	4550 1500 4550 2500
Wire Wire Line
	6150 1500 6050 1500
Wire Wire Line
	6050 1500 6050 2500
$Comp
L power:VDD #PWR0127
U 1 1 621720AA
P 3550 700
F 0 "#PWR0127" H 3550 550 50  0001 C CNN
F 1 "VDD" H 3567 873 50  0000 C CNN
F 2 "" H 3550 700 50  0001 C CNN
F 3 "" H 3550 700 50  0001 C CNN
	1    3550 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 700  3550 800 
Wire Wire Line
	6550 700  6550 800 
Wire Wire Line
	5050 700  5050 800 
Wire Wire Line
	6100 750  6100 1200
Wire Wire Line
	6100 1200 6150 1200
Wire Wire Line
	4650 1200 4600 1200
Wire Wire Line
	4600 1200 4600 750 
Connection ~ 4600 750 
Wire Wire Line
	4600 750  6100 750 
Wire Wire Line
	3150 1200 3100 1200
Wire Wire Line
	3100 1200 3100 750 
Wire Wire Line
	3100 750  4600 750 
Wire Wire Line
	3100 750  3050 750 
Connection ~ 3100 750 
Text Label 3050 750  2    50   ~ 0
CLK
$EndSCHEMATC
