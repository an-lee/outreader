Attribute VB_Name = "PKPM_Info"
Option Explicit
Public i_c1, i_w1, i_b1, i_wb1, i_c2, i_w2, i_b2, i_wb2 As Integer

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            ��ȡ���������Ϣ����                      ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/28/ 14:30
'��������:
'1.�����ֵʱ���жϷ�ĸ�Ƿ�Ϊ�㣬������ڹ�����Ϣ��������ɵļ����������
'2.�����б�ֵ����һ�ĵ�Ԫ�����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/16/ 9:06
'��������:
'1.��������ɺ�ͼ�����ɷֿ�
'2.������,��ColumnInfo��ΪCI

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12/ 21:26
'��������:
'1.���ǽ������ȡ
'2.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////


'����ʱ��:2013/7/29/ 21:26
'��������:
'1.���ǽ��������ʵ��Զ�����
'2.������������ʵ��Զ�ȡ��ֵ





'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Sub OUTReader_PKPM_CompareS_table(path1 As String, path2 As String, startf As Integer, endf As Integer)

'======================================================================================================���ɱ��
Call AddInfoSheet

i_c1 = 0
i_w1 = 0
i_b1 = 0
i_wb1 = 0
i_c2 = 0
i_w2 = 0
i_b2 = 0
i_wb2 = 0


Dim i As Integer

For i = startf To endf

Call OUTReader_PKPM_Info(path1, path2, i)

Next

'������ֵ����
For i = 1 To i_c1
With Sheets("CI")
    '�����ĸ��Ϊ�㣬������ֵ
    If Not .Cells(3 + i, 8) = 0 Then .Cells(3 + i, 16) = .Cells(3 + i, 9) / .Cells(3 + i, 8)
    '�����ֵ�����㣬�������ʾ
    If .Cells(3 + i, 16) > 1 Then .Cells(3 + i, 16).Interior.ColorIndex = 4
    If Not .Cells(3 + i, 10) = 0 Then .Cells(3 + i, 17) = .Cells(3 + i, 11) / .Cells(3 + i, 10)
    If .Cells(3 + i, 17) > 1 Then .Cells(3 + i, 17).Interior.ColorIndex = 4
End With
Next
'ǽ����ֵ����
For i = 1 To i_w1
With Sheets("WCI")
    If Not .Cells(3 + i, 9) = 0 Then .Cells(3 + i, 19) = .Cells(3 + i, 10) / .Cells(3 + i, 9)
    If .Cells(3 + i, 19) > 1 Then .Cells(3 + i, 19).Interior.ColorIndex = 4
    If Not .Cells(3 + i, 13) = 0 Then .Cells(3 + i, 20) = .Cells(3 + i, 14) / .Cells(3 + i, 13)
    If .Cells(3 + i, 20) > 1 Then .Cells(3 + i, 20).Interior.ColorIndex = 4
End With
Next

'Dim as_b1, as_b2, as_b3, as_b4

'������ֵ����
For i = 1 To i_b1

With Sheets("BI")
    '��������Ϊ0����ȡ�׽��1/4
    If .Cells(3 + i, 6) = 0 Then
        .Cells(3 + i, 6) = 0.25 * .Cells(3 + i, 7)
    End If
    If .Cells(3 + i, 8) = 0 Then
        .Cells(3 + i, 8) = 0.25 * .Cells(3 + i, 7)
    End If
    If .Cells(3 + i, 9) = 0 Then
        .Cells(3 + i, 9) = 0.25 * .Cells(3 + i, 10)
    End If
    If .Cells(3 + i, 11) = 0 Then
        .Cells(3 + i, 11) = 0.25 * .Cells(3 + i, 10)
    End If
    If Not .Cells(3 + i, 6) = 0 Then .Cells(3 + i, 14) = .Cells(3 + i, 9) / .Cells(3 + i, 6)
    If .Cells(3 + i, 14) > 1 Then .Cells(3 + i, 14).Interior.ColorIndex = 4
    If Not .Cells(3 + i, 7) = 0 Then .Cells(3 + i, 15) = .Cells(3 + i, 10) / .Cells(3 + i, 7)
    If .Cells(3 + i, 15) > 1 Then .Cells(3 + i, 15).Interior.ColorIndex = 4
    If Not .Cells(3 + i, 8) = 0 Then .Cells(3 + i, 16) = .Cells(3 + i, 11) / .Cells(3 + i, 8)
    If .Cells(3 + i, 16) > 1 Then .Cells(3 + i, 16).Interior.ColorIndex = 4
    If Not .Cells(3 + i, 12) = 0 Then .Cells(3 + i, 17) = .Cells(3 + i, 13) / .Cells(3 + i, 12)
    If .Cells(3 + i, 17) > 1 Then .Cells(3 + i, 17).Interior.ColorIndex = 4
End With
Next

