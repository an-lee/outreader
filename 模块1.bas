Attribute VB_Name = "ģ��1"
Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/7/1
'1.�������ģ��ͼ��Ա�



Sub vmodel()


'----------------------------------------------------------�������飬�ж�ѡ�����������

'---------------------------��λ�����������
Dim shna As String
Dim shna_r As Integer
shna = "˵��"
shna_r = 17

'---------------------------�ж��������
Dim softn As Integer
softn = Sheets(shna).[A65536].End(xlUp).Row - shna_r + 1
Debug.Print softn

'---------------------------�������ݴ�С
Dim dis(), names()
ReDim dis(softn - 1)
ReDim names(softn - 1)

'---------------------------����������ֵ
Dim i As Integer
For i = 0 To softn - 1
dis(i) = Sheets(shna).Cells(shna_r + i, 1)
names(i) = Sheets(shna).Cells(shna_r + i, 2)
Next

'Debug.Print dis(3)

'ѡ����������an
Dim figuresofts(), figurenames()
ReDim Preserve figuresofts(softn - 1)
ReDim Preserve figurenames(softn - 1)

For i = 0 To softn - 1
    figuresofts(i) = dis(i)
    figurenames(i) = names(i)
Next

'----------------------------------------------------------ȷ��¥����
'ȷ��¥����
Sheets(dis(0)).Select
Dim NN As Integer: NN = Cells(Rows.Count, "j").End(3).Row - 2
'Debug.Print "NN=" & NN
'����ȫ�ֱ���¥��������ȷ����û�з�Ӧ������ʱʱ�̻�ͼ¥����ȷ
Num_all = NN



'----------------------------------------------------------ɾ������figure������
Dim sh As Worksheet

'��Ѱ���еĹ����������
Dim sh2 As String
sh2 = Sheets(shna).Cells(shna_r - 2, 3)
For Each sh In Worksheets
    '������¶���Ĺ���������ͬ����ɾ��������
    If sh.name = sh2 Then
        sh.Delete
    End If
Next

'�½�һ��������
With Worksheets
    Set sh = .Add(After:=Worksheets(.Count))
    sh.name = sh2
    End With


'----------------------------------------------------------Ǩ�ƴ���λ�ƽ�����

For i = 0 To softn - 1
    With Sheets(dis(i)).range("BI3:" & "BP" & Num_all + 2)
        .FormulaR1C1 = "=1/" & dis(i) & "!RC[-35]"
        .Font.ColorIndex = 1
        .Locked = True
    End With
Next





'----------------------------------------------------------��ͼ

'Dim i As Integer
Sheets(sh2).Select

'��ͼ���ò���
Dim sheetname(), range_X(), range_Y(0), name_S(), name_XY(1)
ReDim Preserve sheetname(softn)
ReDim Preserve range_X(softn - 1)
ReDim Preserve name_S(softn - 1)
Dim Location(1) As Integer

'ͼ��߿�
Dim Width As Integer, Hight As Integer
Width = 207
Hight = 284


For i = 0 To softn - 1
    sheetname(i) = figuresofts(i)
Next i
sheetname(softn) = sh2

range_Y(0) = "R3C1:R" & NN + 2 & "C1"
name_XY(1) = "����"

For i = 0 To softn - 1
    name_S(i) = figurenames(i)
Next i



'X��նȱ�
For i = 0 To softn - 1
    range_X(i) = "R3C2:R" & NN + 2 & "C2"
Next i
name_XY(0) = "X��նȱ�"
Location(0) = 0 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'X��ն�
For i = 0 To softn - 1
    range_X(i) = "R3C4:R" & NN + 2 & "C4"
Next i
name_XY(0) = "X��ն�"
Location(0) = 1 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������X�����(kN)
For i = 0 To softn - 1
    range_X(i) = "R3C6:R" & NN + 2 & "C6"
Next i
name_XY(0) = "�������X�����(kN)"
Location(0) = 2 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������Y�����(kN)
For i = 0 To softn - 1
    range_X(i) = "R3C8:R" & NN + 2 & "C8"
Next i
name_XY(0) = "�������Y�����(kN)"
Location(0) = 3 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������X�����(kN)
For i = 0 To softn - 1
    range_X(i) = "R3C10:R" & NN + 2 & "C10"
Next i
name_XY(0) = "����������X�����(kN)"
Location(0) = 4 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������Y�����(kN)
For i = 0 To softn - 1
    range_X(i) = "R3C14:R" & NN + 2 & "C14"
Next i
name_XY(0) = "����������Y�����(kN)"
Location(0) = 5 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y��նȱ�
For i = 0 To softn - 1
    range_X(i) = "R3C3:R" & NN + 2 & "C3"
Next i
name_XY(0) = "Y��նȱ�"
Location(0) = 0 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y��ն�
For i = 0 To softn - 1
    range_X(i) = "R3C5:R" & NN + 2 & "C5"
Next i
name_XY(0) = "Y��ն�"
Location(0) = 1 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������X�����(kNm)
For i = 0 To softn - 1
    range_X(i) = "R3C7:R" & NN + 2 & "C7"
