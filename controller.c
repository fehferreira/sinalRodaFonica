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

//----------------------------------------------------------------------------
// ---- DECLARAï¿½ï¿½O DE VARIAVEIS -----

bit flagConfirma,
    flagVoltar,
    flaginicio;

unsigned short var_menu = 1,
               pos_menu,
               max_menu,
               min_menu,
               vetor_menu[5];

unsigned int counter_rotacao;

//----------------------------------------------------------------------------
// --- FUNÇAO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

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


//----------------------------------------------------------------------------
// --- FUNÇÃO DE CONTROLE DE NIVEL E SUBNIVEL DE MENUS ---

void desligaSinais()
{
  TMR1ON_bit = 0x00;
  TMR3ON_bit = 0x00;
  rotacao = 0x00;
  fase = 0x00;
}

//----------------------------------------------------------------------------
// --- DECLARAÇAO DAS FUNï¿½OES LOGICAS DOS MENUS E SUBMENUS -----

void logicaMenuPrincipal()
{
  //Definindo a quantidade de menu
  max_menu = 1;
  min_menu = 0;
  
  //Configurar TIMER1 para sinal de rotacao
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
      case 0: logicaDentes();
      case 1: sinalHall();
    }
  }
  flagVoltar = 0x00;
}

//----------------------------------------------------------------------------

void logicaDentes()
{
  //Definindo a quantidade de menu
  max_menu = 150;
  min_menu = 1;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      escolhaDentes();
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      logicaEspacos();
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void logicaEspacos()
{
  //Definindo a quantidade de menu
  max_menu = 149;
  min_menu = 1;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      escolhaEspacos();
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      sinalIndutivo();
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

void sinalIndutivo();
{
  //Definindo a quantidade de menu
  max_menu = 0;
  min_menu = 0;

  while(flagVoltar != 1)
  {
    while(flagConfirma != 1)
    {
      mostrarSinalIndutivo();
    }
    flagConfirma = 0;
    var_menu = controle_menu(var_menu);
    if(flagVoltar != 1)
    {
      logicaEdicaoIndutivo();
    }else
    {
      goto inicio;
    }
  }
  flagVoltar = 0;
}

//----------------------------------------------------------------------------