'ǽ������ֵ����
For i = 1 To i_wb1

With Sheets("WBI")
    '��������Ϊ0����ȡ�׽��1/4
    If .Cells(3 + i, 6) = 0 Then
        .Cells(3 + i, 6) = 0.25 * .Cells(3 + i, 7)
    End If
    If .Cells(3 + i, 8) = 0 Then
        .Cells(3 + i, 8) = 0.25 * .Cells(3 + i, 7)
    End If
    If .Cells(3 + i, 9) = 0 Then
        .Cells(3 + i, 9) = 0.25 * .Cells(3 + i, 10)
    End If
    If .Cells(3 + i, 11) = 0 Then
        .Cells(3 + i, 11) = 0.25 * .Cells(3 + i, 10)
    End If
    .Cells(3 + i, 14) = .Cells(3 + i, 9) / .Cells(3 + i, 6)
    .Cells(3 + i, 15) = .Cells(3 + i, 10) / .Cells(3 + i, 7)
    .Cells(3 + i, 16) = .Cells(3 + i, 11) / .Cells(3 + i, 8)
    .Cells(3 + i, 17) = .Cells(3 + i, 13) / .Cells(3 + i, 12)
End With
Next


End Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Sub OUTReader_PKPM_CompareS_figure()

'======================================================================================================����ͼ��

Dim sh As Worksheet
'��Ѱ���еĹ����������
For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = "figure_Info" Then
        sh.Delete
    End If
Next

'ͼ��߿�
Dim Width As Integer, Hight As Integer
Width = 207
Hight = 284

Call Addsh("figure_Info")

Call add_chart_2("CI", "P4:P" & i_c1 + 3, "Q4:Q" & i_c2 + 3, "A4:A" & i_c1 + 3, "���������", "�乿��", "����/С��", "�����", 0 * Width, 0 * Hight, Width, Hight)

Call add_chart_2("WCI", "S4:S" & i_w1 + 3, "T4:T" & i_w2 + 3, "A4:A" & i_w1 + 3, "�������", "�ֲ��ֽ�", "����/С��", "ǽ���", 1 * Width, 0 * Hight, Width, Hight)

Call add_chart_4("BI", "N4:N" & i_b1 + 3, "O4:O" & i_b2 + 3, "P4:P" & i_b1 + 3, "Q4:Q" & i_b2 + 3, "A4:A" & i_b1 + 3, "I�㶥��", "�е�׽�", "J�㶥��", "����", "����/С��", "�����", 2 * Width, 0 * Hight, Width, Hight)

Call add_chart_4("WBI", "N4:N" & i_wb1 + 3, "O4:O" & i_wb2 + 3, "P4:P" & i_wb1 + 3, "Q4:Q" & i_wb2 + 3, "A4:A" & i_wb1 + 3, "I�㶥��", "�е�׽�", "J�㶥��", "����", "����/С��", "ǽ�����", 3 * Width, 0 * Hight, Width, Hight)

Sheets("figure_Info").Select
'Sheets("BI").range("L4").Select
'Selection.AutoFill Destination:=range("L4:L" & i_b1), Type:=xlFillDefault
'Sheets("BI").range("M4").Select
'Selection.AutoFill Destination:=range("M4:M" & i_b2), Type:=xlFillDefault


End Sub


'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Sub OUTReader_PKPM_Info(path1 As String, path2 As String, num As Integer)


'==========================================================================================д����

'Sheets("WCI").Cells(Num + 1, 2) = CStr(Num) & "F"
'Sheets("CI").Cells(Num + 1, 2) = CStr(Num) & "F"
'Sheets("BI").Cells(Num + 1, 2) = CStr(Num) & "F"
Dim n As Integer
n = num


'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, filepath2, inputstring  As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'������ֵ������������
Dim C_C, C_W As Integer

'==========================================================================================����ؼ��ʱ���

'����ǽ��������йؼ���
Dim Keyword_Column, Keyword_Wall, Keyword_Beam, Keyword_WBeam As String
'��ֵ
Keyword_Column = "N-C="
Keyword_Wall = "N-WC="
Keyword_Beam = "N-B="
Keyword_WBeam = "N-WB="

'����ǽ��ѹ���йؼ���
Dim Keyword_Column_UC, Keyword_Wall_UC As String
'��ֵ
Keyword_Column_UC = "Uc="
Keyword_Wall_UC = "Uc="

'������׽��������ʹؼ���
Dim Keyword_Beam_Top, Keyword_Beam_Btm, Keyword_Beam_Rsv As String
Dim Keyword_WBeam_Top, Keyword_WBeam_Btm, Keyword_WBeam_Rsv As String
'��ֵ
Keyword_Beam_Top = "Top Ast"
Keyword_Beam_Btm = "Btm Ast"
Keyword_Beam_Rsv = "Rsv"
Keyword_WBeam_Top = "Top Ast"
Keyword_WBeam_Btm = "Btm Ast"
Keyword_WBeam_Rsv = "Rsv"


