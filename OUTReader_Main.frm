VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} OUTReader_Main 
   Caption         =   "Main"
   ClientHeight    =   6810
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7200
   OleObjectBlob   =   "OUTReader_Main.frx":0000
   StartUpPosition =   2  '��Ļ����
End
Attribute VB_Name = "OUTReader_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/4/29
'1.�������ر���ֵ��bug


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/4//19
'1.���ETABS����



'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/7/05
'1.�޸���ȡ֧������ʱ�Ĵ���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/19
'1.�Թ�������-ѡ��·������Ӵ���
'2.�޸ġ�ģ�ͶԱȡ��С���ѡ����
'3.�޸ķ�������


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.��ģ��·���ļ�����D���¡�
'2.���ETABS��������������ĶԱȡ�


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/4/18
'1.���·��д�����������


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/4/2
'1.����ģʽ����δѡ�����������ʾ


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/28
'1.�����ETABS V9��ѡ��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/24
'1.����·����Ĭ��ֵ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/18
'1.�նȱ�������ť����YJK����


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/8
'1.����ETABS������ȡҳ�漰���룬�����²�


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/3
'1.���¶�ȡ�ļ�·����䣬Ĭ�ϴ򿪵�ǰ�ļ������ļ���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/9
'1.���������������棬������ȡ�����ı�׼��������Ϲ�����У�˵�


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/7
'1.������ļ���·��ʱ�򿪵�ǰ�ļ���

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/5
'1.�޸ġ�ģ�ͶԱȡ��µ���Ϣѡ�ʹ��ֵ�ܸ���ȫ����Χ�������Է��������������Ӧ�û��Щ���Ժ�ɸĽ���

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/4
'1.��Ӧ����ǽ�ܼ���Ϣ��ȡģ���޸İ�ť����
'2.���Ӷ�ȡǽ��������İ�ť
'3.ɾ���ֹ�����ֲ����
'4.���ڰ����е�ɾ�����б�񣬱������ص�ǽ�����wallrebar

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/12/11
'1.��ȡ����ǽ�ܼ���Ϣ���ַ�����������У������޸�ǽ��ţ��ٽ������ݶ�ȡ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/27
'1.���»�ͼ���򡣣����ڹ�˾��������ʹ�ã��ڼ���ʹ��ʱ������ɷ�Ӧ�����߻ᵯ��һ��·��ѡ���ȡ����Ӱ��������У�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/25
'1.��ӹ�����,�������ݶԱȴ���;
'2.���ɾ�����й�����ť���������ˣ����費��Ҫ�ṩʹ�ã��Ϳ�ݼ�alt+m��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/16
'1.��������ɺ�ͼ�����ɷֿ�
'2.������,��ColumnInfo��ΪCI
'3.���Ա�����PKPM��YJKѡ�����PKPMĬ��ѡ�У�YJK��ʱ����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�
'2.ɾ�������ϵ�˵��

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/8/4

'�������ݣ�
'1.����·��д����룻


'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/7/30 21:30

'�������ݣ�
'1.����ģʽ�й�����·����ʼֵ��Ϊ�����������ļ���·������OUTĬ�������Ӧ


'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/7/29 19:50

'�������ݣ�
'1.���MBuildingģ��
'2.������Ա�ģ��
'3.�޸��˵���ģʽ����ĳЩ����
'4.����ȫ¥�����ײ���ѹ�ȴ���

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/7/23 13:50

'�������ݣ�
'1.�޸Ŀ�ݼ����ã����ڿ�ݼ��ѿ���ʹ��
'2.���ģ�����ݱ�ѡȡ·�����ڣ�����ֱ�ӵ���������������general��������
'3.���·�����ʼĬ��ֵ���鿴ģʽ������·��Ϊ����������·��������ģʽģ�����ݱ�ͻ������ݱ�Ĭ��Ϊ�������ڹ�������


'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/7/20 21:50

'�������ݣ�
'1.����ģ�͵��Ի������ݣ����ǲ�֪������������⣬�Ӵ�����ֱ�ӵ���Data_Summarizationģ�����ǳ��ִ������ǿ�һ����ʲôԭ��Ŀǰ��ͨ��һ���м�ģ��ת����һ�Ρ�

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/7/16 18:50

'�������ݣ�
'1.����д����general����ѹ�ȴ���

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/7/3 20:21

'�������ݣ�
'1.����YJKѡ��
'2.��ͼ����YJK��PKPM

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/6/27 22��23

'�������ݣ�
'1.��WPJ��Ϊ��ѡ��

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/6/27

'�������ݣ�
'1.���DYNA��DYNA��ͼ��
'2.����WMASS��
'3.���


'////////////////////////////////////////////////////////////////////////////


'����ʱ��:2013/6/06

'�������ݣ�
'1.WPJ���ֲܷ�
'2.����������ֵ�λ��˳��
'3.������ʱλ�ƽ����ݵ�λ�ã���Ϊ��ɫ�����أ�
'4.���˵����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/05/

'�������ݣ�
'1.Ϊ���尴ť��ӿ�ݼ�
'2.���ӻ�ͼ����


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/04/

'�������ݣ�
'1.�����д�������˹��������ƣ����в��ԣ�������Խ�����������Ҳ����Ϊ��������������������
'2.��Mainģ���е�һЩ������ֲ���˴����У���select��zoom��"���ײ�ǽ�������ѹ�ȼ��乹�����д��general"��
'3.������˳���ť����ҿ��費��Ҫ��
'4.�Ը�ѡ���Ĭ��״̬���������ã�ԭ����Ĭ��ȫѡ��Wmass�ļ�����Ҫ���������������Ϣ��Ĭ��ѡ�в�����������YJK��Dyna�ļ��������ƣ�Ĭ��δѡ���������������Ժ����ƺ������
'5.��ģ��������һģ�飬���������ô򿪵Ŀ�ݼ�F2���رմ�������F2�������壻��Ӧ��ThisWorkbook���������Ӧ���룻
'6.����ѡ���ļ���·����ť��
'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/01/ 17:57


'////////////////////////////////////////////////////////////////////////////



'==========================================================================================���Ա�ͼ����
'���Ա�ͼ�����ɰ�ť
Private Sub CompareS_Figure_Click()
'��������ʱ��
Dim start As Single
start = Timer

