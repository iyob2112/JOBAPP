@echo off

rem Define source folder for DOCX files
@REM set "source_folder=C:\Users"
@REM set "source_folder1=D:\"
@REM set "source_folder2=F:\"
@REM set "source_folder3=E:\"
@REM set "source_folder4=G:\"
@REM set "source_folder5=I:\"
@REM set "source_folder6=H:\"


rem Define destination folder
@REM set "destination_folder=.\all_files\c_users"
@REM set "destination_folder1=.\all_files\D"
@REM set "destination_folder2=.\all_files\F"
@REM set "destination_folder3=.\all_files\E"
@REM set "destination_folder4=.\all_files\G"
@REM set "destination_folder5=.\all_files\I"
@REM set "destination_folder6=.\all_files\H"

rem Define file extensions
@REM set "file_extension=.docx"
@REM set "file_extension_pdf=.pdf"

rem Copy DOCX files from source folder to destination folder
@REM xcopy "%source_folder%\*%file_extension%" "%destination_folder%" /s /i
@REM xcopy "%source_folder1%\*%file_extension%" "%destination_folder1%" /s /i
@REM xcopy "%source_folder2%\*%file_extension%" "%destination_folder2%" /s /i
@REM xcopy "%source_folder3%\*%file_extension%" "%destination_folder3%" /s /i
@REM xcopy "%source_folder4%\*%file_extension%" "%destination_folder4%" /s /i
@REM xcopy "%source_folder5%\*%file_extension%" "%destination_folder5%" /s /i
@REM xcopy "%source_folder6%\*%file_extension%" "%destination_folder6%" /s /i




@echo off

setlocal enabledelayedexpansion

set i=0
for /f "skip=1 tokens=1,2" %%a in ('wmic logicaldisk get caption^, drivetype') do (
	if %%b == 3 (
		set array[!i!]=%%a
		set /a i+=1
	)
)

set /a i-=1

set i2 = 0
for /l %%i in (0,1,%i%) do (
	if !array[%%i]! == C: (
		xcopy /s "!array[%%i]!\Users\*.docx" "%~dp0\all_files" 
	)else (
		xcopy /s "!array[%%i]!\*.docx" "%~dp0\all_files"
	)
)

set /p "E=Press any key to exit: "

endlocal