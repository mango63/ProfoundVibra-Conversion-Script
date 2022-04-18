ECHO OFF
setlocal enabledelayedexpansion
IF NOT EXIST "%cd%\Completed\vib" MKDIR "%cd%\Completed\vib"
IF NOT EXIST "%cd%\Completed\csv" MKDIR "%cd%\Completed\csv"
IF NOT EXIST "%cd%\To Be Converted" MKDIR "%cd%\To Be Converted"

IF NOT EXIST Config.txt (
    (
  echo LOGFILE=systemlog.txt
  echo X
  echo Y
  echo Z
  echo FFT
  echo CSV
  echo Datetime
  echo Regional
  echo Extension=-V-FFT.csv
) > config.txt
)


PUSHD "%cd%\To Be Converted" 
FOR %%f in ( *.vib) do (
  SET "names=!names! "%%~nf.vib""
  )

SET vibra=C:\"Program Files"\Profound\Vibra-4.30\Vibra.exe --export-text=../config.txt
START "Vibra" %vibra% %names%
POPD
TIMEOUT 4
MOVE "%cd%\To Be Converted\*.vib" "%CD%\Completed\vib\"
MOVE "%cd%\To Be Converted\*.csv" "%CD%\Completed\csv\"
MOVE "%cd%\To Be Converted\*.TXT" "%CD%\"
ECHO All Files Converted
PAUSE