//-----------------------------------------------------------------------------
/*
  GERADORDE SINAL DE ROTAÇAO 60-2 COM FASE - PROJETO
  DEVIDCE: PIC18F4550        SIMULAÇAO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:NOVEMBRO 2019
  CLOCK: 4MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO INCLUDE'S

#include "header.h"

//-----------------------------------------------------------------------------
// --- INCLUINDO PROTÓTIPOS DAS FUNÇÕES

void interruptTMR0();
void configInterruptTMR0();

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO FUNÇÕES

void interruptTMR0()
{
  if(TMR0IF_bit)
  {
    TMR0IF_bit = 0x00;                     //Limpa a flag do TMR0
    TMR0H = 0xB1;                          //Reinicialização do contador TMR0H
    TMR0L = 0xE0;                          //Reinicialização do contador TMR0L

    if(TMR1ON_bit == 0) testButtonVar();
    else                buttonFreq();
  }
}

//-----------------------------------------------------------------------------

void configInterruptTMR0()
{
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
}

//-----------------------------------------------------------------------------
