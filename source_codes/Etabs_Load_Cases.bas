Attribute VB_Name = "Etabs_Load_Cases"

'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                        ETABS���ع���ѡ��                             ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/4/12��24
'��������:
'1.ETABS���ع���ѡ����Դ�MDB�ļ��ж�ȡ


Public Sub Etabs_Load_Case(MDB_Path As String)

'===================================================================================================��ȡ���ع���

'�������
Dim E_Connect As New ADODB.Connection
Dim E_RcdSet As New ADODB.Recordset
Dim StrSQL As String
Dim Static_Cases(), Spec_Cases(), Hist_Cases(), GDSpec_Cases() As String
Dim N_Static, N_Spec, N_Hist As Long
Dim GD As Integer '��Ӹ��ж��Ƿ�������ӹ涨ˮƽ��ѡ��

GD = 0

'�ж�Access�ļ��Ƿ����

If Dir(MDB_Path) = " " Then
  MsgBox "MDB�ļ������ڣ����ʵ��", vbExclamation, "�޷��������ݿ�"
  Exit Sub
End If

'ʹ��ADO����Access�ļ�
'����Access 2007 ���߰汾EXCEL
Set E_Connect = New ADODB.Connection
E_Connect.CursorLocation = adUseClient
E_Connect.Open ConnectionString:="Provider=Microsoft.Ace.OLEDB.12.0;" & "Data Source =" & MDB_Path & ";" '& "Extended Properties=Excel 12.0;"
'�������ڰ汾��Access��Excelʹ��
'myConnect.Open ConnectionString:="Provider=Microsoft.Jet.OLEDB.12.0;" & "Data Source =" & MDB_Path & ";" & "Extended Properties=Excel 8.0;"


If OUTReader_Main.Option_E_V13 Then

    '��ȡ�������������������
    StrSQL = "Select Distinct [Name] From [Load Cases - Summary] Where [Type] Like '%Static'AND Not([Name] Like '~%')"
    
    Set E_RcdSet = New ADODB.Recordset
    E_RcdSet.Open StrSQL, E_Connect, 3, 2
    
    N_Static = E_RcdSet.RecordCount
    ReDim Static_Cases(N_Static - 1)
    For i = 0 To E_RcdSet.RecordCount - 1
      Static_Cases(i) = E_RcdSet.Fields("Name").Value
      'Debug.Print Static_Cases(i)
      E_RcdSet.MoveNext
    Next i
    
    '��ȡ��Ӧ�׹���
    StrSQL = "Select Distinct [Name] From [Load Cases - Summary] Where [Type] Like '%Spectrum'"
    
    Set E_RcdSet = New ADODB.Recordset
    E_RcdSet.Open StrSQL, E_Connect, 3, 2
    
    N_Spec = E_RcdSet.RecordCount
    If N_Spec = 0 Then
        MsgBox "ȱ�ٷ�Ӧ�׹�����"
    Else
        ReDim Spec_Cases(N_Static - 1)
        For i = 0 To E_RcdSet.RecordCount - 1
          Spec_Cases(i) = E_RcdSet.Fields("Name").Value
          'Debug.Print Spec_Cases(i)
          E_RcdSet.MoveNext
        Next i
    End If
    
'    '��ȡʱ�̹���
'    StrSQL = "Select Distinct [Name] From [Load Cases - Summary] Where [Type] Like '%History'"
'
'    Set E_RcdSet = New ADODB.Recordset
'    E_RcdSet.Open StrSQL, E_Connect, 3, 2
'
'    'N_Hist = E_RcdSet.RecordCount
'    If N_Hist = 0 Then '-------------------------------------------------------------------------------------------------------------------����б�
'        MsgBox "ȱ��ʱ�̹���"
'    Else
'        ReDim Hist_Cases(E_RcdSet.RecordCount - 1)
'        For i = 0 To E_RcdSet.RecordCount - 1
'          Hist_Cases(i) = E_RcdSet.Fields("Name").Value
'          'Debug.Print Hist_Cases(i)
'          E_RcdSet.MoveNext
'        Next i
'    End If
    
