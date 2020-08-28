//-----------------------------------------------------------------------------
/*
  GERADORDE SINAL DE ROTA�AO 60-2 COM FASE - PROJETO
  DEVIDCE: PIC18F4550        SIMULA�AO:PROTEUS
  AUTOR: FELIPE FERREIRA     DATA:NOVEMBRO 2019
  CLOCK: 4MHz                CICLO DE MAQU: 200nS
*/
//-----------------------------------------------------------------------------
// --- DEFININDO INCLUDE'S

#include "header.h"

//-----------------------------------------------------------------------------
// --- INCLUINDO PROT�TIPOS DAS FUN��ES

void interruptTMR1();
void configInterruptTMR1();

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO FUN��ES

void interruptTMR1()
{
  if(TMR1IF_bit)                           //Houve interrup�ao do TIMER1?
  {                                        //Sim...
    contador_rotacao ++;                   //incrementa sinal de rota�ao

    if(contador_rotacao < dentes) rotacao = ~rotacao;
    if(contador_rotacao >= dentes)
    {
      fase = ~fase;
      rotacao = 0x00;
    }
    if(contador_rotacao == (dentes+falhas))
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

//-----------------------------------------------------------------------------

void configInterruptTMR1()
{
  // --- CONFIGURA�AO DO TIMER1 ---

  T1CON = 0b01000001;                      //Configura�ao TIMER1
                                           //Clock interno
                                           //Prescaler 1:1
                                           //Desliga modulo TIMER1

  TMR1L = 0x00;                            //Inicializa variaveis de contagem
  TMR1H = 0x00;                            //Inicializa variaveis de contagem
  TMR1IE_bit = 0x01;                       //Habilita interrup�ao do TIMER1
  TMR1IP_bit = 0x01;                       //Configura a interrup��o como HighPriority
}

//-----------------------------------------------------------------------------