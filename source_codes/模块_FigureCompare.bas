Attribute VB_Name = "ģ��_FigureCompare"
Option Explicit

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                           ���ƶԱ�����ͼ                             ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/24

'�������ݣ�
'1.�����������PKPM��YJK�Աȣ���������Ϊ��F_P&Y

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/8/27

'�������ݣ�
'1.���������ͼ����


'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/8/24

'�������ݣ�
'1.����Ǩ��λ�ƽ����ݴ��룬�����ϲ���ͨ�����������ͼ�����ɣ�


Sub FigureCompare(model_1, model_2, Programe_1, Programe_2)

Dim fs As String

If model_1 = "d_P" And model_2 = "d_M" Then
    fs = "F_P&M"""
End If
If model_1 = "d_P" And model_2 = "d_Y" Then
    fs = "F_P&Y"""
End If
If model_1 = "d_Y" And model_2 = "d_M" Then
    fs = "F_Y&M"""
End If
If model_1 = "d_E" And model_2 = "d_M" Then
    fs = "F_E&M"""
End If
If model_1 = "d_P" And model_2 = "d_E" Then
    fs = "F_P&E"""
End If
If model_1 = "d_E" And model_2 = "d_Y" Then
    fs = "F_E&Y"""
End If


'If CheckBox4_PKPM And CheckBox4_MBuilding Then
'    Call FigureCompare("d_P", "d_M", "SATWE", "Midas Building")
'End If
'
'If CheckBox4_PKPM And CheckBox4_YJK Then
'    Call FigureCompare("d_P", "d_Y", "SATWE", "YJK")
'End If
'
'If CheckBox4_YJK And CheckBox4_MBuilding Then
'    Call FigureCompare("d_Y", "d_M", "YJK", "Midas Building")
'End If
'
'If CheckBox4_ETABS And CheckBox4_MBuilding Then
'    Call FigureCompare("d_E", "d_M", "ETABS", "Midas Building")
'End If
'
'If CheckBox4_ETABS And CheckBox4_PKPM Then
'    Call FigureCompare("d_P", "d_E", "SATWE", "ETABS")
'End If
'
'If CheckBox4_ETABS And CheckBox4_YJK Then
'    Call FigureCompare("d_E", "d_Y", "ETABS", "YJK")
'End If

'----------------------------------------------------------ɾ������figure������
Dim sh As Worksheet

'��Ѱ���еĹ����������
For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = fs Then
        sh.Delete
    End If
Next

'�½�һ��������������Ϊfigure
With Worksheets
    Set sh = .Add(After:=Worksheets(.Count))
    sh.name = fs
    End With
'----------------------------------------------------------��ȡ¥������
Num_all = Sheets(model_1).[A65536].End(xlUp).Row - 2


'----------------------------------------------------------Ǩ��λ�ƽ�����
With Sheets(model_1).range("BI3:" & "BP" & Num_all + 2)
    .FormulaR1C1 = "=1/RC[-35]"
    .Font.ColorIndex = 1
    .Locked = True
End With
With Sheets(model_2).range("BI3:" & "BP" & Num_all + 2)
    .FormulaR1C1 = "=1/RC[-35]"
    .Font.ColorIndex = 1
    .Locked = True
End With

    
'----------------------------------------------------------�ԱȻ�ͼ

'��ͼ���ò���
Dim sheetname(2), range_X(1), range_Y(0), name_S(1), name_XY(1)
Dim Location(1) As Integer

'ͼ��߿�
Dim Width As Integer, Hight As Integer
Width = 207
Hight = 284

'���ò���
sheetname(0) = model_1
sheetname(1) = model_2
sheetname(2) = fs
range_Y(0) = "R3C1:R" & Num_all + 2 & "C1"
name_S(0) = Programe_1
name_S(1) = Programe_2
name_XY(1) = "¥��"

'X��նȱ�
range_X(0) = "R3C2:R" & Num_all + 2 & "C2"
range_X(1) = range_X(0)
name_XY(0) = "X��նȱ�"
Location(0) = 0 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'X��ն�
range_X(0) = "R3C4:R" & Num_all + 2 & "C4"
range_X(1) = range_X(0)
name_XY(0) = "X��ն�"
Location(0) = 1 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������X�����(kN)
range_X(0) = "R3C6:R" & Num_all + 2 & "C6"
range_X(1) = range_X(0)
name_XY(0) = "�������X�����(kN)"
Location(0) = 2 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������Y�����(kN)
range_X(0) = "R3C8:R" & Num_all + 2 & "C8"
range_X(1) = range_X(0)
name_XY(0) = "�������Y�����(kN)"
Location(0) = 3 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������X�����(kN)
range_X(0) = "R3C10:R" & Num_all + 2 & "C10"
range_X(1) = range_X(0)
name_XY(0) = "����������X�����(kN)"
Location(0) = 4 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������Y�����(kN)
range_X(0) = "R3C14:R" & Num_all + 2 & "C14"
range_X(1) = range_X(0)
name_XY(0) = "����������Y�����(kN)"
Location(0) = 5 * Width
Location(1) = 0 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y��նȱ�
range_X(0) = "R3C3:R" & Num_all + 2 & "C3"
range_X(1) = range_X(0)
name_XY(0) = "Y��նȱ�"
Location(0) = 0 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y��ն�
range_X(0) = "R3C5:R" & Num_all + 2 & "C5"
range_X(1) = range_X(0)
name_XY(0) = "Y��ն�"
Location(0) = 1 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������X�����(kNm)
range_X(0) = "R3C7:R" & Num_all + 2 & "C7"
range_X(1) = range_X(0)
name_XY(0) = "�������X�����(kNm)"
Location(0) = 2 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�������Y�����(kNm)
range_X(0) = "R3C9:R" & Num_all + 2 & "C9"
range_X(1) = range_X(0)
name_XY(0) = "�������Y�����(kNm)"
Location(0) = 3 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������X�����(kNm)
range_X(0) = "R3C11:R" & Num_all + 2 & "C11"
range_X(1) = range_X(0)
name_XY(0) = "����������X�����(kNm)"
Location(0) = 4 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'����������Y�����(kNm)
range_X(0) = "R3C15:R" & Num_all + 2 & "C15"
range_X(1) = range_X(0)
name_XY(0) = "����������Y�����(kNm)"
Location(0) = 5 * Width
Location(1) = 1 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX������λ�ƽ�
range_X(0) = "R3C61:R" & Num_all + 2 & "C61"
range_X(1) = range_X(0)
name_XY(0) = "EX������λ�ƽ�"
Location(0) = 0 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'EY������λ�ƽ�
range_X(0) = "R3C65:R" & Num_all + 2 & "C65"
range_X(1) = range_X(0)
name_XY(0) = "EY������λ�ƽ�"
Location(0) = 1 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'WX������λ�ƽ�
range_X(0) = "R3C64:R" & Num_all + 2 & "C64"
range_X(1) = range_X(0)
name_XY(0) = "WX������λ�ƽ�"
Location(0) = 2 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'WY������λ�ƽ�
range_X(0) = "R3C68:R" & Num_all + 2 & "C68"
range_X(1) = range_X(0)
name_XY(0) = "WY������λ�ƽ�"
Location(0) = 3 * Width
Location(1) = 2 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight, "#/###0")

