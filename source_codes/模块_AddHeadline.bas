Attribute VB_Name = "ģ��_AddHeadline"
Option Explicit


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2015/4/19

'��������:
'1.ETABS����������


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2015/4/17

'��������:
'1.ETABS�������޸ģ�


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2014/4/18

'��������:
'1.g������ӵײ�������㸲���ذٷֱȣ�

'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2014/3/4

'��������:
'1.����ETABS���������ݣ���Ϊ ��EX(������)����ʽ

'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/8/19 15:07

'��������:
'1.�޸����ͺŴ���ʽ������С��


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/7/29 13:34

'��������:
'1.�����λ�ƽǱȡ���Ϊ�������λ�Ʊ�
'2. ���Ӽ���������

'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/7/23 18:01

'��������:
'1.����ǽ/����Ϊ��ѡ����,������в�д�����ɸñ�

'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/7/19 10:09

'��������:
'1.����λ�Ʊȡ��նȱȡ�¥�㿹���������ȵ�Ԫ���ʽ


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/7/18 17:01

'��������:
'1.��Ӳ��λ�ƽ�,���λ�Ʊ�,���λ�Ʊ���ֵ
'2.����¥�㣬��ţ����λ�ƽ���ֵ��Ԫ���ʽ


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/7/12 17:28

'��������:
'1.���������general���

'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/7/3 17:28

'��������:
'1.������λ�ơ����λ�ƽ��е�������X��Y�ֿ�������ȡ��ֵʱ�����繤��


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/5/27 19:17

'��������:
'1.dis�������޸ĵ���ϵ����������ѹ�ȵ���
'2.gen�������޸���ѹ���������λ�Ʊ�����


'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/5/21 21:22

'��������:
'1.���ӵ�λ�����������
'2.���������λ�ƽǳ��ֵ�¥�㡢������λ��

'///////////////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��: 2013/5/16 20:06

'///////////////////////////////////////////////////////////////////////////////////////////////////////


Sub AddHeadline(gen, dis, Optional column As String = "C", Optional wall As String = "W")


'��������ʱ��
Dim sngStart As Single
sngStart = Timer



'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            ������general���趨                       ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'======================================================================================================��ӱ��general�ı���

Debug.Print "��ʼ�趨���general�ĸ�ʽ"
Debug.Print "����"

'�����������������
Sheets(gen).Cells.Clear

'������Ԫ����
Sheets(gen).Columns("A:A").ColumnWidth = 4
Sheets(gen).Columns("B:C").ColumnWidth = 10
Sheets(gen).Columns("D:G").ColumnWidth = 15
Sheets(gen).Rows("1:51").RowHeight = 13.5

'��Ϊ��ҳ��ͼ
Sheets(gen).Activate
ActiveWindow.View = xlPageBreakPreview
ActiveWindow.Zoom = 90

'�ӱ����
Call AddFormLine(gen, "b3:g54")

'�ӱ���ɫ
Call AddShadow(gen, "B3:C25", 6750105)
Call AddShadow(gen, "B27:C39", 6750105)
Call AddShadow(gen, "B41:C45", 6750105)
Call AddShadow(gen, "B47:C51", 6750105)
Call AddShadow(gen, "D5:D13", 6750105)
Call AddShadow(gen, "D15:D15", 6750105)
Call AddShadow(gen, "D17:D17", 6750105)
Call AddShadow(gen, "D19:D25", 6750105)
Call AddShadow(gen, "D39:D39", 6750105)
Call AddShadow(gen, "F4:F13", 6750105)
Call AddShadow(gen, "F15:F15", 6750105)
Call AddShadow(gen, "F17:F17", 6750105)
Call AddShadow(gen, "F19:F25", 6750105)
Call AddShadow(gen, "F38:F39", 6750105)
Call AddShadow(gen, "D27:G27", 6750105)
Call AddShadow(gen, "D41:G41", 6750105)
Call AddShadow(gen, "D47:G47", 6750105)
Call AddShadow(gen, "F14:F14", 6750105)
Call AddShadow(gen, "F16:F16", 6750105)
Call AddShadow(gen, "F18:F18", 6750105)
Call AddShadow(gen, "G14:G14", 5505023)
Call AddShadow(gen, "G16:G16", 5505023)
Call AddShadow(gen, "G18:G18", 5505023)
Call AddShadow(gen, "B53:D54", 6750105)
Call AddShadow(gen, "F53:F54", 6750105)

