Attribute VB_Name = "ģ��_��ȡ����ǽ�ܼ���Ϣ"
Option Explicit
Public i_wa As Integer

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/7/9
'1.��Ӽ���ǽ��λѡ�񣬷ֱ��岻ͬ������ʡ�


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/4
'1.����ǽ�ֲ���������"wallshear"����ʱΪ��ɾ�������صı�����ʱ�������ң�
'2.ɾ��ԭ���ֹ�����ֲ�������
'3.����PKPM��������Ŷ�ȡ��ģ��
'4.���ӿ�������Ҫ��ļ�飬�������ļ��
'5.��������Ҫ��ļ��㹫ʽ�л�����ǿ�Ȳ������ֵ������gammaRE����0.85
'6.���Ӷ�ȡ����ǽ��������ĺ�������PKPM��YJK����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/3
'1.������YJK��ģ��
'2.�ֳɰ�¥��Ͱ�������ֶ�ȡ����
'3.ԭmember_info2���ã�����ʱ�����ģ��ֱ�ӵ���
'4.���ӳ������ȡ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/12/24
'��������:
'1.����C50��ftֵ
'2.����������������ʽ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/12/19
'��������:
'1.����һЩbug��i_wa����ֻ��д�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/12/11
'��������:
'1.��ԭ����member_infoģ��ֳ�������member_info1��member_info2��ǰ�����ɱ�񡢲�ź͹�����ţ��ṩ�û��޸Ĺ�����ź�������member_info2�������ݶ�ȡ
'2.���beta_c����
'3.��Ӹֽ���������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/17
'��������:
'1.��������C30C80�Ĳ���ǿ��ֵ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/9/11
'��������:
'1.

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                          ��ȡ����ǽ�ܼ���Ϣ����                      ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub member_info_f(path1 As String, mem As Integer, startf As Integer, endf As Integer, softname As String, infotype As String)


'-------------------------------------------------------------------------------------------- ����������
Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

Call Addsh(wallshearsheet)

'�����������������
Sheets(wallshearsheet).Cells.Clear


'�ӱ����
Call AddFormLine(wallshearsheet, "A2:AC20000")

'�ӱ���ɫ
Call AddShadow(wallshearsheet, "A2:AC3", 10092441)

With Sheets(wallshearsheet)
   
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    '.range("F4:Q20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    '������Ԫ����
    .Columns("AB:AB").ColumnWidth = 18.13
    .Columns("X:Y").ColumnWidth = 11.88
    .Columns("W:W").ColumnWidth = 10.63
   
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 10) = "����ǽ��������"
    .Cells(1, 10).Font.name = "����"
    .Cells(1, 10).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("J1:M1").MergeCells = True
   
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 1) = "���"
    .Cells(2, 2) = "¥��"
    .Cells(2, 3) = "ǽ���"
    .Cells(2, 4) = "������Ϣ"
    .Cells(2, 7) = "��ѹ��"
    .Cells(2, 8) = "CB-XF"
    .Cells(2, 9) = "CB-YF"
    .Cells(2, 10) = "����"
    .Cells(2, 11) = "����"
    .Cells(2, 12) = "�����"
    .Cells(2, 13) = "�ŵȼ�"
    .Cells(2, 14) = "aa"
    .Cells(2, 15) = "ˮƽ�ֽ�"
    .Cells(2, 18) = "����ǿ��"
    .Cells(2, 22) = "beta_c"
    .Cells(2, 23) = "����������"
    .Cells(2, 24) = "����������"
    .Cells(2, 25) = "��������Ҫ��"
    .Cells(2, 26) = "��������Ҫ����"
    .Cells(2, 27) = "���������"
    .Cells(2, 28) = "��������"

    .Cells(3, 4) = "B"
    .Cells(3, 5) = "H"
    .Cells(3, 6) = "Lwc"

    .Cells(3, 8) = "kN"
    .Cells(3, 9) = "kN"
    .Cells(3, 10) = "kN"
    .Cells(3, 11) = "kN"

    .Cells(3, 15) = "ֱ��"
    .Cells(3, 16) = "���"
    .Cells(3, 17) = "����"
    .Cells(3, 18) = "fc"
    .Cells(3, 19) = "ft"
    .Cells(3, 20) = "fck"
    .Cells(3, 21) = "fyv"
    .Cells(3, 24) = "kN"
    .Cells(3, 25) = "kN"


    
    '�ϲ���Ԫ��
    .range("A2:A3").MergeCells = True
    .range("B2:B3").MergeCells = True
    .range("C2:C3").MergeCells = True
    .range("D2:F2").MergeCells = True
    .range("G2:G3").MergeCells = True

    .range("L2:L3").MergeCells = True
    .range("M2:M3").MergeCells = True
    .range("n2:n3").MergeCells = True
    .range("o2:q2").MergeCells = True
    .range("r2:u2").MergeCells = True
    .range("v2:v3").MergeCells = True
    .range("w2:w3").MergeCells = True
    .range("z2:z3").MergeCells = True
    .range("aa2:aa3").MergeCells = True
    .range("ab2:ab3").MergeCells = True
    '.range("v2:v3").MergeCells = True
    '.range("w2:w3").MergeCells = True

    
End With

'������������
Sheets(wallshearsheet).Select
range("d4").Select
With ActiveWindow
    .SplitColumn = 3
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True

i_wa = 0

Dim i As Integer

For i = startf To endf

    Sheets(wallshearsheet).Cells(i + 3, 2) = i
    Sheets(wallshearsheet).Cells(i + 3, 3) = mem
'Call PKPM_Wall_Info(path1, mem, i)

Next

End Sub

'================================================================================================================
Sub member_info_m(path1 As String, flo As Integer, startm As Integer, endm As Integer, softname As String, infotype As String)


'-------------------------------------------------------------------------------------------- ����������
Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

Call Addsh(wallshearsheet)

'�����������������
Sheets(wallshearsheet).Cells.Clear


'�ӱ����
Call AddFormLine(wallshearsheet, "A2:AF20000")

'�ӱ���ɫ
Call AddShadow(wallshearsheet, "A2:AF3", 10092441)

