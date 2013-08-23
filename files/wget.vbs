url = WScript.Arguments.Named("url")
path = WScript.Arguments.Named("path")
Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP")
Set wshShell = CreateObject( "WScript.Shell" )
Set objUserVariables = wshShell.Environment("USER")

'http proxy is optional
'attempt to read from HTTP_PROXY env var first
On Error Resume Next

If NOT (objUserVariables("HTTP_PROXY") = "") Then
objXMLHTTP.setProxy 2, objUserVariables("HTTP_PROXY")

'fall back to named arg
ElseIf NOT (WScript.Arguments.Named("proxy") = "") Then
objXMLHTTP.setProxy 2, WScript.Arguments.Named("proxy")
End If

On Error Goto 0

objXMLHTTP.open "GET", url, false
objXMLHTTP.send()
If objXMLHTTP.Status = 200 Then
Set objADOStream = CreateObject("ADODB.Stream")
objADOStream.Open
objADOStream.Type = 1
objADOStream.Write objXMLHTTP.ResponseBody
objADOStream.Position = 0
Set objFSO = Createobject("Scripting.FileSystemObject")
If objFSO.Fileexists(path) Then objFSO.DeleteFile path
Set objFSO = Nothing
objADOStream.SaveToFile path
objADOStream.Close
Set objADOStream = Nothing
End if
Set objXMLHTTP = Nothing