OUTReader_Main.Hide


If CheckBox6_PKPM Then
    '�����ӳ���
    Call OUTReader_PKPM_CompareS_figure
End If
OUTReader_Main.Show 0

MsgBox "�ķ�ʱ��: " & Timer - start

End Sub



'==========================================================================================���Աȱ�񴰿�
'���Աȱ�����ɰ�ť
Private Sub CompareS_tabale_Click()
'��������ʱ��
Dim start As Single
start = Timer

OUTReader_Main.Hide

'������Ҫ��������

Dim path1 As String, path2 As String
Dim startf As Integer, endf As Integer

'��ȡĿ¼·��
path1 = OUTReader_Main.TextBox_path_xz.Text
path2 = OUTReader_Main.TextBox_path_zz.Text
'��ȡ���
startf = OUTReader_Main.TextBox_startf.Text
endf = OUTReader_Main.TextBox_endf.Text

'�����ӳ���
If CheckBox6_PKPM Then

    Call OUTReader_PKPM_CompareS_table(path1, path2, startf, endf)
    
End If

OUTReader_Main.Show 0

MsgBox "�ķ�ʱ��: " & Timer - start

End Sub

Private Sub AllMem_CommandButton5_Click()

Mem_S.Value = 1
If soft_YJK Then
    Mem_E.Value = allmem_Y(Dic_TextBox.Text, F_Num_TextBox.Value)
    Else: If soft_PKPM Then Mem_E.Value = allmem_P(Dic_TextBox.Text, F_Num_TextBox.Value)
End If

End Sub





'=============================================================================��Ƭǽ����У��_���ɱ��
Private Sub FormCreate_Click()
'ģ�ͱ��ť
'���ɱ���ʽ
'��������ʱ��
Dim start As Single
start = Timer


Dim path1 As String
path1 = Dic_TextBox.Text

'����PKPM��ǽ����У�˱��
If soft_PKPM Then

    If Refer_F Then
        Debug.Print path1
        Call member_info_f(path1, M_Num_TextBox.Value, FLoor_S.Value, Floor_E.Value, "P", "M" & M_Num_TextBox.Value)
        MsgBox "���޸�ǽ��ź����С����ݶ�ȡ��"
    End If
    
    If Refer_M Then
        Debug.Print path1
        Call member_info_m(path1, F_Num_TextBox.Value, Mem_S.Value, Mem_E.Value, "P", "F" & F_Num_TextBox.Value)
    End If
    
End If

'����YJK��ǽ����У�˱��
If soft_YJK Then

    If Refer_F Then
        Debug.Print path1
        Call member_info_f(path1, M_Num_TextBox.Value, FLoor_S.Value, Floor_E.Value, "Y", "M" & M_Num_TextBox.Value)
        MsgBox "���޸�ǽ��ź����С����ݶ�ȡ��"
    End If
    
    If Refer_M Then
        Debug.Print path1
        Call member_info_m(path1, F_Num_TextBox.Value, Mem_S.Value, Mem_E.Value, "Y", "F" & F_Num_TextBox.Value)
    End If
    
End If


'Sheets("d_M").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
'Sheets("d_M").Columns("B:C").NumberFormatLocal = "0.00"

OUTReader_Main.Show 0

'ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start

End Sub

'=============================================================================���������ļ���·����ȡ
Private Sub Get_Dic_MD_Click()

Dim fd As FileDialog
Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFolderPicker)
If fd.Show = -1 Then MD_path.Text = fd.SelectedItems(1)

End Sub

Private Sub Frame1_Click()

End Sub

Private Sub Frame2_Click()

End Sub

Private Sub Frame23_Click()

End Sub

Private Sub Frame4_Click()

End Sub

Private Sub Label54_Click()

End Sub

Private Sub Label51_Click()

End Sub

Private Sub Label57_Click()

End Sub

Private Sub Label9_Click()

End Sub

'=============================================================================��Ϲ�����ȡ_��ȡ����
Private Sub LoadComb_Click()

'��������ʱ��
Dim start As Single
start = Timer

If MD_YJK Then

    Call LOADCOMB_WC_Y(MD_path.Text)
    
End If


If MD_PKPM Then

    Call LOADCOMB_WC_P(MD_path.Text)
    
End If


MsgBox "�ķ�ʱ��: " & Timer - start

End Sub


Private Sub MD_BEAM_CheckBox_Click()

End Sub

Private Sub MD_WC_CheckBox_Click()

End Sub

Private Sub MultiPage1_Change()

End Sub

'=============================================================================��������У��

Private Sub SigleMem_check_Click()

'��������ʱ��
Dim start As Single
start = Timer

Dim Path As String
Path = MD_path.Text

Dim shname As String

If MD_YJK Then
     
     If MD_WC_CheckBox Then
        shname = "Y_WCC_F" & MD_FLO2.Value
        Call SingleWallData_Y(Path, shname, MD_FLO2.Value, MD_NUM.Value)
    End If
    
     If MD_C_CheckBox Then
        shname = "Y_CC_F" & MD_FLO2.Value
        Call SingleColData_Y(Path, shname, MD_FLO2.Value, MD_NUM.Value, "C")
    End If
    
     If MD_GC_CheckBox Then
        shname = "Y_GC_F" & MD_FLO2.Value
        Call SingleColData_Y(Path, shname, MD_FLO2.Value, MD_NUM.Value, "G")
    End If
    
End If


If MD_PKPM Then
     
     If MD_WC_CheckBox Then
        shname = "P_WCC_F" & MD_FLO2.Value
    End If
    
    Call SingleWallData_P(Path, shname, MD_FLO2.Value, MD_NUM.Value)
    
End If


'ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start

End Sub


'=============================================================================����������ȡ_��ȡ����

Private Sub MD_ALL_Click()

'��������ʱ��
Dim start As Single
start = Timer

Dim Path As String
Path = MD_path.Text

Dim shname As String


