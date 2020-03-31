{******************************************************************************}
{                                                                              }
{            Indy (Internet Direct) - Internet Protocols Simplified            }
{                                                                              }
{            https://www.indyproject.org/                                      }
{            https://gitter.im/IndySockets/Indy                                }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  This file is part of the Indy (Internet Direct) project, and is offered     }
{  under the dual-licensing agreement described on the Indy website.           }
{  (https://www.indyproject.org/license/)                                      }
{                                                                              }
{  Copyright:                                                                  }
{   (c) 1993-2020, Chad Z. Hower and the Indy Pit Crew. All rights reserved.   }
{                                                                              }
{******************************************************************************}
{                                                                              }
{        Originally written by: Fabian S. Biehn                                }
{                               fbiehn@aagon.com (German & English)            }
{                                                                              }
{        Contributers:                                                         }
{                               Here could be your name                        }
{                                                                              }
{******************************************************************************}

unit IdOpenSSLHeaders_ebcdic;

interface

// Headers for OpenSSL 1.1.1
// ebcdic.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes;

var

  //extern const unsigned char os_toascii[256];
  //extern const unsigned char os_toebcdic[256];

  function ebcdic2ascii(dest: Pointer; const srce: Pointer; count: TIdC_SIZET): Pointer;
  function ascii2ebcdic(dest: Pointer; const srce: Pointer; count: TIdC_SIZET): Pointer;

implementation

end.
