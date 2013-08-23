IF NOT EXIST "C:\transfer\Projects.zip" (
	start cscript C:\Windows\Temp\wget.vbs /url:http://ec2-54-227-94-117.compute-1.amazonaws.com/Projects.zip /path:C:\transfer\

)