If MD_YJK Then
     
     If MD_WC_CheckBox Then
        shname = "Y_WCD_F" & MD_FLO.Value
        Call WallData_Y(Path, shname, MD_FLO.Value)
    End If
    
    If MD_C_CheckBox Then
        shname = "Y_CD_F" & MD_FLO.Value
        Call ColData_Y(Path, shname, MD_FLO.Value, "C")
    End If
    
    If MD_GC_CheckBox Then
        shname = "Y_GD_F" & MD_FLO.Value
        Call ColData_Y(Path, shname, MD_FLO.Value, "G")
    End If
    
    If MD_BEAM_CheckBox Then
        shname = "Y_BEAM_F" & MD_FLO.Value
        Call BeamData_Y(Path, shname, MD_FLO.Value, "G")
    End If
    
End If


If MD_PKPM Then
     
     If MD_WC_CheckBox Then
        shname = "P_WCD_F" & MD_FLO.Value
        Call WallData_P(Path, shname, MD_FLO.Value)
    End If
    
'    If MD_C_CheckBox Then
'        shname = "P_CD_F" & MD_FLO.Value
'        Call ColData_P(Path, shname, MD_FLO.Value, "C")
'    End If
'
'    If MD_GC_CheckBox Then
'        shname = "P_GD_F" & MD_FLO.Value
'        Call ColData_P(Path, shname, MD_FLO.Value, "G")
'
'    End If
    
End If

'ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start

End Sub



'=============================================================================��Ƭǽ����У��_��ȡ����

Private Sub ReadData_Click()
'ģ�ͱ��ť
'���ݶ�ȡ

'��������ʱ��
Dim start As Single
start = Timer


Dim path1 As String
path1 = Dic_TextBox.Text


Dim i As Integer

If soft_PKPM Then

    If Refer_F Then
        For i = CStr(FLoor_S.Value) To CStr(Floor_E.Value)
            Call PKPM_Wall_Info_F(path1, i, "P", "M" & M_Num_TextBox.Value)
        Next
    End If
    
    If Refer_M Then
        For i = CStr(Mem_S.Value) To CStr(Mem_E.Value)
            Call PKPM_Wall_Info_M(path1, i, "P", "F" & F_Num_TextBox.Value)
        Next
    End If
    
End If

If soft_YJK Then

    If Refer_F Then
        For i = CStr(FLoor_S.Value) To CStr(Floor_E.Value)
            Call YJK_Wall_Info_F(path1, i, "Y", "M" & M_Num_TextBox.Value)
        Next
    End If
    
    If Refer_M Then
        For i = CStr(Mem_S.Value) To CStr(Mem_E.Value)
            Call YJK_Wall_Info_M(path1, i, "Y", "F" & F_Num_TextBox.Value)
        Next
    End If
    
End If


'Sheets("d_M").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
'Sheets("d_M").Columns("B:C").NumberFormatLocal = "0.00"

OUTReader_Main.Show 0

'ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start
End Sub

'=============================================================================��Ƭǽ����У��_���ɱ��

'ģ�ͱ��ť
Private Sub FigureData_Click()

'��������ʱ��
Dim start As Single
start = Timer

If soft_PKPM Then

    If Refer_F Then
        Call member_wall_f("P", "M" & M_Num_TextBox.Value)
    End If
    
    If Refer_M Then
        Call member_wall_m("P", "F" & F_Num_TextBox.Value)
    End If
    
End If

If soft_YJK Then

    If Refer_F Then
        Call member_wall_f("Y", "M" & M_Num_TextBox.Value)
    End If
    
    If Refer_M Then
        Call member_wall_m("Y", "F" & F_Num_TextBox.Value)
    End If
    
End If
    

'Sheets("d_M").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
'Sheets("d_M").Columns("B:C").NumberFormatLocal = "0.00"

OUTReader_Main.Show 0

'ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start

End Sub



Private Sub TextBox_Path_2_Change()

End Sub

'Ϊ���尴ť��ӿ�ݼ� �����ô���ɹ������������������.�ѿ���ʹ��
Private Sub UserForm_Initialize()
    'page_1.Accelerator = "1" 'ѡ��·����ALT+1
    'Page_2.Accelerator = "2" 'ѡ��·����ALT+2
    OUTReader_Main.Get_Dic.Accelerator = "a" 'ѡ��·����ALT+A
    OUTReader_Main.Get_dic_2.Accelerator = "o" 'ѡ��ģ�����ݹ�������ALT+O
    OUTReader_Main.Get_dic_3.Accelerator = "n" 'ѡ����ܹ�������ALT+N
    OUTReader_Main.Get_Data.Accelerator = "d" '���ݱ��ALT+D
    OUTReader_Main.Get_Figure.Accelerator = "c" '����ͼ��ALT+C
    OUTReader_Main.Get_Figure_Dyna.Accelerator = "t" '����ʱ��ͼ��ALT+T
    OUTReader_Main.QuitButton.Accelerator = "q" '�˳�����ALT+Q
    OUTReader_Main.Data_Summarize.Accelerator = "s" '�������ݣ�ALT+S
    OUTReader_Main.dsheets.Accelerator = "m" 'ɾ�����й�����ALT+m
    
    OUTReader_Main.TextBox_Path.Text = ThisWorkbook.Path '����·����ʼĬ��ֵ
    OUTReader_Main.TextBox_Path_2.Text = ThisWorkbook.Path  'ģ�����ݹ���·����ʼĬ��ֵ
    OUTReader_Main.TextBox_Path_3.Text = ThisWorkbook.Path & "\" & ThisWorkbook.name 'ģ�ͻ��ܹ�������ʼĬ��ֵΪ��xlsm
    OUTReader_Main.TextBox_path_xz.Text = ThisWorkbook.Path 'С����·����ʼĬ��ֵ
    OUTReader_Main.TextBox_path_zz.Text = ThisWorkbook.Path '������·����ʼĬ��ֵ
    OUTReader_Main.Dic_TextBox.Text = ThisWorkbook.Path 'ǽ�ܼ����㹤��·����ʼĬ��ֵ
    OUTReader_Main.MD_path.Text = ThisWorkbook.Path '������������·����ʼĬ��ֵ
    OUTReader_Main.TextBox_Path_ETABS.Text = ThisWorkbook.Path 'ETABS����·����ʼĬ��ֵ
    
  
End Sub

