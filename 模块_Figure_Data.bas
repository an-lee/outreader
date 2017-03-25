Attribute VB_Name = "ģ��_Figure_Data"
Option Explicit

'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            �ֲ����ݻ�ͼ                              ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/03
'1.Ǩ�ƴ���λ�ƽ������У�.FormulaR1C1 = "=1/d_P!RC[-35]"��Ϊ.FormulaR1C1 = "=1/" & dis_sheet & "!RC[-35]"


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/27
'1.����Ϊͨ�û�ͼ����������ʱ��������������Ի���Ӧ����µ���������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/13
'1.�޸�λ�ƽǻ�ͼ��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/2
'1.���ӻ�ͼ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/27/ 21:57
'��������:
'1.����Num_All��d_P�е�һ�ж�ȡ���¥����



Sub OUTReader_Figure_Data(softname)

'----------------------------------------------------------ɾ������figure������
Dim sh As Worksheet

Dim dis_sheet, fig_sheet As String

'ͼ��߿�
Dim Width As Integer, Hight As Integer
Width = 207
Hight = 284

If softname = "PKPM" Then
    dis_sheet = "d_P"
    fig_sheet = "figure_PKPM"
ElseIf softname = "YJK" Then
    dis_sheet = "d_Y"
    fig_sheet = "figure_YJK"
ElseIf softname = "MBuilding" Then
    dis_sheet = "d_M"
    fig_sheet = "figure_MBuilding"
ElseIf softname = "ETABS" Then
    dis_sheet = "d_E"
    fig_sheet = "figure_ETABS"
Else
    MsgBox "�����������"
End If

'��Ѱ���еĹ����������
For Each sh In Worksheets
    '������¶���Ĺ���������ͬ�����˳�����
    If sh.name = fig_sheet Then
        sh.Delete
    End If
Next

'�½�һ��������������Ϊfigure
With Worksheets
    Set sh = .Add(After:=Worksheets(.Count))
    sh.name = fig_sheet
    End With

'----------------------------------------------------------Ǩ�ƴ���λ�ƽ�����
'Sheets("figure_PKPM").range("A3:" & "A" & Num_All + 2).Value = Sheets("d_P").range("A3:" & "A" & Num_All + 2).Value
'Sheets("figure_PKPM").range("A3:" & "A" & Num_All + 2).Font.ColorIndex = 2
'Sheets("figure_PKPM").range("A3:" & "A" & Num_All + 2).Locked = True
With Sheets(dis_sheet).range("BI3:" & "BP" & Num_all + 2)
    .FormulaR1C1 = "=1/" & dis_sheet & "!RC[-35]"
    .Font.ColorIndex = 1
    .Locked = True
End With

'----------------------------------------------------------��ȡ¥������
Num_all = Sheets(dis_sheet).[A65536].End(xlUp).Row - 2