With Sheets(wallshearsheet)
   
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    '.range("F4:Q20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    '������Ԫ����
    .Columns("AB:AF").ColumnWidth = 18.13
    .Columns("X:Y").ColumnWidth = 11.88
    .Columns("W:W").ColumnWidth = 10.63
    
   
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 10) = "����ǽ��������"
    .Cells(1, 10).Font.name = "����"
    .Cells(1, 10).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("J1:M1").MergeCells = True
   
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 1) = "���"
    .Cells(2, 2) = "¥��"
    .Cells(2, 3) = "ǽ���"
    .Cells(2, 4) = "������Ϣ"
    .Cells(2, 7) = "��ѹ��"
    .Cells(2, 8) = "CB-XF"
    .Cells(2, 9) = "CB-YF"
    .Cells(2, 10) = "����"
    .Cells(2, 11) = "����"
    .Cells(2, 12) = "�����"
    .Cells(2, 13) = "�ŵȼ�"
    .Cells(2, 14) = "aa"
    .Cells(2, 15) = "ˮƽ�ֽ�"
    .Cells(2, 18) = "����ǿ��"
    .Cells(2, 22) = "beta_c"
    .Cells(2, 23) = "����������"
    .Cells(2, 24) = "����������"
    .Cells(2, 25) = "��������Ҫ��"
    .Cells(2, 26) = "��������Ҫ����"
    .Cells(2, 27) = "���������"
    .Cells(2, 28) = "��������"

    .Cells(3, 4) = "B"
    .Cells(3, 5) = "H"
    .Cells(3, 6) = "Lwc"

    .Cells(3, 8) = "kN"
    .Cells(3, 9) = "kN"
    .Cells(3, 10) = "kN"
    .Cells(3, 11) = "kN"

    .Cells(3, 15) = "ֱ��"
    .Cells(3, 16) = "���"
    .Cells(3, 17) = "����"
    .Cells(3, 18) = "fc"
    .Cells(3, 19) = "ft"
    .Cells(3, 20) = "fck"
    .Cells(3, 21) = "fyv"
    .Cells(3, 24) = "kN"
    .Cells(3, 25) = "kN"


    
    '�ϲ���Ԫ��
    .range("A2:A3").MergeCells = True
    .range("B2:B3").MergeCells = True
    .range("C2:C3").MergeCells = True
    .range("D2:F2").MergeCells = True
    .range("G2:G3").MergeCells = True

    .range("L2:L3").MergeCells = True
    .range("M2:M3").MergeCells = True
    .range("n2:n3").MergeCells = True
    .range("o2:q2").MergeCells = True
    .range("r2:u2").MergeCells = True
    .range("v2:v3").MergeCells = True
    .range("w2:w3").MergeCells = True
    .range("z2:z3").MergeCells = True
    .range("aa2:aa3").MergeCells = True
    .range("AB2:AF3").MergeCells = True
    '.range("v2:v3").MergeCells = True
    '.range("w2:w3").MergeCells = True

    
End With

'������������
Sheets(wallshearsheet).Select
range("d4").Select
With ActiveWindow
    .SplitColumn = 3
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True

i_wa = 0

Dim i As Integer

For i = startm To endm

    Sheets(wallshearsheet).Cells(i + 3, 2) = flo
    Sheets(wallshearsheet).Cells(i + 3, 3) = i
'Call PKPM_Wall_Info(path1, mem, i)

Next

End Sub

'====================================================================================================================================
'PKPM��¥���ȡ
Sub PKPM_Wall_Info_F(path1 As String, num As Integer, softname As String, infotype As String)

Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

Dim n As Integer
n = num


'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'���幹����ű���
Dim mem As Integer

'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC="

'����ǽ��ѹ���йؼ���
Dim Keyword_Wall_UC As String
'��ֵ
Keyword_Wall_UC = "Uc="


'����ǽ�����������йؼ���
Dim Keyword_Wall_V As String
'��ֵ
Keyword_Wall_V = "����������"


'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_Wall As String
'����ǽ��ѹ�ȣ��������
Dim FirstString_Wall_UC As String


'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & CStr(num) & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename


Sheets(wallshearsheet).Select

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
    FirstString_Wall = Mid(data, 2, 5)
    
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
        Debug.Print "��ȡ" & CStr(num) & "��ǽ��Ϣ����"
        
        '��ȡǽ���
        mem = Sheets(wallshearsheet).Cells(n + 3, 3)
        
        If extractNumberFromString(data, 1) = mem Then
            'д�����
            Sheets(wallshearsheet).Cells(n + 3, 1) = i_wa + 1
            'д��¥���
            Sheets(wallshearsheet).Cells(n + 3, 2) = n
