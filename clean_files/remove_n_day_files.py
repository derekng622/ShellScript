#create by Derek Ng 20141111
#删除n天前的文件和目录
#第一个命令行参数是要删除文件的目录,
#第二个命令行参数是天数

import os, sys,datetime,time, shutil
from stat  import *

path=sys.argv[1]   #需要删除的目录
logpath='D:/LOGFILE/' #日志目录
filelist=[]
filelist=os.listdir(path)
for i in range(len(filelist)):
        t1 = time.gmtime(os.stat(os.path.join(path, filelist[i]))[ST_MTIME])  #获取文件的修改日期
        t11 =  time.strftime('%Y-%m-%d',t1)
        year,month,day=t11.split('-')
        t111 = datetime.datetime(int(year),int(month),int(day))        
        t2 = time.gmtime()
        t22 =  time.strftime('%Y-%m-%d',t2)
        year,month,day=t22.split('-')
        t222 = datetime.datetime(int(year),int(month),int(day))        
        days =  (t222-t111).days
        if days > int(sys.argv[2]):  # 如果超过n天,则删除
                try:
                        if(os.path.isfile(os.path.join(path, filelist[i]))):
                            os.remove(os.path.join(path, filelist[i]))
                            log=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')+"  remove "+path+" " + filelist[i]+"  success ["  + str(days) + " days older]\n"  							
                        elif(os.path.isdir(os.path.join(path, filelist[i]))):
                            #os.rmdir(os.path.join(path, filelist[i]))
                            shutil.rmtree(os.path.join(path, filelist[i]))
                            log=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')+"  remove "+path+ " " + filelist[i]+"  success [" + str(days)  + " days older]\n"   
                except:
                        log=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')+"  remove "+path+filelist[i]+"  fail ["  + str(days)  + " days older\n"               
                fTemp=open(logpath+"Remove_n_days_file.log", 'a')        
                fTemp.write(log)