Attribute VB_Name = "PKPM_WPJ_UC"
Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/18 22:05

'�������ݣ�
'1.find��Ӿ�ȷ���Ҳ�����lookat:=1

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/3 20:05

'�������ݣ�
'1.Colum��Wall������ΪCR_P��WR_P��

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/7

'�������ݣ�
'1.����rangeΪ��ʱ���жϣ����ĳ��û��ǽ������ĺ�������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/4 ����ȥ��ȥ���

'�������ݣ�
'1.����д�����л�������Ӧ�������룻
'2.�������ѹ��������ӵ�ɫ������鿴��
'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/3

'�������ݣ�
'1.���˵����
'2.Ѱ��Range���ֵ�Ĵ��뻻Ϊ������

'////////////////////////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            PKPM_WPJ_UC.OUT���ִ���                   ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

Sub OUTReader_PKPM_WPJ_UC(Path As String, num As Integer)

'==========================================================================================д����
Sheets("CR_P").Cells(num + 1, 1) = CStr(num) & "F"
Sheets("WR_P").Cells(num + 1, 1) = CStr(num) & "F"



'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, inputstring  As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i As Integer

'������ֵ������������
Dim C_C, C_W As Integer

'==========================================================================================����ؼ��ʱ���

'����ǽ
Dim Keyword_Column, Keyword_Wall As String
'��ֵ
Keyword_Column = "�������������"
Keyword_Wall = "ǽ�����������"

'����ǽ��ѹ��
Dim Keyword_Column_UC, Keyword_Wall_UC As String
'��ֵ
Keyword_Column_UC = "Uc="
Keyword_Wall_UC = "Uc="


'==========================================================================================�������ַ�����

'����ǽ
Dim FirstString_Column, FirstString_Wall As String
'����ǽ��ѹ��
Dim FirstString_Column_UC, FirstString_Wall_UC As String


'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & CStr(num) & ".OUT"

'���������ļ�·��
filepath = Path & "\" & Filename
'Debug.Print path
'Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #1



'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wpj" & CStr(num); ".out; "
Debug.Print "��ȡ���ָ��"
Debug.Print "����"





Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����ǽ
    FirstString_Column = Mid(data, 33, 8)
    FirstString_Wall = Mid(data, 33, 8)

    '--------------------------------------------------------------------------��ȡ������ѹ��
    i = 0
    If FirstString_Column = Keyword_Column Then
        Debug.Print "��ȡ" & CStr(num) & "��������ѹ�ȡ���"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Column_UC = Mid(data, 20, 3)
            If FirstString_Column_UC = Keyword_Column_UC Then
                Sheets("CR_P").Cells(num + 1, 2 + i) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                Sheets("CR_P").Cells(1, 2 + i) = i + 1
                i = i + 1
            End If
            If CheckRegExpfromString(data, "===") = True Then
                Exit Do
            End If
        Loop
    End If
    '--------------------------------------------------------------------------��ȡǽ����ѹ��
    i = 0
    If FirstString_Wall = Keyword_Wall Then
    Debug.Print "��ȡ" & CStr(num) & "��ǽ����ѹ�ȡ���"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Wall_UC = Mid(data, 20, 3)
            If FirstString_Wall_UC = Keyword_Wall_UC Then
                Sheets("WR_P").Cells(num + 1, 2 + i) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                Sheets("WR_P").Cells(1, 2 + i) = i + 1
                i = i + 1
            End If
            If CheckRegExpfromString(data, "===") = True Then
                Exit Do
            End If
        Loop
    End If
Loop

Close #1





'===========================================================================================��ȡNum�������ѹ�ȼ��乹����Ų�д��dis
'--------------------------------------------------------------------------��
If Sheets("CR_P").Cells(num + 1, 2) = "" Then
    Sheets("d_P").Cells(num + 2, 56) = 0
    Sheets("d_P").Cells(num + 2, 57) = 0
Else
'�����ѹ����������
C_C = IndexMaxofRange(Sheets("CR_P").range(Sheets("CR_P").Cells(num + 1, 2), Sheets("CR_P").Cells(num + 1, 3000)))(2)
'�������ѹ�ȼ��������д��dis
Sheets("d_P").Cells(num + 2, 56) = Worksheets("CR_P").Cells(num + 1, C_C)
Sheets("d_P").Cells(num + 2, 57) = C_C - 1
Worksheets("CR_P").Cells(num + 1, C_C).Interior.ColorIndex = 4
End If
'--------------------------------------------------------------------------ǽ
If Sheets("WR_P").Cells(num + 1, 2) = "" Then
    Sheets("d_P").Cells(num + 2, 58) = 0
    Sheets("d_P").Cells(num + 2, 59) = 0
Else
'�����ѹ����������
C_W = IndexMaxofRange(Sheets("WR_P").range(Sheets("WR_P").Cells(num + 1, 2), Sheets("WR_P").Cells(num + 1, 3000)))(2)
'�������ѹ�ȼ��������д��dis
Sheets("d_P").Cells(num + 2, 58) = Worksheets("WR_P").Cells(num + 1, C_W)
Sheets("d_P").Cells(num + 2, 59) = C_W - 1
Worksheets("WR_P").Cells(num + 1, C_W).Interior.ColorIndex = 4

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

