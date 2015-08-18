@echo off
REM **************************************************
REM ** ROBOCOPY��������			 					**
REM ** ��һ��������Դ·��source 					**
REM ** �ڶ���������Ŀ��·��destination  			**
REM ** 					 							**
REM ** Author��	   ��»� 							**
REM ** ���ڣ�	   1015-05-15						**
REM **************************************************

if ""%1""=="""" goto usage
if ""%2""=="""" goto usage

set source=%1
set destination=%2

set logfile=d:\LOGFILE\BACKUP\%date:~0,4%%date:~5,2%%date:~8,2%.log
call ROBOCOPY %source% %destination% /S /R:3 >>%logfile%

REM ** �����÷���ֵ if %ERRORLEVEL% LEQ 7 set ERRORLEVEL=0 �������д��
if ERRORLEVEL 1 set ERRORLEVEL=0
if ERRORLEVEL 2 set ERRORLEVEL=0
if ERRORLEVEL 3 set ERRORLEVEL=0 
if ERRORLEVEL 5 set ERRORLEVEL=0 
if ERRORLEVEL 6 set ERRORLEVEL=0 
if ERRORLEVEL 7 set ERRORLEVEL=0

IF "%ERRORLEVEL%"=="0" (
	echo ִ�гɹ�
	goto end	
) ELSE (
	goto err
)

:usage
echo ���÷�:: ROBOCOPY source destination /MIR
echo Դ:: ԴĿ¼(������:\·����\\������\����\·��)��
echo                 Ŀ��:: Ŀ��Ŀ¼(������:\·����\\������\����\·��)��
echo                /MIR :: ��������Ŀ¼����
echo     �й��÷�����ϸ��Ϣ�������� ROBOCOPY /? 
goto end

:err
echo %ERRORLEVEL%

:end