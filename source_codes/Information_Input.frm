VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Information_Input 
   Caption         =   "Input"
   ClientHeight    =   9345
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7515
   OleObjectBlob   =   "Information_Input.frx":0000
   StartUpPosition =   2  '��Ļ����
End
Attribute VB_Name = "Information_Input"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/4/2

'�������ݣ�
'1.���Ĭ��ֵ

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/30 20:56

'�������ݣ�
'1.���MBuildingģ�飬������Ϊ��λ�Ʊ�ģ���ȡ���λ�Ʊ������⣬���������������������ɽ���

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/23 13:56

'�������ݣ�
'1.��ӵ���ģʽ���ֶ��������ݽ���



'////////////////////////////////////////////////////////////////////////////

'���ȡ�����˳�Information_Input���壬��OUTRader_Main����
Private Sub CommandButton_cancel_Click()
Information_Input.Hide
OUTReader_Main.Show 0
End Sub

'���ȷ������ʼ��ȡ����
Private Sub CommandButton_OK_Click()
Information_Input.TextBox_Folder.Text = OUTReader_Main.TextBox_Path_2.Text
Information_Input.Hide
If OUTReader_Main.OptionButton_Excel Then
Call Test_XX(2)
End If

'��OUT�����ж�ȡ����
If OUTReader_Main.OptionButton_OUT Then
Call Debug_Mode(2)
'OUTReader_Main.TextBox_Path_2.Text = OUTReader_Main.TextBox_Path_2.Text & "\" & ThisWorkbook.name
'OUTReader_Main.TextBox_Path_2.Text = ThisWorkbook.Path
Call Test_XX(2)
End If

'Dim WB_New_Full As String
'Dim WB_Orig_Full As String
'WB_Orig_Full = OUTReader_Main.TextBox_Path_2.Text
'WB_New_Full = OUTReader_Main.TextBox_Path_3.Text
'Path = Workbooks(WB_Orig).Worksheets("debug").Cells(2, 2)
'Debug.Print Path
'Call Data_Summarization(WB_Orig_Full, WB_New_Full)
End Sub

Public Sub Debug_Mode(X As Integer)
X = 1

'��������ʱ��
Dim start As Single
start = Timer

ThisWorkbook.Activate
OUTReader_Main.Hide

'==========================================================================================������Ҫ��������

Dim Path As String
'Dim General, Distribution, Program As String


'--------------------------------------------------------------ɾ��ԭ������
'Dim i_s As Integer
'For i_s = Sheets.Count To 1 Step -1
    'Sheets(i_s).Cells.Clear
'Next


'--------------------------------------------------------------��ȡ���ݴ洢·��
Path = OUTReader_Main.TextBox_Path_2.Text


'==========================================================================================��ȡPKPM����
If OUTReader_Main.CheckBox_PKPM_2 Then

    '----------------------------------------------------------���ɱ���ͷ
    'Program = "PKPM"
    'General = "General_" & Program
    'Distribution = "Distribution_" & Program
    'Call Addsh(General)
   ' Call Addsh(Distribution)
    Call Addsh("g_P")
    Call Addsh("d_P")
    Call AddHeadline("g_P", "d_P")

    '----------------------------------------------------------д��wmass.out�ļ�����(Ĭ�ϱ���ѡ��)

    'OptionButton_WPJF.Locked = True
    'OptionButton_WPJA.Locked = True
    Sheets("d_P").Select
    ActiveWindow.Zoom = 55
    Call OUTReader_PKPM_WMASS(Path)

    '----------------------------------------------------------д��wzq.out�ļ�����
    Sheets("d_P").Select
    ActiveWindow.Zoom = 55
    Call OUTReader_PKPM_WZQ(Path)

    '----------------------------------------------------------д��wdisp.out�ļ�����
    Sheets("d_P").Select
    Call OUTReader_PKPM_WDISP(Path)
    Sheets("g_P").Select

End If

'==========================================================================================��ȡYJK����
If OUTReader_Main.CheckBox_YJK_2 Then

    '----------------------------------------------------------���ɱ���ͷ
    'Program = "YJK"
    'General = "General_" & Program
    'Distribution = "Distribution_" & Program
    'Call Addsh(General)
   ' Call Addsh(Distribution)
    Call Addsh("g_Y")
    Call Addsh("d_Y")
    Call AddHeadline("g_Y", "d_Y")

    '----------------------------------------------------------д��wmass.out�ļ�����(Ĭ�ϱ���ѡ��)

    'OptionButton_WPJF.Locked = True
    'OptionButton_WPJA.Locked = True
    Sheets("d_Y").Select
    ActiveWindow.Zoom = 55
    Call OUTReader_YJK_WMASS(Path)

    '----------------------------------------------------------д��wzq.out�ļ�����
    Sheets("d_Y").Select
    ActiveWindow.Zoom = 55
    Call OUTReader_YJK_WZQ(Path)
        
    '----------------------------------------------------------д��wdisp.out�ļ�����
    Sheets("d_Y").Select
    Call OUTReader_YJK_WDISP(Path)
    Sheets("g_Y").Select
            
End If

'==========================================================================================��ȡMBuilding����
If OUTReader_Main.CheckBox_MBuilding_2 Then

    '----------------------------------------------------------���ɱ���ͷ
    'Program = "MBuilding"
    'General = "General_" & Program
    'Distribution = "Distribution_" & Program
    'Call Addsh(General)
   ' Call Addsh(Distribution)
    Call Addsh("g_M")
    Call Addsh("d_M")
    Call AddHeadline("g_M", "d_M")

    '----------------------------------------------------------д��wmass.out�ļ�����(Ĭ�ϱ���ѡ��)
        'OptionButton_WPJF.Locked = True
        'OptionButton_WPJA.Locked = True
        Sheets("d_M").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_MBuilding_����Ϣ(Path)
        Call OUTReader_MBuilding_����ն�(Path)
        Call OUTReader_MBuilding_����������(Path)

    '----------------------------------------------------------д��wzq.out�ļ�����
    Sheets("d_M").Select
    ActiveWindow.Zoom = 55
    Call OUTReader_MBuilding_��������(Path)
        
    '----------------------------------------------------------д��wdisp.out�ļ�����
    Sheets("d_M").Select
    Call OUTReader_MBuilding_�ṹλ��(Path)
    Sheets("g_M").Select
            
End If


OUTReader_Main.Show 0

MsgBox "�ķ�ʱ��: " & Timer - start

End Sub

Private Sub Label6_Click()

End Sub

Private Sub TextBox_Operate_Change()

End Sub

Private Sub TextBox_Stage_Change()

End Sub

Private Sub UserForm_Click()

End Sub

