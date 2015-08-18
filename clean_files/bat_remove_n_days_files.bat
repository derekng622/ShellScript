@echo off
REM **************************************************
REM ** 使用python脚本删除n天前的文件: 				**
REM ** 第一个参数是要删除文件的目录, 				**
REM ** 第二个参数是天数  							**
REM **************************************************
python D:\Script\remove_n_day_files.py D:\Kettle\logs\ 60
python D:\Script\remove_n_day_files.py D:\Server\apache-tomcat-6.0.37-8080\logs\ 30
