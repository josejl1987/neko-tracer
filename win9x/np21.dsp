# Microsoft Developer Studio Project File - Name="np21" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** 編集しないでください **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=np21 - Win32 Debug
!MESSAGE これは有効なﾒｲｸﾌｧｲﾙではありません。 このﾌﾟﾛｼﾞｪｸﾄをﾋﾞﾙﾄﾞするためには NMAKE を使用してください。
!MESSAGE [ﾒｲｸﾌｧｲﾙのｴｸｽﾎﾟｰﾄ] ｺﾏﾝﾄﾞを使用して実行してください
!MESSAGE 
!MESSAGE NMAKE /f "np21.mak".
!MESSAGE 
!MESSAGE NMAKE の実行時に構成を指定できます
!MESSAGE ｺﾏﾝﾄﾞ ﾗｲﾝ上でﾏｸﾛの設定を定義します。例:
!MESSAGE 
!MESSAGE NMAKE /f "np21.mak" CFG="np21 - Win32 Debug"
!MESSAGE 
!MESSAGE 選択可能なﾋﾞﾙﾄﾞ ﾓｰﾄﾞ:
!MESSAGE 
!MESSAGE "np21 - Win32 Release" ("Win32 (x86) Application" 用)
!MESSAGE "np21 - Win32 Release NT" ("Win32 (x86) Application" 用)
!MESSAGE "np21 - Win32 Trace" ("Win32 (x86) Application" 用)
!MESSAGE "np21 - Win32 Trap" ("Win32 (x86) Application" 用)
!MESSAGE "np21 - Win32 Debug" ("Win32 (x86) Application" 用)
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "np21 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\bin"
# PROP Intermediate_Dir "..\obj\rel21"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\\" /I ".\x86" /I ".\dialog" /I ".\debuguty" /I "..\\" /I "..\common" /I "..\codecnv" /I "..\i386c" /I "..\i386c\ia32" /I "..\i386c\ia32\instructions" /I "..\i386c\ia32\instructions\fpu" /I "..\mem" /I "..\io" /I "..\cbus" /I "..\bios" /I "..\lio" /I "..\vram" /I "..\sound" /I "..\sound\vermouth" /I "..\sound\getsnd" /I "..\fdd" /I "..\font" /I "..\generic" /I "..\trap" /I "..\zlib" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "SUPPORT_PC9821" /D "SUPPORT_WAVEREC" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x411 /d "NDEBUG"
# ADD RSC /l 0x411 /d "NDEBUG" /d "SUPPORT_PC9821"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ddraw.lib dxguid.lib DSOUND.LIB winmm.lib comctl32.lib wsock32.lib /nologo /subsystem:windows /map /machine:I386

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release_NT"
# PROP BASE Intermediate_Dir "Release_NT"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\bin"
# PROP Intermediate_Dir "..\obj\relnt21"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_UNICODE" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\\" /I ".\x86" /I ".\dialog" /I ".\debuguty" /I "..\\" /I "..\common" /I "..\codecnv" /I "..\i386c" /I "..\i386c\ia32" /I "..\i386c\ia32\instructions" /I "..\i386c\ia32\instructions\fpu" /I "..\mem" /I "..\io" /I "..\cbus" /I "..\bios" /I "..\lio" /I "..\vram" /I "..\sound" /I "..\sound\vermouth" /I "..\sound\getsnd" /I "..\fdd" /I "..\font" /I "..\generic" /I "..\trap" /I "..\zlib" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "UNICODE" /D "SUPPORT_PC9821" /D "SUPPORT_WAVEREC" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x411 /d "NDEBUG"
# ADD RSC /l 0x411 /d "NDEBUG" /d "SUPPORT_PC9821"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ddraw.lib dxguid.lib DSOUND.LIB winmm.lib comctl32.lib wsock32.lib /nologo /subsystem:windows /map /machine:I386 /out:"..\bin/np21nt.exe"

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Trace"
# PROP BASE Intermediate_Dir "Trace"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\bin"
# PROP Intermediate_Dir "..\obj\trc21"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\\" /I ".\x86" /I ".\dialog" /I ".\debuguty" /I "..\\" /I "..\common" /I "..\codecnv" /I "..\i386c" /I "..\i386c\ia32" /I "..\i386c\ia32\instructions" /I "..\i386c\ia32\instructions\fpu" /I "..\mem" /I "..\io" /I "..\cbus" /I "..\bios" /I "..\lio" /I "..\vram" /I "..\sound" /I "..\sound\vermouth" /I "..\sound\getsnd" /I "..\fdd" /I "..\font" /I "..\generic" /I "..\trap" /I "..\zlib" /D "NDEBUG" /D "TRACE" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "SUPPORT_PC9821" /D "NP2APPDEV" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x411 /d "NDEBUG"
# ADD RSC /l 0x411 /d "NDEBUG" /d "SUPPORT_PC9821"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ddraw.lib dxguid.lib DSOUND.LIB winmm.lib comctl32.lib wsock32.lib /nologo /subsystem:windows /map /machine:I386 /out:"..\bin/np21t.exe"

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Trap"
# PROP BASE Intermediate_Dir "Trap"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\bin"
# PROP Intermediate_Dir "..\obj\trap21"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\\" /I ".\x86" /I ".\dialog" /I ".\debuguty" /I "..\\" /I "..\common" /I "..\codecnv" /I "..\i386c" /I "..\i386c\ia32" /I "..\i386c\ia32\instructions" /I "..\i386c\ia32\instructions\fpu" /I "..\mem" /I "..\io" /I "..\cbus" /I "..\bios" /I "..\lio" /I "..\vram" /I "..\sound" /I "..\sound\vermouth" /I "..\sound\getsnd" /I "..\fdd" /I "..\font" /I "..\generic" /I "..\trap" /I "..\zlib" /D "NDEBUG" /D "TRACE" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "SUPPORT_PC9821" /D "NP2APPDEV" /D "ENABLE_TRAP" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x411 /d "NDEBUG"
# ADD RSC /l 0x411 /d "NDEBUG" /d "SUPPORT_PC9821"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ddraw.lib dxguid.lib DSOUND.LIB winmm.lib comctl32.lib wsock32.lib /nologo /subsystem:windows /map /machine:I386 /out:"..\bin/np21trap.exe"

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\bin"
# PROP Intermediate_Dir "..\obj\dbg21"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\\" /I ".\x86" /I ".\dialog" /I ".\debuguty" /I "..\\" /I "..\common" /I "..\codecnv" /I "..\i386c" /I "..\i386c\ia32" /I "..\i386c\ia32\instructions" /I "..\i386c\ia32\instructions\fpu" /I "..\mem" /I "..\io" /I "..\cbus" /I "..\bios" /I "..\lio" /I "..\vram" /I "..\sound" /I "..\sound\vermouth" /I "..\sound\getsnd" /I "..\fdd" /I "..\font" /I "..\generic" /I "..\trap" /I "..\zlib" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "SUPPORT_PC9821" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x411 /d "_DEBUG"
# ADD RSC /l 0x411 /d "_DEBUG" /d "SUPPORT_PC9821"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ddraw.lib dxguid.lib DSOUND.LIB winmm.lib comctl32.lib wsock32.lib /nologo /subsystem:windows /debug /machine:I386 /out:"..\bin/np21d.exe" /pdbtype:sept

