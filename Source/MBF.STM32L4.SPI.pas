unit MBF.STM32L4.SPI;
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

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32L4.GPIO;

{$REGION PinDefinitions}

type
    TSPIMOSIPins = (
    {$if defined(has_SPI2) and defined(has_gpioc) }   PC1_SPI2 = ALT3 or TNativePin.PC1  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioc) },                                     {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }   PA7_SPI1 = ALT5 or TNativePin.PA7  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }, PA12_SPI1 = ALT5 or TNativePin.PA12 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob) },  PB5_SPI1 = ALT5 or TNativePin.PB5  {$endif}
    {$if defined(has_arduinominipins)             },  D11_SPI  = ALT5 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) }, PB15_SPI2 = ALT5 or TNativePin.PB15 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioc) },  PC3_SPI2 = ALT5 or TNativePin.PC3  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod) },  PD4_SPI2 = ALT5 or TNativePin.PD4  {$endif}
    {$if defined(has_SPI3) and defined(has_gpiod) },  PD6_SPI3 = ALT5 or TNativePin.PD6  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe) }, PE15_SPI1 = ALT5 or TNativePin.PE15 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiog) },  PG4_SPI1 = ALT5 or TNativePin.PG4  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi) },  PI3_SPI2 = ALT5 or TNativePin.PI3  {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob) },  PB5_SPI3 = ALT6 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc) }, PC12_SPI3 = ALT6 or TNativePin.PC12 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiog) }, PG11_SPI3 = ALT6 or TNativePin.PG11 {$endif}
  );

    TSPIMISOPins = (
      {$if defined(has_SPI1) and defined(has_gpioa) }   PA6_SPI1 = ALT5 or TNativePin.PA6  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioa) }, PA11_SPI1 = ALT5 or TNativePin.PA11 {$endif}
      {$if defined(has_SPI1) and defined(has_gpiob) },  PB4_SPI1 = ALT5 or TNativePin.PB4  {$endif}
      {$if defined(has_arduinominipins)             },  D12_SPI  = ALT5 or TNativePin.PB4  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiob) }, PB14_SPI2 = ALT5 or TNativePin.PB14 {$endif}
      {$if defined(has_SPI2) and defined(has_gpioc) },  PC2_SPI2 = ALT5 or TNativePin.PC2  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },  PD3_SPI2 = ALT5 or TNativePin.PD3  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioe) }, PE14_SPI1 = ALT5 or TNativePin.PE14 {$endif}
      {$if defined(has_SPI1) and defined(has_gpiog) },  PG3_SPI1 = ALT5 or TNativePin.PG3  {$endif}
      {$if defined(has_SPI2) and defined(has_gpioi) },  PI2_SPI2 = ALT5 or TNativePin.PI2  {$endif}
      {$if defined(has_SPI3) and defined(has_gpiob) },  PB4_SPI3 = ALT6 or TNativePin.PB4  {$endif}
      {$if defined(has_SPI3) and defined(has_gpioc) }, PC11_SPI3 = ALT6 or TNativePin.PC11 {$endif}
      {$if defined(has_SPI3) and defined(has_gpiog) }, PG10_SPI3 = ALT6 or TNativePin.PG10 {$endif}
    );

    TSPISCLKPins = (
      {$if defined(has_SPI2) and defined(has_gpioa) }   PA9_SPI2 = ALT3 or TNativePin.PA9  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },  PD3_SPI2 = ALT3 or TNativePin.PD3  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },                                     {$endif}
      {$if defined(has_SPI1) and defined(has_gpioa) }   PA1_SPI1 = ALT5 or TNativePin.PA1  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioa) },  PA5_SPI1 = ALT5 or TNativePin.PA5  {$endif}
      {$if defined(has_SPI1) and defined(has_gpiob) },  PB3_SPI1 = ALT5 or TNativePin.PB3  {$endif}
      {$if defined(has_arduinominipins)             },  D13_SPI  = ALT5 or TNativePin.PB3  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiob) }, PB10_SPI2 = ALT5 or TNativePin.PB10 {$endif}
      {$if defined(has_SPI2) and defined(has_gpiob) }, PB13_SPI2 = ALT5 or TNativePin.PB13 {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },  PD1_SPI2 = ALT5 or TNativePin.PD1  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioe) }, PE13_SPI1 = ALT5 or TNativePin.PE13 {$endif}
      {$if defined(has_SPI1) and defined(has_gpiog) },  PG2_SPI1 = ALT5 or TNativePin.PG2  {$endif}
      {$if defined(has_SPI2) and defined(has_gpioi) },  PI1_SPI2 = ALT5 or TNativePin.PI1  {$endif}
      {$if defined(has_SPI3) and defined(has_gpiob) },  PB3_SPI3 = ALT6 or TNativePin.PB3  {$endif}
      {$if defined(has_SPI3) and defined(has_gpioc) }, PC10_SPI3 = ALT6 or TNativePin.PC10 {$endif}
      {$if defined(has_SPI3) and defined(has_gpiog) },  PG9_SPI3 = ALT6 or TNativePin.PG9  {$endif}
    );

    TSPINSSPins = (
    {$if defined(has_SPI1) and defined(has_gpioa) }   PA4_SPI1 = ALT5 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }, PA15_SPI1 = ALT5 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob) },  PB0_SPI1 = ALT5 or TNativePin.PB0  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) },  PB9_SPI2 = ALT5 or TNativePin.PB9  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) }, PB12_SPI2 = ALT5 or TNativePin.PB12 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod) },  PD0_SPI2 = ALT5 or TNativePin.PD0  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe) }, PE12_SPI1 = ALT5 or TNativePin.PE12 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiog) },  PG5_SPI1 = ALT5 or TNativePin.PG5  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi) },  PI0_SPI2 = ALT5 or TNativePin.PI0  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa) },  PA4_SPI3 = ALT6 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa) }, PA15_SPI3 = ALT6 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiog) }, PG12_SPI3 = ALT6 or TNativePin.PG12 {$endif}
    {$if defined(has_arduinominipins)             },  D10_SPI  =         TNativePin.PA11 {$endif}
  );
{$ENDREGION}

