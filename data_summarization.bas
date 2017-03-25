Attribute VB_Name = "data_summarization"
Option Explicit

'����ʱ��: 2014/04/02 14:53
'///////////////////////////////////////////////////////////////////////////////////////////////////////
'��������:
'1.Label1��һ����Ӽ���ģ�͵��Ի��ܱ�
'2.ƽ��ϵ��������á�~��


'����ʱ��: 2014/04/02 14:53
'///////////////////////////////////////////////////////////////////////////////////////////////////////
'��������:
'1.����general����
'2.���Ӷ�ȡwmass
'3.����֮�������á�~��


'����ʱ��: 2013/7/30 20:26
'///////////////////////////////////////////////////////////////////////////////////////////////////////
'��������:
'1.���ʱ���У���general��û��ʱ���������ȡ��ǰʱ������

'����ʱ��: 2013/7/23 23:26
'///////////////////////////////////////////////////////////////////////////////////////////////////////
'��������:
'1.���¶�ȡ���ܱ�ʽΪ���֣�1����ȡ�ļ�����OUT�ļ�Ȼ����룻2��ֱ�Ӷ�ȡ����OUTReader�ļ������ݡ����ɶ������У������ڲ鿴ģʽ�н��в���


'����ʱ��: 2013/7/20 19:06
'///////////////////////////////////////////////////////////////////////////////////////////////////////
'��������:
'1.��ȡ���⹤������geneeral�����ݵ�ָ����������ģ�͵��Ի��ܱ���ȡ����ʱ�����ݱ�ᱻ��

'����ʱ��: 2013/7/20 19:06
'///////////////////////////////////////////////////////////////////////////////////////////////////////
'��������:

Public Sub Data_Summarization(WB_Orig_Full As String, WB_New_Full As String, general As String)


'��������ʱ��
Dim sngStart As Single
sngStart = Timer

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                       ������"ģ�͵��Ի���"�趨                       ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'==============================================================================��ģ�͵���workbook

'���幤��������
Dim WB_New As String '���ܱ�
Dim WB_Orig As String '���ݱ�

Application.DisplayAlerts = False