'ѡ��Ŀ¼��ť
Private Sub Get_Dic_31_Click()
Dim fd As FileDialog
Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFolderPicker)
If fd.Show = -1 Then TextBox_path_xz.Text = fd.SelectedItems(1)
End Sub

'ѡ��Ŀ¼��ť
Private Sub Get_Dic_32_Click()
Dim fd As FileDialog
Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFolderPicker)
If fd.Show = -1 Then TextBox_path_zz.Text = fd.SelectedItems(1)
End Sub

'ѡ��Ŀ¼��ť
Private Sub Get_Dic_6_Click()

Dim fd As FileDialog
Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFolderPicker)

If fd.Show = -1 Then
Dic_TextBox.Text = fd.SelectedItems(1)
End If

If Not Sheets("d_P").Cells(3, 1) = "" Then
    Num_all = Sheets("d_P").range("a65536").End(xlUp)
    Floor_E.Value = Num_all
End If

End Sub


'ѡ��Ŀ¼��ť
Private Sub CommandButton9_Click()

Dim fd As FileDialog
Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFolderPicker)
If fd.Show = -1 Then
MD_path.Text = fd.SelectedItems(1)
End If


End Sub




'=============================================================================���Դ���

'���ɵ���ģ�ͻ�����Ϣ
Private Sub Data_Summarize_Click()
If OUTReader_Main.CheckBox_PKPM_2.Value = False And OUTReader_Main.CheckBox_YJK_2.Value = False And OUTReader_Main.CheckBox_MBuilding_2.Value = False Then
    MsgBox ("��ѡ����������")
    Exit Sub
End If

OUTReader_Main.Hide
Information_Input.Show 0

End Sub

'����ģʽ���ݱ�ѡ��
Private Sub Get_dic_2_Click()
Dim fd As FileDialog
'��Excel�ж�ȡ����
If OptionButton_Excel Then
    Application.FileDialog(msoFileDialogFilePicker).InitialFileName = ThisWorkbook.Path & "\"
    Set fd = Application.FileDialog(msoFileDialogFilePicker)
    fd.Filters.Clear
    fd.Filters.Add "Excel Files", "*.xls*"
    If fd.Show = -1 Then OUTReader_Main.TextBox_Path_2 = fd.SelectedItems(1)
'    Dim WBToWrite As String
'    WBToWrite = Application.GetOpenFilename("Excel Files (*.xlsm), *.xlsm")
'    If WBToWrite <> "False" Then
'        OUTReader_Main.TextBox_Path_2 = WBToWrite
'    End If
End If

'��OUT�����ж�ȡ����
If OptionButton_OUT Then
    Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
    Set fd = Application.FileDialog(msoFileDialogFolderPicker)
    If fd.Show = -1 Then TextBox_Path_2.Text = fd.SelectedItems(1)
End If
End Sub

'����ģʽ���ܱ�ѡ��
Private Sub Get_dic_3_Click()
    Dim fd As FileDialog
    Application.FileDialog(msoFileDialogFilePicker).InitialFileName = ThisWorkbook.Path & "\"
    Set fd = Application.FileDialog(msoFileDialogFilePicker)
    fd.Filters.Clear
    fd.Filters.Add "Excel Files", "*.xls*"
    If fd.Show = -1 Then OUTReader_Main.TextBox_Path_3 = fd.SelectedItems(1)
    'Dim WBToWrite As String
    'WBToWrite = Application.GetOpenFilename("Excel Files (*.xls*), *.xls*")
    'If WBToWrite <> "False" Then
    '    OUTReader_Main.TextBox_Path_3 = WBToWrite
'End If
End Sub


'=============================================================================�鿴����

'ѡ��Ŀ¼��ť
Private Sub Get_Dic_Click()
Dim fd As FileDialog
Application.FileDialog(msoFileDialogFolderPicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFolderPicker)
If fd.Show = -1 Then TextBox_Path.Text = fd.SelectedItems(1)
End Sub

'���ɱ��ť
Private Sub Get_Data_Click()
'On Error Resume Next
'��������ʱ��
Dim start As Single
start = Timer


OUTReader_Main.Hide

'==========================================================================================������Ҫ��������

Dim Path As String
Dim general, Distribution, Program As String


'--------------------------------------------------------------ɾ��ԭ������
'Dim i_s As Integer
'For i_s = Sheets.Count To 1 Step -1
    'Sheets(i_s).Cells.Clear
'Next


'--------------------------------------------------------------��ȡ���ݴ洢·��
Path = OUTReader_Main.TextBox_Path.Text


