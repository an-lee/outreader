Attribute VB_Name = "Figure_Dyna"

Option Explicit


'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            ʱ�̷�����ͼ                              ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2014/1/8
'1.����ȫ�ֱ���¥��������ȷ����û�з�Ӧ������ʱʱ�̻�ͼ¥����ȷ

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/11/29
'1.�������35%������20%��Ӧ�׼�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/28
'1.����û�з�Ӧ����ʱ��ͼ�л��з�Ӧ��ϵ������bug

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/27
'1.����Ϊͨ�û�ͼ����������ʱ������sheet�����Ի���ͼ����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/25
'��������:
'1.������λ�ƽ�Ǩ�ƴ��룻

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/16/ 19:23
'��������:
'1.Ǩ������λ�ƽ�������ɫ��Ϊ��ɫ,�����һ��;



Sub OUTReader_Figure_Dyna(ela)

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
Dim num_th, num_th1 As Integer
num_th = Sheets(ela).Cells(2, 2)
num_th1 = num_th
Debug.Print num_th

'��û�з�Ӧ�����ݣ�������������һ
If Sheets(ela).Cells(num_th + 8, 2) = "" Then
    num_th = num_th - 1
End If

For i = 0 To 2 * (num_th + 3) - 1
    Sheets(ela).range(Sheets(ela).Cells(3, 100 + i), Sheets(ela).Cells(NN + 2, 100 + i)).Value = _
    Sheets(ela).range(Sheets(ela).Cells(3, 10 + 3 * i), Sheets(ela).Cells(NN + 2, 10 + 3 * i)).Value
Next

With Sheets(ela).range(Sheets(ela).Cells(3, 100 + 2 * (num_th + 3) + 1), Sheets(ela).Cells(NN + 2, 100 + 4 * (num_th + 3)))
    .FormulaR1C1 = "=1/RC[-" & 2 * (num_th + 3) + 1 & "]"
    .Font.ColorIndex = 2
    .Locked = True
End With

With Sheets(ela).range(Sheets(ela).Cells(3, 100), Sheets(ela).Cells(NN + 2, 100 + 4 * (num_th + 3)))
    .Font.ColorIndex = 2
    .Locked = True
End With


Sheets("figure_dyna").Select

'��ͼ���ò���
Dim sheetname(), range_X(), range_Y(0), name_S(), name_XY(1)
ReDim Preserve sheetname(num_th + 7)
ReDim Preserve range_X(num_th + 6)
ReDim Preserve name_S(num_th + 6)
Dim Location(1) As Integer

'ͼ��߿�
Dim Width As Integer, Hight As Integer

Width = 414
Hight = 510

For i = 0 To num_th + 6
    sheetname(i) = ela
Next i
sheetname(num_th + 7) = "figure_dyna"
range_Y(0) = "R3C9:R" & NN + 2 & "C9"
name_XY(1) = "����"

'----------------------------------------------------------------------����X�����
For i = 0 To num_th + 2
       
    range_X(i) = "R3C" & 11 + 6 * i & ":R" & NN + 2 & "C" & 11 + 6 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

name_XY(0) = "����(EX)"

Location(0) = 0 * Width
Location(1) = 0 * Hight

'������ڷ�Ӧ�����ݣ��������35%������20%��Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), num_th + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  For i = 1 To 4
      range_X(num_th + 2 + i) = "R3C" & 11 + 6 * (num_th + 2) + 4 + i & ":R" & NN + 2 & "C" & 11 + 6 * (num_th + 2) + 4 + i
      name_S(num_th + 2 + i) = Sheets(ela).Cells(6 + num_th + 2 + i, 1)
  Next i
  
  Call add_chart_array(sheetname(), num_th + 7, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If


'----------------------------------------------------------------------����Y�����
For i = 0 To num_th + 2
    
    range_X(i) = "R3C" & 14 + 6 * i & ":R" & NN + 2 & "C" & 14 + 6 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i
                
name_XY(0) = "����(EY)"

Location(0) = 1 * Width
Location(1) = 0 * Hight

'������ڷ�Ӧ�����ݣ��������35%������20%��Ӧ�׼�������
If Sheets(ela).Cells(num_th1 + 8, 2) = "" Then

  Call add_chart_array(sheetname(), num_th + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

Else

  For i = 1 To 4
      range_X(num_th + 2 + i) = "R3C" & 11 + 6 * (num_th + 2) + 8 + i & ":R" & NN + 2 & "C" & 11 + 6 * (num_th + 2) + 8 + i
      name_S(num_th + 2 + i) = Sheets(ela).Cells(6 + num_th + 2 + i, 1)
  Next i
  
  Call add_chart_array(sheetname(), num_th + 7, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)
  
End If

'---------------------------------------------------------------------����X�����
For i = 0 To num_th + 2
    
    range_X(i) = "R3C" & 12 + 6 * i & ":R" & NN + 2 & "C" & 12 + 6 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

name_XY(0) = "���(EX)"

Location(0) = 0 * Width
Location(1) = 1 * Hight

Call add_chart_array(sheetname(), num_th + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'--------------------------------------------------------------------����Y�����
For i = 0 To num_th + 2
    
    range_X(i) = "R3C" & 15 + 6 * i & ":R" & NN + 2 & "C" & 15 + 6 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

name_XY(0) = "���(EY)"

Location(0) = 1 * Width
Location(1) = 1 * Hight

Call add_chart_array(sheetname(), num_th + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'--------------------------------------------------------------------����X����λ�ƽ�
For i = 0 To num_th + 2
    
    range_X(i) = "R3C" & 101 + 2 * (num_th + 3) + 2 * i & ":R" & NN + 2 & "C" & 101 + 2 * (num_th + 3) + 2 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i
                
name_XY(0) = "���λ�ƽ�(EX)"

Location(0) = 0 * Width
Location(1) = 2 * Hight

Call add_chart_array(sheetname(), num_th + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'----------------------------------------------------------------------����Y����λ�ƽ�
For i = 0 To num_th + 2
    
    range_X(i) = "R3C" & 102 + 2 * (num_th + 3) + 2 * i & ":R" & NN + 2 & "C" & 102 + 2 * (num_th + 3) + 2 * i
         
    name_S(i) = Sheets(ela).Cells(6 + i, 1)
    
Next i

name_XY(0) = "���λ�ƽ�(EY)"

Location(0) = 1 * Width
Location(1) = 2 * Hight

Call add_chart_array(sheetname(), num_th + 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")


End Sub




