{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}

{ Indicates that this config file has been processed (to avoid redeclaring or redefining of parameters in other
  configuration files). }
{$DEFINE MBF_CONFIG}

{$HINTS ON}
{$WARNINGS ON}

// Scoped Enums are a good thing
{$SCOPEDENUMS ON}

// Full Boolean Evaluation off
{$BOOLEVAL OFF}

// No IO Checks
{$IOCHECKS OFF}

{$STACKFRAMES OFF}

{$IMPLICITEXCEPTIONS OFF}

//Disable AnsiStrings, they require HEAP
{$LONGSTRINGS OFF}

// FreePascal compiler directives.

{$MODE OBJFPC}

{$INLINE ON}

{$MACRO ON}

{$MODESWITCH TYPEHELPERS}

{$MODESWITCH ADVANCEDRECORDS}

{$WRITEABLECONST OFF}

//{$STATIC ON}

{$IFNDEF EMBEDDED}
  {$ERROR MBF Framework can only be used for target embedded}
{$ENDIF}

{$INCLUDE MBF.Boards.Kinetis.inc}
{$INCLUDE MBF.Boards.STM32F0.inc}
{$INCLUDE MBF.Boards.STM32F1.inc}
{$INCLUDE MBF.Boards.STM32F2.inc}
{$INCLUDE MBF.Boards.STM32F3.inc}
{$INCLUDE MBF.Boards.STM32F4.inc}
{$INCLUDE MBF.Boards.STM32F7.inc}
{$INCLUDE MBF.Boards.STM32L0.inc}
{$INCLUDE MBF.Boards.STM32L1.inc}
{$INCLUDE MBF.Boards.STM32L4.inc}
{$INCLUDE MBF.Boards.NRF51.inc}
{$INCLUDE MBF.Boards.LPC8xx.inc}
{$INCLUDE MBF.Boards.PIC32MX.inc}
{$INCLUDE MBF.Boards.SAMC.inc}
{$INCLUDE MBF.Boards.SAMD.inc}

{$IFNDEF __CONTROLLERTYPE__}
  {$ERROR Unfortunately MBF has not yet been ported to your Embedded Controller}
{$ENDIF}