!ENDIF 

# Begin Target

# Name "np21 - Win32 Release"
# Name "np21 - Win32 Release NT"
# Name "np21 - Win32 Trace"
# Name "np21 - Win32 Trap"
# Name "np21 - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Group "common"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\COMMON\ARC.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\ARCUNZIP.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\BMPDATA.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\LSTARRAY.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\MILSTR.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\MIMPIDEF.C
# End Source File
# Begin Source File

SOURCE=.\x86\PARTS.X86

!IF  "$(CFG)" == "np21 - Win32 Release"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\rel21
InputPath=.\x86\PARTS.X86
InputName=PARTS

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\relnt21
InputPath=.\x86\PARTS.X86
InputName=PARTS

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trc21
InputPath=.\x86\PARTS.X86
InputName=PARTS

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trap21
InputPath=.\x86\PARTS.X86
InputName=PARTS

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\dbg21
InputPath=.\x86\PARTS.X86
InputName=PARTS

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\COMMON\PROFILE.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\STRRES.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\TEXTFILE.C
# End Source File
# Begin Source File

SOURCE=..\COMMON\WAVEFILE.C
# End Source File
# End Group
# Begin Group "codecnv"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\CODECNV\TCSWAP16.C
# End Source File
# Begin Source File

SOURCE=..\CODECNV\UCS2UTF8.C
# End Source File
# Begin Source File

