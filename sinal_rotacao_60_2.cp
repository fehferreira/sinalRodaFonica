#line 1 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/sensor-rotacao-60-2/sinal_rotacao_60_2.c"
#line 24 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/sensor-rotacao-60-2/sinal_rotacao_60_2.c"
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
#line 50 "C:/Users/Felipe - Oficina/Documents/Programação/PIC/sensor-rotacao-60-2/sinal_rotacao_60_2.c"
char contador_rotacao = 0x00;

bit view,
 limpa_lcd;

unsigned int entrada_rotacao,
 contT,
 valor_captura;

char txt[15],
 txt2[15];




void valorCaptura();
void interrupt();
void interrupt_low();
void testButton();
void valores();
void limpaLCD();




void main()
{


 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 IPEN_bit = 0x01;
 TRISD = 0x1F;
 TRISB = 0xF0;
 TRISC = 0xFF;

 view = 1;
 contT = 60000;



 T1CON = 0b01000001;




 TMR1L = 0x00;
 TMR1H = 0x00;
 TMR1IE_bit = 0x01;
 TMR1IP_bit = 0x01;



 T0CON = 0b10001000;





 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IE_bit = 0x01;
 TMR0IP_bit = 0x00;



 ADCON0 = 0x00;
 ADCON1 = 0x0F;




 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);


 while(1)
 {
 if(limpa_lcd) limpaLCD();

 if(view) valorCaptura();
 else valores();


 }

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


void interrupt()
{
 if(TMR1IF_bit)
 {
 contador_rotacao ++;

 if(contador_rotacao < 116)  LATD5_bit  = ~ LATD5_bit ;
 if(contador_rotacao >= 116)
 {
  LATD0_bit  = ~ LATD0_bit ;
  LATD5_bit  = 0x00;
 }
 if(contador_rotacao == 119)
 {
 contador_rotacao = 0x00;
  LATD0_bit  = 0x00;
 }
 TMR1L = contT << 8;
 TMR1H = contT >> 8;

 valor_captura = 65535 - contT;

 TMR1IF_bit = 0x00;
 }

}

void interrupt_low()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0H = 0xB1;
 TMR0L = 0xE0;

 testButton();

 }
}

void testButton()
{
 if( Button(&PORTB, 7, 150, 1) )
 {
 if(contT == 65535 || contT >= 65525) contT = 65535;
 else contT += 10;

 limpa_lcd = 1;

 }

 if( Button(&PORTB, 6, 150, 1) )
 {
 if(contT == 60000 || contT <= 60010) contT = 60000;
 else contT -= 10;

 limpa_lcd = 1;
 }

 if( Button(&PORTB, 5, 150, 1) )
 {
 view = ~view;
 limpa_lcd = 1;
 }
}
