Attribute VB_Name = "ģ��_��ȡǽ���������������"
Option Explicit


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/20
'1.����PKPMǽ��������ȡ


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/23
'1.������Ϲ���������������𹤿��Ķ�ȡ�����


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/14
'1.�鿴��Ϲ��������£���������ֵ����




'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'
'                            YJK
'
'
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%һ��������ǽ����׼������ȡ
Sub WallData_Y(Path, wallsh, flonum)

Dim wallsheet As String
wallsheet = wallsh


Dim n As Integer
n = 1

Dim flo As Integer
flo = flonum


Call Addsh(wallsheet)

'�����������������
Sheets(wallsheet).Cells.Clear


''�ӱ����
'Call AddFormLine(wallsheet, "A2:H20000")

With Sheets(wallsheet)
   
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
    .Cells(1, 3) = "ǽ������"
    .Cells(1, 13).Font.name = "����"
    .Cells(1, 3).Font.Size = "20"
    .Cells(1, 6) = flo & "F"
    '�ϲ���Ԫ��
    .range("C1:E1").MergeCells = True
    
End With

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim path1 As String, Filename As String, filepath1 As String, inputstring As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'���幹����ű���
Dim mem As Integer

Dim FirstString_Wall As String


'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC ="



'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "wwnl" & flo & ".out"

'���������ļ�·��
filepath1 = Path & "\" & Filename