SOURCE=..\CODECNV\UTF8UCS2.C
# End Source File
# End Group
# Begin Group "cpu"

# PROP Default_Filter ""
# Begin Group "IA32"

# PROP Default_Filter ""
# Begin Group "instructions"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\I386C\ia32\instructions\bin_arith.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\bit_byte.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\ctrl_trans.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\data_trans.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\dec_arith.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\flag_ctrl.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\fpu\fpdummy.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\logic_arith.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\misc_inst.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\seg_reg.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\shift_rotate.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\string_inst.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\instructions\system_inst.c
# End Source File
# End Group
# Begin Source File

SOURCE=..\I386C\ia32\cpu.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\cpu_io.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\cpu_mem.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\ctrlxfer.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\debug.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\disasm.c

!IF  "$(CFG)" == "np21 - Win32 Release"

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\exception.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\groups.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\ia32.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\inst_table.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\interface.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\paging.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\resolve.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\segments.c
# End Source File
# Begin Source File

SOURCE=..\I386C\ia32\task.c
# End Source File
# End Group
# Begin Source File

SOURCE=..\I386C\cpucore.c
# End Source File
# Begin Source File

SOURCE=..\I386C\memory.c
# End Source File
# End Group
# Begin Group "mem"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\MEM\DMAX86.C
# End Source File
# Begin Source File

SOURCE=..\MEM\MEMEGC.C
# End Source File
# Begin Source File

SOURCE=..\MEM\MEMEMS.C
# End Source File
# Begin Source File

SOURCE=..\MEM\MEMEPP.C
# End Source File
# Begin Source File

SOURCE=..\MEM\MEMTRAM.C
# End Source File
# Begin Source File

SOURCE=..\MEM\MEMVGA.C
# End Source File
# Begin Source File

SOURCE=..\MEM\MEMVRAM.C
# End Source File
# End Group
# Begin Group "io"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\IO\ARTIC.C
# End Source File
# Begin Source File

SOURCE=..\IO\CGROM.C
# End Source File
# Begin Source File

SOURCE=..\IO\CPUIO.C
# End Source File
# Begin Source File

SOURCE=..\IO\CRTC.C
# End Source File
# Begin Source File

SOURCE=..\IO\DIPSW.C
# End Source File
# Begin Source File

SOURCE=..\IO\DMAC.C
# End Source File
# Begin Source File

SOURCE=..\IO\EGC.C
# End Source File
# Begin Source File

SOURCE=..\IO\EMSIO.C
# End Source File
# Begin Source File

SOURCE=..\IO\EPSONIO.C
# End Source File
# Begin Source File

SOURCE=..\IO\FDC.C
# End Source File
# Begin Source File

SOURCE=..\IO\FDD320.C
# End Source File
# Begin Source File

SOURCE=..\IO\GDC.C
# End Source File
# Begin Source File

SOURCE=..\IO\GDC_PSET.C
# End Source File
# Begin Source File

SOURCE=..\IO\GDC_SUB.C
# End Source File
# Begin Source File

SOURCE=..\IO\IOCORE.C
# End Source File
# Begin Source File

SOURCE=..\IO\MOUSEIF.C
# End Source File
# Begin Source File

SOURCE=..\IO\NECIO.C
# End Source File
# Begin Source File

SOURCE=..\IO\NMIIO.C
# End Source File
# Begin Source File

SOURCE=..\IO\NP2SYSP.C
# End Source File
# Begin Source File

SOURCE=..\IO\PCIDEV.C
# End Source File
# Begin Source File

SOURCE=..\IO\PIC.C
# End Source File
# Begin Source File

SOURCE=..\IO\PIT.C
# End Source File
# Begin Source File

SOURCE=..\IO\PRINTIF.C
# End Source File
# Begin Source File

SOURCE=..\IO\SERIAL.C
# End Source File
# Begin Source File

SOURCE=..\IO\SYSPORT.C
# End Source File
# Begin Source File