Debug.Print "�趨���general�ĸ�ʽ���"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"


Debug.Print "��ʼ��ӱ��general�ı���"
Debug.Print "����"

'------------------------------------------------------������general�ڵı����ʽ
With Sheets(gen)
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    .Cells.NumberFormatLocal = "0.00"
    '���þֲ���Ԫ�������ʽ
    .range("G8:G9").NumberFormatLocal = "G/ͨ�ø�ʽ"
    .range("C28:C37").NumberFormatLocal = "G/ͨ�ø�ʽ"
    .Cells(4, 7).NumberFormatLocal = "yyyy �� m �� d ��"
    .Cells(14, 7).NumberFormatLocal = "# ???/???"
    .Cells(15, 7).NumberFormatLocal = "G/ͨ�ø�ʽ"
    .Cells(17, 7).NumberFormatLocal = "G/ͨ�ø�ʽ"
    .Cells(19, 7).NumberFormatLocal = "G/ͨ�ø�ʽ"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------��ͷ��
    '��ͷ
    .Cells(1, 4) = "��������¼��"
    .Cells(1, 4).Font.name = "����"
    .Cells(1, 4).Font.Size = "20"
    '�ϲ���Ԫ��
    .range("D1:E2").MergeCells = True
    
    '-------------------------------------------------��Ŀ��Ϣ��
    '��Ŀ��Ϣ
    .Cells(3, 2) = "�������ƣ�·����"
    .Cells(4, 6) = "��������"
    .Cells(4, 2) = "�������"
    .Cells(5, 2) = "�������"
    .Cells(5, 4) = "¥�����ɶ�"
    .Cells(5, 6) = "�����ۼ�ϵ��"
    '�ϲ���Ԫ��
    .range("B3:C3").MergeCells = True
    .range("B4:C4").MergeCells = True
    .range("B5:C5").MergeCells = True
    .range("D3:G3").MergeCells = True
    .range("D4:E4").MergeCells = True
    
    '-------------------------------------------------������Ϣ��
    
    '������Ϣ������
    .Cells(6, 2) = "����"
    .Cells(6, 4) = "��������"
    .Cells(6, 6) = "��������"
    .Cells(7, 4) = "��������"
    .Cells(7, 6) = "������"
    '�ϲ���Ԫ��
    .range("B6:C7").MergeCells = True
    
    '-------------------------------------------------��ѹ����
    
    '��ѹ��������
    .Cells(8, 2) = "�����ѹ��"
    .Cells(8, 4) = "�ײ���"
    .Cells(8, 6) = "���"
    .Cells(9, 4) = "�ײ�ǽ"
    .Cells(9, 6) = "���"
    '�ϲ���Ԫ��
    .range("B8:C9").MergeCells = True
    
    '-------------------------------------------------λ�ƽ���
    
    'λ�ƽ�������
    .Cells(10, 2) = "���λ�ƽ�"
    .Cells(10, 3) = "�����"
    .Cells(10, 4) = "X��"
    .Cells(10, 6) = "Y��"
    .Cells(11, 3) = "����"
    .Cells(11, 4) = "X��"
    .Cells(11, 6) = "Y��"
    .Cells(12, 4) = "X+5%��"
    .Cells(12, 6) = "Y+5%��"
    .Cells(13, 4) = "X-5%��"
    .Cells(13, 6) = "Y-5%��"
    .Cells(14, 2) = "�����λ�ƽ�"
    .Cells(14, 6) = "��ֵ"
    .Cells(15, 4) = "����"
    .Cells(15, 6) = "¥��"
    .Cells(16, 2) = "���λ�Ʊ�"
    .Cells(16, 6) = "��ֵ"
    .Cells(17, 4) = "����"
    .Cells(17, 6) = "¥��"
    .Cells(18, 2) = "�����λ�Ʊ�"
    .Cells(18, 6) = "��ֵ"
    .Cells(19, 4) = "����"
    .Cells(19, 6) = "¥��"
    '�ϲ���Ԫ��
    .range("B10:B13").MergeCells = True
    .range("C11:C13").MergeCells = True
    .range("B14:C15").MergeCells = True
    .range("B16:C17").MergeCells = True
    .range("B18:C19").MergeCells = True
    .range("D14:E14").MergeCells = True
    .range("D16:E16").MergeCells = True
    .range("D18:E18").MergeCells = True
    
    '-------------------------------------------------���ر���
    
    '��ѹ��������
    .Cells(20, 2) = "�ȶ������㣨���رȣ�"
    .Cells(20, 4) = "X��"
    .Cells(20, 6) = "�ж�"
    .Cells(21, 4) = "Y��"
    .Cells(21, 6) = "�ж�"
    '�ϲ���Ԫ��
    .range("B20:C21").MergeCells = True
    
    '-------------------------------------------------�նȱ���
    
    '��ѹ��������
    .Cells(22, 2) = "��С�նȱ�"
    .Cells(22, 4) = "X��"
    .Cells(22, 6) = "Y��"
    '�ϲ���Ԫ��
    .range("B22:C22").MergeCells = True
    
    '-------------------------------------------------¥�㿹������������
    
    '��ѹ��������
    .Cells(23, 2) = "����ܼ���������"
    .Cells(23, 4) = "X��"
    .Cells(23, 6) = "Y��"
    '�ϲ���Ԫ��
    .range("B23:C23").MergeCells = True
    
    '-------------------------------------------------���ر���
    
    '��ѹ��������
    .Cells(24, 2) = "��С���ر�"
    .Cells(24, 4) = "X��"
    .Cells(24, 6) = "X����ֵ"
    .Cells(25, 4) = "Y��"
    .Cells(25, 6) = "Y����ֵ"
    '�ϲ���Ԫ��
    .range("B24:C25").MergeCells = True
    .range("B26:G26").MergeCells = True
    
    '-------------------------------------------------������Ϣ��
    
    '������Ϣ������
    .Cells(27, 2) = "��������"
    .Cells(27, 3) = "���ͺ�"
    .Cells(28, 3) = "1"
    .Cells(29, 3) = "2"
    .Cells(30, 3) = "3"
    .Cells(31, 3) = "4"
    .Cells(32, 3) = "5"
    .Cells(33, 3) = "6"
    .Cells(34, 3) = "7"
    .Cells(35, 3) = "8"
    .Cells(36, 3) = "9"
    .Cells(37, 3) = "10"
    .Cells(38, 2) = "���ڱ�"
    .Cells(38, 6) = "�������͸���"
    .Cells(39, 2) = "���Ͳ�������ϵ��"
    .Cells(27, 4) = "����"
    .Cells(27, 5) = "ת��"
    .Cells(27, 6) = "ƽ��ϵ��"
    .Cells(27, 7) = "Ťתϵ��"
    .Cells(39, 4) = "X��"
    .Cells(39, 6) = "Y��"
    '�ϲ���Ԫ��
    .range("B27:B37").MergeCells = True
    .range("B38:C38").MergeCells = True
    '.range("D38:E38").MergeCells = True
    .range("B39:C39").MergeCells = True
    .range("B40:G40").MergeCells = True
    
    '-------------------------------------------------�ṹ������
    
    '���㸲��Ϣ������
    .Cells(42, 2) = "��"
    .Cells(42, 3) = "X��"
    .Cells(43, 3) = "Y��"
    .Cells(44, 2) = "����"
    .Cells(44, 3) = "X��"
    .Cells(45, 3) = "Y��"
    .Cells(41, 4) = "�ײ����"
    .Cells(41, 6) = "�ײ��㸲����"
    '�ϲ���Ԫ��
    .range("B42:B43").MergeCells = True
    .range("B44:B45").MergeCells = True
    .range("D41:E41").MergeCells = True
    .range("F41:G41").MergeCells = True
    .range("D42:E42").MergeCells = True
    .range("F42:G42").MergeCells = True
    .range("D43:E43").MergeCells = True
    .range("F43:G43").MergeCells = True
    .range("D44:E44").MergeCells = True
    .range("F44:G44").MergeCells = True
    .range("D45:E45").MergeCells = True
    .range("F45:G45").MergeCells = True
    .range("B46:G46").MergeCells = True
    
    '-------------------------------------------------���㸲��Ϣ��
    
    '���㸲��Ϣ������
    .Cells(48, 2) = "��"
    .Cells(48, 3) = "X��"
    .Cells(49, 3) = "Y��"
    .Cells(50, 2) = "����"
    .Cells(50, 3) = "X��"
    .Cells(51, 3) = "Y��"
    .Cells(47, 4) = "���㸲����Mr"
    .Cells(47, 5) = "�㸲����Mov"
    .Cells(47, 6) = "��ֵMr/Mov"
    .Cells(47, 7) = "��Ӧ����(%)"
    .range("B48:B49").MergeCells = True
    .range("B50:B51").MergeCells = True
    
    
    '-------------------------------------------------���������֫ǽ�����㸲���ذٷֱ���
    
    '���������֫ǽ�����㸲���ذٷֱȱ���
    .range("B52:G52").MergeCells = True
    .Cells(53, 2) = "���������֫ǽ�����㸲���ذٷֱ�"
    .range("B53:C54").MergeCells = True
    
    .Cells(53, 4) = "X��"
    .Cells(54, 4) = "Y��"
    
    .Cells(53, 6) = "X��"
    .Cells(54, 6) = "Y��"
    