Next i
name_XY(0) = "�������X�����(kNm)"
Location(0) = 2 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������Y�����(kNm)
For i = 0 To softn - 1
    range_X(i) = "R3C9:R" & NN + 2 & "C9"
Next i
name_XY(0) = "�������Y�����(kNm)"
Location(0) = 3 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������X�����(kNm)
For i = 0 To softn - 1
    range_X(i) = "R3C11:R" & NN + 2 & "C11"
Next i
name_XY(0) = "����������X�����(kNm)"
Location(0) = 4 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������Y�����(kNm)
For i = 0 To softn - 1
    range_X(i) = "R3C15:R" & NN + 2 & "C15"
Next i
name_XY(0) = "����������Y�����(kNm)"
Location(0) = 5 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX������λ�ƽ�
For i = 0 To softn - 1
    range_X(i) = "R3C61:R" & NN + 2 & "C61"
Next i
name_XY(0) = "EX������λ�ƽ�"
Location(0) = 0 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'EY������λ�ƽ�
For i = 0 To softn - 1
    range_X(i) = "R3C65:R" & NN + 2 & "C65"
Next i
name_XY(0) = "EY������λ�ƽ�"
Location(0) = 1 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'WX������λ�ƽ�
For i = 0 To softn - 1
    range_X(i) = "R3C64:R" & NN + 2 & "C64"
Next i
name_XY(0) = "WX������λ�ƽ�"
Location(0) = 2 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'WY������λ�ƽ�
For i = 0 To softn - 1
    range_X(i) = "R3C68:R" & NN + 2 & "C68"
Next i
name_XY(0) = "WY������λ�ƽ�"
Location(0) = 3 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'EX+������λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C35:R" & NN + 2 & "C35"
Next i
name_XY(0) = "EX+������λ�Ʊ�"
Location(0) = 0 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX-������λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C36:R" & NN + 2 & "C36"
Next i
name_XY(0) = "EX-������λ�Ʊ�"
Location(0) = 1 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY+������λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C38:R" & NN + 2 & "C38"
Next i
name_XY(0) = "EY+������λ�Ʊ�"
Location(0) = 2 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY-������λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C39:R" & NN + 2 & "C39"
Next i
name_XY(0) = "EY-������λ�Ʊ�"
Location(0) = 3 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX+�����²��λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C41:R" & NN + 2 & "C41"
Next i
name_XY(0) = "EX+�����²��λ�Ʊ�"
Location(0) = 0 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX-�����²��λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C42:R" & NN + 2 & "C42"
Next i
name_XY(0) = "EX-�����²��λ�Ʊ�"
Location(0) = 1 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY+�����²��λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C44:R" & NN + 2 & "C44"
Next i
name_XY(0) = "EY+�����²��λ�Ʊ�"
Location(0) = 2 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY-�����²��λ�Ʊ�
For i = 0 To softn - 1
    range_X(i) = "R3C45:R" & NN + 2 & "C45"
Next i
name_XY(0) = "EY-�����²��λ�Ʊ�"
Location(0) = 3 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'X����ر�
For i = 0 To softn - 1
    range_X(i) = "R3C12:R" & NN + 2 & "C12"
Next i
name_XY(0) = "X����ر�"
Location(0) = 0 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y����ر�
For i = 0 To softn - 1
    range_X(i) = "R3C16:R" & NN + 2 & "C16"
Next i
name_XY(0) = "Y����ر�"
Location(0) = 1 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'X�򿹼���������
For i = 0 To softn - 1
    range_X(i) = "R3C46:R" & NN + 2 & "C46"
Next i
name_XY(0) = "X�򿹼���������"
Location(0) = 2 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y�򿹼���������
For i = 0 To softn - 1
    range_X(i) = "R3C47:R" & NN + 2 & "C47"
Next i
name_XY(0) = "Y�򿹼���������"
Location(0) = 3 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'��λ�������
For i = 0 To softn - 1
    range_X(i) = "R3C54:R" & NN + 2 & "C54"
Next i
name_XY(0) = "��λ�������"
Location(0) = 4 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'������
For i = 0 To softn - 1
    range_X(i) = "R3C55:R" & NN + 2 & "C55"
Next i
name_XY(0) = "������"
Location(0) = 5 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����X���������ٷֱ�
For i = 0 To softn - 1
    range_X(i) = "R3C49:R" & NN + 2 & "C49"
Next i
name_XY(0) = "�����X���������ٷֱ�"
Location(0) = 0 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����Y���������ٷֱ�
For i = 0 To softn - 1
    range_X(i) = "R3C52:R" & NN + 2 & "C52"
Next i
name_XY(0) = "�����Y���������ٷֱ�"
Location(0) = 1 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����X������������ϵ��
For i = 0 To softn - 1
    range_X(i) = "R3C50:R" & NN + 2 & "C50"
Next i
name_XY(0) = "�����X������������ϵ��"
Location(0) = 2 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����Y������������ϵ��
For i = 0 To softn - 1
    range_X(i) = "R3C53:R" & NN + 2 & "C53"
Next i
name_XY(0) = "�����Y������������ϵ��"
Location(0) = 3 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), softn, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)


End Sub