'����ǽ�����������йؼ���
Dim Keyword_Column_V, Keyword_Wall_V As String
'��ֵ
Keyword_Column_V = "����������"
Keyword_Wall_V = "����������"

'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_Column, FirstString_Wall, FirstString_Beam, FirstString_WBeam As String
'����ǽ��ѹ�ȣ��������
Dim FirstString_Column_UC, FirstString_Wall_UC, FirstString_Beam_S, FirstString_WBeam_S As String


'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & CStr(num) & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename
filepath2 = path2 & "\" & Filename

'Debug.Print path1
'Debug.Print filepath

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i


'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ����С�����ļ�wpj" & CStr(num); ".out; "
Debug.Print "��ȡ���ָ��"
Debug.Print "����"





Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����ǽ
    FirstString_Column = Mid(data, 2, 4)
    FirstString_Wall = Mid(data, 2, 5)
    FirstString_Beam = Mid(data, 2, 4)
    FirstString_WBeam = Mid(data, 2, 5)

    '--------------------------------------------------------------------------��ȡ������Ϣ
    If FirstString_Column = Keyword_Column Then
        Debug.Print "��ȡ" & CStr(num) & "������Ϣ����"
        'д�����
        Sheets("CI").Cells(i_c1 + 4, 1) = i_c1 + 1
        'д��¥���
        Sheets("CI").Cells(i_c1 + 4, 2) = n
        '��ȡ�����
        Sheets("CI").Cells(i_c1 + 4, 3) = "NC-" & extractNumberFromString(data, 1)
        '��ȡ������
        Sheets("CI").Cells(i_c1 + 4, 4) = extractNumberFromString(data, 3)
        Sheets("CI").Cells(i_c1 + 4, 5) = extractNumberFromString(data, 4)
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Column_UC = Mid(data, 20, 3)
            If FirstString_Column_UC = Keyword_Column_UC Then
                '��ȡ����ѹ��
                Sheets("CI").Cells(i_c1 + 4, 6) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                '��ȡ�����������
                Sheets("CI").Cells(i_c1 + 4, 8) = Mid(data, 34, 6)
                '��ȡ�����������
                Sheets("CI").Cells(i_c1 + 4, 10) = Mid(data, 48, 6)
            End If
            
            If Mid(data, 2, 5) = Keyword_Column_V Then
                '��ȡ����������
                Sheets("CI").Cells(i_c1 + 4, 12) = extractNumberFromString(data, 1)
                Sheets("CI").Cells(i_c1 + 4, 14) = extractNumberFromString(data, 2)
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_c1 = i_c1 + 1
                Exit Do
            End If
            
        Loop
    End If
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
        Debug.Print "��ȡ" & CStr(num) & "��ǽ��Ϣ����"
        'д�����
        Sheets("WCI").Cells(i_w1 + 4, 1) = i_w1 + 1
        'д��¥���
        Sheets("WCI").Cells(i_w1 + 4, 2) = n
        '��ȡǽ���
        Sheets("WCI").Cells(i_w1 + 4, 3) = "NWC-" & extractNumberFromString(data, 1)
        '��ȡǽ����
        Dim B_w As Integer, H_w As Integer
        Sheets("WCI").Cells(i_w1 + 4, 4) = extractNumberFromString(data, 4) * 1000
        B_w = Sheets("WCI").Cells(i_w1 + 4, 4)
        Sheets("WCI").Cells(i_w1 + 4, 5) = extractNumberFromString(data, 5) * 1000
        H_w = Sheets("WCI").Cells(i_w1 + 4, 5)
        Sheets("WCI").Cells(i_w1 + 4, 6) = extractNumberFromString(data, 6) * 1000
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Wall_UC = Mid(data, 20, 3)
            If FirstString_Wall_UC = Keyword_Wall_UC Then
                '��ȡǽ��ѹ��
                Debug.Print "��ȡ" & CStr(num) & "��ǽ��ѹ�ȡ���"
                Sheets("WCI").Cells(i_w1 + 4, 7) = StringfromStringforReg(data, "\s+0\.\d*", 1)
            End If
            
            If Mid(data, 7, 2) = "M=" And Mid(data, 19, 2) = "N=" Then
                '��ȡ����������
                Dim As_az As Single
                Debug.Print "��ȡ" & CStr(num) & "��ǽ��������"
                Sheets("WCI").Cells(i_w1 + 4, 9) = extractNumberFromString(data, 4)
                As_az = Sheets("WCI").Cells(i_w1 + 4, 9)
                '���������Ϊ0������������Ϊ1������С�����ֵ�ļ���
                If As_az = 0 Then
                    Sheets("WCI").Cells(i_w1 + 4, 9) = 1
                End If
            End If
            
            If Mid(data, 7, 2) = "V=" And Mid(data, 19, 2) = "N=" Then
                '��ȡˮƽ�ֲ���������
                 Debug.Print "��ȡ" & CStr(num) & "��ǽˮƽ����"
                Sheets("WCI").Cells(i_w1 + 4, 11) = extractNumberFromString(data, 4)
                Sheets("WCI").Cells(i_w1 + 4, 13) = extractNumberFromString(data, 5)
            End If
            
            If Mid(data, 2, 5) = Keyword_Wall_V Then
                '��ȡ����������
                 Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                Sheets("WCI").Cells(i_w1 + 4, 15) = extractNumberFromString(data, 1)
                Sheets("WCI").Cells(i_w1 + 4, 17) = extractNumberFromString(data, 2)
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_w1 = i_w1 + 1
                Exit Do
            End If
        Loop
    End If
    
    '--------------------------------------------------------------------------��ȡ����Ϣ
    If FirstString_Beam = Keyword_Beam Then
        Debug.Print "��ȡ" & CStr(num) & "������Ϣ����"
        'д�����
        Sheets("BI").Cells(i_b1 + 4, 1) = i_b1 + 1
        'д��¥���
        Sheets("BI").Cells(i_b1 + 4, 2) = n
        '��ȡ�����
        Sheets("BI").Cells(i_b1 + 4, 3) = "NB-" & extractNumberFromString(data, 1)
        '��ȡ������
        Sheets("BI").Cells(i_b1 + 4, 4) = extractNumberFromString(data, 5)
        Sheets("BI").Cells(i_b1 + 4, 5) = extractNumberFromString(data, 6)
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Beam_S = Mid(data, 1, 7)
            If FirstString_Beam_S = Keyword_Beam_Top Then
                '��ȡ������
                Do While Not EOF(1)
                    Line Input #1, data
                    FirstString_Beam_S = Mid(data, 1, 7)
                    If FirstString_Beam_S = "% Steel" Then
                        Debug.Print "��ȡ" & CStr(num) & "������������ʡ���"
                        Sheets("BI").Cells(i_b1 + 4, 6) = extractNumberFromString(data, 1)
                        Sheets("BI").Cells(i_b1 + 4, 8) = extractNumberFromString(data, 9)
