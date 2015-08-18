@echo off
REM **************************************************
REM ** 部署war包到Tomcat		 					**
REM ** 第一个参数：Tomcat服务名 					**
REM ** 第二个参数：部署路径				  			**
REM ** 					 							**
REM ** Author：	   吴德辉 							**
REM ** 日期：	   1015-06-15						**
REM **************************************************

if ""%1""=="""" goto usage
if ""%2""=="""" goto usage
set tomcat_service=%1
set tomcat_deploy_path=%2

net stop %tomcat_service%

cd %tomcat_deploy_path%

IF %ERRORLEVEL% NEQ 0 (
  REM do something here to address the error
  echo error-部署路径有误
  goto err	
)

rd /S/Q ROOT
del ROOT.war

IF %ERRORLEVEL% NEQ 0 (
  REM do something here to address the error
  echo error-删除旧版本ROOT目录和ROOT.war文件！失败
  goto err	
)

cd ..
ren *.war ROOT.war
move /Y ROOT.war webapps

IF %ERRORLEVEL% NEQ 0 (
  REM do something here to address the error
  echo error-移动新版本ROOT.war到webapps目录！失败
  goto err	
)

rd /s/q work\Catalina

net start %tomcat_service%
IF %ERRORLEVEL% NEQ 0 (
  REM do something here to address the error
  echo error-启动tomcat服务器！失败
  goto err	
)

echo "脚本执行成功！"
PAUSE


:usage
echo 用法:: deploy_war.bat Tomcat服务名 war包部署文件夹
goto end

:err
echo error-脚本执行失败
echo error-错误码：%ERRORLEVEL%

:end