SOURCE=..\IO\UPD4990.C
# End Source File
# End Group
# Begin Group "cbus"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\CBUS\AMD98.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\ATAPICMD.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\BOARD14.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\BOARD26K.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\BOARD86.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\BOARDSPB.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\BOARDX2.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\CBUSCORE.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\CS4231IO.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\IDEIO.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\MPU98II.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\PC9861K.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\PCM86IO.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\SASIIO.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\SCSICMD.C
# End Source File
# Begin Source File

SOURCE=..\CBUS\SCSIIO.C
# End Source File
# End Group
# Begin Group "bios"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\BIOS\BIOS.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS09.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS0C.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS12.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS13.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS18.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS19.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS1A.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS1B.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS1C.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\BIOS1F.C
# End Source File
# Begin Source File

SOURCE=..\BIOS\SXSIBIOS.C
# End Source File
# End Group
# Begin Group "lio"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\LIO\GCIRCLE.C
# End Source File
# Begin Source File

SOURCE=..\LIO\GLINE.C
# End Source File
# Begin Source File

SOURCE=..\LIO\GPSET.C
# End Source File
# Begin Source File

SOURCE=..\LIO\GPUT1.C
# End Source File
# Begin Source File

SOURCE=..\LIO\GSCREEN.C
# End Source File
# Begin Source File

SOURCE=..\LIO\LIO.C
# End Source File
# End Group
# Begin Group "vram"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\VRAM\DISPSYNC.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\MAKEGREX.C
# End Source File
# Begin Source File

SOURCE=.\x86\MAKEGRPH.X86

!IF  "$(CFG)" == "np21 - Win32 Release"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\rel21
InputPath=.\x86\MAKEGRPH.X86
InputName=MAKEGRPH

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj -i.\x86\ -i..\i386c\x86\ -i..\io\x86\ $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\relnt21
InputPath=.\x86\MAKEGRPH.X86
InputName=MAKEGRPH

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj -i.\x86\ -i..\i386c\x86\ -i..\io\x86\ $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trc21
InputPath=.\x86\MAKEGRPH.X86
InputName=MAKEGRPH

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj -i.\x86\ -i..\i386c\x86\ -i..\io\x86\ $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trap21
InputPath=.\x86\MAKEGRPH.X86
InputName=MAKEGRPH

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj -i.\x86\ -i..\i386c\x86\ -i..\io\x86\ $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\dbg21
InputPath=.\x86\MAKEGRPH.X86
InputName=MAKEGRPH

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj -i.\x86\ -i..\i386c\x86\ -i..\io\x86\ $(InputPath)

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\VRAM\MAKETEXT.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\MAKETGRP.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\PALETTES.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\SCRNDRAW.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\SCRNSAVE.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\SDRAW.C
# End Source File
# Begin Source File

SOURCE=..\VRAM\VRAM.C
# End Source File
# End Group
# Begin Group "sound"

# PROP Default_Filter ""
# Begin Group "vermouth"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\SOUND\VERMOUTH\MIDIMOD.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\VERMOUTH\MIDINST.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\VERMOUTH\MIDIOUT.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\VERMOUTH\MIDTABLE.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\VERMOUTH\MIDVOICE.C
# End Source File
# End Group
# Begin Group "getsnd"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\SOUND\GETSND\GETSMIX.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\GETSND\GETSND.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\GETSND\GETWAVE.C
# End Source File
# End Group
# Begin Source File

SOURCE=..\SOUND\ADPCMC.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\ADPCMG.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\BEEPC.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\BEEPG.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\CS4231C.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\CS4231G.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\FMBOARD.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\FMTIMER.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\OPNGENC.C
# End Source File
# Begin Source File

SOURCE=.\x86\OPNGENG.asm