'==========================================================================================��ȡPKPM����
If CheckBox_PKPM Then

 Open "d:\dic.ini" For Output As #1
        Print #1, Path
    Close #1

    '----------------------------------------------------------���ɱ���ͷ
    'Program = "PKPM"
    'General = "General_" & Program
    'Distribution = "Distribution_" & Program
    'Call Addsh(General)
   ' Call Addsh(Distribution)
    Call Addsh("g_P")
    Call Addsh("d_P")
    Call Addsh("CR_P")
    Call Addsh("WR_P")
    Call AddHeadline("g_P", "d_P", "CR_P", "WR_P")
    Sheets("g_P").Cells(3, 4) = Path


    '----------------------------------------------------------д��wmass.out�ļ�����(Ĭ�ϱ���ѡ��)
    If CheckBox_WMASS Then
        'OptionButton_WPJF.Locked = True
        'OptionButton_WPJA.Locked = True
        Sheets("d_P").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_PKPM_WMASS(Path)
    End If

    '----------------------------------------------------------д��wzq.out�ļ�����
    If CheckBox_WZQ Then
        Sheets("d_P").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_PKPM_WZQ(Path)
    End If

    '----------------------------------------------------------д��wdisp.out�ļ�����
    If CheckBox_WDISP Then
        Sheets("d_P").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_PKPM_WDISP(Path)
    End If

    '----------------------------------------------------------д��wpj.out�ļ�����
    If CheckBox_WPJF Then
        Sheets("CR_P").Select
        ActiveWindow.Zoom = 70
        Sheets("WR_P").Select
        ActiveWindow.Zoom = 70
        Call OUTReader_PKPM_WPJ_UC(Path, Num_Base + 1)
    '------------------------------------���ײ�ǽ�������ѹ�ȼ��乹�����д��general
        Sheets("g_P").Cells(8, 5) = Sheets("d_P").Cells(Num_Base + 3, 56)
        Sheets("g_P").Cells(8, 7) = Round(Sheets("d_P").Cells(Num_Base + 3, 57), 1)
        Sheets("g_P").Cells(9, 5) = Sheets("d_P").Cells(Num_Base + 3, 58)
        Sheets("g_P").Cells(9, 7) = Round(Sheets("d_P").Cells(Num_Base + 3, 59), 1)
    End If
    If CheckBox_WPJA Then
        Sheets("CR_P").Select
        ActiveWindow.Zoom = 70
        Sheets("WR_P").Select
        ActiveWindow.Zoom = 70
        Dim i As Integer
        For i = 1 To Num_all
            Call OUTReader_PKPM_WPJ_UC(Path, i)
        Next
    '------------------------------------��ȫ¥��ǽ�������ѹ�ȼ��乹�����д��general
        Sheets("g_P").Cells(8, 5) = Sheets("d_P").Cells(Num_Base + 3, 56)
        Sheets("g_P").Cells(8, 7) = Round(Sheets("d_P").Cells(Num_Base + 3, 57), 1)
        Sheets("g_P").Cells(9, 5) = Sheets("d_P").Cells(Num_Base + 3, 58)
        Sheets("g_P").Cells(9, 7) = Round(Sheets("d_P").Cells(Num_Base + 3, 59), 1)
    End If



    '----------------------------------------------------------д��wv02q.out�ļ�����
    If CheckBox_WV02Q Then
        Sheets("d_P").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_PKPM_WV02Q(Path)
    End If

    '----------------------------------------------------------д��wdyna.out�ļ�����
    If CheckBox_WDYNA Then
        Call Addsh("e_P")
        Sheets("e_P").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_PKPM_WDYNA(Path)
    End If
    
    Call gaoliang("P")
    
    '����С�����λ��
    Sheets("d_P").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
    Sheets("d_P").Columns("B:C").NumberFormatLocal = "0.00"
    Sheets("d_P").Columns("AT:AU").NumberFormatLocal = "0.00"
    Sheets("d_P").Columns("AH:AS").NumberFormatLocal = "0.00"
    Sheets("d_P").Columns("BB:BB").NumberFormatLocal = "0.0"
    Sheets("d_P").Columns("BC:BC").NumberFormatLocal = "0.00"
    
    Sheets("g_P").Select

' Open "d:\dic.ini" For Output As #1
'        Print #1, Path
'    Close #1

End If

'==========================================================================================��ȡYJK����
If CheckBox_YJK Then

 Open "d:\dic.ini" For Output As #1
        Print #1, Path
    Close #1

    '----------------------------------------------------------���ɱ���ͷ
    'Program = "YJK"
    'General = "General_" & Program
    'Distribution = "Distribution_" & Program
    'Call Addsh(General)
   ' Call Addsh(Distribution)
    Call Addsh("g_Y")
    Call Addsh("d_Y")
    Call Addsh("CR_Y")
    Call Addsh("WR_Y")
    Call AddHeadline("g_Y", "d_Y", "CR_Y", "WR_Y")
    Sheets("g_Y").Cells(3, 4) = Path
    
        
    '----------------------------------------------------------д��wmass.out�ļ�����(Ĭ�ϱ���ѡ��)
    If CheckBox_WMASS Then
        'OptionButton_WPJF.Locked = True
        'OptionButton_WPJA.Locked = True
        Sheets("d_Y").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_YJK_WMASS(Path)
    End If
        
    '----------------------------------------------------------д��wzq.out�ļ�����
    If CheckBox_WZQ Then
        Sheets("d_Y").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_YJK_WZQ(Path)
    End If
        
    '----------------------------------------------------------д��wdisp.out�ļ�����
    If CheckBox_WDISP Then
        Sheets("d_Y").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_YJK_WDISP(Path)
    End If
    
    '----------------------------------------------------------д��wpj.out�ļ�����
    If CheckBox_WPJF Then
        Sheets("CR_Y").Select
        ActiveWindow.Zoom = 70
        Sheets("WR_Y").Select
        ActiveWindow.Zoom = 70
        Call OUTReader_YJK_WPJ_UC(Path, Num_Base + 1)
    '------------------------------------���ײ�ǽ�������ѹ�ȼ��乹�����д��general
        Sheets("g_Y").Cells(8, 5) = Sheets("d_Y").Cells(Num_Base + 3, 56)
        Sheets("g_Y").Cells(8, 7) = Round(Sheets("d_Y").Cells(Num_Base + 3, 57))
        Sheets("g_Y").Cells(9, 5) = Sheets("d_Y").Cells(Num_Base + 3, 58)
        Sheets("g_Y").Cells(9, 7) = Round(Sheets("d_Y").Cells(Num_Base + 3, 59))
    End If
    If CheckBox_WPJA Then
        Sheets("CR_Y").Select
        ActiveWindow.Zoom = 70
        Sheets("WR_Y").Select
        ActiveWindow.Zoom = 70
        For i = 1 To Num_all
            Call OUTReader_YJK_WPJ_UC(Path, i)
        Next
    '------------------------------------��ȫ¥��ǽ�������ѹ�ȼ��乹�����д��general
        Sheets("g_Y").Cells(8, 5) = Sheets("d_Y").Cells(Num_Base + 3, 56)
        Sheets("g_Y").Cells(8, 7) = Round(Sheets("d_Y").Cells(Num_Base + 3, 57))
        Sheets("g_Y").Cells(9, 5) = Sheets("d_Y").Cells(Num_Base + 3, 58)
        Sheets("g_Y").Cells(9, 7) = Round(Sheets("d_Y").Cells(Num_Base + 3, 59))
    End If
 
    '----------------------------------------------------------д��wv02q.out�ļ�����
    If CheckBox_WV02Q Then
        Sheets("d_Y").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_YJK_WV02Q(Path)
    End If
    
    '----------------------------------------------------------д��wdyna.out�ļ�����
    If CheckBox_WDYNA Then
        Call Addsh("e_YJK")
        Sheets("e_YJK").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_YJK_WDYNA(Path)
    End If
    
     Call gaoliang("Y")

