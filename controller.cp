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
#line 54 "c:/users/felipe - oficina/documents/programação/pic/signal-rotation-induction/header.h"
void logicaMenuPrincipal();


void buttonFreq();
void testButtonVar();
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
#line 16 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
bit flagConfirma,
 flagVoltar,
 flaginicio;

unsigned short var_menu = 1,
 pos_menu,
 max_menu,
 min_menu,
 vetor_menu[5];

unsigned int counter_rotacao;




char controle_menu(char var_atual)
{
 if(flagVoltar == 0)
 {
 vetor_menu[pos_menu] = var_atual;
 pos_menu++;
 var_atual = 1;
 }else if(pos_menu > 0)
 {
 pos_menu--;
 var_atual = vetor_menu[pos_menu];
 }

 return var_atual;
}





void desligaSinais()
{
 TMR1ON_bit = 0x00;
 TMR3ON_bit = 0x00;
  LATD5_bit  = 0x00;
  LATD0_bit  = 0x00;
}




void logicaMenuPrincipal()
{

 max_menu = 2;
 min_menu = 1;


 configInterruptTMR1();

 while(flagConfirma != 1)
 {
 tipoSinal();
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {
 switch(vetor_menu[pos_menu-1])
 {
#line 84 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
 }
 }
 flagVoltar = 0x00;
}



void logicaMenu1()
{

 max_menu = 1;
 min_menu = 1;

 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 switch(var_menu)
 {

 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {
 switch(vetor_menu[pos_menu-1])
 {

 }
 }
 }
 flagVoltar = 0;
}



void logicaMenu2()
{

 max_menu = 2;
 min_menu = 1;

 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 switch(var_menu)
 {
#line 135 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {



 }
 }
 flagVoltar = 0;
}



void logicaMenu3()
{

 max_menu = 2;
 min_menu = 1;

 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 switch(var_menu)
 {
#line 165 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {



 }
 }
 flagVoltar = 0;
}




void logicaMenu1_1()
{

 max_menu = 2;
 min_menu = 1;


 configInterruptTMR1();


 TMR1ON_bit = 0x01;
 TMR3ON_bit = 0x01;

 while(flagVoltar != 1)
 {
 while(flagConfirma != 1)
 {
 switch(var_menu)
 {
#line 203 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
 }
 }
 flagConfirma = 0;
 var_menu = controle_menu(var_menu);
 if(flagVoltar != 1)
 {
 switch(vetor_menu[pos_menu-1])
 {
#line 213 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/signal-rotation-induction/controller.c"
 }
 }
 }
 flagVoltar = 0;
 desligaSinais();
}
