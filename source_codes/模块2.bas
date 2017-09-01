Attribute VB_Name = "ģ��2"

Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/10/26
'1.�����Ը�����������ȡ


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%һ������������֧������׼������ȡ
Sub BeamData_Y(Path, Beamsh, flonum, CorG As String)

Dim Beamsheet As String
Beamsheet = Beamsh
Dim flo As Integer
flo = flonum

Dim n As Integer
n = 0

Call Addsh(Beamsheet)

'�����������������
Sheets(Beamsheet).Cells.Clear

With Sheets(Beamsheet)
   
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
    .Cells(1, 3) = "��������"
    .Cells(1, 13).Font.name = "����"
    .Cells(1, 3).Font.Size = "20"
    .Cells(1, 6) = flo & "F"
    '�ϲ���Ԫ��
    .range("C1:E1").MergeCells = True
    '������
    .Cells(2, 1) = "N-B"
    .Cells(2, 2) = "H"
    .Cells(2, 3) = "B1"
    .Cells(2, 4) = "B2"
    .Cells(2, 5) = "tw"
    .Cells(2, 6) = "tf1"
    .Cells(2, 7) = "tf2"
    .Cells(2, 8) = "(-M)"
    .Cells(2, 9) = "(+M)"
    .Cells(2, 10) = "Shear"
    
End With

'�ӱ���ɫ
Call AddShadow(Beamsheet, "A2:J2", 10092441)

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim path1 As String, Filename As String, filepath1 As String, inputstring As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim i, j As Integer

'���幹����ű���
Dim mem As Integer

Dim FirstString_Beam As String


'==========================================================================================����ؼ��ʱ���

'����֧�ű���йؼ���
Dim Keyword_Beam As String
'��ֵ
Keyword_Beam = "N-B="



'==========================================================================================�����ļ���ȡ·��
'ָ���ļ���Ϊwpj_Num.out
Filename = "wpj" & flo & ".out"

'���������ļ�·��
filepath1 = Path & "\" & Filename


Sheets(Beamsheet).Select

Dim i_ As Integer: i = FreeFile

'�򿪽���ļ�
Open (filepath1) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wpj.OUT"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
  
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    '����֧��
     FirstString_Beam = Mid(data, 3, 4)
   
    '--------------------------------------------------------------------------��ȡ����֧�ŵ���Ϣ
    If FirstString_Beam = Keyword_Beam Then
       
        If CheckRegExpfromString(data, "B*H*U*T*D*F") = True Then
               
    '        Debug.Print FirstString_Beam, data
          
            'д����
            Sheets(Beamsheet).Cells(3 + n, 1) = StringfromStringforReg(data, "\d+\.?\d*", 1)
            '��ȡ�ߴ�
            Sheets(Beamsheet).Cells(3 + n, 5) = StringfromStringforReg(data, "\d+\.?\d*", 5)
            Sheets(Beamsheet).Cells(3 + n, 2) = StringfromStringforReg(data, "\d+\.?\d*", 6)
            Sheets(Beamsheet).Cells(3 + n, 3) = StringfromStringforReg(data, "\d+\.?\d*", 7)
            Sheets(Beamsheet).Cells(3 + n, 6) = StringfromStringforReg(data, "\d+\.?\d*", 8)
            Sheets(Beamsheet).Cells(3 + n, 4) = StringfromStringforReg(data, "\d+\.?\d*", 9)
            Sheets(Beamsheet).Cells(3 + n, 7) = StringfromStringforReg(data, "\d+\.?\d*", 10)
   
            Do While Not EOF(1)
           
                Line Input #1, data
               
               '��ȡ�����
                If Mid(data, 3, 7) = "-M(kNm)" Then
                    For j = 1 To 9
                        Sheets(Beamsheet).Cells(3 + n, 10 + j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next
                    Sheets(Beamsheet).Cells(3 + n, 8) = "=MIN(RC[3]:RC[11])"
                End If
                
               '��ȡ�����
                If Mid(data, 3, 7) = "+M(kNm)" Then
                    For j = 1 To 9
                        Sheets(Beamsheet).Cells(3 + n, 19 + j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next
                    Sheets(Beamsheet).Cells(3 + n, 9) = "=MAX(RC[11]:RC[19])"
                End If
                
               '��ȡ����
                If Mid(data, 3, 5) = "Shear" Then
                    For j = 1 To 9
                        Sheets(Beamsheet).Cells(3 + n, 28 + j) = StringfromStringforReg(data, "-?\d+\.?\d*", j)
                    Next
                    Sheets(Beamsheet).Cells(3 + n, 10) = "=MAX(RC[19]:RC[27])"
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

'�ӱ����
Call AddFormLine(Beamsheet, "A1:J" & Sheets(Beamsheet).range("A65535").End(xlUp).Row)

End Sub

Sub TEST()
Dim i
For i = 11 To 16
Sheets("Y_BEAM_F35").Columns(i).Delete
Next
End Sub
