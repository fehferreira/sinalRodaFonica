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
void buttonMenu();

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
    limpa_lcd = 1;
  }
}

//-----------------------------------------------------------------------------

void buttonMenu()
{
  if(button1)                     //Botao solto?
  {
    if(flaginicio == 0)
    {
      flagVoltar = 1;
      flagConfirma = 1;
      limpa_lcd = 0x01;
    }
  }

  if(button2)
  {
    if(flaginicio == 0)
    {
      if(var_menu <= max_menu && var_menu > min_menu) var_menu --;
      else                             var_menu = min_menu;
      limpa_lcd = 0x01;
    }
  }

  if(button3)
  {
    if(flaginicio == 0)
    {
      if(var_menu < max_menu && var_menu >= 0) var_menu ++;
      else                             var_menu = max_menu;
      limpa_lcd = 0x01;
    }
  }

  if(button4)
  {
    if(flaginicio == 1)
    {
      flaginicio = 0;
      limpa_lcd = 1;
    }else
    {
      flagConfirma = 1;
      limpa_lcd = 0x01;
    }
  }
}

//-----------------------------------------------------------------------------