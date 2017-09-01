Attribute VB_Name = "ETABS_HIST_Figs"
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                       ETABSʱ�����ݻ�ͼ                              ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�
'2.����Y��ʱ��������X��ʱʱ�����߳���bug

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/8
'��������:
'1.����X���Y��ʱ�̷ֿ��ˣ����Բ��ܵ���ԭ�ȵ�ʱ�����ݻ�ͼ���룬ֻ�ܵ���д�ˣ���������취ͳһһ��

Sub ETABS_HIST_Fig(ela As String)

'Dim ela  As String
'ela = "e_E"
'----------------------------------------------------------ɾ������figure������
Dim sh As Worksheet

'��Ѱ���еĹ����������
For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = "figure_dyna" Then
        sh.Delete
    End If
Next

'�½�һ��������������Ϊfigure
With Worksheets
    Set sh = .Add(After:=Worksheets(.Count))
    sh.name = "figure_dyna"
    End With

    
'ȷ��¥����
Sheets(ela).Select
Dim NN As Integer: NN = Cells(Rows.Count, "j").End(3).Row - 2
'Debug.Print "NN=" & NN
'����ȫ�ֱ���¥��������ȷ����û�з�Ӧ������ʱʱ�̻�ͼ¥����ȷ
Num_all = NN
'----------------------------------------------------------Ǩ�ƴ���λ�ƽ�����
Dim i As Integer
Dim num_th, num_th1, Num_X, Num_Y As Integer
num_th = Sheets(ela).Cells(2, 2)
num_th1 = num_th
Num_X = Sheets(ela).Cells(2, 4)
Num_Y = Sheets(ela).Cells(2, 6)
'Debug.Print num_th

'���з�Ӧ�����ݣ�������������2
If Sheets(ela).Cells(num_th + 8, 2) = "" Then
    num_th = num_th - 2
End If

For i = 0 To num_th + 6 - 1
    Sheets(ela).range(Sheets(ela).Cells(3, 100 + i), Sheets(ela).Cells(NN + 2, 100 + i)).Value = _
    Sheets(ela).range(Sheets(ela).Cells(3, 10 + 3 * i), Sheets(ela).Cells(NN + 2, 10 + 3 * i)).Value
Next

With Sheets(ela).range(Sheets(ela).Cells(3, 100 + num_th + 6 + 1), Sheets(ela).Cells(NN + 2, 100 + 2 * (num_th + 6)))
    .FormulaR1C1 = "=1/RC[-" & num_th + 6 + 1 & "]"
    .Font.ColorIndex = 2
    .Locked = True
End With

With Sheets(ela).range(Sheets(ela).Cells(3, 100), Sheets(ela).Cells(NN + 2, 100 + 2 * (num_th + 3)))
    .Font.ColorIndex = 2
    .Locked = True
End With


Sheets("figure_dyna").Select

'--------------------------------------------------------------��ͼ���ò���
Dim sheetname(), range_X(), range_Y(0), name_S(), name_XY(1)
ReDim Preserve sheetname(num_th + 7)
ReDim Preserve range_X(num_th1 + 6)
ReDim Preserve name_S(num_th1 + 6)
Dim Location(1) As Integer

'����ͼ��߿�
Dim Width As Integer, Hight As Integer

Width = 414
Hight = 510

For i = 0 To num_th + 6
    sheetname(i) = ela
Next i
sheetname(num_th + 7) = "figure_dyna"
range_Y(0) = "R3C9:R" & NN + 2 & "C9"
name_XY(1) = "����"


'--------------------------------------------------------------����X�����
Erase range_X
ReDim Preserve range_X(num_th1 + 6)

For i = 0 To Num_X - 1
       
    range_X(i) = "R3C" & 11 + 3 * i & ":R" & NN + 2 & "C" & 11 + 3 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

'ƽ��ֵ�����ֵ
For i = 0 To 1
       
    range_X(Num_X + i) = "R3C" & 11 + 3 * (num_th1 + 2 * i) & ":R" & NN + 2 & "C" & 11 + 3 * (num_th1 + 2 * i)
         
    name_S(Num_X + i) = Sheets(ela).Cells(6 + num_th1 + i, 1)
    