'            д��ֽ�ֱ���ͼ��
'            Sheets(wallshearsheet).Cells(n + 3, 15) = OUTReader_Main.D_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 16) = OUTReader_Main.DJ_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 17) = 2
        
            '��ȡǽ����
            Dim B_w As Long, H_w As Long
            Sheets(wallshearsheet).Cells(n + 3, 4) = extractNumberFromString(data, 4) * 1000
            B_w = Sheets(wallshearsheet).Cells(n + 3, 4)
            Sheets(wallshearsheet).Cells(n + 3, 5) = extractNumberFromString(data, 5) * 1000
            H_w = Sheets(wallshearsheet).Cells(n + 3, 5)
            Sheets(wallshearsheet).Cells(n + 3, 6) = extractNumberFromString(data, 6) * 1000

            Do While Not EOF(1)
                Line Input #1, data
                FirstString_Wall_UC = Mid(data, 20, 3)
                If Mid(data, 2, 2) = "aa" Then
                    Sheets(wallshearsheet).Cells(n + 3, 14) = extractNumberFromString(data, 1)
                    Sheets(wallshearsheet).Cells(n + 3, 13) = extractNumberFromString(data, 3)
                    Sheets(wallshearsheet).Cells(n + 3, 21) = extractNumberFromString(data, 5)
                End If
                If FirstString_Wall_UC = Keyword_Wall_UC Then
                    '��ȡǽ��ѹ��
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��ѹ�ȡ���"
                    Sheets(wallshearsheet).Cells(n + 3, 7) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                End If
           
                If Mid(data, 7, 2) = "M=" And Mid(data, 19, 2) = "V=" Then
                    '��ȡ����������
                    Debug.Print "��ȡ" & CStr(num) & "�����ȡ���"                   '----------------------------��������
                    Sheets(wallshearsheet).Cells(n + 3, 12) = extractNumberFromString(data, 4)
                    Sheets(wallshearsheet).Cells(n + 3, 12) = Round(Sheets(wallshearsheet).Cells(n + 3, 12), 3)
                End If
           

           
                If Mid(data, 7, 2) = "V=" And Mid(data, 19, 2) = "N=" Then
                    '��ȡˮƽ�ֲ���������
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��������"
                    Sheets(wallshearsheet).Cells(n + 3, 11) = extractNumberFromString(data, 2) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 11) = Round(Abs(Sheets(wallshearsheet).Cells(n + 3, 11)), 0)
                    Sheets(wallshearsheet).Cells(n + 3, 10) = extractNumberFromString(data, 3) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 10) = Round(Sheets(wallshearsheet).Cells(n + 3, 10), 0)
                    If Sheets(wallshearsheet).Cells(n + 3, 10) > 0 Then
                        Sheets(wallshearsheet).Cells(n + 3, 10).Interior.ColorIndex = 3
                        Sheets(wallshearsheet).Cells(n + 3, 2).Interior.ColorIndex = 3
                    End If
                End If
           
                If Mid(data, 2, 5) = Keyword_Wall_V Then
                    '��ȡ����������
                     Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                    Sheets(wallshearsheet).Cells(n + 3, 8) = extractNumberFromString(data, 1)
                    Sheets(wallshearsheet).Cells(n + 3, 8) = Round(Sheets(wallshearsheet).Cells(n + 3, 8), 1)
                    Sheets(wallshearsheet).Cells(n + 3, 9) = extractNumberFromString(data, 2)
                    Sheets(wallshearsheet).Cells(n + 3, 9) = Round(Sheets(wallshearsheet).Cells(n + 3, 9), 1)
                End If

                If Sheets(wallshearsheet).Cells(n + 3, 13) = "80" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 35.9
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.22
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 50.2
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.8
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "75" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 33.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.18
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 47.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.83
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "70" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 31.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.14
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 44.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.87
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "65" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 29.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.09
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 41.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.9
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "60" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 27.5
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.04
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 38.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.93
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "55" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 25.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.96
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 35.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.97
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "50" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 23.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.89
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 32.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "45" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 21.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.8
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 29.6
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "40" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 19.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.71
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 26.8
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "35" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 16.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.57
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 23.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "30" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 14.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.43
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 20.1
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                Else
                    MsgBox ("����������ǿ��ֵ��")
                End If
                
                
                If Sheets(wallshearsheet).Cells(n + 3, 12) < 1.5 Then
                   Sheets(wallshearsheet).Cells(n + 3, 23) = 1.5
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 12) > 2.2 Then
                    Sheets(wallshearsheet).Cells(n + 3, 23) = 2.2
                Else
                    Sheets(wallshearsheet).Cells(n + 3, 23) = Sheets(wallshearsheet).Cells(n + 3, 12)
                End If
                
                With Sheets(wallshearsheet)
                
                '��������Ҫ���顢���������
                .Cells(n + 3, 26).Formula = "=RC[-15]/RC[-1]"
                .Cells(n + 3, 27).Formula = "=RC[-16]/RC[-3]"
                
                '�ֲ���������
                If OUTReader_Main.WallLocation1 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C3:R26C3)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C4:R26C4)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C5:R26C5)"
                ElseIf OUTReader_Main.WallLocation2 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C15:R26C15)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C16:R26C16)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C17:R26C17)"
                End If
                
                '�������������㡢��������Ҫ�����
                If .Cells(n + 3, 10) < 0 Then
                    
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])+0.1*MIN(ABS(RC[-14]*1000),0.2*RC[-6]*RC[-20]*RC[-19]))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                
                Else
                
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])-0.1*ABS(RC[-14]*1000))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                End If
                
                .Cells(n + 3, 25).Formula = "=0.15 *RC[-3]*RC[-7] * RC[-21] * (RC[-20] - RC[-11]) / 1000 / 0.85"
                End With
                
                Sheets(wallshearsheet).Columns("V:V").NumberFormatLocal = "0.00"
                Sheets(wallshearsheet).Columns("W:AA").NumberFormatLocal = "0.00"
                        
                If CheckRegExpfromString(data, "---") = True Then
                    i_wa = i_wa + 1
                    Exit Do
                End If
            Loop
        End If
        
        '��������Ҫ��͹�������鲻����ʱ���ɫ
        With Sheets(wallshearsheet)
            If .Cells(n + 3, 26) >= 1 Then
                .Cells(n + 3, 26).Interior.ColorIndex = 6
                .Cells(n + 3, 2).Interior.ColorIndex = 3
            End If

            If .Cells(n + 3, 27) >= 1 Then
                .Cells(n + 3, 27).Interior.ColorIndex = 6
                .Cells(n + 3, 2).Interior.ColorIndex = 3
            End If
        End With
        
    End If
   
   
Loop

Close #1

End Sub

'==============================================================================================================================================================================

'PKPM��¥���ȡ
Sub PKPM_Wall_Info_M(path1 As String, num As Integer, softname As String, infotype As String)

Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

Dim n As Integer
n = num


'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'���幹����ű���
Dim mem As Integer

Dim flo As Integer


'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC="

'����ǽ��ѹ���йؼ���
Dim Keyword_Wall_UC As String
'��ֵ
Keyword_Wall_UC = "Uc="


'����ǽ�����������йؼ���
Dim Keyword_Wall_V As String
'��ֵ
Keyword_Wall_V = "����������"


'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_Wall As String
'����ǽ��ѹ�ȣ��������
Dim FirstString_Wall_UC As String


'==========================================================================================�����ļ���ȡ·��

flo = Sheets(wallshearsheet).Cells(n + 3, 2)

'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & flo & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename


Sheets(wallshearsheet).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ����С�����ļ�wpj" & flo & ".out; "
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����ǽ
    FirstString_Wall = Mid(data, 2, 5)
    
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
        Debug.Print "��ȡ" & flo & "��ǽ��Ϣ����"
        
        '��ȡǽ���
        mem = Sheets(wallshearsheet).Cells(n + 3, 3)
        
        If extractNumberFromString(data, 1) = mem Then
            'д�����
            Sheets(wallshearsheet).Cells(n + 3, 1) = i_wa + 1