'----------------------------------------------------------���ù��̻�ͼ
'X��նȱȡ��նȼ�������
Call add_chart(softname, "B3:" & "B" & Num_all + 2, "A3:" & "A" & Num_all + 2, "X��նȱ�", "�նȱ�", "���", 0 * Width, 0 * Hight, Width, Hight)
Call add_chart(softname, "D3:" & "D" & Num_all + 2, "A3:" & "A" & Num_all + 2, "X��ն�", "�ն�", "���", 1 * Width, 0 * Hight, Width, Hight)
Call add_chart(softname, "F3:" & "F" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�������X�����", "����(kN)", "���", 2 * Width, 0 * Hight, Width, Hight)
Call add_chart(softname, "H3:" & "H" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�������Y�����", "����(kN)", "���", 3 * Width, 0 * Hight, Width, Hight)
Call add_chart(softname, "J3:" & "J" & Num_all + 2, "A3:" & "A" & Num_all + 2, "����������X�����", "����(kN)", "���", 4 * Width, 0 * Hight, Width, Hight)
Call add_chart(softname, "N3:" & "N" & Num_all + 2, "A3:" & "A" & Num_all + 2, "����������Y�����", "����(kN)", "���", 5 * Width, 0 * Hight, Width, Hight)

'Y��նȱȡ��նȼ�������
Call add_chart(softname, "C3:" & "C" & Num_all + 2, "A3:" & "A" & Num_all + 2, "Y��նȱ�", "�նȱ�", "���", 0 * Width, 1 * Hight, Width, Hight)
Call add_chart(softname, "E3:" & "E" & Num_all + 2, "A3:" & "A" & Num_all + 2, "Y��ն�", "�ն�", "���", 1 * Width, 1 * Hight, Width, Hight)
Call add_chart(softname, "G3:" & "G" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�������X�����", "���(kNm)", "���", 2 * Width, 1 * Hight, Width, Hight)
Call add_chart(softname, "I3:" & "I" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�������Y�����", "���(kNm)", "���", 3 * Width, 1 * Hight, Width, Hight)
Call add_chart(softname, "K3:" & "K" & Num_all + 2, "A3:" & "A" & Num_all + 2, "����������X�����", "���(kNm)", "���", 4 * Width, 1 * Hight, Width, Hight)
Call add_chart(softname, "O3:" & "O" & Num_all + 2, "A3:" & "A" & Num_all + 2, "����������Y�����", "���(kNm)", "���", 5 * Width, 1 * Hight, Width, Hight)

'���λ�ƽ�
Call add_chart(softname, "BI3:" & "BI" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EX������λ�ƽ�", "λ�ƽ�", "���", 0 * Width, 2 * Hight, Width, Hight, "#/###0")
Call add_chart(softname, "BM3:" & "BM" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EY������λ�ƽ�", "λ�ƽ�", "���", 1 * Width, 2 * Hight, Width, Hight, "#/###0")
Call add_chart(softname, "BL3:" & "BL" & Num_all + 2, "A3:" & "A" & Num_all + 2, "WX������λ�ƽ�", "λ�ƽ�", "���", 2 * Width, 2 * Hight, Width, Hight, "#/###0")
Call add_chart(softname, "BP3:" & "BP" & Num_all + 2, "A3:" & "A" & Num_all + 2, "WY������λ�ƽ�", "λ�ƽ�", "���", 3 * Width, 2 * Hight, Width, Hight, "#/###0")

'λ�Ʊ�
Call add_chart(softname, "AI3:" & "AI" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EX+������λ�Ʊ�", "λ�Ʊ�", "���", 0 * Width, 3 * Hight, Width, Hight)
Call add_chart(softname, "AJ3:" & "AJ" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EX-������λ�Ʊ�", "λ�Ʊ�", "���", 1 * Width, 3 * Hight, Width, Hight)
Call add_chart(softname, "AL3:" & "AL" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EY+������λ�Ʊ�", "λ�Ʊ�", "���", 2 * Width, 3 * Hight, Width, Hight)
Call add_chart(softname, "AM3:" & "AM" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EY-������λ�Ʊ�", "λ�Ʊ�", "���", 3 * Width, 3 * Hight, Width, Hight)

'���λ�Ʊ�
Call add_chart(softname, "AO3:" & "AO" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EX+�����²��λ�Ʊ�", "λ�Ʊ�", "���", 0 * Width, 4 * Hight, Width, Hight)
Call add_chart(softname, "AP3:" & "AP" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EX-�����²��λ�Ʊ�", "λ�Ʊ�", "���", 1 * Width, 4 * Hight, Width, Hight)
Call add_chart(softname, "AR3:" & "AR" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EY+�����²��λ�Ʊ�", "λ�Ʊ�", "���", 2 * Width, 4 * Hight, Width, Hight)
Call add_chart(softname, "AS3:" & "AS" & Num_all + 2, "A3:" & "A" & Num_all + 2, "EY-�����²��λ�Ʊ�", "λ�Ʊ�", "���", 3 * Width, 4 * Hight, Width, Hight)

'���رȡ������������ȼ�������
Call add_chart(softname, "L3:" & "L" & Num_all + 2, "A3:" & "A" & Num_all + 2, "X����ر�", "���ر�", "���", 0 * Width, 5 * Hight, Width, Hight)
Call add_chart(softname, "P3:" & "P" & Num_all + 2, "A3:" & "A" & Num_all + 2, "Y����ر�", "���ر�", "���", 1 * Width, 5 * Hight, Width, Hight)
Call add_chart(softname, "AT3:" & "AT" & Num_all + 2, "A3:" & "A" & Num_all + 2, "X�򿹼���������", "������������", "���", 2 * Width, 5 * Hight, Width, Hight)
Call add_chart(softname, "AU3:" & "AU" & Num_all + 2, "A3:" & "A" & Num_all + 2, "Y�򿹼���������", "������������", "���", 3 * Width, 5 * Hight, Width, Hight)
Call add_chart(softname, "BB3:" & "BB" & Num_all + 2, "A3:" & "A" & Num_all + 2, "��λ�������", "��λ�������", "���", 4 * Width, 5 * Hight, Width, Hight)
Call add_chart(softname, "BC3:" & "BC" & Num_all + 2, "A3:" & "A" & Num_all + 2, "������", "������", "���", 5 * Width, 5 * Hight, Width, Hight)

'��ܼ�����ռ�ܼ�������������ϵ��
Call add_chart(softname, "AW3:" & "AW" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�����X���������ٷֱ�", "����������ٷֱ�", "���", 0 * Width, 6 * Hight, Width, Hight)
Call add_chart(softname, "AZ3:" & "AZ" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�����Y���������ٷֱ�", "����������ٷֱ�", "���", 1 * Width, 6 * Hight, Width, Hight)
Call add_chart(softname, "AX3:" & "AX" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�����X������������ϵ��", "�������������ϵ��", "���", 2 * Width, 6 * Hight, Width, Hight)
Call add_chart(softname, "BA3:" & "BA" & Num_all + 2, "A3:" & "A" & Num_all + 2, "�����Y������������ϵ��", "�������������ϵ��", "���", 3 * Width, 6 * Hight, Width, Hight)

End Sub
