Attribute VB_Name = "MBuilding_�������_UC"
Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�


'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ�䣺2013/07/28 11��30
'�������ݣ�
'1.�������ѹ����ȡ

'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ�䣺2013/07/20 12��10
'�������ݣ�
'1.��ֲPKPM_WPJ_UC���ṩ����ѹ�������ļ���ֻ��ǽ����ѹ����Ϣ��û������ѹ����Ϣ��δ����֤��ȡ����ѹ����Ϣ�Ƿ���ȷ



'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****             MBuilding_������Ƽ�������.TXT���ִ���                 ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

Sub OUTReader_MBuilding_�������_UC(Path As String, num)

'==========================================================================================д����
Sheets("CR_M").Cells(num + 1, 1) = CStr(num) & "F"
Sheets("WR_M").Cells(num + 1, 1) = CStr(num) & "F"



'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·��
Dim Filename, filepath As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i As Integer

'������ֵ������������
Dim C_C, C_W As Integer

'==========================================================================================����ؼ��ʱ���

'����ǽ
Dim Keyword_Column, Keyword_WC As String
'��ֵ
Keyword_Column = "�ֽ��������������ƽ��"
Keyword_WC = "�ֽ������ǽ��������ƽ��"

'����ǽ��ѹ��
Dim Keyword_Column_UC, Keyword_WC_UC As String
'��ֵ
Keyword_Column_UC = "NAF ="
Keyword_WC_UC = "NAF ="


'==========================================================================================�������ַ�����

'����ǽ
Dim FirstString_Column, FirstString_WC As String
'����ǽ��ѹ��
Dim FirstString_Column_UC, FirstString_WC_UC As String


'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊ ��������Ƽ�������_Num.txt
Filename = Dir(Path & "\*_��������Ƽ�������_" & CStr(num) & "F.txt")

'���������ļ�·��
filepath = Path & "\" & Filename
'Debug.Print path
'Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #1



'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ���������Ƽ�������_" & CStr(num); "F.txt; "
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, data '���ı��ļ�һ��
    
    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����ǽ
    FirstString_Column = Mid(data, 8 + Len(num), 13)
    FirstString_WC = Mid(data, 8 + Len(num), 14)
'   Debug.Print num
    '--------------------------------------------------------------------------��ȡ������ѹ��
    i = 0
    If FirstString_Column = Keyword_Column Then
        Debug.Print "��ȡ" & CStr(num) & "��������ѹ�ȡ���"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Column_UC = Mid(data, 29, 5)
            Debug.Print FirstString_Column_UC
            If FirstString_Column_UC = Keyword_Column_UC Then
            Debug.Print "XX1"
                Sheets("CR_M").Cells(num + 1, 2 + i) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                Sheets("CR_M").Cells(1, 2 + i) = i + 1
                i = i + 1
            End If
            If CheckRegExpfromString(data, "===") Then
                Exit Do
            End If
        Loop
    End If
    '--------------------------------------------------------------------------��ȡǽ������ѹ��
    i = 0
    If FirstString_WC = Keyword_WC Then
    Debug.Print "��ȡ" & CStr(num) & "��ǽ������ѹ�ȡ���"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_WC_UC = Mid(data, 19, 5)
            Debug.Print FirstString_WC_UC
            If FirstString_WC_UC = Keyword_WC_UC Then
            Debug.Print "XX2"
                Sheets("WR_M").Cells(num + 1, 2 + i) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                Sheets("WR_M").Cells(1, 2 + i) = i + 1
                i = i + 1
            End If
            If CheckRegExpfromString(data, "===") Then
                Exit Do
            End If
        Loop
    End If
Loop

Close #1



'===========================================================================================��ȡNum�������ѹ�ȼ��乹����Ų�д��dis
'--------------------------------------------------------------------------��
If Sheets("CR_M").Cells(num + 1, 2) = "" Then
    Sheets("d_M").Cells(num + 2, 56) = 0
    Sheets("d_M").Cells(num + 2, 57) = 0
Else
'�����ѹ����������
C_C = IndexMaxofRange(Sheets("CR_M").range(Sheets("CR_M").Cells(num + 1, 2), Sheets("CR_M").Cells(num + 1, 3000)))(2)
'�������ѹ�ȼ��������д��dis
Sheets("d_M").Cells(num + 2, 56) = Worksheets("CR_M").Cells(num + 1, C_C)
Sheets("d_M").Cells(num + 2, 57) = C_C - 1
Worksheets("CR_M").Cells(num + 1, C_C).Interior.ColorIndex = 4
End If
'--------------------------------------------------------------------------ǽ��
If Sheets("WR_M").Cells(num + 1, 2) = "" Then
    Sheets("d_M").Cells(num + 2, 58) = 0
    Sheets("d_M").Cells(num + 2, 59) = 0
Else
'�����ѹ����������
C_W = IndexMaxofRange(Sheets("WR_M").range(Sheets("WR_M").Cells(num + 1, 2), Sheets("WR_M").Cells(num + 1, 3000)))(2)
'�������ѹ�ȼ��������д��dis
Sheets("d_M").Cells(num + 2, 58) = Worksheets("WR_M").Cells(num + 1, C_W)
Sheets("d_M").Cells(num + 2, 59) = C_W - 1
Worksheets("WR_M").Cells(num + 1, C_W).Interior.ColorIndex = 4

End If


Debug.Print "��ȡ" & CStr(num) & "��ǽ����ѹ�Ⱥķ�ʱ��: " & Timer - sngStart


End Sub

Function IndexMaxofRange(index_Range As range)
Dim Max, R, C As Integer
Max = WorksheetFunction.Max(index_Range)
R = index_Range.Find(Max, After:=index_Range.Cells(index_Range.Rows.Count, index_Range.Columns.Count), LookIn:=xlValues, lookat:=1).Row
C = index_Range.Find(Max, After:=index_Range.Cells(index_Range.Rows.Count, index_Range.Columns.Count), LookIn:=xlValues, lookat:=1).column
IndexMaxofRange = Array(Max, R, C)
End Function

