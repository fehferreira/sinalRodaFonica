//-----------------------------------------------------------------------------
/*
  GERADORDE SINAL DE ROTA�AO 60-2 COM FASE - PROJETO
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:NOVEMBRO 2019
  CLOCK: 4MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO LCD

#include "header.h"

//---------------------------------------------------------------------------
// --- CRIA�AO DE VARIAVEIS GLOBAIS

unsigned short contador_rotacao = 0x00,
               dentes,
               falhas;

unsigned int valor_captura;

//---------------------------------------------------------------------------
// --- C�DIGO PRINCIPAL

void main()
{
  // --- CONFIGURACAO GERAL ---

  GIE_bit = 0x01;                          //Habilita interrup�oes gerais
  PEIE_bit = 0x01;                         //Habilita interrup�oes de perifericos
  IPEN_bit = 0x01;                         //Habilita prioridade de interrup��o.
  TRISD = 0x1F;                            //Configura PORTD com i/o's
  TRISB = 0xF0;                            //Configura PORTB com i/o's
  TRISC = 0xFF;                            //Configura PORTC com i/o's
  
  view = 1;
  contT = 60000;
  
  // --- CONFIGURA��O DE ADC ---

  ADCON0 = 0x00;                           //Configurando os conversores como desabilitados
  ADCON1 = 0x0F;                           //Configurando as entradas como digitais
  
  // --- CONFIGURACAO DAS INTERRUPCOES ---
  
  configInterruptTMR0();                   //Chamando fun�ao de config do TMR0
  configInterruptTMR1();                   //Chamando funcao de config do TMR1

  // --- CONFIGURACAO LCD ---
  
  Lcd_Init();                              //Inicializa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);                //Desliga o cursor do LCD


  while(1)
   {
     if(limpa_lcd) limpaLCD();
   
     if(view) valorCaptura();                     //Funcao de impressao da rota�ao
     else     valores();
      
      
   }//FINAL LOOP

}//FINAL MAIN

//----------------------------------------------------------------------------
// --- DECLARA�AO DAS FUN�OES

void interrupt()
{
  interruptTMR1();
}

//----------------------------------------------------------------------------

void interrupt_low()
{
  interruptTMR0();
}