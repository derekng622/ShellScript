@echo off
REM **************************************************
REM ** ROBOCOPY备份资料			 					**
REM ** 第一个参数：源路径source 					**
REM ** 第二个参数：目的路径destination  			**
REM ** 					 							**
REM ** Author：	   吴德辉 							**
REM ** 日期：	   1015-05-15						**
REM **************************************************

if ""%1""=="""" goto usage
if ""%2""=="""" goto usage

set source=%1
set destination=%2

set logfile=d:\LOGFILE\BACKUP\%date:~0,4%%date:~5,2%%date:~8,2%.log
call ROBOCOPY %source% %destination% /S /R:3 >>%logfile%

REM ** 重设置返回值 if %ERRORLEVEL% LEQ 7 set ERRORLEVEL=0 或下面的写法
if ERRORLEVEL 1 set ERRORLEVEL=0
if ERRORLEVEL 2 set ERRORLEVEL=0
if ERRORLEVEL 3 set ERRORLEVEL=0 
if ERRORLEVEL 5 set ERRORLEVEL=0 
if ERRORLEVEL 6 set ERRORLEVEL=0 
if ERRORLEVEL 7 set ERRORLEVEL=0

IF "%ERRORLEVEL%"=="0" (
	echo 执行成功
	goto end	
) ELSE (
	goto err
)

:usage
echo 简单用法:: ROBOCOPY source destination /MIR
echo 源:: 源目录(驱动器:\路径或\\服务器\共享\路径)。
echo                 目标:: 目标目录(驱动器:\路径或\\服务器\共享\路径)。
echo                /MIR :: 镜像完整目录树。
echo     有关用法的详细信息，请运行 ROBOCOPY /? 
goto end

:err
echo %ERRORLEVEL%

:end