End With

Debug.Print "��ӱ��general�ı������"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"



'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                          ������distribution���趨                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************




'======================================================================================================�趨���distribution�ĸ�ʽ


Debug.Print "��ʼ�趨���distribution�ĸ�ʽ"
Debug.Print "����"

Sheets(dis).Cells.Clear

'�ӱ����
Call AddFormLine(dis, "A1:BG200")

'�ӱ���ɫ
'�����
Call AddShadow(dis, "A1:A2", 10092441)
'�նȱ���
Call AddShadow(dis, "B1:C2", 6750207)
'�ն���
Call AddShadow(dis, "D1:E2", 10092441)
'�������
Call AddShadow(dis, "F1:I2", 6750207)
'���������
Call AddShadow(dis, "J1:Q2", 10092441)
'λ����
Call AddShadow(dis, "R1:Y2", 6750207)
'���λ�ƽ���
Call AddShadow(dis, "Z1:AG2", 10092441)
'λ�Ʊ���
Call AddShadow(dis, "AH1:AM2", 6750207)
'���λ�Ʊ���
Call AddShadow(dis, "AN1:AS2", 10092441)
'������������
Call AddShadow(dis, "AT1:AU2", 6750207)
'����������
Call AddShadow(dis, "AV1:BA2", 10092441)
'�����ֲ���
Call AddShadow(dis, "BB1:BC2", 6750207)
'�������ѹ����
Call AddShadow(dis, "BD1:BE2", 10092441)
'ǽ�����ѹ����
Call AddShadow(dis, "BF1:BG2", 6750207)