Next i

name_XY(0) = "����(EX)"

Location(0) = 0 * Width
Location(1) = 0 * Hight

'������ڷ�Ӧ�����ݣ��������35%������20%��Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), Num_X + 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  range_X(Num_X + 2) = "R3C" & 11 + 3 * (num_th1 + 4) & ":R" & NN + 2 & "C" & 11 + 3 * (num_th1 + 4)
  name_S(Num_X + 2) = Sheets(ela).Cells(6 + num_th1 + 2, 1)
      
  For i = 1 To 4
      range_X(Num_X + 2 + i) = "R3C" & 11 + 3 * (num_th1 + 6) - 2 + i & ":R" & NN + 2 & "C" & 11 + 3 * (num_th1 + 6) - 2 + i
      name_S(Num_X + 2 + i) = Sheets(ela).Cells(6 + num_th1 + 2 + i, 1)
  Next i
  
  Call add_chart_array(sheetname(), Num_X + 7, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


'-------------------------------------------------------------����Y�����
Erase range_X
ReDim Preserve range_X(num_th1 + 6)

For i = 0 To Num_Y - 1
       
    range_X(i) = "R3C" & 11 + 3 * (Num_X + i) & ":R" & NN + 2 & "C" & 11 + 3 * (Num_X + i)
         
    name_S(i) = Sheets(ela).Cells(6 + Num_X + i, 1)
    
Next i

'ƽ��ֵ�����ֵ
For i = 0 To 1
       
    range_X(Num_Y + i) = "R3C" & 11 + 3 * (num_th1 + 1 + 2 * i) & ":R" & NN + 2 & "C" & 11 + 3 * (num_th1 + 1 + 2 * i)
         
    name_S(Num_Y + i) = Sheets(ela).Cells(6 + num_th1 + i, 1)
    
Next i

name_XY(0) = "����(EY)"

Location(0) = 1 * Width
Location(1) = 0 * Hight

'������ڷ�Ӧ�����ݣ��������35%������20%��Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 5) = "" Then

  Call add_chart_array(sheetname(), Num_Y + 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  range_X(Num_Y + 2) = "R3C" & 11 + 3 * (num_th1 + 5) & ":R" & NN + 2 & "C" & 11 + 3 * (num_th1 + 5)
  name_S(Num_Y + 2) = Sheets(ela).Cells(6 + num_th1 + 2, 1)
      
  For i = 1 To 4
      range_X(Num_Y + 2 + i) = "R3C" & 11 + 3 * (num_th1 + 6) + 2 + i & ":R" & NN + 2 & "C" & 11 + 3 * (num_th1 + 6) + 2 + i
      name_S(Num_Y + 2 + i) = Sheets(ela).Cells(6 + num_th1 + 2 + i, 1)
  Next i
  
  Call add_chart_array(sheetname(), Num_Y + 7, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


'-------------------------------------------------------------����X�����
Erase range_X
ReDim Preserve range_X(num_th1 + 6)

For i = 0 To Num_X - 1
       
    range_X(i) = "R3C" & 12 + 3 * i & ":R" & NN + 2 & "C" & 12 + 3 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

'ƽ��ֵ�����ֵ
For i = 0 To 1
       
    range_X(Num_X + i) = "R3C" & 12 + 3 * (num_th1 + 2 * i) & ":R" & NN + 2 & "C" & 12 + 3 * (num_th1 + 2 * i)
         
    name_S(Num_X + i) = Sheets(ela).Cells(6 + num_th1 + i, 1)
    
Next i

name_XY(0) = "���(EX)"

Location(0) = 0 * Width
Location(1) = 1 * Hight

'������ڷ�Ӧ�����ݣ���ӷ�Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), Num_X + 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  range_X(Num_X + 2) = "R3C" & 12 + 3 * (num_th1 + 4) & ":R" & NN + 2 & "C" & 12 + 3 * (num_th1 + 4)
  name_S(Num_X + 2) = Sheets(ela).Cells(6 + num_th1 + 2, 1)

  Call add_chart_array(sheetname(), Num_X + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


'-------------------------------------------------------------����Y�����
Erase range_X
ReDim Preserve range_X(num_th1 + 6)

For i = 0 To Num_Y - 1
       
    range_X(i) = "R3C" & 12 + 3 * (Num_X + i) & ":R" & NN + 2 & "C" & 12 + 3 * (Num_X + i)
         
    name_S(i) = Sheets(ela).Cells(6 + Num_X + i, 1)
    
Next i

'ƽ��ֵ�����ֵ
For i = 0 To 1
       
    range_X(Num_Y + i) = "R3C" & 12 + 3 * (num_th1 + 1 + 2 * i) & ":R" & NN + 2 & "C" & 12 + 3 * (num_th1 + 1 + 2 * i)
         
    name_S(Num_Y + i) = Sheets(ela).Cells(6 + num_th1 + i, 1)
    
Next i

name_XY(0) = "���(EY)"

Location(0) = 1 * Width
Location(1) = 1 * Hight

'������ڷ�Ӧ�����ݣ���ӷ�Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), Num_Y + 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  range_X(Num_Y + 2) = "R3C" & 12 + 3 * (num_th1 + 5) & ":R" & NN + 2 & "C" & 12 + 3 * (num_th1 + 5)
  name_S(Num_Y + 2) = Sheets(ela).Cells(6 + num_th1 + 2, 1)

  Call add_chart_array(sheetname(), Num_Y + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


'-----------------------------------------------------------����X����λ�ƽ�
Erase range_X
ReDim Preserve range_X(num_th1 + 6)

For i = 0 To Num_X - 1
       
    range_X(i) = "R3C" & 107 + num_th + i & ":R" & NN + 2 & "C" & 107 + num_th + i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

'ƽ��ֵ�����ֵ
For i = 0 To 1
       
    range_X(Num_X + i) = "R3C" & 107 + num_th + num_th1 + 2 * i & ":R" & NN + 2 & "C" & 107 + num_th + num_th1 + 2 * i
         
    name_S(Num_X + i) = Sheets(ela).Cells(6 + num_th1 + i, 1)
    
Next i

name_XY(0) = "���λ�ƽ�(EX)"

Location(0) = 0 * Width
Location(1) = 2 * Hight

'������ڷ�Ӧ�����ݣ���ӷ�Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), Num_X + 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  range_X(Num_X + 2) = "R3C" & 107 + num_th + num_th1 + 4 & ":R" & NN + 2 & "C" & 107 + num_th + num_th1 + 4
  name_S(Num_X + 2) = Sheets(ela).Cells(6 + num_th1 + 2, 1)

  Call add_chart_array(sheetname(), Num_X + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


'-----------------------------------------------------------����Y����λ�ƽ�
Erase range_X
ReDim Preserve range_X(num_th1 + 6)

For i = 0 To Num_Y - 1
       
    range_X(i) = "R3C" & 107 + num_th + Num_X + i & ":R" & NN + 2 & "C" & 107 + num_th + Num_X + i
         
    name_S(i) = Sheets(ela).Cells(6 + Num_X + i, 1)
    
Next i

'ƽ��ֵ�����ֵ
For i = 0 To 1
       
    range_X(Num_Y + i) = "R3C" & 108 + num_th + num_th1 + 2 * i & ":R" & NN + 2 & "C" & 108 + num_th + num_th1 + 2 * i
         
    name_S(Num_Y + i) = Sheets(ela).Cells(6 + num_th1 + i, 1)
    
Next i

name_XY(0) = "���λ�ƽ�(EY)"

Location(0) = 1 * Width
Location(1) = 2 * Hight

'������ڷ�Ӧ�����ݣ���ӷ�Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), Num_Y + 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  range_X(Num_Y + 2) = "R3C" & 108 + num_th + num_th1 + 4 & ":R" & NN + 2 & "C" & 108 + num_th + num_th1 + 4
  name_S(Num_Y + 2) = Sheets(ela).Cells(6 + num_th1 + 2, 1)

  Call add_chart_array(sheetname(), Num_Y + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


End Sub