'            д��ֽ�ֱ���ͼ��
'            Sheets(wallshearsheet).Cells(n + 3, 15) = OUTReader_Main.D_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 16) = OUTReader_Main.DJ_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 17) = 2
        
            '��ȡǽ����
            Dim B_w As Long, H_w As Long
            Sheets(wallshearsheet).Cells(n + 3, 4) = extractNumberFromString(data, 4) * 1000
            B_w = Sheets(wallshearsheet).Cells(n + 3, 4)
            Sheets(wallshearsheet).Cells(n + 3, 5) = extractNumberFromString(data, 5) * 1000
            H_w = Sheets(wallshearsheet).Cells(n + 3, 5)
            Sheets(wallshearsheet).Cells(n + 3, 6) = extractNumberFromString(data, 6) * 1000

            Do While Not EOF(1)
                Line Input #1, data
                FirstString_Wall_UC = Mid(data, 20, 3)
                If Mid(data, 2, 2) = "aa" Then
                    Sheets(wallshearsheet).Cells(n + 3, 14) = extractNumberFromString(data, 1)
                    Sheets(wallshearsheet).Cells(n + 3, 13) = extractNumberFromString(data, 3)
                    Sheets(wallshearsheet).Cells(n + 3, 21) = extractNumberFromString(data, 5)
                End If
                If FirstString_Wall_UC = Keyword_Wall_UC Then
                    '��ȡǽ��ѹ��
                    Debug.Print "��ȡ" & mem & "��ǽ��ѹ�ȡ���"
                    Sheets(wallshearsheet).Cells(n + 3, 7) = StringfromStringforReg(data, "\s+0\.\d*", 1)
                End If
           
                If Mid(data, 7, 2) = "M=" And Mid(data, 19, 2) = "V=" Then
                    '��ȡ����������
                    Debug.Print "��ȡ" & mem & "�ż���ȡ���"                   '----------------------------��������
                    Sheets(wallshearsheet).Cells(n + 3, 12) = extractNumberFromString(data, 4)
                    Sheets(wallshearsheet).Cells(n + 3, 12) = Round(Sheets(wallshearsheet).Cells(n + 3, 12), 3)
                End If
           

           
                If Mid(data, 7, 2) = "V=" And Mid(data, 19, 2) = "N=" Then
                    '��ȡˮƽ�ֲ���������
                    Debug.Print "��ȡ" & mem & "��ǽ��������"
                    Sheets(wallshearsheet).Cells(n + 3, 11) = extractNumberFromString(data, 2) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 11) = Round(Abs(Sheets(wallshearsheet).Cells(n + 3, 11)), 0)
                    Sheets(wallshearsheet).Cells(n + 3, 10) = extractNumberFromString(data, 3) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 10) = Round(Sheets(wallshearsheet).Cells(n + 3, 10), 0)
                    If Sheets(wallshearsheet).Cells(n + 3, 10) > 0 Then
                        Sheets(wallshearsheet).Cells(n + 3, 10).Interior.ColorIndex = 3
                        Sheets(wallshearsheet).Cells(n + 3, 2).Interior.ColorIndex = 3
                    End If
                End If
           
                If Mid(data, 2, 5) = Keyword_Wall_V Then
                    '��ȡ����������
                     Debug.Print "��ȡ" & mem & "��ǽ��������������"
                    Sheets(wallshearsheet).Cells(n + 3, 8) = extractNumberFromString(data, 1)
                    Sheets(wallshearsheet).Cells(n + 3, 8) = Round(Sheets(wallshearsheet).Cells(n + 3, 8), 1)
                    Sheets(wallshearsheet).Cells(n + 3, 9) = extractNumberFromString(data, 2)
                    Sheets(wallshearsheet).Cells(n + 3, 9) = Round(Sheets(wallshearsheet).Cells(n + 3, 9), 1)
                End If

                If Sheets(wallshearsheet).Cells(n + 3, 13) = "80" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 35.9
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.22
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 50.2
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.8
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "75" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 33.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.18
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 47.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.83
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "70" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 31.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.14
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 44.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.87
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "65" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 29.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.09
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 41.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.9
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "60" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 27.5
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.04
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 38.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.93
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "55" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 25.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.96
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 35.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.97
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "50" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 23.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.89
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 32.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "45" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 21.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.8
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 29.6
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "40" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 19.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.71
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 26.8
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "35" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 16.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.57
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 23.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "30" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 14.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.43
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 20.1
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                Else
                    MsgBox ("����������ǿ��ֵ��")
                End If
                
                
                If Sheets(wallshearsheet).Cells(n + 3, 12) < 1.5 Then
                   Sheets(wallshearsheet).Cells(n + 3, 23) = 1.5
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 12) > 2.2 Then
                    Sheets(wallshearsheet).Cells(n + 3, 23) = 2.2
                Else
                    Sheets(wallshearsheet).Cells(n + 3, 23) = Sheets(wallshearsheet).Cells(n + 3, 12)
                End If
                
                With Sheets(wallshearsheet)
                
                '��������Ҫ���顢���������
                .Cells(n + 3, 26).Formula = "=RC[-15]/RC[-1]"
                .Cells(n + 3, 27).Formula = "=RC[-16]/RC[-3]"
                
                '�ֲ���������
                If OUTReader_Main.WallLocation1 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C3:R26C3)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C4:R26C4)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C5:R26C5)"
                ElseIf OUTReader_Main.WallLocation2 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C15:R26C15)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C16:R26C16)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C17:R26C17)"
                End If
                
                '�������������㡢��������Ҫ�����
                If .Cells(n + 3, 10) < 0 Then
                    
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])+0.1*MIN(ABS(RC[-14]*1000),0.2*RC[-6]*RC[-20]*RC[-19]))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                
                Else
                
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])-0.1*ABS(RC[-14]*1000))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                End If
                
                .Cells(n + 3, 25).Formula = "=0.15 *RC[-3]*RC[-7] * RC[-21] * (RC[-20] - RC[-11]) / 1000 / 0.85"
                End With
                
                Sheets(wallshearsheet).Columns("V:V").NumberFormatLocal = "0.00"
                Sheets(wallshearsheet).Columns("W:AA").NumberFormatLocal = "0.00"
                        
                If CheckRegExpfromString(data, "---") = True Then
                    i_wa = i_wa + 1
                    Exit Do
                End If
            Loop
        End If
        
        '��������Ҫ��͹�������鲻����ʱ���ɫ
        With Sheets(wallshearsheet)
            If .Cells(n + 3, 26) >= 1 Then
                .Cells(n + 3, 26).Interior.ColorIndex = 6
                .Cells(n + 3, 2).Interior.ColorIndex = 3
            End If

            If .Cells(n + 3, 27) >= 1 Then
                .Cells(n + 3, 27).Interior.ColorIndex = 6
                .Cells(n + 3, 2).Interior.ColorIndex = 3
            End If
        End With
        
    End If
   
   