'������·������ȡԭʼ���ݹ���������
Dim aFile_1 As Variant
aFile_1 = Split(WB_Orig_Full, "\")
WB_Orig = aFile_1(UBound(aFile_1))

'������·������ȡ�������ݹ���������
Dim aFile_2 As Variant
aFile_2 = Split(WB_New_Full, "\")
WB_New = aFile_2(UBound(aFile_2))

'���ԭʼ���ݹ�����δ�򿪣���򿪹�����
Debug.Print WB_Orig
If Not WorkbookOpen(WB_Orig) Then
    Workbooks.Open (WB_Orig_Full)
Else
    MsgBox "ģ�����ݹ������Ѵ�"
End If

'����������ݹ�����δ�򿪣���򿪹�����
If Not WorkbookOpen(WB_New) Then
    Workbooks.Open (WB_New_Full)
Else
    MsgBox "�������ݹ������Ѵ�"
End If

Workbooks(WB_New).Activate

Dim Wb As Worksheet

'��Ѱ���еĹ����������
For Each Wb In Worksheets
    '���ܹ���������������������ʽ�趨
    If Wb.name = "ģ�͵��Ի���" Then
        GoTo Label1
    End If
Next Wb
    
'==============================================================================��ӱ��"ģ�͵��Ի���"�ı���

Debug.Print "��ʼ�趨���""ģ�͵��Ի���""�ĸ�ʽ"
Debug.Print "����"

'�½�������
Call Addsh("ģ�͵��Ի���")

With Sheets("ģ�͵��Ի���")

'�����������������
.Cells.Clear

'������Ԫ���/��
.range("A:A").ColumnWidth = 4
.range("B:F,L:L").ColumnWidth = 8
.range("M:N").ColumnWidth = 9
.range("G:I").ColumnWidth = 15
.range("J:K,O:Q").ColumnWidth = 12
.Rows("1:1").RowHeight = 35

End With

'����ֽ�Ŵ�С��A3����
Sheets("ģ�͵��Ի���").PageSetup.PaperSize = xlPaperA3
Sheets("ģ�͵��Ի���").PageSetup.Orientation = xlLandscape

'��Ϊ��ҳ��ͼ
Sheets("ģ�͵��Ի���").Activate
ActiveWindow.View = xlPageBreakPreview
ActiveWindow.Zoom = 90

'�ӱ����
Call AddFormLine("ģ�͵��Ի���", "A1:Q100")

'�ӱ���ɫ
Call AddShadow("ģ�͵��Ի���", "A2:I2", 16777164)
Call AddShadow("ģ�͵��Ի���", "J2:Q2", 6750105)

Debug.Print "�趨���""ģ�͵��Ի���""�ĸ�ʽ���"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"


Debug.Print "��ʼ��ӱ��""ģ�͵��Ի���""�ı���"
Debug.Print "����"

'------------------------------------------------------������""ģ�͵��Ի���""�ڵı����ʽ
With Sheets("ģ�͵��Ի���")
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    '����С�����λ��
    '.Cells.NumberFormatLocal = "0.00"
    '���þֲ���Ԫ�������ʽ
    .range("B:B").NumberFormatLocal = "yyyy/m/d"
    'Cells(14, 7).NumberFormatLocal = "# ???/???"
    'Cells(15, 7).NumberFormatLocal = "G/ͨ�ø�ʽ"
    'Cells(17, 7).NumberFormatLocal = "G/ͨ�ø�ʽ"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = True
    
    '-------------------------------------------------��ͷ��
    '�ϲ���Ԫ��
    .range("A1:Q1").MergeCells = True
    .Cells(1, 1).HorizontalAlignment = xlCenter
    .Cells(1, 1).VerticalAlignment = xlCenter
    
    '��ͷ
    .Cells(1, 1).Font.name = "����"
    .Cells(1, 1).Font.Size = "20"
    .Cells(1, 1) = "ģ�͵��Ի��ܼ�¼��"
    
    '-------------------------------------------------��Ŀ��Ϣ��
    '��Ŀ��Ϣ
    .Cells(2, 1) = "No."
    .Cells(2, 2) = "ʱ��"
    .Cells(2, 3) = "�����׶�"
    .Cells(2, 4) = "ģ��"
    .Cells(2, 5) = "ԭʼģ��"
    .Cells(2, 6) = "�ļ���"
    .Cells(2, 7) = "Ŀ��"
    .Cells(2, 8) = "����"
    .Cells(2, 9) = "���"
    .Cells(2, 10) = "T1T2T3(s)"
    .Cells(2, 11) = "ƽ��ϵ��"
    .Cells(2, 12) = "Tt/T1"
    .Cells(2, 13) = "����ϵ��X"
    .Cells(2, 14) = "����ϵ��Y"
    .Cells(2, 15) = "���λ�ƽ�"
    .Cells(2, 16) = "���λ�Ʊ�"
    .Cells(2, 17) = "���λ�Ʊ�"
    
End With

'����
ActiveWorkbook.Save

Debug.Print "��ӱ��""ģ�͵��Ի���""�ı������"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"
    


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                        ��ȡ������general����                         ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************
Label1:
Workbooks(WB_New).Sheets("ģ�͵��Ի���").Activate

Dim N_Model As Integer

'ȷ��������������
N_Model = ActiveSheet.range("A65535").End(xlUp).Row

'���
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 1) = N_Model - 1

'ʱ��  ���general��û��ʱ�����ڣ���ȡ��ǰ����
If IsEmpty(Workbooks(WB_Orig).Sheets(general).Cells(4, 7)) Then
    Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 2) = Year(Date) & "/" & Month(Date) & "/" & Day(Date)
Else
    Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 2) = Workbooks(WB_Orig).Sheets(general).Cells(4, 7)
End If