'�������
Sheets(dis).Select
range("B3").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 2
End With
ActiveWindow.FreezePanes = True


Debug.Print "�趨���distribution�ĸ�ʽ���"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"

'======================================================================================================��ӱ��distribution�ı���


'-----------------------------------------------------���distribution�ı����ʽ


Debug.Print "��ʼ��ӱ��distribution�ı���"
Debug.Print "����"


With Sheets(dis)
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------�����
    
   .Cells(1, 1) = "���"
    .range("A1:A2").MergeCells = True
    
    '-------------------------------------------------�նȱ���
    
    .Cells(1, 2) = "�նȱ�"
    .Cells(2, 2) = "Ratx"
    .Cells(2, 3) = "Raty"
    .range("B1:C1").MergeCells = True
    
    '-------------------------------------------------�ն���
    
    .Cells(1, 4) = "�ն�"
    .Cells(2, 4) = "RJX3"
    .Cells(2, 5) = "RJY3"
    .range("D1:E1").MergeCells = True
    
    '-------------------------------------------------�������
    
    .Cells(1, 6) = "�����"
    .Cells(2, 6) = "����X"
    .Cells(2, 7) = "���X"
    .Cells(2, 8) = "����Y"
    .Cells(2, 9) = "���Y"
    .range("F1:I1").MergeCells = True
    
    '-------------------------------------------------���������
    
    .Cells(1, 10) = "�������"
    .Cells(2, 10) = "����X"
    .Cells(2, 11) = "���X"
    .Cells(2, 12) = "���ر�X"
    .Cells(2, 13) = "��������ر�X"
    .Cells(2, 14) = "����Y"
    .Cells(2, 15) = "���Y"
    .Cells(2, 16) = "���ر�Y"
    .Cells(2, 17) = "��������ر�Y"
    .range("J1:Q1").MergeCells = True
    
    '-------------------------------------------------λ����
    
    .Cells(1, 18) = "λ��"
    .Cells(2, 18) = "EX"
    .Cells(2, 19) = "EX +"
    .Cells(2, 20) = "EX -"
    .Cells(2, 21) = "Wind X"
    .Cells(2, 22) = "EY  "
    .Cells(2, 23) = "EY +"
    .Cells(2, 24) = "EY -"
    .Cells(2, 25) = "Wind Y"
    .range("R1:Y1").MergeCells = True
    
    '-------------------------------------------------���λ�ƽ���
    
    .Cells(1, 26) = "���λ�ƽ�"
    .Cells(2, 26) = "EX"
    .Cells(2, 27) = "EX +"
    .Cells(2, 28) = "EX -"
    .Cells(2, 29) = "Wind X"
    .Cells(2, 30) = "EY  "
    .Cells(2, 31) = "EY +"
    .Cells(2, 32) = "EY -"
    .Cells(2, 33) = "Wind Y"
    .range("Z1:AG1").MergeCells = True
        
    '-------------------------------------------------λ�Ʊ���
    
    .Cells(1, 34) = "λ�Ʊ�"
    .Cells(2, 34) = "EX  "
    .Cells(2, 35) = "EX +"
    .Cells(2, 36) = "EX -"
    .Cells(2, 37) = "EY  "
    .Cells(2, 38) = "EY +"
    .Cells(2, 39) = "EY -"
    .range("AH1:AM1").MergeCells = True
    
    '-------------------------------------------------���λ�Ʊ���
    
    .Cells(1, 40) = "���λ�Ʊ�"
    .Cells(2, 40) = "EX  "
    .Cells(2, 41) = "EX +"
    .Cells(2, 42) = "EX -"
    .Cells(2, 43) = "EY  "
    .Cells(2, 44) = "EY +"
    .Cells(2, 45) = "EY -"
    .range("AN1:AS1").MergeCells = True
    
    '-------------------------------------------------������������
    
    .Cells(1, 46) = "¥�㿹��������"
    .Cells(2, 46) = "Ratio_X"
    .Cells(2, 47) = "Ratio_Y"
    .range("AT1:AU1").MergeCells = True
    
    '-------------------------------------------------����������
    
    .Cells(1, 48) = "������ļ���"
    .Cells(2, 48) = "V_Col_X"
    .Cells(2, 49) = "Ratio_VX"
    .Cells(2, 50) = "Cof_VX"
    .Cells(2, 51) = "V_Col_Y"
    .Cells(2, 52) = "Ratio_VY"
    .Cells(2, 53) = "Cof_VY"
    .range("AV1:BA1").MergeCells = True
    
    '-------------------------------------------------�����ֲ���
    
    .Cells(1, 54) = "��λ��������ֲ�"
    .Cells(2, 54) = "��λ�������"
    .Cells(2, 55) = "������"
    .range("BB1:BC1").MergeCells = True
    
    '-------------------------------------------------��ѹ����
    
    .Cells(1, 56) = "�������ѹ��"
    .Cells(2, 56) = "Uc_Max"
    .Cells(2, 57) = "���"
    .range("BD1:BE1").MergeCells = True
    
    .Cells(1, 58) = "ǽ�����ѹ��"
    .Cells(2, 58) = "Uc_Max"
    .Cells(2, 59) = "���"
    .range("BF1:BG1").MergeCells = True
    
    
    '-------------------------------------------------ETABSƥ��������������ع���
    If dis = "d_E" Then
      '�������Ӧ�����
      If Not IsEmpty(OUTReader_Main.ComboBox_SPEC_X) Then
        '�նȱ�
        .Cells(2, 2) = .Cells(2, 2) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '�ն�
        .Cells(2, 4) = .Cells(2, 4) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '����
        .Cells(2, 10) = .Cells(2, 10) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '��أ��涨ˮƽ������
        .Cells(2, 11) = .Cells(2, 11) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '���ر�
        .Cells(2, 12) = .Cells(2, 12) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '��������ر�
        .Cells(2, 13) = .Cells(2, 13) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        'λ�ƣ��涨ˮƽ������
        .Cells(2, 18) = .Cells(2, 18) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '���λ�ƽ�
        .Cells(2, 26) = .Cells(2, 26) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        'λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 34) = .Cells(2, 34) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '���λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 40) = .Cells(2, 40) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        '��ܼ������ռ��
        .Cells(2, 76) = "Co_V" & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        .Cells(2, 77) = "Co_V" & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        .Cells(2, 78) = "Wa_V" & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        .Cells(2, 79) = "Wa_V" & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        .Cells(2, 80) = "V" & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        .Cells(2, 81) = "V" & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        
        .Cells(2, 82) = "Co_M" & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        .Cells(2, 83) = "Co_M" & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        .Cells(2, 84) = "Wa_M" & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        .Cells(2, 85) = "Wa_M" & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        .Cells(2, 86) = "M" & "(" & OUTReader_Main.ComboBox_SPEC_X.Text & ")"
        .Cells(2, 87) = "M" & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        
      End If
      
      If Not IsEmpty(OUTReader_Main.ComboBox_SPEC_Y) Then
        '�նȱ�
        .Cells(2, 3) = .Cells(2, 3) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '�ն�
        .Cells(2, 5) = .Cells(2, 5) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '����
        .Cells(2, 14) = .Cells(2, 14) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '��أ��涨ˮƽ������
        .Cells(2, 15) = .Cells(2, 15) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '���ر�
        .Cells(2, 16) = .Cells(2, 16) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '��������ر�
        .Cells(2, 17) = .Cells(2, 17) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        'λ�ƣ��涨ˮƽ������
        .Cells(2, 22) = .Cells(2, 22) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '���λ�ƽ�
        .Cells(2, 30) = .Cells(2, 30) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        'λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 37) = .Cells(2, 37) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        '���λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 43) = .Cells(2, 43) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_Y.Text & ")"
        
      End If
      
      'ƫ�ĵ���Ӧ�����
      If Not IsEmpty(OUTReader_Main.ComboBox_SPEC_XEcc) Then
        '����ƫ�ĵ���Ӧ�����
        'λ�ƣ��涨ˮƽ������
        .Cells(2, 19) = .Cells(2, 19) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & ")"
        '���λ�ƽ�
        .Cells(2, 27) = .Cells(2, 27) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & ")"
        'λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 35) = .Cells(2, 35) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & ")"
        '���λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 41) = .Cells(2, 41) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & ")"
        
        '����ƫ�ĵ���Ӧ�����
        'λ�ƣ��涨ˮƽ������
        .Cells(2, 20) = .Cells(2, 20) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & ")"
        '���λ�ƽ�
        .Cells(2, 28) = .Cells(2, 28) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & ")"
        'λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 36) = .Cells(2, 36) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & ")"
        '���λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 42) = .Cells(2, 42) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & ")"
        
         
         
         .Cells(2, 70) = "Disp_Max" & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & ")"
         .Cells(2, 71) = "Disp_Max" & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & ")"
         
      End If
      
      If Not IsEmpty(OUTReader_Main.ComboBox_SPEC_YEcc) Then
        '����ƫ�ĵ���Ӧ�����
        'λ�ƣ��涨ˮƽ������
        .Cells(2, 23) = .Cells(2, 23) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & ")"
        '���λ�ƽ�
        .Cells(2, 31) = .Cells(2, 31) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & ")"
        'λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 38) = .Cells(2, 38) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & ")"
        '���λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 44) = .Cells(2, 44) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & ")"
        
        '����ƫ�ĵ���Ӧ�����
        'λ�ƣ��涨ˮƽ������
        .Cells(2, 24) = .Cells(2, 24) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & ")"
        '���λ�ƽ�2
        .Cells(2, 32) = .Cells(2, 32) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & ")"
        'λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 39) = .Cells(2, 39) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & ")"
        '���λ�Ʊȣ��涨ˮƽ������
        .Cells(2, 45) = .Cells(2, 45) & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & ")"
        
         .Cells(2, 72) = "Disp_Max" & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & ")"
         .Cells(2, 73) = "Disp_Max" & vbCrLf & "(" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & ")"
      End If
      
      '��������
      If Not IsEmpty(OUTReader_Main.ComboBox_Wind_X) Then
        '����
        .Cells(2, 6) = .Cells(2, 6) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_X.Text & ")"
        '���
        .Cells(2, 7) = .Cells(2, 7) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_X.Text & ")"
        'λ��
        .Cells(2, 21) = .Cells(2, 21) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_X.Text & ")"
        '���λ�ƽ�
        .Cells(2, 29) = .Cells(2, 29) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_X.Text & ")"
        
      End If
      
      If Not IsEmpty(OUTReader_Main.ComboBox_Wind_Y) Then
        '����
        .Cells(2, 8) = .Cells(2, 8) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_Y.Text & ")"
        '���
        .Cells(2, 9) = .Cells(2, 9) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_Y.Text & ")"
        'λ��
        .Cells(2, 25) = .Cells(2, 25) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_Y.Text & ")"
        '���λ�ƽ�
        .Cells(2, 33) = .Cells(2, 33) & vbCrLf & "(" & OUTReader_Main.ComboBox_Wind_Y.Text & ")"
        
      End If
      
      
      
    End If

    
    