Loop

Close #1

End Sub


'==============================================================================================================================================================================
Sub YJK_Wall_Info_F(path1 As String, num As Integer, softname As String, infotype As String)

Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

Dim n As Integer
n = num


'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'���幹����ű���
Dim mem As Integer

'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC="

'����ǽ��ѹ���йؼ���
Dim Keyword_Wall_UC As String
'��ֵ
Keyword_Wall_UC = "Uc="


'����ǽ�����������йؼ���
Dim Keyword_Wall_V As String
'��ֵ
Keyword_Wall_V = "����������"


'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_Wall As String
'����ǽ��ѹ�ȣ��������
Dim FirstString_Wall_UC As String


'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "wpj" & CStr(num) & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename


Sheets(wallshearsheet).Select

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
    FirstString_Wall = Mid(data, 3, 5)
    
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
        Debug.Print "��ȡ" & CStr(num) & "��ǽ��Ϣ����"
        
        '��ȡǽ���
        mem = Sheets(wallshearsheet).Cells(n + 3, 3)
'        Debug.Print data
'        Debug.Print StringfromStringforReg(data, "\d+", 1)
        If StringfromStringforReg(data, "\d+", 1) = mem Then
            Debug.Print "д�����"
            'д�����
            Sheets(wallshearsheet).Cells(n + 3, 1) = i_wa + 1
            'д��¥���
            Sheets(wallshearsheet).Cells(n + 3, 2) = n
'            д��ֽ�ֱ���ͼ��
'            Sheets(wallshearsheet).Cells(n + 3, 15) = OUTReader_Main.D_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 16) = OUTReader_Main.DJ_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 17) = 2
        
            '��ȡǽ����
            Dim B_w As Long, H_w As Long
            Sheets(wallshearsheet).Cells(n + 3, 4) = StringfromStringforReg(data, "\d+\.?\d*", 4) * 1000
            B_w = Sheets(wallshearsheet).Cells(n + 3, 4)
            Sheets(wallshearsheet).Cells(n + 3, 5) = StringfromStringforReg(data, "\d+\.?\d*", 5) * 1000
            H_w = Sheets(wallshearsheet).Cells(n + 3, 5)
            Sheets(wallshearsheet).Cells(n + 3, 6) = StringfromStringforReg(data, "\d+\.?\d*", 6) * 1000

            Do While Not EOF(1)
                Line Input #1, data
                If Mid(data, 3, 5) = "Cover" Then
                    Sheets(wallshearsheet).Cells(n + 3, 14) = StringfromStringforReg(data, "\d+\.?\d*", 2)
                    Sheets(wallshearsheet).Cells(n + 3, 13) = StringfromStringforReg(data, "\d+\.?\d*", 5)
                    Sheets(wallshearsheet).Cells(n + 3, 21) = StringfromStringforReg(data, "\d+\.?\d*", 7)
                End If
                FirstString_Wall_UC = Mid(data, 22, 3)
                If FirstString_Wall_UC = Keyword_Wall_UC Then
                    '��ȡǽ��ѹ��
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��ѹ�ȡ���"
                    Sheets(wallshearsheet).Cells(n + 3, 7) = StringfromStringforReg(data, "0\.\d*", 1)
                End If
           
                If Mid(data, 8, 2) = "M=" And Mid(data, 21, 2) = "V=" Then
                    '��ȡ����������
                    Debug.Print "��ȡ" & CStr(num) & "�����ȡ���"                   '----------------------------��������
                    Sheets(wallshearsheet).Cells(n + 3, 12) = extractNumberFromString(data, 4)
                    Sheets(wallshearsheet).Cells(n + 3, 12) = Round(Sheets(wallshearsheet).Cells(n + 3, 12), 3)
                End If
           
           
                If Mid(data, 8, 2) = "V=" And Mid(data, 21, 2) = "N=" Then
                    '��ȡˮƽ�ֲ���������
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��������"
                    Sheets(wallshearsheet).Cells(n + 3, 11) = extractNumberFromString(data, 2) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 11) = Round(Abs(Sheets(wallshearsheet).Cells(n + 3, 11)), 0)
                    Sheets(wallshearsheet).Cells(n + 3, 10) = extractNumberFromString(data, 3) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 10) = Round(Sheets(wallshearsheet).Cells(n + 3, 10), 0)
                    If Sheets(wallshearsheet).Cells(n + 3, 10) > 0 Then
                        Sheets(wallshearsheet).Cells(n + 3, 10).Interior.ColorIndex = 3
                        Sheets(wallshearsheet).Cells(n + 3, 2).Interior.ColorIndex = 3
                    End If
                End If
                
                '��鳬����
                If Mid(data, 3, 2) = "**" Then
                
                    Sheets(wallshearsheet).Cells(n + 3, 28 + j) = data
                    If Sheets(wallshearsheet).Cells(n + 3, 28 + j) <> 0 Then
                        Sheets(wallshearsheet).Cells(n + 3, 28 + j).Interior.ColorIndex = 3
                        Sheets(wallshearsheet).Cells(n + 3, 2).Interior.ColorIndex = 3
                        Else
                            Sheets(wallshearsheet).Cells(n + 3, 28 + j) = "��"
                    End If
                    '��鳬���ѭ����ȡ���������
                    j = 1
                    Do While Not EOF(1)
                        Line Input #1, data
                        If Mid(data, 3, 2) = "**" Then
                            Sheets(wallshearsheet).Cells(n + 3, 28 + j) = data
                            If Sheets(wallshearsheet).Cells(n + 3, 28 + j) <> 0 Then
                                Sheets(wallshearsheet).Cells(n + 3, 28 + j).Interior.ColorIndex = 3
                                Sheets(wallshearsheet).Cells(n + 3, 2).Interior.ColorIndex = 3
                                Else
                                Sheets(wallshearsheet).Cells(n + 3, 28 + j) = "��"
                            End If
                            j = j + 1
                        End If
                        
                    '��ȡ�������������г�����ʱ����Ϊ�˳�ѭ�����ж�����
                        If Mid(data, 3, 5) = Keyword_Wall_V Then
                            Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                            Sheets(wallshearsheet).Cells(n + 3, 8) = extractNumberFromString(data, 1)
                            Sheets(wallshearsheet).Cells(n + 3, 8) = Round(Sheets(wallshearsheet).Cells(n + 3, 8), 1)
                            Sheets(wallshearsheet).Cells(n + 3, 9) = extractNumberFromString(data, 2)
                            Sheets(wallshearsheet).Cells(n + 3, 9) = Round(Sheets(wallshearsheet).Cells(n + 3, 9), 1)
                            Exit Do
                        End If
                    Loop
                    
                End If
                  
                '��ȡ����������
                If Mid(data, 3, 5) = Keyword_Wall_V Then
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                    Sheets(wallshearsheet).Cells(n + 3, 8) = extractNumberFromString(data, 1)
                    Sheets(wallshearsheet).Cells(n + 3, 8) = Round(Sheets(wallshearsheet).Cells(n + 3, 8), 1)
                    Sheets(wallshearsheet).Cells(n + 3, 9) = extractNumberFromString(data, 2)
                    Sheets(wallshearsheet).Cells(n + 3, 9) = Round(Sheets(wallshearsheet).Cells(n + 3, 9), 1)
                        
                End If

                If Sheets(wallshearsheet).Cells(n + 3, 13) = "80" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 35.9
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.22
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 50.2
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.8
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "75" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 33.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.18
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 47.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.83
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "70" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 31.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.14
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 44.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.87
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "65" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 29.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.09
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 41.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.9
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "60" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 27.5
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.04
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 38.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.93
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "55" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 25.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.96
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 35.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.97
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "50" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 23.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.89
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 32.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "45" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 21.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.8
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 29.6
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "40" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 19.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.71
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 26.8
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "35" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 16.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.57
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 23.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "30" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 14.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.43
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 20.1
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                Else
                    MsgBox ("����������ǿ��ֵ��")
                End If
                
                
                If Sheets(wallshearsheet).Cells(n + 3, 12) < 1.5 Then
                   Sheets(wallshearsheet).Cells(n + 3, 23) = 1.5
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 12) > 2.2 Then
                    Sheets(wallshearsheet).Cells(n + 3, 23) = 2.2
                Else
                    Sheets(wallshearsheet).Cells(n + 3, 23) = Sheets(wallshearsheet).Cells(n + 3, 12)
                End If
                
                With Sheets(wallshearsheet)
                
                '��������Ҫ���顢���������
                .Cells(n + 3, 26).Formula = "=RC[-15]/RC[-1]"
                .Cells(n + 3, 27).Formula = "=RC[-16]/RC[-3]"
                
                '�ֲ���������
                If OUTReader_Main.WallLocation1 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C3:R26C3)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C4:R26C4)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C5:R26C5)"
                ElseIf OUTReader_Main.WallLocation2 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C15:R26C15)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C16:R26C16)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C17:R26C17)"
                End If
                
                '�������������㡢��������Ҫ�����
                If .Cells(n + 3, 10) < 0 Then
                    
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])+0.1*MIN(ABS(RC[-14]*1000),0.2*RC[-6]*RC[-20]*RC[-19]))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                
                Else
                
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])-0.1*ABS(RC[-14]*1000))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                End If
                
                .Cells(n + 3, 25).Formula = "=0.15 *RC[-3]*RC[-7] * RC[-21] * (RC[-20] - RC[-11]) / 1000 / 0.85"
                End With
                
                Sheets(wallshearsheet).Columns("V:V").NumberFormatLocal = "0.00"
                Sheets(wallshearsheet).Columns("W:AA").NumberFormatLocal = "0.00"
                        
                If CheckRegExpfromString(data, "---") = True Then
                    i_wa = i_wa + 1
                    Exit Do
                End If
            Loop
        End If
        
        '��������Ҫ��͹�������鲻����ʱ���ɫ
        With Sheets(wallshearsheet)
            If .Cells(n + 3, 26) >= 1 Then
                .Cells(n + 3, 26).Interior.ColorIndex = 6
                .Cells(n + 3, 2).Interior.ColorIndex = 3
            End If

            If .Cells(n + 3, 27) >= 1 Then
                .Cells(n + 3, 27).Interior.ColorIndex = 6
                .Cells(n + 3, 2).Interior.ColorIndex = 3
            End If
        End With
        
    End If
   
   