'    Open "d:\dic.ini" For Output As #1
'        Print #1, Path
'    Close #1
    
    '����С�����λ��
    Sheets("d_Y").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
    Sheets("d_Y").Columns("B:C").NumberFormatLocal = "0.00"
    Sheets("d_Y").Columns("AT:AU").NumberFormatLocal = "0.00"
    Sheets("d_Y").Columns("AH:AS").NumberFormatLocal = "0.00"
    
    Sheets("g_Y").Select
        
End If


'==========================================================================================��ȡMBuilding����

If CheckBox_MBuilding Then

 Open "d:\dic.ini" For Output As #1
        Print #1, Path
    Close #1

    '----------------------------------------------------------���ɱ���ͷ
    'Program = "MBuilding"
    'General = "General_" & Program
    'Distribution = "Distribution_" & Program
    'Call Addsh(General)
   ' Call Addsh(Distribution)
    Call Addsh("g_M")
    Call Addsh("d_M")
    Call Addsh("CR_M")
    Call Addsh("WR_M")
    Call AddHeadline("g_M", "d_M", "CR_M", "WR_M")
    Sheets("g_M").Cells(3, 4) = Path
    
        
    '----------------------------------------------------------д��wmass.out�ļ�����(Ĭ�ϱ���ѡ��)
    If CheckBox_WMASS Then
        'OptionButton_WPJF.Locked = True
        'OptionButton_WPJA.Locked = True
        Sheets("d_M").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_MBuilding_����Ϣ(Path)
        Call OUTReader_MBuilding_����ն�(Path)
        Call OUTReader_MBuilding_����������(Path)
    End If
        
    '----------------------------------------------------------д��wzq.out�ļ�����
    If CheckBox_WZQ Then
        Sheets("d_M").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_MBuilding_��������(Path)
    End If
        
    '----------------------------------------------------------д��wdisp.out�ļ�����
    If CheckBox_WDISP Then
        Sheets("d_M").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_MBuilding_�ṹλ��(Path)
    End If
    
    '----------------------------------------------------------д��wpj.out�ļ�����
    If CheckBox_WPJF Then
        Sheets("CR_M").Select
        ActiveWindow.Zoom = 70
        Sheets("WR_M").Select
        ActiveWindow.Zoom = 70
        Call OUTReader_MBuilding_�������_UC(Path, Num_Base + 1)
    '------------------------------------���ײ�ǽ�������ѹ�ȼ��乹�����д��general
        Sheets("g_M").Cells(8, 5) = Sheets("d_M").Cells(Num_Base + 3, 56)
        Sheets("g_M").Cells(8, 7) = Round(Sheets("d_M").Cells(Num_Base + 3, 57))
        Sheets("g_M").Cells(9, 5) = Sheets("d_M").Cells(Num_Base + 3, 58)
        Sheets("g_M").Cells(9, 7) = Round(Sheets("d_M").Cells(Num_Base + 3, 59))
    End If
    If CheckBox_WPJA Then
        Sheets("CR_M").Select
        ActiveWindow.Zoom = 70
        Sheets("WR_M").Select
        ActiveWindow.Zoom = 70
        For i = 1 To Num_all
            Call OUTReader_MBuilding_�������_UC(Path, i)
        Next
    '------------------------------------��ȫ¥��ǽ�������ѹ�ȼ��乹�����д��general
        Sheets("g_M").Cells(8, 5) = Sheets("d_M").Cells(Num_Base + 3, 56)
        Sheets("g_M").Cells(8, 7) = Round(Sheets("d_M").Cells(Num_Base + 3, 57))
        Sheets("g_M").Cells(9, 5) = Sheets("d_M").Cells(Num_Base + 3, 58)
        Sheets("g_M").Cells(9, 7) = Round(Sheets("d_M").Cells(Num_Base + 3, 59))
    End If
 
    '----------------------------------------------------------д��wv02q.out�ļ�����
    If CheckBox_WV02Q Then
        Sheets("d_M").Select
        ActiveWindow.Zoom = 55
        Call OUTReader_MBuilding_�������(Path)
    End If
    
'    '----------------------------------------------------------д��wdyna.out�ļ�����
'    If CheckBox_WDYNA Then
'        Call Addsh("Elastic_Dynamic_MBuilding")
'        Sheets("Elastic_Dynamic_MBuilding").Select
'        ActiveWindow.Zoom = 55
'        Call OUTReader_MBuilding_WDYNA(path)
'    End If

     Call gaoliang("M")

'Open "d:\dic.ini" For Output As #1
'        Print #1, Path
'    Close #1

    Sheets("d_M").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"
    Sheets("d_M").Columns("B:C").NumberFormatLocal = "0.00"
    Sheets("d_M").Columns("AT:AU").NumberFormatLocal = "0.00"
    Sheets("d_M").Columns("AH:AS").NumberFormatLocal = "0.000"
    Sheets("d_M").Columns("BB:BB").NumberFormatLocal = "0.0"

    Sheets("g_M").Select
    
End If




OUTReader_Main.Show 0

MsgBox "�ķ�ʱ��: " & Timer - start

End Sub


'�����˳�����ť
Sub QuitButton_Click()
    If Workbooks.Count > 1 Then
        ThisWorkbook.Close
    Else
        Application.Quit
    End If
End Sub


'������ʾʱͨ����ESC���˳����壬��Button�ؼ��Ѿ�����С�����˳�������F2���ã���ʱ����
'Private Sub CommandButtonP_Click()
'End
'End Sub

'��Ӧ�����ݻ�ͼ��ť
Private Sub Get_Figure_Click()

'��������ʱ��
Dim start As Single
start = Timer

If CheckBox_PKPM Then

    Call OUTReader_Figure_Data("PKPM")
    
ElseIf CheckBox_YJK Then
    
    Call OUTReader_Figure_Data("YJK")
    
ElseIf CheckBox_MBuilding Then
    
    Call OUTReader_Figure_Data("MBuilding")
    
End If

    
OUTReader_Main.Show 0

MsgBox "�ķ�ʱ��: " & Timer - start

End Sub

'ʱ�����߻�ͼ��ť
Private Sub Get_Figure_Dyna_Click()

'��������ʱ��
Dim start As Single
start = Timer