End With


Debug.Print "��ӱ��distribution�ı������"
Debug.Print "����"


'��Ԫ�����Զ�����
Sheets(dis).Cells.EntireColumn.AutoFit
'����С�����λ��
Sheets(dis).Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
Sheets(dis).Columns("B:C").NumberFormatLocal = "0.00"
Sheets(dis).Columns("AT:AU").NumberFormatLocal = "0.00"
Sheets(dis).Columns("AH:AS").NumberFormatLocal = "0.00"

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                          ������Column��Wall���趨                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

Debug.Print "��ʼ�趨���Column��Wall�ĸ�ʽ"
Debug.Print "����"

'--------------------------------------------------------------------------Column
Debug.Print column
If column <> "C" Then
Sheets(column).Cells.Clear
With Sheets(column)
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '�п�
    .Columns.ColumnWidth = 5.5
End With
'�������
Sheets(column).Cells(1, 1) = "���"
'������������
Sheets(column).Select
range("B2").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 1
End With
ActiveWindow.FreezePanes = True
End If

'--------------------------------------------------------------------------Wall
If wall <> "W" Then
Sheets(wall).Cells.Clear
With Sheets(wall)
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '�п�
    .Columns.ColumnWidth = 5.5
End With
'�������
Sheets(wall).Cells(1, 1) = "���"
'������������
Sheets(wall).Select
range("B2").Select
With ActiveWindow
    .SplitColumn = 1
    .SplitRow = 1