Loop

Close #1

End Sub


'==============================================================================================================================================================================
Sub YJK_Wall_Info_M(path1 As String, num As Integer, softname As String, infotype As String)

Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

Dim n As Integer
n = num

'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'����¥�����
Dim flo As Integer

'���幹����ű���
Dim mem As Integer

'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC="

'����ǽ��ѹ���йؼ���
Dim Keyword_Wall_UC As String
'��ֵ
Keyword_Wall_UC = "Uc="


'����ǽ�����������йؼ���
Dim Keyword_Wall_V As String
'��ֵ
Keyword_Wall_V = "����������"


'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_Wall As String
'����ǽ��ѹ�ȣ��������
Dim FirstString_Wall_UC As String


'==========================================================================================�����ļ���ȡ·��

flo = Sheets(wallshearsheet).Cells(n + 3, 2)

'ָ���ļ���Ϊwpj_Num.out
Filename = "wpj" & flo & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename


Sheets(wallshearsheet).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ����С�����ļ�wpj" & flo & ".out; "
Debug.Print "��ȡ���ָ��"
Debug.Print "����"

'��ȡǽ���
mem = Sheets(wallshearsheet).Cells(n + 3, 3)

If mem <> 0 Then


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����ǽ
    FirstString_Wall = Mid(data, 3, 5)
    
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
        Debug.Print "��ȡ" & flo & "��ǽ��Ϣ����"
        
'        Debug.Print data
'        Debug.Print StringfromStringforReg(data, "\d+", 1)

        If StringfromStringforReg(data, "\d+", 1) = mem Then
            Debug.Print "д�����"
            'д�����
            Sheets(wallshearsheet).Cells(n + 3, 1) = i_wa + 1