'Sheets("figure_dyna").Select

If CheckBox_PKPM Then

    Call OUTReader_Figure_Dyna("e_P")
  
ElseIf CheckBox_YJK Then
    
    Call OUTReader_Figure_Dyna("e_YJK")
        
End If

OUTReader_Main.Show 0

ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start


End Sub
'������ֵ��ť
Private Sub LimitGe_Click()


If Height_TextBox.Text <= 150 Then
    DisLimit_TextBox.Text = DisLimit150_TextBox.Text
ElseIf Height_TextBox.Text >= 250 Then
    DisLimit_TextBox.Text = 500
Else
    DisLimit_TextBox.Text = 1 / (1 / DisLimit150_TextBox.Text + (Height_TextBox.Text - 150) / 100 * (1 / 500 - 1 / DisLimit150_TextBox.Text))
    DisLimit_TextBox.Text = Int(DisLimit_TextBox.Text)
End If

If Intensity_TextBox.Text = 6 Then
    If PeriodX_TextBox < 3.5 Then
        RatioLimitX_TextBox.Text = 0.8
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitX_TextBox.Text = 0.6
    Else
        RatioLimitX_TextBox.Text = 0.8 - (PeriodX_TextBox.Text - 3.5) / 1.5 * (0.8 - 0.6)
        RatioLimitX_TextBox.Text = Round(RatioLimitX_TextBox.Text, 2)
    End If
    
    If PeriodY_TextBox < 3.5 Then
        RatioLimitY_TextBox.Text = 0.8
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitY_TextBox.Text = 0.6
    Else
        RatioLimitY_TextBox.Text = 0.8 - (PeriodY_TextBox.Text - 3.5) / 1.5 * (0.8 - 0.6)
        RatioLimitY_TextBox.Text = Round(RatioLimitY_TextBox.Text, 2)
    End If
ElseIf Intensity_TextBox.Text = 7 Then
    If PeriodX_TextBox < 3.5 Then
        RatioLimitX_TextBox.Text = 1.6
    ElseIf PeriodX_TextBox.Text > 5 Then
        'Debug.Print PeriodX_TextBox.Text
        RatioLimitX_TextBox.Text = 1.2
    Else
        RatioLimitX_TextBox.Text = 1.6 - (PeriodX_TextBox.Text - 3.5) / 1.5 * (1.6 - 1.2)
        RatioLimitX_TextBox.Text = Round(RatioLimitX_TextBox.Text, 2)
    End If
    
    If PeriodY_TextBox < 3.5 Then
        RatioLimitY_TextBox.Text = 1.6
    ElseIf PeriodY_TextBox.Text > 5 Then
        Debug.Print PeriodX_TextBox.Text
        RatioLimitY_TextBox.Text = 1.2
    Else
        RatioLimitY_TextBox.Text = 1.6 - (PeriodY_TextBox.Text - 3.5) / 1.5 * (1.6 - 1.2)
        RatioLimitY_TextBox.Text = Round(RatioLimitY_TextBox.Text, 2)
    End If
ElseIf Intensity_TextBox.Text = 7.5 Then
    If PeriodX_TextBox < 3.5 Then
        RatioLimitX_TextBox.Text = 2.4
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitX_TextBox.Text = 1.8
    Else
        RatioLimitX_TextBox.Text = 2.4 - (PeriodX_TextBox.Text - 3.5) / 1.5 * (2.4 - 1.8)
        RatioLimitX_TextBox.Text = Round(RatioLimitX_TextBox.Text, 2)
    End If
    
    If PeriodY_TextBox < 3.5 Then
        RatioLimitY_TextBox.Text = 2.4
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitY_TextBox.Text = 1.8
    Else
        RatioLimitY_TextBox.Text = 2.4 - (PeriodY_TextBox.Text - 3.5) / 1.5 * (2.4 - 1.8)
        RatioLimitY_TextBox.Text = Round(RatioLimitY_TextBox.Text, 2)
    End If
ElseIf Intensity_TextBox.Text = 8 Then
    If PeriodX_TextBox < 3.5 Then
        RatioLimitX_TextBox.Text = 3.2
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitX_TextBox.Text = 2.4
    Else
        RatioLimitX_TextBox.Text = 3.2 - (PeriodX_TextBox.Text - 3.5) / 1.5 * (3.2 - 2.4)
        RatioLimitX_TextBox.Text = Round(RatioLimitX_TextBox.Text, 2)
    End If
    
    If PeriodY_TextBox < 3.5 Then
        RatioLimitY_TextBox.Text = 3.2
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitY_TextBox.Text = 2.4
    Else
        RatioLimitY_TextBox.Text = 3.2 - (PeriodY_TextBox.Text - 3.5) / 1.5 * (3.2 - 2.4)
        RatioLimitY_TextBox.Text = Round(RatioLimitY_TextBox.Text, 2)
    End If
ElseIf Intensity_TextBox.Text = 8.5 Then
    If PeriodX_TextBox < 3.5 Then
        RatioLimitX_TextBox.Text = 4.8
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitX_TextBox.Text = 3.6
    Else
        RatioLimitX_TextBox.Text = 4.8 - (PeriodX_TextBox.Text - 3.5) / 1.5 * (4.8 - 3.6)
        RatioLimitX_TextBox.Text = Round(RatioLimitX_TextBox.Text, 2)
    End If
    
    If PeriodY_TextBox < 3.5 Then
        RatioLimitY_TextBox.Text = 4.8
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitY_TextBox.Text = 3.6
    Else
        RatioLimitY_TextBox.Text = 4.8 - (PeriodY_TextBox.Text - 3.5) / 1.5 * (4.8 - 3.6)
        RatioLimitY_TextBox.Text = Round(RatioLimitY_TextBox.Text, 2)
    End If
