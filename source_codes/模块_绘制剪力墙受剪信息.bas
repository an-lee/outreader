Attribute VB_Name = "ģ��_���Ƽ���ǽ�ܼ���Ϣ"
Option Explicit


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                          ���Ƽ���ǽ�ܼ���Ϣ����                      ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/3
'1.�ֳ�����ģ�飬��¥��Ͱ�����
'2.���������


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/12/19
'��������:
'1.NN�Ķ�����ԭ����A�и�ΪB��
'2.ͼ������Ϊ����������Ҫ�󡱼���������������


Sub member_wall_f(softname As String, infotype As String)

Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

'sheetname() Ϊ������������sheet����1 X N_C+1 ά���飬���һ��ֵΪͼ������sheet��
'N_C Ϊͼ����������
'range_X() Ϊͼ���X������range��1 X N_C ά����
'range_Y() Ϊͼ���Y������range��1 X 1 ά����
'name() Ϊ����Series�ı��⣬1 X N_C ά����
'name_XY() 1 X 2 ά���飬��һ��ֵΪͼ���X��ı��⣬�ڶ���ֵΪY�����
'Location() 1 X 2 ά���飬Ϊͼ����sheet�е�λ�ã�
'Optional NumFormat As String = "G/ͨ�ø�ʽ" ΪX�����ݵĸ�ʽ��ȱʡֵΪͨ�ã���Ϊ��������ѧ�����ȣ�


Dim NN As Integer: NN = Sheets(wallshearsheet).range("b65536").End(xlUp)

'��ͼ���ò���
Dim sheetname(), range_X(), range_Y(0), name_S(), name_XY(1)
ReDim Preserve sheetname(3)
ReDim Preserve range_X(2)
ReDim Preserve name_S(2)
Dim Location(1) As Integer

'ͼ��߿�
Dim Width As Integer, Hight As Integer
Width = 207
Hight = 284

Dim i As Integer

For i = 0 To 2
    sheetname(i) = wallshearsheet
Next i
sheetname(3) = wallshearsheet

range_Y(0) = "R4C2:R" & NN + 3 & "C2"
name_XY(1) = "����"

       
range_X(0) = "R4C11:R" & NN + 3 & "C11"
name_S(0) = "����"

range_X(1) = "R4C24:R" & NN + 3 & "C24"
name_S(1) = "����������"

range_X(2) = "R4C25:R" & NN + 3 & "C25"
name_S(2) = "��������Ҫ��"
    
                
name_XY(0) = "����ǽ�ܼ�����"

Location(0) = 1400
Location(1) = 100

Call add_chart_array(sheetname(), 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

End Sub


Sub member_wall_m(softname As String, infotype As String)

Dim wallshearsheet As String
wallshearsheet = "WS_" & softname & "_" & infotype

'sheetname() Ϊ������������sheet����1 X N_C+1 ά���飬���һ��ֵΪͼ������sheet��
'N_C Ϊͼ����������
'range_X() Ϊͼ���X������range��1 X N_C ά����
'range_Y() Ϊͼ���Y������range��1 X 1 ά����
'name() Ϊ����Series�ı��⣬1 X N_C ά����
'name_XY() 1 X 2 ά���飬��һ��ֵΪͼ���X��ı��⣬�ڶ���ֵΪY�����
'Location() 1 X 2 ά���飬Ϊͼ����sheet�е�λ�ã�
'Optional NumFormat As String = "G/ͨ�ø�ʽ" ΪX�����ݵĸ�ʽ��ȱʡֵΪͨ�ã���Ϊ��������ѧ�����ȣ�


Dim NN As Integer: NN = Sheets(wallshearsheet).range("c65536").End(xlUp)

'��ͼ���ò���
Dim sheetname(), range_X(), range_Y(0), name_S(), name_XY(1)
ReDim Preserve sheetname(3)
ReDim Preserve range_X(2)
ReDim Preserve name_S(2)
Dim Location(1) As Integer

'ͼ��߿�
Dim Width As Integer, Hight As Integer
Width = 207
Hight = 284

Dim i As Integer

For i = 0 To 2
    sheetname(i) = wallshearsheet
Next i
sheetname(3) = wallshearsheet

range_Y(0) = "R4C3:R" & NN + 3 & "C3"
name_XY(1) = "����"

       
range_X(0) = "R4C11:R" & NN + 3 & "C11"
name_S(0) = "����"

range_X(1) = "R4C24:R" & NN + 3 & "C24"
name_S(1) = "����������"

range_X(2) = "R4C25:R" & NN + 3 & "C25"
name_S(2) = "��������Ҫ��"
    
                
name_XY(0) = "����ǽ�ܼ�����"

Location(0) = 1400
Location(1) = 100

Call add_chart_array(sheetname(), 3, range_X(), range_Y(), name_S(), name_XY(), Location(), Width, Hight)

End Sub
