# Ein Skript welches eine Ordnerstruktur für ein Webprojekt erstellt.


#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>


#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>


#Region ### START Koda GUI section ### Form=

$Form_1 = GUICreate("Web Projekt Generator", 300, 300, 200, 124)

$Label_2 = GUICtrlCreateLabel("Title of Web-Project", 25, 50, 80, 25)
$Input_2 = GUICtrlCreateInput("/", 100, 50, 225, 21)

$Create_dir= GUICtrlCreateButton("Create Web-Project", 25, 80, 110, 25)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $Create_dir
			bootstrapDownload()

			unzipBootstrap()

		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd

Func createProject()
        ; Create a constant variable in Local scope of the directory.
		Local $sFilePath = @DesktopDir & GUICtrlRead($Input_2) & "\bootstrap"
		Local $sSubFileClasses = @DesktopDir & GUICtrlRead($Input_2) & "\classes"
		Local $sSubFileViews = @DesktopDir & GUICtrlRead($Input_2) & "\views"

        ; If the directory exists the don't continue.
        If FileExists($sFilePath) Then
                MsgBox($MB_SYSTEMMODAL, "", "An error occurred. The directory already exists.")
                Return False
        EndIf

        ; Open the temporary directory.
        ShellExecute(@DesktopDir)

        ; Create the directory.
        DirCreate($sFilePath)
		DirCreate($sSubFileClasses)
		DirCreate($sSubFileViews)

        ; Display a message of the directory creation.
        MsgBox($MB_SYSTEMMODAL, "", "The directory has been created.")

EndFunc

Func bootstrapDownload()
		$sbootstrapZipFile = "bootstrap-5.2.3-dist.zip"
		$bootstrapLoad = InetGet("https://github.com/twbs/bootstrap/releases/download/v5.2.3/bootstrap-5.2.3-dist.zip", "bootstrap-5.2.3-dist.zip", 1, 1)
EndFunc

Func unzipBootstrap()
	Sleep(50)

	$unrarPath= 'C:\Program Files\WinRAR\winrar.exe'
	$rarfilePath = @ScriptDir & '\bootstrap-5.2.3-dist.zip'
	$FileEndings = '*.*'
	$ExtractPath = @ScriptDir&'\Ext'
	DirCreate($ExtractPath)
	$test = ShellExecute($unrarPath, 'x '& $rarfilePath&' '& $FileEndings&' '& $ExtractPath, "")
	;$sFileOpen = FileOpen("C:\Users\****\Desktop\Test\bootstrap-5.2.3-dist.zip")
	;$sFileMove = FileMove ( "C:\Users\****\Desktop\Test\bootstrap-5.2.3-dist", @DesktopDir, 0 )

	;$winrarRun = Run($winrarPath, "")

	ConsoleWrite($unrarPath & 'x '& $rarfilePath&' '& $FileEndings&' '& $ExtractPath)

EndFunc