'                        Sheets("BI").Cells(i_b1 + 4, 8) = "=MAX(F4:H4)"
                    End If
                
                    If FirstString_Beam_S = Keyword_Beam_Btm Then
                        Exit Do
                    End If
                Loop
                
            End If
            
            '��ȡ���׽�
            FirstString_Beam_S = Mid(data, 1, 7)
            If FirstString_Beam_S = "% Steel" Then
                Debug.Print "��ȡ" & CStr(num) & "�����׽�����ʡ���"
                Sheets("BI").Cells(i_b1 + 4, 7) = extractNumberFromString(data, 5)
            End If
            
            
            '��ȡ���乿��
            If Mid(data, 2, 3) = Keyword_Beam_Rsv Then
                Debug.Print "��ȡ" & CStr(num) & "�����乿�ʡ���"
                Sheets("BI").Cells(i_b1 + 4, 12) = extractNumberFromString(data, 1)
                If Sheets("BI").Cells(i_b1 + 4, 12) < extractNumberFromString(data, 5) Then
                    Sheets("BI").Cells(i_b1 + 4, 12) = extractNumberFromString(data, 5)
                End If
                If Sheets("BI").Cells(i_b1 + 4, 12) < extractNumberFromString(data, 9) Then
                    Sheets("BI").Cells(i_b1 + 4, 12) = extractNumberFromString(data, 9)
                End If
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_b1 = i_b1 + 1
                Exit Do
            End If

        Loop
    End If
    
    
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_WBeam = Keyword_WBeam Then
        Debug.Print "��ȡ" & CStr(num) & "��ǽ����Ϣ����"
        'д�����
        Sheets("WBI").Cells(i_wb1 + 4, 1) = i_wb1 + 1
        'д��¥���
        Sheets("WBI").Cells(i_wb1 + 4, 2) = n
        '��ȡ�����
        Sheets("WBI").Cells(i_wb1 + 4, 3) = "NWB-" & extractNumberFromString(data, 1)
        '��ȡ������
        Sheets("WBI").Cells(i_wb1 + 4, 4) = extractNumberFromString(data, 5)
        Sheets("WBI").Cells(i_wb1 + 4, 5) = extractNumberFromString(data, 6)
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_WBeam_S = Mid(data, 1, 7)
            If FirstString_WBeam_S = Keyword_WBeam_Top Then
                '��ȡ������
                Do While Not EOF(1)
                    Line Input #1, data
                    FirstString_WBeam_S = Mid(data, 1, 7)
                    If FirstString_WBeam_S = "% Steel" Then
                        Debug.Print "��ȡ" & CStr(num) & "��ǽ����������ʡ���"
                        Sheets("WBI").Cells(i_wb1 + 4, 6) = extractNumberFromString(data, 1)
                        Sheets("WBI").Cells(i_wb1 + 4, 8) = extractNumberFromString(data, 9)
