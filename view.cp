#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/view.c"
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
#line 54 "c:/users/felipe - oficina/documents/programação/pic/signal-rotation-induction/header.h"
void logicaMenuPrincipal();


void buttonFreq();
void buttonMenu();


void inicioLcd();
void tipoSinal();
void valorCaptura();
void valores();
void limpaLCD();


void interruptTMR0();
void configInterruptTMR0();


void interruptTMR1();
void configInterruptTMR1();




extern unsigned short contador_rotacao,
 dentes,
 var_menu,
 pos_menu,
 max_menu,
 min_menu,
 falhas;

extern bit flaginicio,
 flagConfirma,
 flagVoltar,
 limpa_lcd;

extern unsigned int contT,
 valor_captura;

extern char txt[15],
 txt2[15];
#line 16 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/view.c"
bit limpa_lcd;

char txt[15],
 txt2[15];




void buttonFreq();
void testButtonVar();
void inicioLcd();




char escolhaSinal[2] [17] = {"Sinal Indutivo","Sinal Hall"};




void inicioLcd()
{
 Lcd_Chr(1,1,'V');
 Lcd_Chr_Cp('a');
 Lcd_Chr_Cp('r');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('a');
 Lcd_Chr_Cp('p');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

}



void tipoSinal()
{

 Lcd_Chr(1,1,'T');
 Lcd_Chr_Cp('i');
 Lcd_Chr_Cp('p');
 Lcd_Chr_Cp('o');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('d');
 Lcd_Chr_Cp('e');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('s');
 Lcd_Chr_Cp('i');
 Lcd_Chr_Cp('n');
 Lcd_Chr_Cp('a');
 Lcd_Chr_Cp('l');
 Lcd_Chr_Cp(':');

 Lcd_Out(2,1,escolhaSinal[var_menu]);

}



void valorCaptura()
{
 Lcd_Chr(1,1,'V');
 Lcd_Chr_Cp('a');
 Lcd_Chr_Cp('r');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('C');
 Lcd_Chr_Cp('a');
 Lcd_Chr_Cp('p');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 Lcd_Chr(2,6,'m');
 Lcd_Chr_Cp('s');

 Lcd_Chr(2,14,'H');
 Lcd_Chr_Cp('z');

 FloatToStr_FixLen(((2*(valor_captura * 1 * 2E-7))/1000),txt2, 5);
 WordToStr((1/(2*(valor_captura * 1 * 2E-7))),txt);

 Lcd_Out(2,1,txt2);
 Lcd_Out(2,8,txt);
}



void valores()
{
 Lcd_Chr(1,1,'V');
 Lcd_Chr_Cp('a');
 Lcd_Chr_Cp('r');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp('I');
 Lcd_Chr_Cp('n');
 Lcd_Chr_Cp('c');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(':');

 LongToStr(contT,txt2);

 Lcd_Out(2,1,txt2);
}



void limpaLCD()
{
 limpa_lcd = 0;
 Lcd_Cmd(_LCD_CLEAR);
}