Sheets(wallsheet).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wwnl.OUT"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
  
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    'ǽ
     FirstString_Wall = Mid(data, 2, 6)
   
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
       
        If StringfromStringforReg(data, "\d+\.?\d*", 1) = n Then
               
    '        Debug.Print FirstString_Wall, data
           
              '-------------------------------------------------������
            With Sheets(wallsheet)
            '��Ŀ��Ϣ
                .Cells(2 + (n - 1) * 17, 1) = "N-WC"
                .Cells(2 + (n - 1) * 17, 2) = "B"
                .Cells(2 + (n - 1) * 17, 3) = "H"
                .Cells(2 + (n - 1) * 17, 4) = "Lwc"
                .Cells(2 + (n - 1) * 17, 5) = "aa"
                .Cells(2 + (n - 1) * 17, 6) = "Angle"
                .Cells(2 + (n - 1) * 17, 7) = "Uc"
                
                .Cells(4 + (n - 1) * 17, 1) = "(iCase)"
                .Cells(4 + (n - 1) * 17, 2) = "Shear-X"
                .Cells(4 + (n - 1) * 17, 3) = "Shear-Y"
                .Cells(4 + (n - 1) * 17, 4) = "Axial"
                .Cells(4 + (n - 1) * 17, 5) = "Mx-Btm"
                .Cells(4 + (n - 1) * 17, 6) = "My-Btm"
                .Cells(4 + (n - 1) * 17, 7) = "Mx-Top"
                .Cells(4 + (n - 1) * 17, 8) = "My-Top"

            End With
            
            '�ӱ���ɫ
            Call AddShadow(wallsheet, "A" & 2 + (n - 1) * 17 & ":G" & 2 + (n - 1) * 17, 10092441)
            Call AddShadow(wallsheet, "A" & 4 + (n - 1) * 17 & ":H" & 4 + (n - 1) * 17, 10092441)
           
            'д����
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 1) = StringfromStringforReg(data, "\d+\.?\d*", 1)
            '��ȡ�Ƕ�
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 6) = StringfromStringforReg(data, "\d+\.?\d*", 5)
   
            Do While Not EOF(1)
           
                Line Input #1, data
               
                If Mid(data, 2, 9) = "*(    EX)" Then
                    Sheets(wallsheet).Cells(5 + (n - 1) * 17, 1) = "EX"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(5 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next
                
                End If
               
                If Mid(data, 2, 9) = "*(   EX+)" Then
                    Sheets(wallsheet).Cells(6 + (n - 1) * 17, 1) = "EX+"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(6 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
               
                If Mid(data, 2, 9) = "*(   EX-)" Then
                    Sheets(wallsheet).Cells(7 + (n - 1) * 17, 1) = "EX-"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(7 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(    EY)" Then
                    Sheets(wallsheet).Cells(8 + (n - 1) * 17, 1) = "EY"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(8 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(   EY+)" Then
                    Sheets(wallsheet).Cells(9 + (n - 1) * 17, 1) = "EY+"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(9 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(   EY-)" Then
                    Sheets(wallsheet).Cells(10 + (n - 1) * 17, 1) = "EY-"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(10 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(   +WX)" Then
                    Sheets(wallsheet).Cells(11 + (n - 1) * 17, 1) = "WX+"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(11 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(   -WX)" Then
                    Sheets(wallsheet).Cells(12 + (n - 1) * 17, 1) = "WX-"
                    For j = 2 To 8
                    Sheets(wallsheet).Cells(12 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(   +WY)" Then
                    Sheets(wallsheet).Cells(13 + (n - 1) * 17, 1) = "WY+"
                    For j = 2 To 8
                    Sheets(wallsheet).Cells(13 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(   -WY)" Then
                    Sheets(wallsheet).Cells(14 + (n - 1) * 17, 1) = "WY-"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(14 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)

                    Next
                End If
                           
                If Mid(data, 2, 9) = "*(    DL)" Then
                    Sheets(wallsheet).Cells(15 + (n - 1) * 17, 1) = "DL"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(15 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                           
                If Mid(data, 2, 9) = "*(    LL)" Then
                    Sheets(wallsheet).Cells(16 + (n - 1) * 17, 1) = "LL"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(16 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                   
                If Mid(data, 2, 9) = "*(    EV)" Then
                    Sheets(wallsheet).Cells(17 + (n - 1) * 17, 1) = "EV"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(17 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
                    Next

                End If
                   
                If CheckRegExpfromString(data, "---") = True Then
                    Exit Do
                End If
                   
                Loop
               
                 n = n + 1
            End If
        End If

Loop

Close #1

'==========================================================================================��ȡ�����ߴ����Ϣ

'��ֵ
Keyword_Wall = "N-WC="

'����ǽ��ѹ���йؼ���
Dim Keyword_Wall_UC As String

'��ֵ
Keyword_Wall_UC = "Uc="

'����ǽ��ѹ��
Dim FirstString_Wall_UC As String

'��Ź���
n = 1

'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & flo & ".OUT"

'���������ļ�·��
filepath1 = Path & "\" & Filename

i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ����С�����ļ�wpj" & flo; ".out; "
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
'        Debug.Print "��ȡ" & flo & "��ǽ��Ϣ����"
        
        If StringfromStringforReg(data, "\d+", 1) = Sheets(wallsheet).Cells(3 + (n - 1) * 17, 1) Then

            '��ȡǽ����
            Dim B_w As Long, H_w As Long
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 2) = StringfromStringforReg(data, "\d+\.?\d*", 4) * 1000
            B_w = Sheets(wallsheet).Cells(3 + (n - 1) * 17, 2)
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 3) = StringfromStringforReg(data, "\d+\.?\d*", 5) * 1000
            H_w = Sheets(wallsheet).Cells(3 + (n - 1) * 17, 3)
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 4) = StringfromStringforReg(data, "\d+\.?\d*", 6) * 1000

            Do While Not EOF(1)
                Line Input #1, data
                FirstString_Wall_UC = Mid(data, 22, 3)
                If Mid(data, 3, 5) = "Cover" Then
                    Sheets(wallsheet).Cells(3 + (n - 1) * 17, 5) = StringfromStringforReg(data, "\d+", 2)
                End If
                If FirstString_Wall_UC = Keyword_Wall_UC Then
                    '��ȡǽ��ѹ��
'                    Debug.Print "��ȡ" & flo & "��ǽ��ѹ�ȡ���"
                    Sheets(wallsheet).Cells(3 + (n - 1) * 17, 7) = StringfromStringforReg(data, "0\.\d*", 1)
                End If
                If CheckRegExpfromString(data, "---") = True Then
                    Exit Do
                End If
            Loop
            
            n = n + 1
            
        End If
        
    End If

Loop

    
Close #1

Call AddFormLine(wallsheet, "A2:H" & Sheets(wallsheet).range("A65535").End(xlUp).Row)

End Sub

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ϲ�����ȡ
Sub LOADCOMB_WC_Y(Path)

Dim lcombsh As String
lcombsh = "LCOMB_Y"

Call Addsh(lcombsh)

'�����������������
Sheets(lcombsh).Cells.Clear


''�ӱ����
'Call AddFormLine(lcombsh, "A2:M20000")

'�ӱ���ɫ
Call AddShadow(lcombsh, "A2:M2", 10092441)

With Sheets(lcombsh)
   
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
    .Cells(1, 6) = "�������"
    .Cells(1, 6).Font.name = "����"
    .Cells(1, 6).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("F1:H1").MergeCells = True
    
End With

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i As Integer, j As Integer

Dim n As Integer
n = 1

'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC="

'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_WC As String

'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "wpj1.OUT"

'���������ļ�·��
filepath1 = Path & "\" & Filename

Sheets(lcombsh).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '--------------------------------------------------------------------------��ȡ��Ϲ�������Ϣ
    If Mid(data, 6, 5) = "Ncm  " Then
    
        Debug.Print data
        
        For i = 1 To 13
            Sheets(lcombsh).Cells(2, i) = "(" & StringfromStringforReg(data, "\S+", i) & ")"
        Next
        
        Do While Not EOF(1)
            Line Input #1, inputstring '���ı��ļ�һ��
            data = inputstring
                
            If CheckRegExpfromString(data, "\*\*\*\*\*") = True Then
                Exit Do
            End If
            
'            If CheckRegExpfromString(data, "\d+") = True Then
            Debug.Print data
            If StringfromStringforReg(data, "\d+", 1) = n Then
                Debug.Print data
                '��ȡ
                For i = 1 To 13
                    Sheets(lcombsh).Cells(n + 2, i) = StringfromStringforReg(data, "\S+", i)
                Next
                
                For i = 1 To 13
                    If Sheets(lcombsh).Cells(n + 2, i) = "--" Then Sheets(lcombsh).Cells(n + 2, i) = 0
                Next
                
            End If
               
            n = n + 1
'            End If
        Loop
    End If
Loop

Close #1

'�ӱ����
Call AddFormLine(lcombsh, "A2:M" & Sheets(lcombsh).range("A65535").End(xlUp).Row)

End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����������������Ϲ�����ȡ����

Sub SingleWallData_Y(Path As String, sheetname As String, flonum As Integer, mem As Integer)


Dim wcsheet As String
wcsheet = sheetname


Dim n As Integer
n = 1

Dim i As Integer
Dim j As Integer

Dim flo As Integer
flo = flonum


Call Addsh(wcsheet)

'�����������������
Sheets(wcsheet).Cells.Clear


'�ӱ����
'Call AddFormLine(wcsheet, "A2:H20000")
Call AddFormLine(wcsheet, "J4:P21")

'������������
Sheets(wcsheet).Select
range("b5").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True

With Sheets(wcsheet)
   
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
    .Columns("J:J").ColumnWidth = 18.13
   
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 3) = "ǽ��У��"
    .Cells(1, 13).Font.name = "����"
    .Cells(1, 3).Font.Size = "20"
    .Cells(1, 6) = flo & "F"
    '�ϲ���Ԫ��
    .range("C1:E1").MergeCells = True
    

    '��Ŀ��Ϣ
    .Cells(2, 1) = "N-WC"
    .Cells(2, 2) = "B"
    .Cells(2, 3) = "H"
    .Cells(2, 4) = "Lwc"
    .Cells(2, 5) = "aa"
    .Cells(2, 6) = "Angle"
    .Cells(2, 7) = "Uc"
    
    .Cells(4, 1) = "(iCase)"
    .Cells(4, 2) = "Shear-X"
    .Cells(4, 3) = "Shear-Y"
    .Cells(4, 4) = "Axial"
    .Cells(4, 5) = "Mx-Btm"
    .Cells(4, 6) = "My-Btm"
    .Cells(4, 7) = "Mx-Top"
    .Cells(4, 8) = "My-Top"
    
    .Cells(18, 1) = "(Ncm)"
    .Cells(18, 2) = "Shear-X"
    .Cells(18, 3) = "Shear-Y"
    .Cells(18, 4) = "Axial"
    .Cells(18, 5) = "Mx-Btm"
    .Cells(18, 6) = "My-Btm"
    .Cells(18, 7) = "Mx-Top"
    .Cells(18, 8) = "My-Top"
    
    .Cells(4, 10) = "LoadComb"
    .Cells(4, 11) = "Ncm"
    .Cells(4, 12) = "Shear-X"
    .Cells(4, 13) = "Shear-Y"
    .Cells(4, 14) = "Axial"
    .Cells(4, 15) = "Mx-Btm"
    .Cells(4, 16) = "My-Btm"
    
    '�ӱ���ɫ
    Call AddShadow(wcsheet, "A2:G2", 10092441)
    Call AddShadow(wcsheet, "A4:H4", 10092441)
    Call AddShadow(wcsheet, "A18:H18", 10092441)
    Call AddShadow(wcsheet, "J4:P4", 10092441)
    Call AddShadow(wcsheet, "J4:J21", 10092441)
    
End With

Dim m As Integer

'��ȡ��Ϲ����ĸ���
m = Sheets("LCOMB_Y").range("A65535").End(xlUp).Row - 2


Dim sh As Worksheet
'��Ѱ���еĹ����������
Dim condition

condition = "no"

For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = "Y_WCD_F" & flo Then
        condition = "yes"
    End If
Next

If condition = "no" Then
    MsgBox ("ȱ�ٱ��Y_WCD_F" & flo)
    
    Exit Sub

End If


With Sheets(wcsheet)

    .Cells(3, 1) = mem
    
    '�����ߴ硢��ѹ�ȵ�
    For i = 2 To 7
        .Cells(3, i).FormulaR1C1 = "=INDEX(Y_WCD_F" & flo & "!C,3+(R3C1-1)*17)"
    Next
    
    '������׼����
    For i = 4 To 17
        For j = 1 To 8
            .Cells(i, j).FormulaR1C1 = "=INDEX(Y_WCD_F" & flo & "!C," & i & "+(R3C1-1)*17)"
        Next
    Next
    
    '�������
    For i = 19 To m + 18
        For j = 2 To 8
            .Cells(i, j).FormulaR1C1 = "=R15C*LCOMB_Y!R[-16]C2+R16C*LCOMB_Y!R[-16]C3+R11C*LCOMB_Y!R[-16]C4+R12C*LCOMB_Y!R[-16]C5+R13C*LCOMB_Y!R[-16]C6+R14C*LCOMB_Y!R[-16]C7+R5C*LCOMB_Y!R[-16]C8+R8C*LCOMB_Y!R[-16]C9+R17C*LCOMB_Y!R[-16]C10"
        Next
        .Cells(i, 1) = i - 18
    Next
    
    '�������
    For i = 5 To 18
        For j = 12 To 16
            .Cells(i, j).FormulaR1C1 = "=VLOOKUP(RC11,R18C1:R" & m + 17 & "C8," & j - 10 & ")"
        Next
    Next
    
    For i = 12 To 16
        .Cells(19, i).FormulaR1C1 = "=1.2*R15C[-10]+1.4*R16C[-10]"
    Next
    
    For i = 12 To 16
        .Cells(20, i).FormulaR1C1 = "=R15C[-10]+R16C[-10]"
    Next
    
    .Cells(21, 10) = "Nmin"
    .Cells(21, 11) = "=MAX(R[-2]C[-7]:R[100]C[-7])"
    
    
    Dim ii As Integer
    Dim i_RowID As Integer
    Dim i_Rng As range
    
    '---------------------------------------------------------�������
    For ii = 2 To 8
    Dim R As range
    Set R = Worksheets(sheetname).range(Cells(18, ii), Cells(m + 17, ii))
    Call maxormin(R, "max", sheetname & "!R18C" & CStr(ii) & ":R" & CStr(m + 17) & "C" & CStr(ii))
    Call maxormin(R, "min", sheetname & "!R18C" & CStr(ii) & ":R" & CStr(m + 17) & "C" & CStr(ii))
    Next

    
    
End With



'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwdcnl.OUT
Dim Filename As String, filepath1 As String

Filename = "wdcnl.OUT"

'���������ļ�·��
filepath1 = Path & "\" & Filename

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ȡ���ָ��"
Debug.Print "����"

Dim inputstring As String, data As String

n = 5

Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '--------------------------------------------------------------------------��ȡ��Ϲ�������Ϣ
    If Mid(data, 2, 8) = "N-WC =1 " Then
    
        Debug.Print data
        
        
        Do While Not EOF(1)
            Line Input #1, inputstring '���ı��ļ�һ��
            data = inputstring
                
            If CheckRegExpfromString(data, "----") = True Then
                Exit Do
            End If
            
'            If CheckRegExpfromString(data, "\d+") = True Then
'            Debug.Print data
            
            Sheets(wcsheet).Cells(n, 11) = StringfromStringforReg(data, "\d+", 1)
            Sheets(wcsheet).Cells(n, 10) = "(" & StringfromStringforReg(data, "\S+", 8) & ")"
            n = n + 1
        
        Loop
    End If
Loop

Close #1

Call AddFormLine(wcsheet, "A2:H" & Sheets(wcsheet).range("A65535").End(xlUp).Row)

End Sub






'============================================================================================================================================================================
'============================================================================================================================================================================
'============================================================================================================================================================================






'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'%%                                                                        %%
'                            PKPM
'%%                                                                        %%
'%%                                                                        %%
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%һ��������ǽ����׼������ȡ
Sub WallData_P(Path, wallsh, flonum)

Dim wallsheet As String
wallsheet = wallsh


Dim n As Integer
n = 1

Dim flo As Integer
flo = flonum


Call Addsh(wallsheet)

'�����������������
Sheets(wallsheet).Cells.Clear


''�ӱ����
'Call AddFormLine(wallsheet, "A2:H20000")

With Sheets(wallsheet)
   
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
    .Cells(1, 3) = "ǽ������"
    .Cells(1, 13).Font.name = "����"
    .Cells(1, 3).Font.Size = "20"
    .Cells(1, 6) = flo & "F"
    '�ϲ���Ԫ��
    .range("C1:E1").MergeCells = True
    
End With

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim path1 As String, Filename As String, filepath1 As String, inputstring As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'���幹����ű���
Dim mem As Integer

Dim FirstString_Wall As String


'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-Wc ="


'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "wwnl" & flo & ".out"

'���������ļ�·��
filepath1 = Path & "\" & Filename


Sheets(wallsheet).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wwnl.OUT"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
  
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    'ǽ
     FirstString_Wall = Mid(data, 2, 6)
   
    '--------------------------------------------------------------------------��ȡǽ����Ϣ
    If FirstString_Wall = Keyword_Wall Then
       
        If StringfromStringforReg(data, "\d+\.?\d*", 1) = n Then
               
    '        Debug.Print FirstString_Wall, data
           
              '-------------------------------------------------������
            With Sheets(wallsheet)
            '��Ŀ��Ϣ
                .Cells(2 + (n - 1) * 17, 1) = "N-WC"
                .Cells(2 + (n - 1) * 17, 2) = "B"
                .Cells(2 + (n - 1) * 17, 3) = "H"
                .Cells(2 + (n - 1) * 17, 4) = "Lwc"
                .Cells(2 + (n - 1) * 17, 5) = "aa"
                .Cells(2 + (n - 1) * 17, 6) = "Angle"
                .Cells(2 + (n - 1) * 17, 7) = "Uc"
                
                .Cells(4 + (n - 1) * 17, 1) = "(iCase)"
                .Cells(4 + (n - 1) * 17, 2) = "Shear-X"
                .Cells(4 + (n - 1) * 17, 3) = "Shear-Y"
                .Cells(4 + (n - 1) * 17, 4) = "Axial"
                .Cells(4 + (n - 1) * 17, 5) = "Mx-Btm"
                .Cells(4 + (n - 1) * 17, 6) = "My-Btm"
                .Cells(4 + (n - 1) * 17, 7) = "Mx-Top"
                .Cells(4 + (n - 1) * 17, 8) = "My-Top"

            End With
            
            '�ӱ���ɫ
            Call AddShadow(wallsheet, "A" & 2 + (n - 1) * 17 & ":G" & 2 + (n - 1) * 17, 10092441)
            Call AddShadow(wallsheet, "A" & 4 + (n - 1) * 17 & ":H" & 4 + (n - 1) * 17, 10092441)
           
            'д����
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 1) = StringfromStringforReg(data, "\d+\.?\d*", 1)
            '��ȡ�Ƕ�
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 6) = StringfromStringforReg(data, "\d+\.?\d*", 5)
   
            Do While Not EOF(1)
           
                Line Input #1, data
               
                If Mid(data, 2, 5) = "( 1*)" Then
                    Sheets(wallsheet).Cells(5 + (n - 1) * 17, 1) = "EX"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(5 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next
                
                End If
               
                If Mid(data, 2, 5) = "( 2*)" Then
                    Sheets(wallsheet).Cells(6 + (n - 1) * 17, 1) = "EX+"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(6 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
               
                If Mid(data, 2, 5) = "( 3*)" Then
                    Sheets(wallsheet).Cells(7 + (n - 1) * 17, 1) = "EX-"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(7 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
                If Mid(data, 2, 5) = "( 4*)" Then
                    Sheets(wallsheet).Cells(8 + (n - 1) * 17, 1) = "EY"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(8 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
                If Mid(data, 2, 5) = "( 5*)" Then
                    Sheets(wallsheet).Cells(9 + (n - 1) * 17, 1) = "EY+"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(9 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
                If Mid(data, 2, 5) = "( 6*)" Then
                    Sheets(wallsheet).Cells(10 + (n - 1) * 17, 1) = "EY-"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(10 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
                If Mid(data, 2, 5) = "( 7 )" Then
                    Sheets(wallsheet).Cells(11 + (n - 1) * 17, 1) = "WX"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(11 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
'                If Mid(data, 2, 5) = "( 7 )" Then
'                    Sheets(wallsheet).Cells(12 + (n - 1) * 17, 1) = "WX-"
'                    For j = 2 To 8
'                    Sheets(wallsheet).Cells(12 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
'                    Next
'
'                End If
                           
                If Mid(data, 2, 5) = "( 8 )" Then
                    Sheets(wallsheet).Cells(12 + (n - 1) * 17, 1) = "WY"
                    For j = 2 To 8
                    Sheets(wallsheet).Cells(12 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
'                If Mid(data, 2, 5) = "( 8 )" Then
'                    Sheets(wallsheet).Cells(14 + (n - 1) * 17, 1) = "WY-"
'                    For j = 2 To 8
'                        Sheets(wallsheet).Cells(14 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
'
'                    Next
'                End If
                           
                If Mid(data, 2, 5) = "( 9 )" Then
                    Sheets(wallsheet).Cells(13 + (n - 1) * 17, 1) = "DL"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(13 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                           
                If Mid(data, 2, 5) = "(10 )" Then
                    Sheets(wallsheet).Cells(14 + (n - 1) * 17, 1) = "LL"
                    For j = 2 To 8
                        Sheets(wallsheet).Cells(14 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next

                End If
                   
'                If Mid(data, 2, 9) = "*(    EV)" Then
'                    Sheets(wallsheet).Cells(17 + (n - 1) * 17, 1) = "EV"
'                    For j = 2 To 8
'                        Sheets(wallsheet).Cells(17 + (n - 1) * 17, j) = StringfromStringforReg(data, "-?\d+\.?\d*", j - 1)
'                    Next
'
'                End If
                   
                If CheckRegExpfromString(data, "---") = True Then
                    Exit Do
                End If
                   
                Loop
               
                 n = n + 1
            End If
        End If

Loop

Close #1

'==========================================================================================��ȡ�����ߴ����Ϣ

'��ֵ
Keyword_Wall = "N-WC="

'����ǽ��ѹ���йؼ���
Dim Keyword_Wall_UC As String

'��ֵ
Keyword_Wall_UC = "Uc="

'����ǽ��ѹ��
Dim FirstString_Wall_UC As String

'��Ź���
n = 1

'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ" & flo & ".OUT"

'���������ļ�·��
filepath1 = Path & "\" & Filename

i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ����С�����ļ�wpj" & flo; ".out; "
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
'        Debug.Print "��ȡ" & flo & "��ǽ��Ϣ����"
        
        If StringfromStringforReg(data, "\d+", 1) = Sheets(wallsheet).Cells(3 + (n - 1) * 17, 1) Then

            '��ȡǽ����
            Dim B_w As Long, H_w As Long
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 2) = StringfromStringforReg(data, "\d+\.?\d*", 4) * 1000
            B_w = Sheets(wallsheet).Cells(3 + (n - 1) * 17, 2)
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 3) = StringfromStringforReg(data, "\d+\.?\d*", 5) * 1000
            H_w = Sheets(wallsheet).Cells(3 + (n - 1) * 17, 3)
            Sheets(wallsheet).Cells(3 + (n - 1) * 17, 4) = StringfromStringforReg(data, "\d+\.?\d*", 6) * 1000

            Do While Not EOF(1)
                Line Input #1, data
                FirstString_Wall_UC = Mid(data, 22, 3)
                If Mid(data, 3, 5) = "Cover" Then
                    Sheets(wallsheet).Cells(3 + (n - 1) * 17, 5) = StringfromStringforReg(data, "\d+", 2)
                End If
                If FirstString_Wall_UC = Keyword_Wall_UC Then
                    '��ȡǽ��ѹ��
'                    Debug.Print "��ȡ" & flo & "��ǽ��ѹ�ȡ���"
                    Sheets(wallsheet).Cells(3 + (n - 1) * 17, 7) = StringfromStringforReg(data, "0\.\d*", 1)
                End If
                If CheckRegExpfromString(data, "---") = True Then
                    Exit Do
                End If
            Loop
            
            n = n + 1
            
        End If
        
    End If

Loop

    
Close #1

Call AddFormLine(wallsheet, "A2:H" & Sheets(wallsheet).range("A65535").End(xlUp).Row)

End Sub

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ϲ�����ȡ
Sub LOADCOMB_WC_P(Path)

On Error Resume Next

Dim lcombsh As String
lcombsh = "LCOMB_P"

Call Addsh(lcombsh)

'�����������������
Sheets(lcombsh).Cells.Clear


''�ӱ����
'Call AddFormLine(lcombsh, "A2:M20000")

'�ӱ���ɫ
Call AddShadow(lcombsh, "A2:M2", 10092441)

With Sheets(lcombsh)
   
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
    .Cells(1, 6) = "�������"
    .Cells(1, 6).Font.name = "����"
    .Cells(1, 6).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("F1:H1").MergeCells = True
    
End With

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath1, inputstring   As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i As Integer, j As Integer

Dim n As Integer
n = 1

'==========================================================================================����ؼ��ʱ���

'ǽ����йؼ���
Dim Keyword_Wall As String
'��ֵ
Keyword_Wall = "N-WC="

'==========================================================================================�������ַ�����

'����ǽ����
Dim FirstString_WC As String

'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "WPJ1.OUT"

'���������ļ�·��
filepath1 = Path & "\" & Filename

Sheets(lcombsh).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    Debug.Print data
    
    '--------------------------------------------------------------------------��ȡ��Ϲ�������Ϣ
    If Mid(data, 2, 3) = "Ncm" Then
    
        Debug.Print data
        
        For i = 1 To 13
            Sheets(lcombsh).Cells(2, i) = "(" & StringfromStringforReg(data, "\S+", i) & ")"
        Next
        
        Do While Not EOF(1)
            Line Input #1, inputstring '���ı��ļ�һ��
            data = inputstring
                
            If CheckRegExpfromString(data, "-------") = True Then
                Exit Do
            End If
            
'            If CheckRegExpfromString(data, "\d+") = True Then
            Debug.Print data
            If StringfromStringforReg(data, "\d+", 1) = n Then
                Debug.Print data
                '��ȡ
                For i = 1 To 13
                    Sheets(lcombsh).Cells(n + 2, i) = StringfromStringforReg(data, "\S+", i)
                Next
                
                For i = 1 To 13
                    If Sheets(lcombsh).Cells(n + 2, i) = "--" Then Sheets(lcombsh).Cells(n + 2, i) = 0
                Next
                
            End If
               
            n = n + 1
'            End If
        Loop
    End If
Loop

Close #1

'�ӱ����
Call AddFormLine(lcombsh, "A2:M" & Sheets(lcombsh).range("A65535").End(xlUp).Row)

End Sub


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����������������Ϲ�����ȡ����

Sub SingleWallData_P(Path As String, sheetname As String, flonum As Integer, mem As Integer)


Dim wcsheet As String
wcsheet = sheetname


Dim n As Integer
n = 1

Dim i As Integer
Dim j As Integer

Dim flo As Integer
flo = flonum


Call Addsh(wcsheet)

'�����������������
Sheets(wcsheet).Cells.Clear


'�ӱ����
'Call AddFormLine(wcsheet, "A2:H20000")
Call AddFormLine(wcsheet, "J4:P21")

'������������
Sheets(wcsheet).Select
range("b5").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 3
End With
ActiveWindow.FreezePanes = True

With Sheets(wcsheet)
   
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
    .Columns("J:J").ColumnWidth = 18.13
   
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 3) = "ǽ��У��"
    .Cells(1, 13).Font.name = "����"
    .Cells(1, 3).Font.Size = "20"
    .Cells(1, 6) = flo & "F"
    '�ϲ���Ԫ��
    .range("C1:E1").MergeCells = True
    

    '��Ŀ��Ϣ
    .Cells(2, 1) = "N-WC"
    .Cells(2, 2) = "B"
    .Cells(2, 3) = "H"
    .Cells(2, 4) = "Lwc"
    .Cells(2, 5) = "aa"
    .Cells(2, 6) = "Angle"
    .Cells(2, 7) = "Uc"
    
    .Cells(4, 1) = "(iCase)"
    .Cells(4, 2) = "Shear-X"
    .Cells(4, 3) = "Shear-Y"
    .Cells(4, 4) = "Axial"
    .Cells(4, 5) = "Mx-Btm"
    .Cells(4, 6) = "My-Btm"
    .Cells(4, 7) = "Mx-Top"
    .Cells(4, 8) = "My-Top"
    
    .Cells(18, 1) = "(Ncm)"
    .Cells(18, 2) = "Shear-X"
    .Cells(18, 3) = "Shear-Y"
    .Cells(18, 4) = "Axial"
    .Cells(18, 5) = "Mx-Btm"
    .Cells(18, 6) = "My-Btm"
    .Cells(18, 7) = "Mx-Top"
    .Cells(18, 8) = "My-Top"
    
    .Cells(4, 10) = "LoadComb"
    .Cells(4, 11) = "Ncm"
    .Cells(4, 12) = "Shear-X"
    .Cells(4, 13) = "Shear-Y"
    .Cells(4, 14) = "Axial"
    .Cells(4, 15) = "Mx-Btm"
    .Cells(4, 16) = "My-Btm"
    
    '�ӱ���ɫ
    Call AddShadow(wcsheet, "A2:G2", 10092441)
    Call AddShadow(wcsheet, "A4:H4", 10092441)
    Call AddShadow(wcsheet, "A18:H18", 10092441)
    Call AddShadow(wcsheet, "J4:P4", 10092441)
    Call AddShadow(wcsheet, "J4:J21", 10092441)
    
End With

Dim m As Integer

'��ȡ��Ϲ����ĸ���
m = Sheets("LCOMB_P").range("A65535").End(xlUp).Row - 2


Dim sh As Worksheet
'��Ѱ���еĹ����������
Dim condition

condition = "no"

For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = "P_WCD_F" & flo Then
        condition = "yes"
    End If
Next

If condition = "no" Then
    MsgBox ("ȱ�ٱ��P_WCD_F" & flo)
    
    Exit Sub

End If


With Sheets(wcsheet)

    .Cells(3, 1) = mem
    
    '�����ߴ硢��ѹ�ȵ�
    For i = 2 To 7
        .Cells(3, i).FormulaR1C1 = "=INDEX(P_WCD_F" & flo & "!C,3+(R3C1-1)*17)"
    Next
    
    '������׼����
    For i = 4 To 17
        For j = 1 To 8
            .Cells(i, j).FormulaR1C1 = "=INDEX(P_WCD_F" & flo & "!C," & i & "+(R3C1-1)*17)"
        Next
    Next
    
    '�������
    For i = 19 To m + 18
        For j = 2 To 8
            .Cells(i, j).FormulaR1C1 = "=R13C*LCOMB_P!R[-16]C2+R14C*LCOMB_P!R[-16]C3+R11C*LCOMB_P!R[-16]C4+R12C*LCOMB_P!R[-16]C5+R5C*LCOMB_P!R[-16]C6+R8C*LCOMB_P!R[-16]C7"
        Next
        .Cells(i, 1) = i - 18
    Next
    
    '�������
    For i = 5 To 18
        For j = 12 To 16
            .Cells(i, j).FormulaR1C1 = "=VLOOKUP(RC11,R18C1:R" & m + 17 & "C8," & j - 10 & ")"
        Next
    Next
    

Sheets(wcsheet).Cells(19, 10) = "1.2*DL+1.4*LL"
Sheets(wcsheet).Cells(20, 10) = "DL+LL"

    For i = 12 To 16
        .Cells(19, i).FormulaR1C1 = "=1.2*R13C[-10]+1.4*R14C[-10]"
    Next
    
    For i = 12 To 16
        .Cells(20, i).FormulaR1C1 = "=R13C[-10]+R14C[-10]"
    Next
    
    .Cells(21, 10) = "Nmin"
    .Cells(21, 11) = "=MAX(R[-2]C[-7]:R[100]C[-7])"
    
    
    Dim ii As Integer
    Dim i_RowID As Integer
    Dim i_Rng As range
    
    '---------------------------------------------------------�������
    For ii = 2 To 8
    Dim R As range
    Set R = Worksheets(sheetname).range(Cells(18, ii), Cells(m + 17, ii))
    Call maxormin(R, "max", sheetname & "!R18C" & CStr(ii) & ":R" & CStr(m + 17) & "C" & CStr(ii))
    Call maxormin(R, "min", sheetname & "!R18C" & CStr(ii) & ":R" & CStr(m + 17) & "C" & CStr(ii))
    Next

    
    
End With


'
''==========================================================================================�����ļ���ȡ·��
''ָ���ļ���Ϊwdcnl.OUT
'Dim Filename As String, filepath1 As String
'
'Filename = "wdcnl.OUT"
'
''���������ļ�·��
'filepath1 = Path & "\" & Filename
'
'Dim i_ As Integer: i = FreeFile
'
''�򿪽���ļ�
'Open (filepath1) For Input Access Read As #i
'
''===========================================================================================���ж�ȡ�ı�
'
'Debug.Print "��ȡ���ָ��"
'Debug.Print "����"
'
'Dim inputstring As String, data As String
'
'n = 5
'
'Do While Not EOF(1)
'
'    Line Input #1, inputstring '���ı��ļ�һ��
'
'    '����ȡ��һ���ַ�����ֵ��data����
'    data = inputstring
'
'    '--------------------------------------------------------------------------��ȡ��Ϲ�������Ϣ
'    If Mid(data, 2, 8) = "N-WC =1 " Then
'
'        Debug.Print data
'
'
'        Do While Not EOF(1)
'            Line Input #1, inputstring '���ı��ļ�һ��
'            data = inputstring
'
'            If CheckRegExpfromString(data, "----") = True Then
'                Exit Do
'            End If
'
''            If CheckRegExpfromString(data, "\d+") = True Then
''            Debug.Print data
'
'            Sheets(wcsheet).Cells(n, 11) = StringfromStringforReg(data, "\d+", 1)
'            Sheets(wcsheet).Cells(n, 10) = "(" & StringfromStringforReg(data, "\S+", 8) & ")"
'            n = n + 1
'
'        Loop
'    End If
'Loop
'
'Close #1


For n = 5 To 18
  Sheets(wcsheet).Cells(n, 11) = 1
Next


Call AddFormLine(wcsheet, "A2:H" & Sheets(wcsheet).range("A65535").End(xlUp).Row)

End Sub