'                        Sheets("WBI").Cells(i_wb1 + 4, 8) = "=MAX(F4:H4)"
                    End If
                
                    If FirstString_WBeam_S = Keyword_WBeam_Btm Then
                        Exit Do
                    End If
                Loop
                
            End If
            
            '��ȡ���׽�
            FirstString_WBeam_S = Mid(data, 1, 7)
            If FirstString_WBeam_S = "% Steel" Then
                Debug.Print "��ȡ" & CStr(num) & "��ǽ���׽�����ʡ���"
                Sheets("WBI").Cells(i_wb1 + 4, 7) = extractNumberFromString(data, 5)
            End If
            
            
            '��ȡ���乿��
            If Mid(data, 2, 3) = Keyword_WBeam_Rsv Then
                Debug.Print "��ȡ" & CStr(num) & "��ǽ���乿�ʡ���"
                Sheets("WBI").Cells(i_wb1 + 4, 12) = extractNumberFromString(data, 1)
                If Sheets("WBI").Cells(i_wb1 + 4, 12) < extractNumberFromString(data, 5) Then
                    Sheets("WBI").Cells(i_wb1 + 4, 12) = extractNumberFromString(data, 5)
                End If
                If Sheets("WBI").Cells(i_wb1 + 4, 12) < extractNumberFromString(data, 9) Then
                    Sheets("WBI").Cells(i_wb1 + 4, 12) = extractNumberFromString(data, 9)
                End If
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_wb1 = i_wb1 + 1
                Exit Do
            End If

        Loop
    End If

    
Loop

Close #1


'�򿪽���ļ�
Open (filepath2) For Input Access Read As #i


'===========================================================================================��ȡ������Ϣ

Debug.Print "��ʼ�����������ļ�wpj" & CStr(num); ".out; "
Debug.Print "��ȡ���ָ��"
Debug.Print "����"





Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����ǽ
    FirstString_Column = Mid(data, 2, 4)
    FirstString_Wall = Mid(data, 2, 5)
    FirstString_Beam = Mid(data, 2, 4)
    FirstString_WBeam = Mid(data, 2, 5)

    '--------------------------------------------------------------------------��ȡ������Ϣ
    If FirstString_Column = Keyword_Column Then
        Debug.Print "��ȡ" & CStr(num) & "������Ϣ����"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Column_UC = Mid(data, 20, 3)
            If FirstString_Column_UC = Keyword_Column_UC Then
                '��ȡ����ѹ��
                Sheets("CI").Cells(i_c2 + 4, 7) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                '��ȡ�����������
                Sheets("CI").Cells(i_c2 + 4, 9) = Mid(data, 34, 6)
                '��ȡ�����������
                Sheets("CI").Cells(i_c2 + 4, 11) = Mid(data, 48, 6)
            End If
            
            If Mid(data, 2, 5) = Keyword_Column_V Then
                '��ȡ����������
                Sheets("CI").Cells(i_c2 + 4, 13) = extractNumberFromString(data, 1)
                Sheets("CI").Cells(i_c2 + 4, 15) = extractNumberFromString(data, 2)
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_c2 = i_c2 + 1
                Exit Do
            End If
            
        Loop
    End If
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
        '��ȡǽ����
        B_w = Sheets("WCI").Cells(i_w2 + 4, 4)
        H_w = Sheets("WCI").Cells(i_w2 + 4, 5)
        Debug.Print "��ȡ" & CStr(num) & "��ǽ��Ϣ����"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Wall_UC = Mid(data, 20, 3)
            If FirstString_Wall_UC = Keyword_Wall_UC Then
                '��ȡǽ��ѹ��
                Debug.Print "��ȡ" & CStr(num) & "��ǽ��ѹ�ȡ���"
                Sheets("WCI").Cells(i_w2 + 4, 8) = StringfromStringforReg(data, "\s+0\.\d*", 1)
            End If
            
            If Mid(data, 7, 2) = "M=" And Mid(data, 19, 2) = "N=" Then
                '��ȡ����������
                 Debug.Print "��ȡ" & CStr(num) & "��ǽ��������"
                Sheets("WCI").Cells(i_w2 + 4, 10) = extractNumberFromString(data, 4)
                As_az = Sheets("WCI").Cells(i_w2 + 4, 10)
                '���������Ϊ0������������Ϊ1������С�����ֵ�ļ���
                If As_az = 0 Then
                    Sheets("WCI").Cells(i_w2 + 4, 10) = 1
                End If
            End If
            
            If Mid(data, 7, 2) = "V=" And Mid(data, 19, 2) = "N=" Then
                '��ȡˮƽ�ֲ���������
                 Debug.Print "��ȡ" & CStr(num) & "��ǽˮƽ����"
                Sheets("WCI").Cells(i_w2 + 4, 12) = extractNumberFromString(data, 4)
                Sheets("WCI").Cells(i_w2 + 4, 14) = extractNumberFromString(data, 5)
            End If
            
            If Mid(data, 2, 5) = Keyword_Wall_V Then
                '��ȡ����������
                 Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                Sheets("WCI").Cells(i_w2 + 4, 16) = extractNumberFromString(data, 1)
                Sheets("WCI").Cells(i_w2 + 4, 18) = extractNumberFromString(data, 2)
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_w2 = i_w2 + 1
                Exit Do
            End If
        Loop
    End If
    
    '--------------------------------------------------------------------------��ȡ����Ϣ
    If FirstString_Beam = Keyword_Beam Then
        Debug.Print "��ȡ" & CStr(num) & "������Ϣ����"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_Beam_S = Mid(data, 1, 7)
            If FirstString_Beam_S = Keyword_Beam_Top Then
                '��ȡ������
                Do While Not EOF(1)
                    Line Input #1, data
                    FirstString_Beam_S = Mid(data, 1, 7)
                    If FirstString_Beam_S = "% Steel" Then
                        Debug.Print "��ȡ" & CStr(num) & "������������ʡ���"
                        Sheets("BI").Cells(i_b2 + 4, 9) = extractNumberFromString(data, 1)
                        Sheets("BI").Cells(i_b2 + 4, 11) = extractNumberFromString(data, 9)
