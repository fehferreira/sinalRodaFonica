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

void interruptTMR1();
void configInterruptTMR1();

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO FUNÇÕES

void interruptTMR1()
{
  if(TMR1IF_bit)                           //Houve interrupçao do TIMER1?
  {                                        //Sim...
    contador_rotacao ++;                   //incrementa sinal de rotaçao

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
  // --- CONFIGURAÇAO DO TIMER1 ---

  T1CON = 0b01000001;                      //Configuraçao TIMER1
                                           //Clock interno
                                           //Prescaler 1:1
                                           //Desliga modulo TIMER1

  TMR1L = 0x00;                            //Inicializa variaveis de contagem
  TMR1H = 0x00;                            //Inicializa variaveis de contagem
  TMR1IE_bit = 0x01;                       //Habilita interrupçao do TIMER1
  TMR1IP_bit = 0x01;                       //Configura a interrupção como HighPriority
}

//-----------------------------------------------------------------------------