const
  DefaultSPIBaudrate=8000000;
  DefaultSPITimeout=10000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=0,
    Sixteen=1
  );

  TSPIOperatingMode = (
    Slave=%0,
    Master=%1
  );

  TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function  FindDividerValue(const Baudrate: Cardinal) : Cardinal;
    function  GetBaudrate: Cardinal;
    procedure SetBaudrate(const aBaudrate: Cardinal);
    function  GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
    function  GetMode: TSPIMode;
    procedure SetMode(const aMode: TSPIMode);
    function  GetOperatingMode: TSPIOperatingMode;
    procedure SetOperatingMode(const aOperatingMode: TSPIOperatingMode);

    procedure SetMOSIPin(const aMOSIPin : TSPIMOSIPins);
    procedure SetMISOPin(const aMISOPin : TSPIMISOPins);
    procedure SetSCLKPin(const aSCLKPin : TSPISCLKPins);
    procedure SetNSSPin( const aNSSPin : TSPINSSPins);
    procedure SetNSSPinLow(const SoftNSSPin : TPinIdentifier);
    procedure SetNSSPinHigh(const SoftNSSPin : TPinIdentifier);

  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;
    function  Disable : boolean;
    procedure Enable;

    function ReadByte(var aReadByte: byte; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadWord(var aReadWord: word; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadWord(var aReadBuffer: array of word; aReadCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;

    function WriteByte(const aWriteByte: byte; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteBuffer(pWriteBuffer: pByte; aWriteCount : longWord; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteWord(const aWriteWord: word; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteWord(const aWriteBuffer: array of word; aWriteCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;

    function TransferByte(const aWriteByte : byte; var aReadByte : byte; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferByte(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aTransferCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferWord(const aWriteWord: word; var aReadWord : word; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferWord(const aWriteBuffer: array of word; var aReadBuffer : array of word; aTransferCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;

    property Baudrate : Cardinal read getBaudrate write setBaudrate;
    property Mode : TSPIMode read getMode write setMode;
    //property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
    property OperatingMode : TSPIOperatingMode read getOperatingMode write setOperatingMode;

    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOPINS}

  {$IF DEFINED(HAS_ARDUINOMINIPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOMINIPINS}

implementation
uses
  MBF.BitHelpers,
  MBF.STM32L4.SystemCore;

var
  NSSPins : array[1..3] of longInt;

procedure TSPIRegistersHelper.Initialize;
var
  i : longWord;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : RCC.APB2ENR  := RCC.APB2ENR or (1 shl 12);{$endif}
    {$ifdef has_spi2}SPI2_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 14);{$endif}
    {$ifdef has_spi3}SPI3_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 15);{$endif}
  end;

  for i := 1 to 3 do
    NSSPins[i] := -1;

  // Set Defaults, all crazy Modes turned off, SPI disabled
  CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  CR2:= 0;

  // MSTR Always set Master Mode
  SetBitLevelHigh(CR1,2);

  // Set correct Polarity and Phase aka as Mode 0-3
  setBitsMasked(CR1,longWord(TSPIMode.Mode0),%11 shl 0,0);

end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
begin
  Initialize;
  setBaudRate(DefaultSPIBaudrate);
  //Set configuration as defined by user

  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode((LongWord(AMOSIPin) shr 8) and $0f);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode((LongWord(AMISOPin) shr 8) and $0f);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode((LongWord(ASCLKPin) shr 8) and $0f);
  // Some special handling needed
  setNSSPin(ANSSPin);
end;

procedure TSPIRegistersHelper.SetMOSIPin(const aMOSIPin : TSPIMOSIPins);
begin
  GPIO.PinMode[longWord(aMOSIPin) and $ff] := TPinMode((longWord(aMOSIPin) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setMISOPin(const aMISOPIN : TSPIMISOPins);
begin
  GPIO.PinMode[longWord(aMISOPin) and $ff] := TPinMode((longWord(aMISOPin) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setSCLKPin(const aSCLKPin : TSPISCLKPins);
begin
  GPIO.PinMode[longWord(aSCLKPin) and $ff] := TPinMode((longWord(aSCLKPin) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setNSSPin(const aNSSPin : TSPINSSPins);
begin
  if longInt(aNSSPin) >=ALT0 then
  begin
    GPIO.PinMode[longWord(aNSSPin) and $ff] := TPinMode((longWord(aNSSPin) shr 8) and $0f);
    //Enable Hardware NSS
    SetBitLevelLow(CR1,9);
  end
  else
  begin
    SetBitLevelHigh(CR1,9);
    //TODO Low or High, what will it be????
    SetBitLevelHigh(CR1,8);

    if longInt(aNSSPin) >= 0 then
    begin
      GPIO.PinMode[longWord(aNSSPin)] := TPinMode.Output;
      GPIO.SetPinLevelHigh(longWord(aNSSPin));
    end;
  end;

  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : NSSPins[1] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi2}SPI2_BASE : NSSPins[2] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi3}SPI3_BASE : NSSPins[3] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi4}SPI4_BASE : NSSPins[4] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi5}SPI5_BASE : NSSPins[5] := longInt(aNSSPin);{$endif}
      {$ifdef has_spi6}SPI6_BASE : NSSPins[6] := longInt(aNSSPin);{$endif}
  end;
end;

procedure TSPIRegistersHelper.SetNSSPinLow(const SoftNSSPin : TPinIdentifier);
var
  _NSSPin : longWord;
begin
  // Are we doing Hardware NSS?
  if (GetBitValue(CR1,9) = 0) and (SoftNSSPin=TNativePin.None) then
    exit;

  if SoftNSSPin > TNativePin.None then
  begin
    GPIO.SetPinLevelLow(SoftNSSPin);
    SetBitLevelHigh(CR1,9);
    //TODO Low or High, what will it be????
    SetBitLevelHigh(CR1,8);
    exit;
  end;

  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
    {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
    {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
    {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    {$ifdef has_spi5}SPI5_BASE : _NSSPin := NSSPins[5];{$endif}
    {$ifdef has_spi6}SPI6_BASE : _NSSPin := NSSPins[6];{$endif}
  end;

  if _NSSPin >= ALT0 then
  begin
    //Enable Hardware NSS
    SetBitLevelLow(CR1,9);
  end
  else
  begin
    SetBitLevelHigh(CR1,9);
    //TODO Low or High, what will it be????
    SetBitLevelHigh(CR1,8);
    GPIO.SetPinLevelLow(_NSSPin);
  end
end;

procedure TSPIRegistersHelper.SetNSSPinHigh(const SoftNSSPin : TPinIdentifier);
var
  _NSSPin : longWord;
begin
  // Are we doing Hardware NSS?
  if (GetBitValue(CR1,9) = 0) and (SoftNSSPin=TNativePin.None) then
    exit;

  if SoftNSSPin > TNativePin.None then
  begin
    GPIO.SetPinLevelHigh(SoftNSSPin);
    exit;
  end;

  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
    {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
    {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
    {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    {$ifdef has_spi5}SPI5_BASE : _NSSPin := NSSPins[5];{$endif}
    {$ifdef has_spi6}SPI6_BASE : _NSSPin := NSSPins[6];{$endif}
  end;

  //Take the NSS Pin High in software Mode (end transfer)
  GPIO.SetPinLevelHigh(_NSSPin);
end;

function TSPIRegistersHelper.Disable : boolean;
begin
  Result := GetBitValue(CR1,6) > 0;
  SetBitLevelLow(CR1,6);
end;

procedure TSPIRegistersHelper.Enable;
begin
  SetBitLevelHigh(CR1,6);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: Cardinal): Cardinal;
var
  BaseFrequency : Cardinal;
begin
    case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_spi4}SPI4_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;

  for result := 0 to 7 do
    if BaudRate >= (BaseFrequency div word(2 shl result)) then
      break;
end;

function TSPIRegistersHelper.GetBaudrate: Cardinal;
var
  BaseFrequency : Cardinal;
begin
  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
      {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_spi4}SPI4_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;
  Result := BaseFrequency shr (GetBitsMasked(CR1,%111 shl 3,3)+1);
end;

procedure TSPIRegistersHelper.SetBaudrate(const aBaudrate: Cardinal);
var
  Divider : longWord;
begin
    Divider := FindDividerValue(aBaudrate);
    SetBitsMasked(CR1,Divider,%111 shl 3,3);
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(GetBitValue(CR1,11));
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
begin
  SetBitValue(CR1,TBitValue(aBitsPerWord),11);
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(GetBitsMasked(CR1,%11,0));
end;

procedure TSPIRegistersHelper.SetMode(const aMode: TSPIMode);
begin
  SetBitsMasked(CR1,longWord(aMode),%11,0);
end;


procedure TSPIRegistersHelper.SetOperatingMode(const aOperatingMode: TSPIOperatingMode);
begin
  //TODO
end;

function TSPIRegistersHelper.GetOperatingMode: TSPIOperatingMode;
begin
  Result := TSPIOperatingMode(GetBitValue(CR1,2));
end;

function TSPIRegistersHelper.ReadByte(var aReadByte: byte; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := $ff;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadByte := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  dummy : byte;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aReadCount = -1 then
    aReadCount := High(aReadBuffer) - Low(aReadBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aReadbuffer) to Low(aReadbuffer)+aReadCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := $ff;

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.ReadWord(var aReadWord: word; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := $ffff;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadWord := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;


  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.ReadWord(var aReadBuffer: array of word; aReadCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  Result := true;

  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aReadCount = -1 then
    aReadCount := High(aReadBuffer) - Low(aReadBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aReadBuffer) to Low(aReadBuffer)+aReadCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := $ffff;

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteByte(const aWriteByte: byte; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  Dummy : byte;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  DR := aWriteByte;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  Dummy := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteBuffer(pWriteBuffer: pByte; aWriteCount : longWord; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  dummy : byte;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := 1 to aWriteCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := pWriteBuffer^;

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    Dummy := DR;
    inc(pWriteBuffer);
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  dummy : byte;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aWriteCount = -1 then
    aWriteCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aWriteCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := aWriteBuffer[i];

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    Dummy := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.WriteWord(const aWriteWord: word; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  Dummy : Word;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 16 bits
  setBitsPerWord(TSPIBitsPerWord.Sixteen);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  DR := aWriteWord;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  Dummy := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;


function TSPIRegistersHelper.WriteWord(const aWriteBuffer: array of Word; aWriteCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  dummy : Word;
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aWriteCount = -1 then
    aWriteCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 16 bits
  setBitsPerWord(TSPIBitsPerWord.Sixteen);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aWriteCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    self.DR := aWriteBuffer[i];
    // TXE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    Dummy := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferByte(const aWriteByte : Byte; var aReadByte : Byte; const Timeout : longWord=0;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := aWriteByte;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadByte := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferByte(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aTransferCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);

  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aTransferCount = -1 then
    aTransferCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aTransferCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := aWriteBuffer[i];

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord : Word; var aReadWord : Word; const Timeout : longWord=0;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): boolean;
var
  EndTime : longWord;
begin
  Result := true;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  if WaitBitIsSet(SR,1,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  DR := aWriteWord;

  // TXE Wait until data is completely shifted out
  if WaitBitIsSet(SR,0,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;
  aReadWord := DR;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  setNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;

function TSPIRegistersHelper.TransferWord(const aWriteBuffer: array of word; var aReadBuffer : array of word; aTransferCount : integer=-1; const Timeout : longWord=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);

  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultSPITimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if aTransferCount = -1 then
    aTransferCount := High(aWriteBuffer) - Low(aWriteBuffer);

  SetNSSPinLow(SoftNSSPin);
  //transfer in 8 bits
  setBitsPerWord(TSPIBitsPerWord.Eight);
  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  SetBitLevelHigh(CR1,6);

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aTransferCount do
  begin
    if WaitBitIsSet(SR,1,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    DR := aWriteBuffer[i];

    // RXNE Wait until data is completely shifted out
    if WaitBitIsSet(SR,0,EndTime) = false then
    begin
      setNSSPinHigh(SoftNSSPin);
      SetBitLevelLow(CR1,6);
      exit(false);
    end;
    aReadBuffer[i] := DR;
  end;

  // Wait for Busy Flag to get cleared
  if WaitBitIsCleared(SR,7,EndTime) = false then
  begin
    setNSSPinHigh(SoftNSSPin);
    SetBitLevelLow(CR1,6);
    exit(false);
  end;

  SetNSSPinHigh(SoftNSSPin);

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  SetBitLevelLow(CR1,6);
end;


end.