'                        Sheets("BI").Cells(i_b1 + 4, 8) = "=MAX(F4:H4)"
                    End If
                
                    If FirstString_Beam_S = Keyword_Beam_Btm Then
                        Exit Do
                    End If
                Loop
                
            End If
            
            '��ȡ���׽�
            FirstString_Beam_S = Mid(data, 1, 7)
            If FirstString_Beam_S = "% Steel" Then
                Debug.Print "��ȡ" & CStr(num) & "�����׽�����ʡ���"
                Sheets("BI").Cells(i_b2 + 4, 10) = extractNumberFromString(data, 5)
            End If
            
            
            '��ȡ���乿��
            If Mid(data, 2, 3) = Keyword_Beam_Rsv Then
                Debug.Print "��ȡ" & CStr(num) & "�����乿�ʡ���"
                Sheets("BI").Cells(i_b2 + 4, 13) = extractNumberFromString(data, 1)
                If Sheets("BI").Cells(i_b2 + 4, 13) < extractNumberFromString(data, 5) Then
                    Sheets("BI").Cells(i_b2 + 4, 13) = extractNumberFromString(data, 5)
                End If
                If Sheets("BI").Cells(i_b2 + 4, 13) < extractNumberFromString(data, 9) Then
                    Sheets("BI").Cells(i_b2 + 4, 13) = extractNumberFromString(data, 9)
                End If
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_b2 = i_b2 + 1
                Exit Do
            End If

        Loop
    End If
    
    
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_WBeam = Keyword_WBeam Then
        Debug.Print "��ȡ" & CStr(num) & "��ǽ����Ϣ����"
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_WBeam_S = Mid(data, 1, 7)
            If FirstString_WBeam_S = Keyword_WBeam_Top Then
                '��ȡ������
                Do While Not EOF(1)
                    Line Input #1, data
                    FirstString_WBeam_S = Mid(data, 1, 7)
                    If FirstString_WBeam_S = "% Steel" Then
                        Debug.Print "��ȡ" & CStr(num) & "��ǽ����������ʡ���"
                        Sheets("WBI").Cells(i_wb2 + 4, 9) = extractNumberFromString(data, 1)
                        Sheets("WBI").Cells(i_wb2 + 4, 11) = extractNumberFromString(data, 9)
'                        Sheets("WBI").Cells(i_wb2 + 4, 8) = "=MAX(F4:H4)"
                    End If
                
                    If FirstString_WBeam_S = Keyword_WBeam_Btm Then
                        Exit Do
                    End If
                Loop
                
            End If
            
            '��ȡ���׽�
            FirstString_WBeam_S = Mid(data, 1, 7)
            If FirstString_WBeam_S = "% Steel" Then
                Debug.Print "��ȡ" & CStr(num) & "��ǽ���׽�����ʡ���"
                Sheets("WBI").Cells(i_wb2 + 4, 10) = extractNumberFromString(data, 5)
            End If
            
            
            '��ȡ���乿��
            If Mid(data, 2, 3) = Keyword_WBeam_Rsv Then
                Debug.Print "��ȡ" & CStr(num) & "��ǽ���乿�ʡ���"
                Sheets("WBI").Cells(i_wb2 + 4, 13) = extractNumberFromString(data, 1)
                If Sheets("WBI").Cells(i_wb2 + 4, 13) < extractNumberFromString(data, 5) Then
                    Sheets("WBI").Cells(i_wb2 + 4, 13) = extractNumberFromString(data, 5)
                End If
                If Sheets("WBI").Cells(i_wb2 + 4, 13) < extractNumberFromString(data, 9) Then
                    Sheets("WBI").Cells(i_wb2 + 4, 13) = extractNumberFromString(data, 9)
                End If
            End If
            
            If CheckRegExpfromString(data, "---") = True Then
                i_wb2 = i_wb2 + 1
                Exit Do
            End If

        Loop
    End If

    