'            д��ֽ�ֱ���ͼ��
'            Sheets(wallshearsheet).Cells(n + 3, 15) = OUTReader_Main.D_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 16) = OUTReader_Main.DJ_TextBox.Text
'            Sheets(wallshearsheet).Cells(n + 3, 17) = 2
        
            '��ȡǽ����
            Dim B_w As Long, H_w As Long
            Sheets(wallshearsheet).Cells(n + 3, 4) = StringfromStringforReg(data, "\d+\.?\d*", 4) * 1000
            B_w = Sheets(wallshearsheet).Cells(n + 3, 4)
            Sheets(wallshearsheet).Cells(n + 3, 5) = StringfromStringforReg(data, "\d+\.?\d*", 5) * 1000
            H_w = Sheets(wallshearsheet).Cells(n + 3, 5)
            Sheets(wallshearsheet).Cells(n + 3, 6) = StringfromStringforReg(data, "\d+\.?\d*", 6) * 1000

            Do While Not EOF(1)
                Line Input #1, data
                If Mid(data, 3, 5) = "Cover" Then
                    Sheets(wallshearsheet).Cells(n + 3, 14) = StringfromStringforReg(data, "\d+\.?\d*", 2)
                    Sheets(wallshearsheet).Cells(n + 3, 13) = StringfromStringforReg(data, "\d+\.?\d*", 5)
                    Sheets(wallshearsheet).Cells(n + 3, 21) = StringfromStringforReg(data, "\d+\.?\d*", 7)
                End If
                FirstString_Wall_UC = Mid(data, 22, 3)
                If FirstString_Wall_UC = Keyword_Wall_UC Then
                    '��ȡǽ��ѹ��
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��ѹ�ȡ���"
                    Sheets(wallshearsheet).Cells(n + 3, 7) = StringfromStringforReg(data, "0\.\d*", 1)
                End If
           
                If Mid(data, 8, 2) = "M=" And Mid(data, 21, 2) = "V=" Then
                    '��ȡ����������
                    Debug.Print "��ȡ" & CStr(num) & "�ż���ȡ���"                   '----------------------------��������
                    Sheets(wallshearsheet).Cells(n + 3, 12) = extractNumberFromString(data, 4)
                    Sheets(wallshearsheet).Cells(n + 3, 12) = Round(Sheets(wallshearsheet).Cells(n + 3, 12), 3)
                End If
           
           
                If Mid(data, 8, 2) = "V=" And Mid(data, 21, 2) = "N=" Then
                    '��ȡˮƽ�ֲ���������
                    Debug.Print "��ȡ" & CStr(num) & "��ǽ��������"
                    Sheets(wallshearsheet).Cells(n + 3, 11) = extractNumberFromString(data, 2) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 11) = Round(Abs(Sheets(wallshearsheet).Cells(n + 3, 11)), 0)
                    Sheets(wallshearsheet).Cells(n + 3, 10) = extractNumberFromString(data, 3) '----------------------------�������
                    Sheets(wallshearsheet).Cells(n + 3, 10) = Round(Sheets(wallshearsheet).Cells(n + 3, 10), 0)
                    If Sheets(wallshearsheet).Cells(n + 3, 10) > 0 Then
                        Sheets(wallshearsheet).Cells(n + 3, 10).Interior.ColorIndex = 3
                        Sheets(wallshearsheet).Cells(n + 3, 3).Interior.ColorIndex = 3
                    End If
                End If
           

                If Mid(data, 3, 2) = "**" Then
                
                    Sheets(wallshearsheet).Cells(n + 3, 28 + j) = data
                    If Sheets(wallshearsheet).Cells(n + 3, 28 + j) <> 0 Then
                        Sheets(wallshearsheet).Cells(n + 3, 28 + j).Interior.ColorIndex = 3
                        Sheets(wallshearsheet).Cells(n + 3, 3).Interior.ColorIndex = 3
                        Else
                            Sheets(wallshearsheet).Cells(n + 3, 28 + j) = "��"
                    End If
                    '��鳬���ѭ����ȡ���������
                    j = 1
                    Do While Not EOF(1)
                        Line Input #1, data
                        If Mid(data, 3, 2) = "**" Then
                            Sheets(wallshearsheet).Cells(n + 3, 28 + j) = data
                            If Sheets(wallshearsheet).Cells(n + 3, 28 + j) <> 0 Then
                                Sheets(wallshearsheet).Cells(n + 3, 28 + j).Interior.ColorIndex = 3
                                Sheets(wallshearsheet).Cells(n + 3, 3).Interior.ColorIndex = 3
                                Else
                                Sheets(wallshearsheet).Cells(n + 3, 28 + j) = "��"
                            End If
                            j = j + 1
                        End If
                        
                    '��ȡ����������
                        If Mid(data, 3, 5) = Keyword_Wall_V Then
                            Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                            Sheets(wallshearsheet).Cells(n + 3, 8) = extractNumberFromString(data, 1)
                            Sheets(wallshearsheet).Cells(n + 3, 8) = Round(Sheets(wallshearsheet).Cells(n + 3, 8), 1)
                            Sheets(wallshearsheet).Cells(n + 3, 9) = extractNumberFromString(data, 2)
                            Sheets(wallshearsheet).Cells(n + 3, 9) = Round(Sheets(wallshearsheet).Cells(n + 3, 9), 1)
                            Exit Do
                        End If
                    Loop
                    
                End If
                  
                '��ȡ����������
                    If Mid(data, 3, 5) = Keyword_Wall_V Then
                        Debug.Print "��ȡ" & CStr(num) & "��ǽ��������������"
                        Sheets(wallshearsheet).Cells(n + 3, 8) = extractNumberFromString(data, 1)
                        Sheets(wallshearsheet).Cells(n + 3, 8) = Round(Sheets(wallshearsheet).Cells(n + 3, 8), 1)
                        Sheets(wallshearsheet).Cells(n + 3, 9) = extractNumberFromString(data, 2)
                        Sheets(wallshearsheet).Cells(n + 3, 9) = Round(Sheets(wallshearsheet).Cells(n + 3, 9), 1)
                        
                    End If
                    
                If Sheets(wallshearsheet).Cells(n + 3, 13) = "80" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 35.9
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.22
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 50.2
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.8
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "75" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 33.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.18
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 47.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.83
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "70" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 31.8
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.14
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 44.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.87
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "65" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 29.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.09
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 41.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.9
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "60" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 27.5
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 2.04
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 38.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.93
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "55" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 25.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.96
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 35.5
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 0.97
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "50" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 23.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.89
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 32.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "45" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 21.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.8
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 29.6
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "40" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 19.1
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.71
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 26.8
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "35" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 16.7
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.57
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 23.4
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 13) = "30" Then
                   Sheets(wallshearsheet).Cells(n + 3, 18) = 14.3
                   Sheets(wallshearsheet).Cells(n + 3, 19) = 1.43
                   Sheets(wallshearsheet).Cells(n + 3, 20) = 20.1
                   Sheets(wallshearsheet).Cells(n + 3, 22) = 1#
                Else
                    MsgBox ("����������ǿ��ֵ��")
                End If
                
                
                If Sheets(wallshearsheet).Cells(n + 3, 12) < 1.5 Then
                   Sheets(wallshearsheet).Cells(n + 3, 23) = 1.5
                ElseIf Sheets(wallshearsheet).Cells(n + 3, 12) > 2.2 Then
                    Sheets(wallshearsheet).Cells(n + 3, 23) = 2.2
                Else
                    Sheets(wallshearsheet).Cells(n + 3, 23) = Sheets(wallshearsheet).Cells(n + 3, 12)
                End If
                
                With Sheets(wallshearsheet)
                
                '��������Ҫ���顢���������
                .Cells(n + 3, 26).Formula = "=RC[-15]/RC[-1]"
                .Cells(n + 3, 27).Formula = "=RC[-16]/RC[-3]"
                
                '�ֲ���������
                '�ֲ���������
                If OUTReader_Main.WallLocation1 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C3:R26C3)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C4:R26C4)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C2:R26C2,wallrebar!R4C5:R26C5)"
                ElseIf OUTReader_Main.WallLocation2 Then
                    .Cells(n + 3, 15).Formula = "=LOOKUP(ROUNDUP(RC[-11]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C15:R26C15)"
                    .Cells(n + 3, 16).Formula = "=LOOKUP(ROUNDUP(RC[-12]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C16:R26C16)"
                    .Cells(n + 3, 17).Formula = "=LOOKUP(ROUNDUP(RC[-13]/50,0)*50,wallrebar!R4C14:R26C14,wallrebar!R4C17:R26C17)"
                End If
                
                '�������������㡢��������Ҫ�����
                If .Cells(n + 3, 10) < 0 Then
                    
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])+0.1*MIN(ABS(RC[-14]*1000),0.2*RC[-6]*RC[-20]*RC[-19]))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                
                Else
                
                .Cells(n + 3, 24).Formula = "=1/0.85*(1/(RC[-1]-0.5)*(0.4*RC[-5]*RC[-20]*(RC[-19]-RC[-10])-0.1*ABS(RC[-14]*1000))+RC[-7]*0.8*RC[-3]*0.7854*RC[-9]^2/RC[-8]*(RC[-19]-RC[-10]))/1000"
                
                End If
                
                .Cells(n + 3, 25).Formula = "=0.15 *RC[-3]*RC[-7] * RC[-21] * (RC[-20] - RC[-11]) / 1000 / 0.85"
                End With
                
                                Sheets(wallshearsheet).Columns("V:V").NumberFormatLocal = "0.00"
                Sheets(wallshearsheet).Columns("V:V").NumberFormatLocal = "0.00"
                Sheets(wallshearsheet).Columns("W:AA").NumberFormatLocal = "0.00"
                        
                If CheckRegExpfromString(data, "---") = True Then
                    i_wa = i_wa + 1
                    Exit Do
                End If
            Loop
        End If
        
        '��������Ҫ��͹�������鲻����ʱ���ɫ
        With Sheets(wallshearsheet)
            If .Cells(n + 3, 26) >= 1 Then
                .Cells(n + 3, 26).Interior.ColorIndex = 6
                .Cells(n + 3, 3).Interior.ColorIndex = 3
            End If

            If .Cells(n + 3, 27) >= 1 Then
                .Cells(n + 3, 27).Interior.ColorIndex = 6
                .Cells(n + 3, 3).Interior.ColorIndex = 3
            End If
        End With
        
    End If
   
   