'�����׶�
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 3) = Information_Input.TextBox_Stage.Text

'ģ��
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 4) = Information_Input.TextBox_Model.Text

'ԭʼģ��
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 5) = Information_Input.TextBox_Orig_Model.Text

'�ļ���
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 6) = Information_Input.TextBox_Folder.Text

'Ŀ��
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 7) = Information_Input.TextBox_Target.Text

'���
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 8) = Information_Input.TextBox_Operate.Text
'���
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 9) = Information_Input.TextBox_Result.Text

'���� T1T2T3
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 10) = Round(Workbooks(WB_Orig).Sheets(general).Cells(28, 4), 2) & "~" & Round(Workbooks(WB_Orig).Sheets(general).Cells(29, 4), 2) & "~" & Round(Workbooks(WB_Orig).Sheets(general).Cells(30, 4), 2)

'ƽ��ϵ��
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 11) = Round(1 - Workbooks(WB_Orig).Sheets(general).Cells(28, 7), 2) & "~" & Round(1 - Workbooks(WB_Orig).Sheets(general).Cells(29, 7), 2) & "~" & Round(1 - Workbooks(WB_Orig).Sheets(general).Cells(30, 7), 2)

'Tt / T1
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 12) = Round(Workbooks(WB_Orig).Sheets(general).Cells(38, 4), 2)

'����ϵ��X
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 13) = Workbooks(WB_Orig).Sheets(general).Cells(39, 5) & "%"

'����ϵ��Y
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 14) = Workbooks(WB_Orig).Sheets(general).Cells(39, 7) & "%"

'���λ�ƽ�
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 15) = Workbooks(WB_Orig).Sheets(general).Cells(14, 4) & "(" & Workbooks(WB_Orig).Sheets(general).Cells(15, 5) & ")"

'���λ�Ʊ�
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 16) = Workbooks(WB_Orig).Sheets(general).Cells(16, 4) & "(" & Workbooks(WB_Orig).Sheets(general).Cells(17, 5) & ")"

'���λ�Ʊ�
Sheets("ģ�͵��Ի���").Cells(N_Model + 1, 17) = Workbooks(WB_Orig).Sheets(general).Cells(18, 4) & "(" & Workbooks(WB_Orig).Sheets(general).Cells(19, 5) & ")"

'����
ThisWorkbook.Save

Information_Input.Hide
OUTReader_Main.Show 0

'��Ԫ�����Զ�����
'Sheets("ģ�͵��Ի���").Cells.EntireRow.AutoFit

MsgBox "�ķ�ʱ��: " & Timer - sngStart

End Sub

Function WorkbookOpen(WorkBookName As String) As Boolean
    '����ù������Ѵ��򷵻���
    WorkbookOpen = False
    On Error GoTo WorkBookNotOpen
    If Len(Application.Workbooks(WorkBookName).name) > 0 Then
        WorkbookOpen = True
        Exit Function
    End If
WorkBookNotOpen:
End Function

 
Public Sub Test_XX(XXC As Integer)

XXC = 1
Dim WB_New_Full As String
Dim WB_Orig_Full As String
'WB_Orig_Full = OUTReader_Main.TextBox_Path_2.Text
WB_Orig_Full = ThisWorkbook.Path & "\" & ThisWorkbook.name
WB_New_Full = OUTReader_Main.TextBox_Path_3.Text
'Path = Workbooks(WB_Orig).Worksheets("debug").Cells(2, 2)
'Debug.Print Path
If OUTReader_Main.CheckBox_PKPM_2 Then
    Call Data_Summarization(WB_Orig_Full, WB_New_Full, "g_P")
End If

If OUTReader_Main.CheckBox_YJK_2 Then
    Call Data_Summarization(WB_Orig_Full, WB_New_Full, "g_Y")
End If

If OUTReader_Main.CheckBox_MBuilding_2 Then
    Call Data_Summarization(WB_Orig_Full, WB_New_Full, "g_M")
End If

End Sub

