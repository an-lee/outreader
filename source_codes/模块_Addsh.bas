Attribute VB_Name = "ģ��_Addsh"
Option Explicit
Sub Addsh(name)

'���幤����
Dim sh As Worksheet

'��Ѱ���еĹ����������
For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = name Then
        Exit Sub
    End If
Next

'�½�һ��������������Ϊname
With Worksheets
    Set sh = .Add(After:=Worksheets(.Count))
    sh.name = name
    End With
    
End Sub

'����������������

Sub testforaddsh()

'������Ϊ��������������
Call Addsh("general")
Call Addsh("distribution1")

End Sub
