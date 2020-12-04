
apkdecompilebat = "apktool "
apk = " "
signjar = "signapk.jar "
certificate = "certificate.pem "
key1 = "key.pk8 "
new1 = " "
Set objFSO = CreateObject("Scripting.FileSystemObject")
CurrentFolder = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\"))
Set oShell = WScript.CreateObject("WScript.Shell")
networkconfigfile = "network_security_config.xml"



sign1 = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & signjar
sign2 = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & certificate
sign3 = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & key1
apk1 = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & apk
apktool1 = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & apkdecompilebat
networkconfigfile = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & networkconfigfile

For Each f in objFSO.GetFolder(CurrentFolder).Files
  name = LCase(f.Name)
  If objFSO.GetExtensionName(name) = "apk" Then
    'do stuff
     apk = objFSO.GetFileName(f)
	 name = objFSO.GetBaseName(f)
	 folder = objFSO.GetParentFolderName(f)
oShell.Run apktool1 & " d " & apk & " -f", 0 , True
new1 = name & "_edited.apk"
sign4 = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & new1
Set xmlDoc = _
  CreateObject("Microsoft.XMLDOM")
XML = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & name & "\AndroidManifest.xml"
xmlDoc.Async = "False"
xmlDoc.Load XML
Set colNodes=xmlDoc.selectSingleNode("//application")

Set pageUrl = xmlDoc.createAttribute("android:networkSecurityConfig")  
pageUrl.Value = "@xml/network_security_config"
colNodes.attributes.setNamedItem(pageUrl)
xmlDoc.Save XML
resfile = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\")) & name & "\res\xml\"
objFSO.CopyFile networkconfigfile , resfile, True
apkfolder = folder & "\" & name & "\dist\" & apk

	oShell.Run apktool1 & " b " & name, 0 , True
	objFSO.CopyFile apkfolder, CurrentFolder , True
	name2 = apk & " "
	oShell.Run "java -jar " & sign1 & sign2 & sign3 & name2 & sign4 , 0 , True
	End If
	
Next


