Attribute VB_Name = "ģ��_CheckRegExpfromString"
Option Explicit

'�ж��ַ���sStr���Ƿ���������ʽReg�����ģ�����ݵ�ͨ�ú���������True��False

Function CheckRegExpfromString(sStr As String, Reg As String) As Boolean
    CheckRegExpfromString = False
    With CreateObject("VBScript.RegExp")
        .Global = True
        .Pattern = Reg
        If .TEST(sStr) = True Then
            CheckRegExpfromString = True
        End If
    End With
End Function