ElseIf Intensity_TextBox.Text = 9 Then
    If PeriodX_TextBox < 3.5 Then
        RatioLimitX_TextBox.Text = 6.4
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitX_TextBox.Text = 4.8
    Else
        RatioLimitX_TextBox.Text = 6.4 - (PeriodX_TextBox.Text - 3.5) / 1.5 * (6.4 - 4.8)
        RatioLimitX_TextBox.Text = Round(RatioLimitX_TextBox.Text, 2)
    End If
    
    If PeriodY_TextBox < 3.5 Then
        RatioLimitY_TextBox.Text = 6.4
    ElseIf PeriodX_TextBox.Text > 5 Then
        RatioLimitY_TextBox.Text = 4.8
    Else
        RatioLimitY_TextBox.Text = 6.4 - (PeriodY_TextBox.Text - 3.5) / 1.5 * (6.4 - 4.8)
        RatioLimitY_TextBox.Text = Round(RatioLimitY_TextBox.Text, 2)
    End If
Else
    MsgBox "��������ȷ������Ҷȣ�"
End If


OUTReader_Main.Show 0

ThisWorkbook.Save


End Sub


'ģ�ͶԱȻ�ͼ��ť
Private Sub CommandButton4_Figure_Click()

'��������ʱ��
Dim start As Single
start = Timer

If CheckBox4_PKPM And CheckBox4_MBuilding Then
    Call FigureCompare("d_P", "d_M", "SATWE", "Midas")
End If

If CheckBox4_PKPM And CheckBox4_YJK Then
    Call FigureCompare("d_P", "d_Y", "SATWE", "YJK")
End If

If CheckBox4_YJK And CheckBox4_MBuilding Then
    Call FigureCompare("d_Y", "d_M", "YJK", "Midas")
End If

If CheckBox4_ETABS And CheckBox4_MBuilding Then
    Call FigureCompare("d_E", "d_M", "ETABS", "Midas")
End If

If CheckBox4_ETABS And CheckBox4_PKPM Then
    Call FigureCompare("d_P", "d_E", "SATWE", "ETABS")
End If

If CheckBox4_ETABS And CheckBox4_YJK Then
    Call FigureCompare("d_E", "d_Y", "ETABS", "YJK")
End If
    


OUTReader_Main.Show 0

ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start


End Sub


'ģ�ͱ��ť
Private Sub CommandButton4_Data_Click()

'��������ʱ��
Dim start As Single
start = Timer


If CheckBox4_PKPM And CheckBox4_MBuilding Then
    Call DataCompare("g_P", "g_M", "d_P", "d_M")
End If

If CheckBox4_PKPM And CheckBox4_YJK Then
    Call DataCompare("g_P", "g_Y", "d_P", "d_Y")
End If

If CheckBox4_YJK And CheckBox4_MBuilding Then
    Call DataCompare("g_Y", "g_M", "d_Y", "d_M")
End If

If CheckBox4_ETABS And CheckBox4_MBuilding Then
    Call DataCompare("g_E", "g_M", "d_E", "d_M")
End If

If CheckBox4_ETABS And CheckBox4_PKPM Then
    Call DataCompare("g_E", "g_P", "d_E", "d_P")
End If

If CheckBox4_ETABS And CheckBox4_YJK Then
    Call DataCompare("g_E", "g_Y", "d_E", "d_Y")
End If

    


OUTReader_Main.Show 0

ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start
End Sub

'ģ�ͱ��ť
Private Sub CommandButton4_FigureAll_Click()

'��������ʱ��
Dim start As Single
start = Timer

Call CompareFigureAll


OUTReader_Main.Show 0

ThisWorkbook.Save
MsgBox "�ķ�ʱ��: " & Timer - start
End Sub




'PKPM&YJK�նȱ�������ť
Private Sub modi_Click()

If CheckBox4_PKPM Then
    Call modi_stiff
    MsgBox "PKPM�նȼ��նȱ��������"
    Else
    Call modi_stiff_Y
    MsgBox "YJK�նȼ��նȱ��������"
End If



End Sub

'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Private Sub dsheets_Click()
Dim i As Integer
For i = Worksheets.Count To 3 Step -1
    Application.DisplayAlerts = False
    Worksheets(i).Delete
    Application.DisplayAlerts = True
Next
End Sub

Private Sub ��ͼ��ֵ_Click()

End Sub

Private Sub �ṹ��Ϣ_Click()

End Sub

'=======================================================================================================ETABS�鿴

Private Sub Get_ETABS_Path_Click()
'��MDB�ж�ȡ����
Dim fd As FileDialog
Application.FileDialog(msoFileDialogFilePicker).InitialFileName = ThisWorkbook.Path & "\"
Set fd = Application.FileDialog(msoFileDialogFilePicker)
fd.Filters.Clear
fd.Filters.Add "Access Databases", "*.mdb,*.accdb"
If fd.Show = -1 Then OUTReader_Main.TextBox_Path_ETABS = fd.SelectedItems(1)

'��MDB�ж�ȡ����
'If Option_ETABS_MDB Then
'    Dim WBToWrite As String
'    WBToWrite = Application.GetOpenFilename("Access Files (*.mdb), *.mdb")
'    If WBToWrite <> "False" Then
'        OUTReader_Main.TextBox_Path_ETABS = WBToWrite
'    End If
'End If

End Sub


Private Sub ETABS_Read_LOAD_Click()
'��ȡETABS���ع�������������������Ӧ��ѡ��
Dim MDB_Path As String

MDB_Path = OUTReader_Main.TextBox_Path_ETABS.Text

Call Etabs_Load_Case(MDB_Path)

End Sub

Private Sub Read_ETABS_Data_Click()
'��ȡETABS����
Dim MDB_Path As String
MDB_Path = OUTReader_Main.TextBox_Path_ETABS.Text

'������
Call Addsh("g_E")
Call Addsh("d_E")
Call AddHeadline("g_E", "d_E")
Sheets("g_E").Cells(3, 4) = MDB_Path

Call ETABS_DATA_READ(MDB_Path)
Call ETABS_HIST_DATA(MDB_Path)

Call gaoliang("E")

End Sub
Private Sub ETABSMOB_Click()
'��ȡETABSλ�ƽǼ��ر�����

Call ETABS_DATA_CALC("ETABSMOB")
'Debug.Print "aa"

End Sub


Private Sub Fig_ETABS_Click()
'ETABS��Ӧ�����ݻ�ͼ
Call OUTReader_Figure_Data("ETABS")

End Sub


Private Sub ETABS_HISTFIG_Click()
'ETABSʱ�̷������ݻ�ͼ
Call ETABS_HIST_Fig("e_E")
End Sub