Loop

Close #1




End Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Sub AddInfoSheet()


'��������ʱ��
Dim sngStart As Single
sngStart = Timer

Call Addsh("CI")
Call Addsh("WCI")
Call Addsh("BI")
Call Addsh("WBI")

'======================================================================================================��ӱ��Column�ı���

'�����������������
Sheets("CI").Cells.Clear


'�ӱ����
Call AddFormLine("CI", "A2:Q20000")

'�ӱ���ɫ
Call AddShadow("CI", "A2:Q3", 10092441)

With Sheets("CI")
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    .range("F4:Q20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 6) = "�������Ϣ��ȡ"
    .Cells(1, 6).Font.name = "����"
    .Cells(1, 6).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("F1:H1").MergeCells = True
    
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 1) = "���"
    .Cells(2, 2) = "¥��"
    .Cells(2, 3) = "�����"
    .Cells(2, 4) = "������Ϣ"
    .Cells(2, 6) = "��ѹ��"
    .Cells(2, 8) = "���������Rs"
    .Cells(2, 10) = "���������Rsv"
    .Cells(2, 12) = "CB-XF"
    .Cells(2, 14) = "CB-YF"
    .Cells(2, 16) = "����/С��"
    .Cells(3, 4) = "B"
    .Cells(3, 5) = "H"
    .Cells(3, 6) = "С��"
    .Cells(3, 7) = "����"
    .Cells(3, 8) = "С��"
    .Cells(3, 9) = "����"
    .Cells(3, 10) = "С��"
    .Cells(3, 11) = "����"
    .Cells(3, 12) = "С��"
    .Cells(3, 13) = "����"
    .Cells(3, 14) = "С��"
    .Cells(3, 15) = "����"
    .Cells(3, 16) = "����"
    .Cells(3, 17) = "����"
    '�ϲ���Ԫ��
    .range("A2:A3").MergeCells = True
    .range("B2:B3").MergeCells = True
    .range("C2:C3").MergeCells = True
    .range("D2:E2").MergeCells = True
    .range("F2:G2").MergeCells = True
    .range("H2:I2").MergeCells = True
    .range("J2:K2").MergeCells = True
    .range("L2:M2").MergeCells = True
    .range("N2:O2").MergeCells = True
    .range("P2:Q2").MergeCells = True
End With

'������������
Sheets("CI").Select
range("B4").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True



'======================================================================================================��ӱ��Wall�ı���

'�����������������
Sheets("WCI").Cells.Clear


'�ӱ����
Call AddFormLine("WCI", "A2:T20000")

'�ӱ���ɫ
'Call AddShadow("WCI", "A2:T3", 6750105)
Call AddShadow("WCI", "A2:T3", 10092441)


With Sheets("WCI")
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    .range("G4:T20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 9) = "ǽ�����Ϣ��ȡ"
    .Cells(1, 9).Font.name = "����"
    .Cells(1, 9).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("I1:L1").MergeCells = True
    
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 1) = "���"
    .Cells(2, 2) = "¥��"
    .Cells(2, 3) = "�����"
    .Cells(2, 4) = "������Ϣ"
    .Cells(2, 7) = "��ѹ��"
    .Cells(2, 9) = "һ�˰���������As"
    .Cells(2, 11) = "ˮƽ�ֲ������Ash"
    .Cells(2, 13) = "�ֲ��������Rsh"
    .Cells(2, 15) = "CB-XF"
    .Cells(2, 17) = "CB-YF"
    .Cells(2, 19) = "����/С��"
    .Cells(3, 4) = "B"
    .Cells(3, 5) = "H"
    .Cells(3, 6) = "Lwc"
    .Cells(3, 7) = "С��"
    .Cells(3, 8) = "����"
    .Cells(3, 9) = "С��"
    .Cells(3, 10) = "����"
    .Cells(3, 11) = "С��"
    .Cells(3, 12) = "����"
    .Cells(3, 13) = "С��"
    .Cells(3, 14) = "����"
    .Cells(3, 15) = "С��"
    .Cells(3, 16) = "����"
    .Cells(3, 17) = "С��"
    .Cells(3, 18) = "����"
    .Cells(3, 19) = "һ�˰���"
    .Cells(3, 20) = "ˮƽ�ֲ�"
    '�ϲ���Ԫ��
    .range("A2:A3").MergeCells = True
    .range("B2:B3").MergeCells = True
    .range("C2:C3").MergeCells = True
    .range("D2:F2").MergeCells = True
    .range("G2:H2").MergeCells = True
    .range("I2:J2").MergeCells = True
    .range("K2:L2").MergeCells = True
    .range("M2:N2").MergeCells = True
    .range("O2:P2").MergeCells = True
    .range("Q2:R2").MergeCells = True
    .range("S2:T2").MergeCells = True