End With
ActiveWindow.FreezePanes = True

Debug.Print "��ӱ��Column��Wall�ı������"
Debug.Print "����"
End If

End Sub


'�����������ģ��

Sub AddFormLine(shname, sel)

With Sheets(shname).range(sel)
    '���������ڵ�Ԫ��ˮƽ��
    .Borders(xlInsideVertical).LineStyle = xlContinuous
    '���������ڵ�Ԫ����ֱ��
    .Borders(xlInsideHorizontal).LineStyle = xlContinuous
    '�������������
    .Borders(xlEdgeLeft).LineStyle = xlContinuous
    '���������Ҳ���
    .Borders(xlEdgeRight).LineStyle = xlContinuous
    '���������ϲ���
    .Borders(xlEdgeTop).LineStyle = xlContinuous
    '���������²���
    .Borders(xlEdgeBottom).LineStyle = xlContinuous
End With

End Sub

'��ӵ�Ԫ���ɫģ��

Sub AddShadow(shname, sel, color)

With Sheets((shname)).range(sel).Interior
    .Pattern = xlSolid
    .PatternColorIndex = xlAutomatic
    '����colorΪ�Զ������ɫ����
    .color = color
    '��ɫ���ȣ�-1������� 1��������
    .TintAndShade = 0.3
    .PatternTintAndShade = 0
End With
    
End Sub

