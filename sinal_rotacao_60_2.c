/*
  GERADORDE SINAL DE ROTAÇAO 60-2 COM FASE - PROJETO
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:NOVEMBRO 2019
  CLOCK: 4MHz                CICLO DE MAQU: 200nS
  
  -----------------------------------------------------------
        --- CALCULO PARA INTERRUPÇÃO DO TIMER1 ---
  
  Timer1_Ovf = (65536 - <TMR1H:TMR1L>) * prescaler T1 * ciclo de maquina
  Timer1_Ovf = (65536 - <variavel>) * 1 * 2E-7
  
  -----------------------------------------------------------
  -- CALCULO PARA INTERRUPÇÃO DO TIMER0(Teste dos botoes) ---
  
  Timer0_Ovf = (65535- (TMR0H + TMR0L)) * prescaler T1 * ciclo de maquina
  Timer0_Ovf = (65535 - 45536) * 2 * 2E-7
  Timer0_ovf = 0,004 segundos ou 4ms
  
*/
//-----------------------------------------------------------------------------
// --- DEFININDO LCD

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

//-----------------------------------------------------------------------------
// --- MAPEAMENTO DE HARDWARE ---

#define rotacao LATD5_bit
#define fase    LATD0_bit
#define button1 Button(&PORTB, 7, 150, 1)
#define button2 Button(&PORTB, 6, 150, 1)
#define button3 Button(&PORTB, 5, 150, 1)

//---------------------------------------------------------------------------
// --- CRIAÇAO DE VARIAVEIS GLOBAIS

char contador_rotacao = 0x00;
    
bit view,
    limpa_lcd;

unsigned int entrada_rotacao,
             contT,
             valor_captura;

char txt[15],
     txt2[15];

//-----------------------------------------------------------------------------
// --- CRIANDO PROTÓTIPOS DAS FUNÇOES

void valorCaptura();
void interrupt();
void interrupt_low();
void testButton();
void valores();
void limpaLCD();

//---------------------------------------------------------------------------
// --- CÓDIGO PRINCIPAL

void main()
{
  // --- CONFIGURACAO GERAL ---

  GIE_bit = 0x01;                          //Habilita interrupçoes gerais
  PEIE_bit = 0x01;                         //Habilita interrupçoes de perifericos
  IPEN_bit = 0x01;                         //Habilita prioridade de interrupção.
  TRISD = 0x1F;                            //Configura PORTD com i/o's
  TRISB = 0xF0;                            //Configura PORTB com i/o's
  TRISC = 0xFF;

  view = 1;
  contT = 60000;

  // --- CONFIGURAÇAO DO TIMER1 ---
  
  T1CON = 0b01000001;                      //Configuraçao TIMER1
                                           //Clock interno
                                           //Prescaler 1:1
                                           //Liga modulo TIMER1

  TMR1L = 0x00;                            //Inicializa variaveis de contagem
  TMR1H = 0x00;                            //Inicializa variaveis de contagem
  TMR1IE_bit = 0x01;                       //Habilita interrupçao do TIMER1
  TMR1IP_bit = 0x01;                       //Configura a interrupção como HighPriority
  
  // --- CONFIGURAÇÃO DO TIMER0 (TESTE DO BOTAO) - tempo de int=4ms ---
  
  T0CON = 0b10001000;                      //Configuração do TIMER0
                                           //Interrupção do TMR0 ligado
                                           //counter com 16 bits
                                           //incremento com clock interno
                                           //prescaler de 1:2

  TMR0H         = 0xB1;                           //Inicialização do contador TMR0H
  TMR0L         = 0xE0;                           //Inicialização do contador TMR0L
  TMR0IE_bit = 0x01;                       //Ativa a interrupção do TMR0
  TMR0IP_bit = 0x00;                       //Configura a interrupção como HighPriotiry

  // --- CONFIGURAÇÃO DE ADC ---
  
  ADCON0 = 0x00;                           //Configurando os conversores como desabilitados
  ADCON1 = 0x0F;                           //Configurando as entradas como digitais

  
  // --- CONFIGURACAO LCD ---
  
  Lcd_Init();                              //Inicializa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);                //Desliga o cursor do LCD


  while(1)
   {
     if(limpa_lcd) limpaLCD();
   
     if(view) valorCaptura();                     //Funcao de impressao da rotaçao
     else     valores();
      
      
   }//FINAL LOOP

}//FINAL MAIN

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNÇOES

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


void interrupt()                           //Funcao de interrupçao
{
  if(TMR1IF_bit)                           //Houve interrupçao do TIMER1?
  {                                        //Sim...
    contador_rotacao ++;                   //incrementa sinal de rotaçao

    if(contador_rotacao < 116) rotacao = ~rotacao;
    if(contador_rotacao >= 116)
    {
      fase = ~fase;
      rotacao = 0x00;
    }
    if(contador_rotacao == 119)
    {
      contador_rotacao = 0x00;
      fase = 0x00;
    }
    TMR1L = contT << 8;
    TMR1H = contT >> 8;
    
    valor_captura = 65535 - contT;
    
    TMR1IF_bit = 0x00;                     //Limpa a flag do TIMER1
  }
  
}

void interrupt_low()
{
  if(TMR0IF_bit)
  {
    TMR0IF_bit = 0x00;                     //Limpa a flag do TMR0
    TMR0H = 0xB1;                          //Reinicialização do contador TMR0H
    TMR0L = 0xE0;                          //Reinicialização do contador TMR0L

    testButton();

  }
}

void testButton()
{
  if(button1)
  {
    if(contT == 65535 || contT >= 65525)  contT = 65535;
    else              contT += 10;

    limpa_lcd = 1;

  }

  if(button2)
  {
    if(contT == 60000 || contT <= 60010)  contT = 60000;
    else            contT -= 10;

    limpa_lcd = 1;
  }

  if(button3)
  {
    view = ~view;
    limpa_lcd = 1;
  }
}