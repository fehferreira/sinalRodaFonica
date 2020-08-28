#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
#line 1 "c:/users/felipe - oficina/documents/programação/pic/signal-rotation-induction/header.h"
#line 25 "c:/users/felipe - oficina/documents/programação/pic/signal-rotation-induction/header.h"
sbit LCD_RS at RD6_bit;
sbit LCD_EN at RD7_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISD6_bit;
sbit LCD_EN_Direction at TRISD7_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
#line 53 "c:/users/felipe - oficina/documents/programação/pic/signal-rotation-induction/header.h"
void buttonFreq();
void testButtonVar();


void valorCaptura();
void valores();
void limpaLCD();


void interruptTMR0();
void configInterruptTMR0();


void interruptTMR1();
void configInterruptTMR1();




extern unsigned short contador_rotacao,
 dentes,
 falhas;

extern bit view,
 limpa_lcd;

extern unsigned int contT,
 valor_captura;

extern char txt[15],
 txt2[15];