!IF  "$(CFG)" == "np21 - Win32 Release"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\rel21
InputPath=.\x86\OPNGENG.asm
InputName=OPNGENG

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	ml /Fo$(IntDir)\$(InputName).obj /c $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\relnt21
InputPath=.\x86\OPNGENG.asm
InputName=OPNGENG

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	ml /Fo$(IntDir)\$(InputName).obj /c $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trc21
InputPath=.\x86\OPNGENG.asm
InputName=OPNGENG

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	ml /Fo$(IntDir)\$(InputName).obj /c $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trap21
InputPath=.\x86\OPNGENG.asm
InputName=OPNGENG

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	ml /Fo$(IntDir)\$(InputName).obj /c $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\dbg21
InputPath=.\x86\OPNGENG.asm
InputName=OPNGENG

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	ml /Fo$(IntDir)\$(InputName).obj /c $(InputPath)

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\SOUND\PCM86C.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\PCM86G.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\PSGGENC.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\PSGGENG.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\RHYTHMC.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\S98.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\SOUND.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\SOUNDROM.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\TMS3631C.C
# End Source File
# Begin Source File

SOURCE=..\SOUND\TMS3631G.C
# End Source File
# End Group
# Begin Group "fdd"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\fdd\cdd_ccd.c
# End Source File
# Begin Source File

SOURCE=..\fdd\cdd_cue.c
# End Source File
# Begin Source File

SOURCE=..\fdd\cdd_iso.c
# End Source File
# Begin Source File

SOURCE=..\fdd\cdd_mds.c
# End Source File
# Begin Source File

SOURCE=..\fdd\cdd_nrg.c
# End Source File
# Begin Source File

SOURCE=..\fdd\cddfile.c
# End Source File
# Begin Source File

SOURCE=..\FDD\DISKDRV.C
# End Source File
# Begin Source File

SOURCE=..\FDD\FDD_D88.C
# End Source File
# Begin Source File

SOURCE=..\FDD\FDD_MTR.C
# End Source File
# Begin Source File

SOURCE=..\FDD\FDD_XDF.C
# End Source File
# Begin Source File

SOURCE=..\FDD\FDDFILE.C
# End Source File
# Begin Source File

SOURCE=..\FDD\NEWDISK.C
# End Source File
# Begin Source File

SOURCE=..\FDD\SXSI.C
# End Source File
# Begin Source File

SOURCE=..\FDD\SXSICD.C
# End Source File
# Begin Source File

SOURCE=..\FDD\SXSIHDD.C
# End Source File
# End Group
# Begin Group "font"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\FONT\FONT.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTDATA.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTFM7.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTMAKE.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTPC88.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTPC98.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTV98.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTX1.C
# End Source File
# Begin Source File

SOURCE=..\FONT\FONTX68K.C
# End Source File
# End Group
# Begin Group "generic"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\GENERIC\CMJASTS.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\CMNDRAW.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\DIPSWBMP.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\HOSTDRV.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\HOSTDRVS.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\KEYDISP.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\MEMDBG32.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\NP2INFO.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\SOFTKBD.C
# End Source File
# Begin Source File

SOURCE=..\GENERIC\UNASM.C
# End Source File
# End Group
# Begin Group "trap"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\TRAP\INTTRAP.C
# End Source File
# Begin Source File

SOURCE=..\TRAP\STEPTRAP.C
# End Source File
# End Group
# Begin Group "win9x"

# PROP Default_Filter ""
# Begin Group "dialog"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\DIALOG\D_ABOUT.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_BMP.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_CLND.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_CONFIG.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_DISK.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_MPU98.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_SCREEN.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_SERIAL.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\D_SOUND.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\DIALOGS.CPP
# End Source File
# Begin Source File

SOURCE=.\DIALOG\NP2CLASS.CPP
# End Source File
# End Group
# Begin Group "debuguty"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\DEBUGUTY\VIEW1MB.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWASM.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWCMN.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWER.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWMEM.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWMENU.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWREG.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWSEG.CPP
# End Source File
# Begin Source File

SOURCE=.\DEBUGUTY\VIEWSND.CPP
# End Source File
# End Group
# Begin Source File

SOURCE=.\BOARD118.C
# End Source File
# Begin Source File

SOURCE=.\CMMIDI.CPP
# End Source File
# Begin Source File

SOURCE=.\CMPARA.CPP
# End Source File
# Begin Source File

SOURCE=.\CMSERIAL.CPP
# End Source File
# Begin Source File

SOURCE=.\COMMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\x86\CPUTYPE.X86

