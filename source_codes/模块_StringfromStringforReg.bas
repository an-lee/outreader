Attribute VB_Name = "ģ��_StringfromStringforReg"
Option Explicit

'���ַ���sStr�а�������ʽReg��ȡ��iNum���ַ�����ͨ�ú���

Function StringfromStringforReg(sStr As String, Reg As String, iNum As Integer) As String
    With CreateObject("VBScript.RegExp")
        .Global = True
        .Pattern = Reg
        Dim mc
        Set mc = .Execute(sStr)  'ִ��ƥ�������
        If mc.Count >= iNum Then
            StringfromStringforReg = mc(iNum - 1).Value
        End If
    End With
End Function