ElseIf OUTReader_Main.Option_E_V9 Then

   '��ȡ�������������������
    StrSQL = "Select Distinct [Case] From [Static Load Cases] Where [Type] Like '%WIND'"
    
    Set E_RcdSet = New ADODB.Recordset
    E_RcdSet.Open StrSQL, E_Connect, 3, 2
    
    N_Static = E_RcdSet.RecordCount
    
    If N_Static = 0 Then
        MsgBox "���ع���û��ѡ��!"
        Exit Sub
    Else
        ReDim Static_Cases(N_Static - 1)
    End If
    
    For i = 0 To E_RcdSet.RecordCount - 1
      Static_Cases(i) = E_RcdSet.Fields("Case").Value
      'Debug.Print Static_Cases(i)
      E_RcdSet.MoveNext
    Next i
    
   '��ȡ�����������涨ˮƽ��
    StrSQL = "Select Distinct [Case] From [Static Load Cases] Where [Type] Like '%QUAKE'"
    
    Set E_RcdSet = New ADODB.Recordset
    E_RcdSet.Open StrSQL, E_Connect, 3, 2
    
    N_Static = E_RcdSet.RecordCount
    
    If N_Static = 0 Then
        MsgBox "�涨ˮƽ������û��ѡ��!"
        'Exit Sub
    Else
        GD = 1
        ReDim GDSpec_Cases(N_Static - 1)
    End If
    
    For i = 0 To E_RcdSet.RecordCount - 1
      GDSpec_Cases(i) = E_RcdSet.Fields("Case").Value
      'Debug.Print Static_Cases(i)
      E_RcdSet.MoveNext
    Next i
    
    '��ȡ��Ӧ�׹���
    StrSQL = "Select Distinct [Case] From [Response Spectrum Cases]"
    
    Set E_RcdSet = New ADODB.Recordset
    E_RcdSet.Open StrSQL, E_Connect, 3, 2
    
    N_Spec = E_RcdSet.RecordCount
    If N_Spec = 0 Then
        MsgBox "ȱ�ٷ�Ӧ�׹�����"
    Else
        ReDim Spec_Cases(N_Spec - 1)
        For i = 0 To E_RcdSet.RecordCount - 1
          Spec_Cases(i) = E_RcdSet.Fields("Case").Value
          'Debug.Print Spec_Cases(i)
          E_RcdSet.MoveNext
        Next i
    End If
    
'    '��ȡʱ�̹���
'    StrSQL = "Select Distinct [Name] From [Load Cases - Summary] Where [Type] Like '%History'"
'
'    Set E_RcdSet = New ADODB.Recordset
'    E_RcdSet.Open StrSQL, E_Connect, 3, 2
'
'    N_Hist = E_RcdSet.RecordCount
'    If N_Hist = 0 Then '-------------------------------------------------------------------------------------------------------------------����б�
'        MsgBox "ȱ��ʱ�̹���"
'    Else
'        ReDim Hist_Cases(E_RcdSet.RecordCount - 1)
'        For i = 0 To E_RcdSet.RecordCount - 1
'          Hist_Cases(i) = E_RcdSet.Fields("Name").Value
'          'Debug.Print Hist_Cases(i)
'          E_RcdSet.MoveNext
'        Next i
'    End If
    
End If

'�ر�Access�ļ�
E_RcdSet.Close
Set E_RcdSet = Nothing
E_Connect.Close
Set E_Connect = Nothing

'===================================================================================================���帴�Ͽ��б�

If GD = 0 Then
'��Ӧ�׹���
OUTReader_Main.ComboBox_SPEC_X.List = Spec_Cases
OUTReader_Main.ComboBox_SPEC_XEcc.List = Spec_Cases
OUTReader_Main.ComboBox_SPEC_Y.List = Spec_Cases
OUTReader_Main.ComboBox_SPEC_YEcc.List = Spec_Cases

ElseIf GD = 1 Then

'��Ӧ�׹���
OUTReader_Main.ComboBox_SPEC_X.List = Spec_Cases
OUTReader_Main.ComboBox_SPEC_XEcc.List = GDSpec_Cases
OUTReader_Main.ComboBox_SPEC_XEcc2.List = GDSpec_Cases
OUTReader_Main.ComboBox_SPEC_XGD.List = GDSpec_Cases
OUTReader_Main.ComboBox_SPEC_Y.List = Spec_Cases
OUTReader_Main.ComboBox_SPEC_YEcc.List = GDSpec_Cases
OUTReader_Main.ComboBox_SPEC_YEcc2.List = GDSpec_Cases
OUTReader_Main.ComboBox_SPEC_YGD.List = GDSpec_Cases

End If

'����ع���
OUTReader_Main.ComboBox_Wind_X.List = Static_Cases
OUTReader_Main.ComboBox_Wind_Y.List = Static_Cases

'ʱ�̹���
If N_Hist > 1 Then '-------------------------------------------------------------------------------------------------------------------����б�
OUTReader_Main.ListBox_TH_X.List = Hist_Cases
OUTReader_Main.ListBox_TH_Y.List = Hist_Cases
End If

End Sub