!IF  "$(CFG)" == "np21 - Win32 Release"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\rel21
InputPath=.\x86\CPUTYPE.X86
InputName=CPUTYPE

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\relnt21
InputPath=.\x86\CPUTYPE.X86
InputName=CPUTYPE

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trc21
InputPath=.\x86\CPUTYPE.X86
InputName=CPUTYPE

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trap21
InputPath=.\x86\CPUTYPE.X86
InputName=CPUTYPE

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\dbg21
InputPath=.\x86\CPUTYPE.X86
InputName=CPUTYPE

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\DCLOCK.CPP
# End Source File
# Begin Source File

SOURCE=.\DCLOCKD.X86

!IF  "$(CFG)" == "np21 - Win32 Release"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\rel21
InputPath=.\DCLOCKD.X86
InputName=DCLOCKD

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Release NT"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\relnt21
InputPath=.\DCLOCKD.X86
InputName=DCLOCKD

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trace"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trc21
InputPath=.\DCLOCKD.X86
InputName=DCLOCKD

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Trap"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\trap21
InputPath=.\DCLOCKD.X86
InputName=DCLOCKD

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ELSEIF  "$(CFG)" == "np21 - Win32 Debug"

# Begin Custom Build - ｱｾﾝﾌﾞﾙ中... $(InputPath)
IntDir=.\..\obj\dbg21
InputPath=.\DCLOCKD.X86
InputName=DCLOCKD

"$(IntDir)\$(InputName).obj" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	nasmw -f win32 -o $(IntDir)\$(InputName).obj $(InputPath)

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\DD2.CPP
# End Source File
# Begin Source File

SOURCE=.\DOSIO.CPP
# End Source File
# Begin Source File

SOURCE=.\EXTROMIO.CPP
# End Source File
# Begin Source File

SOURCE=.\FONTMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\INI.CPP
# End Source File
# Begin Source File

SOURCE=.\JOYMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\JULIET.CPP
# End Source File
# Begin Source File

SOURCE=.\MENU.CPP
# End Source File
# Begin Source File

SOURCE=.\MOUSEMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\MT32SND.CPP
# End Source File
# Begin Source File

SOURCE=.\NP2.CPP
# End Source File
# Begin Source File

SOURCE=.\NP2ARG.CPP
# End Source File
# Begin Source File

SOURCE=.\OEMTEXT.CPP
# End Source File
# Begin Source File

SOURCE=.\SCRNMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\SOUNDMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\SSTP.CPP
# End Source File
# Begin Source File

SOURCE=.\SSTPMSG.CPP
# End Source File
# Begin Source File

SOURCE=.\SUBWIND.CPP
# End Source File
# Begin Source File

SOURCE=.\SYSMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\TASKMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\TIMEMNG.CPP
# End Source File
# Begin Source File

SOURCE=.\TOOLWIN.CPP
# End Source File
# Begin Source File

SOURCE=.\TRACE.CPP
# End Source File
# Begin Source File

SOURCE=.\WIN32SUB.CPP
# End Source File
# Begin Source File

SOURCE=.\WINKBD.CPP
# End Source File
# Begin Source File

SOURCE=.\WINLOC.CPP
# End Source File
# End Group
# Begin Group "zlib"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\zlib\adler32.c
# End Source File
# Begin Source File

SOURCE=..\zlib\crc32.c
# End Source File
# Begin Source File

SOURCE=..\zlib\inffast.c
# End Source File
# Begin Source File

SOURCE=..\zlib\inflate.c
# End Source File
# Begin Source File

SOURCE=..\zlib\inftrees.c
# End Source File
# Begin Source File

SOURCE=..\zlib\zutil.c
# End Source File
# End Group
# Begin Source File

SOURCE=..\CALENDAR.C
# End Source File
# Begin Source File

SOURCE=..\DEBUGSUB386.C
# End Source File
# Begin Source File

SOURCE=..\KEYSTAT.C
# End Source File
# Begin Source File

SOURCE=..\NEVENT.C
# End Source File
# Begin Source File

SOURCE=..\PCCORE.C
# End Source File
# Begin Source File

SOURCE=..\STATSAVE.C
# End Source File
# Begin Source File

SOURCE=..\TIMING.C
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\resources\np2.ico
# End Source File
# Begin Source File

SOURCE=.\resources\1252\np2.rc
# End Source File
# Begin Source File

SOURCE=.\resources\np2debug.ico
# End Source File
# End Group
# End Target
# End Project
