d:
cd D:\Server\apache-tomcat-6.0.37-8280

set bkdir=webapps_%date:~0,4%%date:~5,2%%date:~8,2%
mkdir backup\%bkdir%
xcopy /s/e/y/q webapps backup\%bkdir%
echo "完成备份webapps到backup目录！"



PAUSE