'EX+������λ�Ʊ�
range_X(0) = "R3C35:R" & Num_all + 2 & "C35"
range_X(1) = range_X(0)
name_XY(0) = "EX+������λ�Ʊ�"
Location(0) = 0 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX-������λ�Ʊ�
range_X(0) = "R3C36:R" & Num_all + 2 & "C36"
range_X(1) = range_X(0)
name_XY(0) = "EX-������λ�Ʊ�"
Location(0) = 1 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY+������λ�Ʊ�
range_X(0) = "R3C38:R" & Num_all + 2 & "C38"
range_X(1) = range_X(0)
name_XY(0) = "EY+������λ�Ʊ�"
Location(0) = 2 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY-������λ�Ʊ�
range_X(0) = "R3C39:R" & Num_all + 2 & "C39"
range_X(1) = range_X(0)
name_XY(0) = "EY-������λ�Ʊ�"
Location(0) = 3 * Width
Location(1) = 3 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX+�����²��λ�Ʊ�
range_X(0) = "R3C41:R" & Num_all + 2 & "C41"
range_X(1) = range_X(0)
name_XY(0) = "EX+�����²��λ�Ʊ�"
Location(0) = 0 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EX-�����²��λ�Ʊ�
range_X(0) = "R3C42:R" & Num_all + 2 & "C42"
range_X(1) = range_X(0)
name_XY(0) = "EX-�����²��λ�Ʊ�"
Location(0) = 1 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY+�����²��λ�Ʊ�
range_X(0) = "R3C44:R" & Num_all + 2 & "C44"
range_X(1) = range_X(0)
name_XY(0) = "EY+�����²��λ�Ʊ�"
Location(0) = 2 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'EY-�����²��λ�Ʊ�
range_X(0) = "R3C45:R" & Num_all + 2 & "C45"
range_X(1) = range_X(0)
name_XY(0) = "EY-�����²��λ�Ʊ�"
Location(0) = 3 * Width
Location(1) = 4 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'X����ر�
range_X(0) = "R3C12:R" & Num_all + 2 & "C12"
range_X(1) = range_X(0)
name_XY(0) = "X����ر�"
Location(0) = 0 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y����ر�
range_X(0) = "R3C16:R" & Num_all + 2 & "C16"
range_X(1) = range_X(0)
name_XY(0) = "Y����ر�"
Location(0) = 1 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'X�򿹼���������
range_X(0) = "R3C46:R" & Num_all + 2 & "C46"
range_X(1) = range_X(0)
name_XY(0) = "X�򿹼���������"
Location(0) = 2 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'Y�򿹼���������
range_X(0) = "R3C47:R" & Num_all + 2 & "C47"
range_X(1) = range_X(0)
name_XY(0) = "Y�򿹼���������"
Location(0) = 3 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'��λ�������
range_X(0) = "R3C54:R" & Num_all + 2 & "C54"
range_X(1) = range_X(0)
name_XY(0) = "��λ�������"
Location(0) = 4 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'������
range_X(0) = "R3C55:R" & Num_all + 2 & "C55"
range_X(1) = range_X(0)
name_XY(0) = "������"
Location(0) = 5 * Width
Location(1) = 5 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����X���������ٷֱ�
range_X(0) = "R3C49:R" & Num_all + 2 & "C49"
range_X(1) = range_X(0)
name_XY(0) = "�����X���������ٷֱ�"
Location(0) = 0 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����Y���������ٷֱ�
range_X(0) = "R3C52:R" & Num_all + 2 & "C52"
range_X(1) = range_X(0)
name_XY(0) = "�����Y���������ٷֱ�"
Location(0) = 1 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����X������������ϵ��
range_X(0) = "R3C50:R" & Num_all + 2 & "C50"
range_X(1) = range_X(0)
name_XY(0) = "�����X������������ϵ��"
Location(0) = 2 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

'�����Y������������ϵ��
range_X(0) = "R3C53:R" & Num_all + 2 & "C53"
range_X(1) = range_X(0)
name_XY(0) = "�����Y������������ϵ��"
Location(0) = 3 * Width
Location(1) = 6 * Hight
Call add_chart_array(sheetname(), 2, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)


End Sub