End With

'������������
Sheets("WCI").Select
range("B4").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True

'======================================================================================================��ӱ��Beam�ı���

'�����������������
Sheets("BI").Cells.Clear


'�ӱ����
Call AddFormLine("BI", "A2:Q20000")

'�ӱ���ɫ
'Call AddShadow("BI", "A2:03", 6750105)
Call AddShadow("BI", "A2:Q3", 10092441)

With Sheets("BI")
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    .range("F4:Q20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 6) = "�������Ϣ��ȡ"
    .Cells(1, 6).Font.name = "����"
    .Cells(1, 6).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("F1:H1").MergeCells = True
    
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 1) = "���"
    .Cells(2, 2) = "¥��"
    .Cells(2, 3) = "�����"
    .Cells(2, 4) = "������Ϣ"
    .Cells(2, 6) = "����ʣ�С��"
    .Cells(2, 9) = "����ʣ�����"
    .Cells(2, 12) = "�乿��"
    .Cells(2, 14) = "����/С��"
    .Cells(3, 4) = "B"
    .Cells(3, 5) = "H"
    .Cells(3, 6) = "I�㶥��"
    .Cells(3, 7) = "�е�׽�"
    .Cells(3, 8) = "J�㶥��"
    .Cells(3, 9) = "I�㶥��"
    .Cells(3, 10) = "�е�׽�"
    .Cells(3, 11) = "�㶥��"
    .Cells(3, 12) = "С��"
    .Cells(3, 13) = "����"
    .Cells(3, 14) = "I�㶥��"
    .Cells(3, 15) = "�е�׽�"
    .Cells(3, 16) = "J�㶥��"
    .Cells(3, 17) = "�乿"
    '�ϲ���Ԫ��
    .range("A2:A3").MergeCells = True
    .range("B2:B3").MergeCells = True
    .range("C2:C3").MergeCells = True
    .range("D2:E2").MergeCells = True
    .range("F2:H2").MergeCells = True
    .range("I2:K2").MergeCells = True
    .range("L2:M2").MergeCells = True
    .range("N2:Q2").MergeCells = True
    
End With

'������������
Sheets("BI").Select
range("B4").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True



'======================================================================================================��ӱ��WBeam�ı���

'�����������������
Sheets("WBI").Cells.Clear


'�ӱ����
Call AddFormLine("WBI", "A2:Q20000")

'�ӱ���ɫ
'Call AddShadow("WBI", "A2:03", 6750105)
Call AddShadow("WBI", "A2:Q3", 10092441)

With Sheets("WBI")
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    .range("F4:Q20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 6) = "ǽ�������Ϣ��ȡ"
    .Cells(1, 6).Font.name = "����"
    .Cells(1, 6).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("F1:H1").MergeCells = True
    
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 1) = "���"
    .Cells(2, 2) = "¥��"
    .Cells(2, 3) = "�����"
    .Cells(2, 4) = "������Ϣ"
    .Cells(2, 6) = "����ʣ�С��"
    .Cells(2, 9) = "����ʣ�����"
    .Cells(2, 12) = "�乿��"
    .Cells(2, 14) = "����/С��"
    .Cells(3, 4) = "B"
    .Cells(3, 5) = "H"
    .Cells(3, 6) = "I�㶥��"
    .Cells(3, 7) = "�е�׽�"
    .Cells(3, 8) = "J�㶥��"
    .Cells(3, 9) = "I�㶥��"
    .Cells(3, 10) = "�е�׽�"
    .Cells(3, 11) = "�㶥��"
    .Cells(3, 12) = "С��"
    .Cells(3, 13) = "����"
    .Cells(3, 14) = "I�㶥��"
    .Cells(3, 15) = "�е�׽�"
    .Cells(3, 16) = "J�㶥��"
    .Cells(3, 17) = "�乿"
    '�ϲ���Ԫ��
    .range("A2:A3").MergeCells = True
    .range("B2:B3").MergeCells = True
    .range("C2:C3").MergeCells = True
    .range("D2:E2").MergeCells = True
    .range("F2:H2").MergeCells = True
    .range("I2:K2").MergeCells = True
    .range("L2:M2").MergeCells = True
    .range("N2:Q2").MergeCells = True
    
End With



'������������
Sheets("WBI").Select
range("B4").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True

End Sub


