Attribute VB_Name = "ģ��_����"
'����Range������ʽ�Ĵ���

'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2015/4/19
'�������ݣ�
'1.���ETABS

'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2014/4/18

'�������ݣ�
'1.����жϣ��������򲻸���

Sub gaoliang(soft As String)
On Error Resume Next
'-------------------------------------------------------------------------------------------������ֵ
Dim sht As String
If soft = "P" Then
    sht = "d_P"
ElseIf soft = "Y" Then
    sht = "d_Y"
ElseIf soft = "M" Then
    sht = "d_M"
ElseIf soft = "E" Then
    sht = "d_E"
End If


Num_all = Sheets(sht).range("a65536").End(xlUp)
Debug.Print "��¥��="; Num_all

Dim i_RowID As Integer
Dim i_Rng As range

'---------------------------------------------------------�նȱ�
For ii = 2 To 3
If Worksheets(sht).Cells(3, ii) <> "" Then
    Dim R As range
    Set R = Worksheets(sht).range(Worksheets(sht).Cells(3, ii), Worksheets(sht).Cells(Num_all + 1, ii))
    Call maxormin(R, "min", sht & "!R3C" & CStr(ii) & ":R" & CStr(Num_all + 1) & "C" & CStr(ii))
    End If
Next

'---------------------------------------------------------��������
For ii = 46 To 47
If Worksheets(sht).Cells(3, ii) <> "" Then
    Set R = Worksheets(sht).range(Worksheets(sht).Cells(3, ii), Worksheets(sht).Cells(Num_all + 1, ii))
    Call maxormin(R, "min", sht & "!R3C" & CStr(ii) & ":R" & CStr(Num_all + 1) & "C" & CStr(ii))
End If
Next

'---------------------------------------------------------������
ii = 55
    If Worksheets(sht).Cells(3, ii) <> "" Then
    Set R = Worksheets(sht).range(Worksheets(sht).Cells(4, ii), Worksheets(sht).Cells(Num_all + 2, ii))
    Call maxormin(R, "max", sht & "!R4C" & CStr(ii) & ":R" & CStr(Num_all + 2) & "C" & CStr(ii))
End If


'---------------------------------------------------------λ�ƽ�
For ii = 26 To 33
If Worksheets(sht).Cells(3, ii) <> "" Then
    Set R = Worksheets(sht).range(Worksheets(sht).Cells(3, ii), Worksheets(sht).Cells(Num_all + 2, ii))
    Call maxormin(R, "min", sht & "!R3C" & CStr(ii) & ":R" & CStr(Num_all + 2) & "C" & CStr(ii))
End If
Next

'---------------------------------------------------------λ�Ʊ�
For ii = 34 To 45
If Worksheets(sht).Cells(3, ii) <> "" Then
    Set R = Worksheets(sht).range(Worksheets(sht).Cells(3, ii), Worksheets(sht).Cells(Num_all + 2, ii))
    Call maxormin(R, "max", sht & "!R3C" & CStr(ii) & ":R" & CStr(Num_all + 2) & "C" & CStr(ii))
End If
Next

End Sub
