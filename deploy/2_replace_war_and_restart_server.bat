net stop "Tomcat6-8280"
echo "停止tomcat服务器！"

d:
cd D:\Server\apache-tomcat-6.0.37-8280\webapps

rd /S/Q ROOT
del ROOT.war
echo "完成删除旧版本ROOT目录和ROOT.war文件！"

cd ..

move /Y ROOT.war webapps
echo "完成移动新版本ROOT.war到webapps目录！"

rd /s/q work\Catalina
echo "完成清除work缓存！"

net start "Tomcat6-8280"
echo "启动tomcat服务器！"

PAUSE