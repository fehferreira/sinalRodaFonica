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

//---------------------------------------------------------------------------
// --- CRIAÇAO DE VARIAVEIS GLOBAIS

unsigned int contT;

//-----------------------------------------------------------------------------
// --- INCLUINDO PROTÓTIPOS DAS FUNÇÕES

void buttonFreq();
void testButtonVar();

//-----------------------------------------------------------------------------
// --- DESENVOLVENDO FUNÇÕES

void buttonFreq()
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

//-----------------------------------------------------------------------------

void testButtonVar()
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

//-----------------------------------------------------------------------------