Loop


End If

Close #1

End Sub



Function allmem_Y(path1 As String, num_floor As Integer) As Integer


allmem_Y = 0

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i As Integer
'ָ���ļ���Ϊwpj_Num.out
Filename = "wpj" & num_floor & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wpj" & num_floor & ".out; "
Debug.Print "����"

Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
'    Debug.Print data
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If Mid(data, 3, 5) = "N-WC=" Then
'        Debug.Print "test"
        allmem_Y = allmem_Y + 1
    End If

Loop

Close #1
    
End Function

Function allmem_P(path1 As String, num_floor As Integer) As Integer


allmem_P = 0

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i As Integer
'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & num_floor & ".OUT"

'���������ļ�·��
filepath1 = path1 & "\" & Filename

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wpj" & num_floor & ".out; "
Debug.Print "����"

Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
'    Debug.Print data
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If Mid(data, 2, 5) = "N-WC=" Then
'        Debug.Print "test"
        allmem_P = allmem_P + 1
    End If

Loop

Close #1
    
End Function



Sub wallrebar()

Dim i As Integer

Dim shname As String
shname = "wallrebar_test"

Call Addsh(shname)

'�����������������
Sheets(shname).Cells.Clear


'�ӱ����
Call AddFormLine(shname, "B2:J26")

'�ӱ���ɫ
Call AddShadow(shname, "B2:J3", 10092441)

With Sheets(shname)
   
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    '.range("F4:Q20000").NumberFormatLocal = "0.00"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
   
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 5) = "����ǽ�ֲ�������"
    .Cells(1, 5).Font.name = "����"
    .Cells(1, 5).Font.Size = "11"
    '�ϲ���Ԫ��
    .range("E1:G1").MergeCells = True
   
    '-------------------------------------------------������
    '��Ŀ��Ϣ
    .Cells(2, 2) = "ǽ��"
    .Cells(2, 3) = "ˮƽ�ֲ���"
    .Cells(2, 6) = "�����"
    .Cells(2, 7) = "����ֲ���"
    .Cells(2, 10) = "�����"
    
    .Cells(3, 3) = "ֱ��"
    .Cells(3, 4) = "���"
    .Cells(3, 5) = "����"

    .Cells(3, 7) = "ֱ��"
    .Cells(3, 8) = "���"
    .Cells(3, 9) = "����"
    
    '�ϲ���Ԫ��
    .range("B2:B3").MergeCells = True
    .range("F2:F3").MergeCells = True
    .range("J2:J3").MergeCells = True

    .range("C2:E2").MergeCells = True
    .range("G2:I2").MergeCells = True
    
    
    '����
    For i = 1 To 23
        .Cells(i + 3, 2) = 200 + (i - 1) * 50
    Next
    
End With

End Sub
