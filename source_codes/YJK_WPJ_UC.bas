Attribute VB_Name = "YJK_WPJ_UC"

Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/3/16
'1.����YJK1.6�汾���ݸ��¶�ȡ����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/18 22:05

'�������ݣ�
'1.find��Ӿ�ȷ���Ҳ�����lookat:=1


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/3
'�������ݣ�
'1.��ֲPKPM��alpha��
'2.��ѹ�ȹؼ��ʸ��ģ���ȡ����Ҳ��Ӧ����
'3.�ƺ�YJK�ĸ�ʽ���Ų�ͬ�汾����ʽ��ϸС�仯����������Щ��ģ��ʧЧ


'////////////////////////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            YJK_WPJ_UC.OUT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

Sub OUTReader_YJK_WPJ_UC(Path As String, num As Integer)

'==========================================================================================д����
Sheets("CR_Y").Cells(num + 1, 1) = CStr(num) & "F"
Sheets("WR_Y").Cells(num + 1, 1) = CStr(num) & "F"


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
Keyword_Column = "�������Ƽ�����"
Keyword_Wall = "ǽ�������Ƽ�����"

'����ǽ��ѹ��
Dim Keyword_Column_UC, Keyword_Wall_UC As String
'��ֵ
Keyword_Column_UC = "Nu="
Keyword_Wall_UC = "Nu="


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
    FirstString_Column = Mid(data, 27, 8)
    FirstString_Wall = Mid(data, 25, 9)

    '--------------------------------------------------------------------------��ȡ������ѹ��
    i = 0
    If FirstString_Column = Keyword_Column Or Mid(data, 34, 9) = " �������Ƽ�����" Then
        Debug.Print "��ȡ" & CStr(num) & "��������ѹ�ȡ���"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Column_UC = Mid(data, 8, 3)
            Dim FirstString_Column_UC1 As String
            FirstString_Column_UC1 = Mid(data, 9, 3)
                If FirstString_Column_UC = Keyword_Column_UC Or FirstString_Column_UC1 = Keyword_Column_UC Or Mid(data, 9, 3) = "Nco" Then '-----------------------------------------------------------�޸�
                Debug.Print data
                Sheets("CR_Y").Cells(num + 1, 2 + i) = Format(extractNumberFromString2(data, 3), "0.00")
                Sheets("CR_Y").Cells(1, 2 + i) = i + 1
                i = i + 1
            End If
            If CheckRegExpfromString(data, "\*\*\*") = True Then
                Exit Do
            End If
        Loop
    End If
    '--------------------------------------------------------------------------��ȡǽ����ѹ��
    i = 0
    If FirstString_Wall = Keyword_Wall Or Mid(data, 34, 9) = "ǽ�������Ƽ�����" Then
        Debug.Print "��ȡ" & CStr(num) & "��ǽ����ѹ�ȡ���"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Wall_UC = Mid(data, 8, 3)
            If FirstString_Wall_UC = Keyword_Wall_UC Then
                Debug.Print data
                Sheets("WR_Y").Cells(num + 1, 2 + i) = Format(extractNumberFromString2(data, 2), "0.00") '-----------------------------------------------------------------------------------------------------0208
                Sheets("WR_Y").Cells(1, 2 + i) = i + 1
                i = i + 1
            End If
            If CheckRegExpfromString(data, "\*\*\*") = True Then
                Exit Do
            End If
        Loop
    End If
Loop

Close #1





'===========================================================================================��ȡNum�������ѹ�ȼ��乹����Ų�д��dis
'--------------------------------------------------------------------------��
If Sheets("CR_Y").Cells(num + 1, 2) = "" Then
    Sheets("d_Y").Cells(num + 2, 56) = 0
    Sheets("d_Y").Cells(num + 2, 57) = 0
Else
'�����ѹ����������
C_C = IndexMaxofRange(Sheets("CR_Y").range(Sheets("CR_Y").Cells(num + 1, 2), Sheets("CR_Y").Cells(num + 1, 3000)))(2)
'�������ѹ�ȼ��������д��dis
Sheets("d_Y").Cells(num + 2, 56) = Worksheets("CR_Y").Cells(num + 1, C_C)
Sheets("d_Y").Cells(num + 2, 57) = C_C - 1
Worksheets("CR_Y").Cells(num + 1, C_C).Interior.ColorIndex = 4
End If
'--------------------------------------------------------------------------ǽ
If Sheets("WR_Y").Cells(num + 1, 2) = "" Then
    Sheets("d_Y").Cells(num + 2, 58) = 0
    Sheets("d_Y").Cells(num + 2, 59) = 0
Else
'�����ѹ����������
C_W = IndexMaxofRange(Sheets("WR_Y").range(Sheets("WR_Y").Cells(num + 1, 2), Sheets("WR_Y").Cells(num + 1, 3000)))(2)
'�������ѹ�ȼ��������д��dis
Sheets("d_Y").Cells(num + 2, 58) = Worksheets("WR_Y").Cells(num + 1, C_W)
Sheets("d_Y").Cells(num + 2, 59) = C_W - 1
Worksheets("WR_Y").Cells(num + 1, C_W).Interior.ColorIndex = 4

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

