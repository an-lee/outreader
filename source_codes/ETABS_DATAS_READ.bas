Attribute VB_Name = "ETABS_DATAS_READ"
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                           ETABS���ݶ�ȡ                              ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/4/15
'��������:
'1.���������Ӹ�Ϊ��������ϵ��;


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/4/4
'��������:
'1.���ӵ����������ȡ �� Frame Shear Ratios In Dual Systems And Modifiers ���㸲�����ȡ �� Frame Overturning Moments In Dual Systems
'2.����general��նȱ���ȡ����
'3.���Ӱ汾��ʱ��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/29
'��������:
'1.������V9�Ĵ���:λ�ƺͿ�ܼ���������
'2.��exit sub �����˵�����ֱ��exit̫�ֱ���~


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/28
'��������:
'1.������V9�Ĵ���;
'2.����˸նȱ���⣨�����˸նȱȲ��֣�


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/11
'��������:
'1.ĳһ������λ�Ʊ����ݲ�����X��Y��ѡ�����������ȥ���������� [Direction] IN ('X')��[Direction] IN ('Y')
'2.etabsλ�Ʊ����ʱ��δ��������¥�㲻������ݣ�ȫΪ0��λ�Ʊ�Ϊ�գ���ע��
'3.����¥����������


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/6
'��������:
'1.ETABS������ȡ��Ŀǰд����ȡStory Data, Modal Direction Factors, Modal Participating Mass Ratios,
'Story Drifts, Story Max/Avg Displacements, Story Forces, Story Stiffness, Shear Gravity Ratios.
'2.Ŀǰȱ�ٸնȱȣ������ֲ�����Ϣ��û����etabs2013���ѡ�����ҵ�


Public Sub ETABS_DATA_READ(MDB_Path As String)

'�������
Dim E_Connect As ADODB.Connection
Dim E_RcdSet As ADODB.Recordset
Dim E_RxSchema As ADODB.Recordset

Dim StrSQL As String

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


'================================================================================================================�� Story Data
  
  Dim Story_N() As String
  
  '��ȡ¥����
    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
        StrSQL = "Select [Name],[Height] From [Story Data] Order By [Elevation] ASC"
    ElseIf OUTReader_Main.Option_E_V9 Then
        StrSQL = "Select [Story],[Height] From [Story Data] Order By [Elevation] ASC"
        'Debug.Print StrSQL
    End If
        'StrSQL = "Select [Name],[Height] From [Story Data] Order By [Elevation] ASC"
  
  Set E_RcdSet = New ADODB.Recordset
  E_RcdSet.Open StrSQL, E_Connect, 3, 2
  
  Num_all = E_RcdSet.RecordCount - 1
  ReDim Story_N(Num_all, 2)
  For i = 0 To Num_all
    Story_N(i, 0) = i
    
    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
        Story_N(i, 1) = E_RcdSet.Fields("Name").Value
    ElseIf OUTReader_Main.Option_E_V9 Then
        Story_N(i, 1) = E_RcdSet.Fields("Story").Value
        'Debug.Print StrSQL
    End If
    
    'Story_N(i, 1) = E_RcdSet.Fields("Name").Value
    Story_N(i, 2) = E_RcdSet.Fields("Height").Value
    'Debug.Print Story_N(i, 0) & "," & Story_N(i, 1) & "," & Story_N(i, 2)
    E_RcdSet.MoveNext
  Next i
  
  'д��¥���źͲ��
  For i = 1 To Num_all
    
    Sheets("d_E").Cells(i + 2, 1) = Story_N(i, 0)
    Sheets("d_E").Cells(i + 2, 60) = Story_N(i, 2)
    
  Next i
  
  If OUTReader_Main.ComboBox_SPEC_X.Text = "" And OUTReader_Main.ComboBox_SPEC_XEcc.Text = "" And OUTReader_Main.ComboBox_SPEC_Y.Text = "" And OUTReader_Main.ComboBox_Wind_X.Text = "" And OUTReader_Main.ComboBox_Wind_Y.Text = "" Then
    Exit Sub
  End If
            
            
'================================================================================================================�� Program Control

If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�

    StrSQL = "Select [ProgramName],[Version],[Level] From [Program Control]"
    Set E_RcdSet = New ADODB.Recordset
    E_RcdSet.Open StrSQL, E_Connect, 3, 2
    
    Sheets("g_E").Cells(4, 4) = E_RcdSet.Fields("ProgramName").Value & " V" & E_RcdSet.Fields("Version").Value & " " & E_RcdSet.Fields("Level").Value
    
ElseIf OUTReader_Main.Option_E_V9 Then

    Sheets("g_E").Cells(4, 4) = "ETABS V9"
    'Debug.Print StrSQL
End If

Sheets("g_E").Cells(4, 7).Formula = "=Today()"
        

'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%���ݽ����ȡ
'�жϸ����Ƿ����Ȼ���ȡ��Ӧ����
Set E_RxSchema = E_Connect.OpenSchema(20)

Do Until E_RxSchema.EOF

  If UCase(E_RxSchema("TABLE_TYPE")) = "TABLE" Then
  'Debug.Print E_RxSchema("TABLE_TYPE") & "," & E_RxSchema("TABLE_NAME")
      
      Select Case (E_RxSchema("TABLE_NAME"))
      
      
        '===============================================================================================================�� Modal Direction Factors
        Case ("Modal Direction Factors")
          Dim N_M As Long
          
          '��ȡ���ͼ���������
          StrSQL = "Select [Period],[UX],[UY],[RZ] From [Modal Direction Factors]" ' Order By [Mode] ASC"
          
          Set E_RcdSet = New ADODB.Recordset
          E_RcdSet.Open StrSQL, E_Connect, 3, 2
          
          'N_M = E_RcdSet.RecordCount
          N_M = 10
          Sheets("g_E").Cells(38, 7) = N_M
          
          If N_M > 10 Then N_M = 10
          
          For i = 1 To N_M
            Sheets("g_E").Cells(i + 27, 4) = E_RcdSet.Fields("Period").Value
            Sheets("g_E").Cells(i + 27, 6) = Format(E_RcdSet.Fields("UX").Value, "0.00") & "+" & Format(E_RcdSet.Fields("UY").Value, "0.00")
            Sheets("g_E").Cells(i + 27, 7) = E_RcdSet.Fields("RZ").Value
            E_RcdSet.MoveNext
          Next i
          
          Call ETABS_DATA_CALC("Modal Direction Factors")
          
        
        '===============================================================================================================�� Modal Participating Mass Ratios
        Case ("Modal Participating Mass Ratios")
          '��ȡ������������ϵ��
          StrSQL = "Select [Mode],[UX],[UY],[RZ] ,[SumUX],[SumUY] From [Modal Participating Mass Ratios]"
          
          Set E_RcdSet = New ADODB.Recordset
          E_RcdSet.Open StrSQL, E_Connect, 3, 2
          For i = 1 To 10 '----------------------------------------------------------------------------------------------------------------------------------------------------------���
            Sheets("g_E").Cells(i + 27, 6) = Format(E_RcdSet.Fields("UX").Value, "0.00") & "+" & Format(E_RcdSet.Fields("UY").Value, "0.00")
            Sheets("g_E").Cells(i + 27, 7) = Format(E_RcdSet.Fields("RZ").Value, "0.00")
            E_RcdSet.MoveNext
          Next i
          
          E_RcdSet.MoveLast
          
          Sheets("g_E").Cells(39, 5) = E_RcdSet.Fields("SumUX")
          Sheets("g_E").Cells(39, 7) = E_RcdSet.Fields("SumUY")
          
          Sheets("g_E").Cells(27, 6) = "��������ϵ����X+Y��"
          Sheets("g_E").Cells(27, 7) = "��������ϵ����Z��"
          

          
                
          
        '==================================================================================================================�� Story Drifts
        Case ("Story Drifts")
                  
          '��ȡˮƽ���������λ�ƽ�X
          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & " Max')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftX] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
                'Debug.Print StrSQL
            End If
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EXλ�ƽ����ݲ��㣡~"
            Else
                For i = Num_all To 1 Step -1
                  'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
                  
                    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                        Sheets("d_E").Cells(i + 2, 26) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                    ElseIf OUTReader_Main.Option_E_V9 Then
                        Sheets("d_E").Cells(i + 2, 26) = Round(1 / E_RcdSet.Fields("DriftX").Value, 0)
                        'Debug.Print StrSQL
                    End If
                    
                  'Sheets("d_E").Cells(i + 2, 26) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                  E_RcdSet.MoveNext
                Next i
            End If
          End If
          
          '��ȡˮƽ���������λ�ƽ�X+
          If OUTReader_Main.ComboBox_SPEC_XEcc.Text <> "" Then
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & " Max')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftX] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & "')"
            'Debug.Print StrSQL
            End If
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EX+λ�ƽ����ݲ��㣡"
            Else
            
                For i = Num_all To 1 Step -1
                  'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
                    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                        Sheets("d_E").Cells(i + 2, 27) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                    ElseIf OUTReader_Main.Option_E_V9 Then
                        Sheets("d_E").Cells(i + 2, 27) = Round(1 / E_RcdSet.Fields("DriftX").Value, 0)
                        'Debug.Print StrSQL
                    End If
                    
                  'Sheets("d_E").Cells(i + 2, 27) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                  E_RcdSet.MoveNext
                Next i
            End If
                    
            '��ȡˮƽ���������λ�ƽ�X-
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & " Max')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftX] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & "')"
            'Debug.Print StrSQL
            End If
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EX-λ�ƽ����ݲ��㣡"
            Else

            
                For i = Num_all To 1 Step -1
                  'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
                    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                        Sheets("d_E").Cells(i + 2, 28) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                    ElseIf OUTReader_Main.Option_E_V9 Then
                        Sheets("d_E").Cells(i + 2, 28) = Round(1 / E_RcdSet.Fields("DriftX").Value, 0)
                        'Debug.Print StrSQL
                    End If
                  'Sheets("d_E").Cells(i + 2, 28) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                  E_RcdSet.MoveNext
                Next i
            
            End If
          End If
          
          '��ȡ����ز��λ�ƽ�X
          If OUTReader_Main.ComboBox_Wind_X.Text <> "" Then
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftX] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [Load] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
            'Debug.Print StrSQL
            End If
            
               'StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "WXλ�ƽ����ݲ��㣡~"
            Else
                For i = Num_all To 1 Step -1
                  'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
                  
                    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                        Sheets("d_E").Cells(i + 2, 29) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                    ElseIf OUTReader_Main.Option_E_V9 Then
                        Sheets("d_E").Cells(i + 2, 29) = Round(1 / E_RcdSet.Fields("DriftX").Value, 0)
                        'Debug.Print StrSQL
                    End If
                    
                  'Sheets("d_E").Cells(i + 2, 29) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                  E_RcdSet.MoveNext
                Next i
            End If
          End If
          
          '��ȡˮƽ���������λ�ƽ�Y
          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & " Max')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftY] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
            'Debug.Print StrSQL
            End If
            
                'StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EYλ�ƽ����ݲ��㣡"
            Else
            
                For i = Num_all To 1 Step -1
                  'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
                  
                    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                        Sheets("d_E").Cells(i + 2, 30) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                    ElseIf OUTReader_Main.Option_E_V9 Then
                        Sheets("d_E").Cells(i + 2, 30) = Round(1 / E_RcdSet.Fields("DriftY").Value, 0)
                        'Debug.Print StrSQL
                    End If
                    
                  'Sheets("d_E").Cells(i + 2, 30) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                  E_RcdSet.MoveNext
                Next i
            End If
          End If
          
          '��ȡˮƽ���������λ�ƽ�Y+
          If OUTReader_Main.ComboBox_SPEC_YEcc.Text <> "" Then
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " Max')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftY] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & "')"
            'Debug.Print StrSQL
            End If
            
                'StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EY+λ�ƽ����ݲ��㣡"
            Else

            
                For i = Num_all To 1 Step -1
                  'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
                
                    If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                        Sheets("d_E").Cells(i + 2, 31) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                    ElseIf OUTReader_Main.Option_E_V9 Then
                        Sheets("d_E").Cells(i + 2, 31) = Round(1 / E_RcdSet.Fields("DriftY").Value, 0)
                        'Debug.Print StrSQL
                    End If
                    
                  'Sheets("d_E").Cells(i + 2, 31) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                  E_RcdSet.MoveNext
                Next i
            
            End If
            
            '��ȡˮƽ���������λ�ƽ�Y-
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " Max')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftY] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & "')"
            'Debug.Print StrSQL
            End If
            
                'StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EY-λ�ƽ����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
              
                If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                    Sheets("d_E").Cells(i + 2, 32) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                ElseIf OUTReader_Main.Option_E_V9 Then
                    Sheets("d_E").Cells(i + 2, 32) = Round(1 / E_RcdSet.Fields("DriftY").Value, 0)
                    'Debug.Print StrSQL
                End If
                
              'Sheets("d_E").Cells(i + 2, 32) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          '��ȡ����ز��λ�ƽ�Y
          If OUTReader_Main.ComboBox_Wind_Y.Text <> "" Then
            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
            ElseIf OUTReader_Main.Option_E_V9 Then
                StrSQL = "Select [Story],[DriftY] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [Load] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
            'Debug.Print StrSQL
            End If
            
                'StrSQL = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "WYλ�ƽ����ݲ��㣡~"
            Else
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")

                If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
                    Sheets("d_E").Cells(i + 2, 33) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
                ElseIf OUTReader_Main.Option_E_V9 Then
                    Sheets("d_E").Cells(i + 2, 33) = Round(1 / E_RcdSet.Fields("DriftY").Value, 0)
                    'Debug.Print StrSQL
                End If
                
              'Sheets("d_E").Cells(i + 2, 33) = Round(1 / E_RcdSet.Fields("Drift").Value, 0)
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          Call ETABS_DATA_CALC("Story Drifts")
          
        '==================================================================================================================�� Story Max/Avg Displacements '----------------------------------V9�������
        Case ("Story Max/Avg Displacements")
          '��ȡ�涨ˮƽ������λ��X
          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EXλ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 18) = E_RcdSet.Fields("Average").Value
              Sheets("d_E").Cells(i + 2, 34) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ�涨ˮƽ������λ��X+
          If OUTReader_Main.ComboBox_SPEC_XEcc.Text <> "" Then
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX+λ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 19) = E_RcdSet.Fields("Average").Value
              Sheets("d_E").Cells(i + 2, 35) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
                      
            '��ȡ�涨ˮƽ������λ��X-
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX-λ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 20) = E_RcdSet.Fields("Average").Value
              Sheets("d_E").Cells(i + 2, 36) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ�����λ��X
          If OUTReader_Main.ComboBox_Wind_X.Text <> "" Then
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "WXλ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 21) = E_RcdSet.Fields("Average").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ�涨ˮƽ������λ��Y
          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EYλ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 22) = E_RcdSet.Fields("Average").Value
              Sheets("d_E").Cells(i + 2, 37) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ�涨ˮƽ������λ��Y+
          If OUTReader_Main.ComboBox_SPEC_YEcc.Text <> "" Then
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where  [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EY+λ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 23) = E_RcdSet.Fields("Average").Value
              Sheets("d_E").Cells(i + 2, 38) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
                    
            '��ȡ�涨ˮƽ������λ��Y-
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EY-λ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 24) = E_RcdSet.Fields("Average").Value
              Sheets("d_E").Cells(i + 2, 39) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          '��ȡ�����λ��Y
          If OUTReader_Main.ComboBox_Wind_Y.Text <> "" Then
            StrSQL = "Select [Story],[Average],[Ratio] From [Story Max/Avg Displacements] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "WYλ�����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 25) = E_RcdSet.Fields("Average").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          Call ETABS_DATA_CALC("Story Max/Avg Displacements")
          
        '==================================================================================================================�� Story Forces
        Case ("Story Forces")
          '��ȡˮƽ�������X��"���Y"
          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
            StrSQL = "Select [Story],[VX],[MY] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 10) = E_RcdSet.Fields("VX").Value
              Sheets("d_E").Cells(i + 2, 11) = E_RcdSet.Fields("MY").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡˮƽ�������Y��"���X"
          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
            StrSQL = "Select [Story],[VY],[MX] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & " Max')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EY������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 14) = E_RcdSet.Fields("VY").Value
              Sheets("d_E").Cells(i + 2, 15) = E_RcdSet.Fields("MX").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ����ؼ���X�����Y������ָ�ֵ������ȡ�˾���ֵ
          If OUTReader_Main.ComboBox_Wind_X.Text <> "" Then
            StrSQL = "Select [Story],[VX],[MY] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "WX�������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 6) = Abs(E_RcdSet.Fields("VX").Value)
              Sheets("d_E").Cells(i + 2, 7) = Abs(E_RcdSet.Fields("MY").Value)
              E_RcdSet.MoveNext
            Next i
            End If
          End If
            
          '��ȡ����ؼ���Y�����X
          If OUTReader_Main.ComboBox_Wind_Y.Text <> "" Then
            StrSQL = "Select [Story],[VY],[MX] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "WY�������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 8) = Abs(E_RcdSet.Fields("VY").Value)
              Sheets("d_E").Cells(i + 2, 9) = Abs(E_RcdSet.Fields("MX").Value)
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          Call ETABS_DATA_CALC("Story Forces")
          
        '==================================================================================================================�� Story Shears '------------------------------------------for V9
        Case ("Story Shears")
          '��ȡˮƽ�������X��"���Y"
          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
            StrSQL = "Select [Story],[VX],[MY] From [Story Shears] Where [Loc] IN ('Bottom') AND [Load] IN  ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX������ݲ��㣡~"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 10) = E_RcdSet.Fields("VX").Value
              Sheets("d_E").Cells(i + 2, 11) = E_RcdSet.Fields("MY").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          '��ȡˮƽ�������Y��"���X"
          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
            StrSQL = "Select [Story],[VY],[MX] From [Story Shears] Where [Loc] IN ('Bottom') AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EY������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 14) = E_RcdSet.Fields("VY").Value
              Sheets("d_E").Cells(i + 2, 15) = E_RcdSet.Fields("MX").Value
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ����ؼ���X�����Y������ָ�ֵ������ȡ�˾���ֵ
          If OUTReader_Main.ComboBox_Wind_X.Text <> "" Then
            StrSQL = "Select [Story],[VX],[MY] From [Story Shears] Where [Loc] IN ('Bottom') AND [Load] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "WX�������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 6) = Abs(E_RcdSet.Fields("VX").Value)
              Sheets("d_E").Cells(i + 2, 7) = Abs(E_RcdSet.Fields("MY").Value)
              E_RcdSet.MoveNext
            Next i
            End If
          End If
            
          '��ȡ����ؼ���Y�����X
          If OUTReader_Main.ComboBox_Wind_Y.Text <> "" Then
            StrSQL = "Select [Story],[VY],[MX] From [Story Shears] Where [Loc] IN ('Bottom') AND [Load] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "WY�������ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 8) = Abs(E_RcdSet.Fields("VY").Value)
              Sheets("d_E").Cells(i + 2, 9) = Abs(E_RcdSet.Fields("MX").Value)
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          Call ETABS_DATA_CALC("Story Forces")
          
        '==================================================================================================================�� Story Stiffness
       ' Case ("Story Stiffness")
'          '��ȡˮƽ�������X���ն�X���նȱ�X
'          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
'            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
'                StrSQL = "Select [Story],[ShearX],[StiffX] From [Story Stiffness] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
'            ElseIf OUTReader_Main.Option_E_V9 Then
'                StrSQL = "Select [Story],[Shear-X],[Stiff-X] From [Story Stiffness] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
'            'Debug.Print StrSQL
'            Debug.Print "�նȱ�~"
'            End If
'
'                'StrSQL = "Select [Story],[ShearX],[StiffX] From [Story Stiffness] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
'            'Debug.Print StrSQL
'
'            Set E_RcdSet = New ADODB.Recordset
'            E_RcdSet.Open StrSQL, E_Connect, 3, 2
'
'            If E_RcdSet.RecordCount < Num_all Then
'              MsgBox "EX�ն����ݲ��㣡"
'            Else
'
'            For i = Num_all To 1 Step -1
'              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
'              'Sheets("d_E").Cells(i + 2, 10) = E_RcdSet.Fields("ShearX").Value
'
'                If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
'                    Sheets("d_E").Cells(i + 2, 4) = E_RcdSet.Fields("StiffX").Value
'                ElseIf OUTReader_Main.Option_E_V9 Then
'                    Sheets("d_E").Cells(i + 2, 4) = E_RcdSet.Fields("Stiff-X").Value
'                    'Debug.Print StrSQL
'                End If
'
'              'Sheets("d_E").Cells(i + 2, 4) = E_RcdSet.Fields("StiffX").Value
'              'Sheets("d_E").Cells(i + 2, 2) = E_RcdSet.Fields("Modifier").Value
'              E_RcdSet.MoveNext
'            Next i
'
'            End If
'          End If
'
'          '��ȡˮƽ�������Y���ն�Y���նȱ�Y
'          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
'            If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
'                StrSQL = "Select [Story],[ShearY],[StiffY] From [Story Stiffness] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
'            ElseIf OUTReader_Main.Option_E_V9 Then
'                StrSQL = "Select [Story],[Shear-Y],[Stiff-Y] From [Story Stiffness] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
'            'Debug.Print StrSQL
'            End If
'
'                'StrSQL = "Select [Story],[ShearY],[StiffY] From [Story Stiffness] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
'            'Debug.Print StrSQL
'
'            Set E_RcdSet = New ADODB.Recordset
'            E_RcdSet.Open StrSQL, E_Connect, 3, 2
'
'            If E_RcdSet.RecordCount < Num_all Then
'              MsgBox "EY�ն����ݲ��㣡"
'            Else
'
'            For i = Num_all To 1 Step -1
'              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
'              'Sheets("d_E").Cells(i + 2, 14) = E_RcdSet.Fields("ShearY").Value
'
'                If OUTReader_Main.Option_E_V13 Then '-----------------------------����б�
'                    Sheets("d_E").Cells(i + 2, 5) = E_RcdSet.Fields("StiffY").Value
'                ElseIf OUTReader_Main.Option_E_V9 Then
'                   Sheets("d_E").Cells(i + 2, 5) = E_RcdSet.Fields("Stiff-Y").Value
'                    'Debug.Print StrSQL
'                End If
'
'              'Sheets("d_E").Cells(i + 2, 5) = E_RcdSet.Fields("StiffY").Value
'              'Sheets("d_E").Cells(i + 2, 3) = E_RcdSet.Fields("Modifier").Value
'              E_RcdSet.MoveNext
'            Next i
'            End If
'          End If
'
'          '����նȱ�
'          For i = 1 To Num_all - 1
'          If Sheets("d_E").Cells(i + 3, 4) / Sheets("d_E").Cells(i + 3, 60) <> 0 And Sheets("d_E").Cells(i + 3, 5) / Sheets("d_E").Cells(i + 3, 60) Then
'             Sheets("d_E").Cells(i + 2, 2) = Sheets("d_E").Cells(i + 2, 4) * Sheets("d_E").Cells(i + 2, 60) / Sheets("d_E").Cells(i + 3, 4) / Sheets("d_E").Cells(i + 3, 60)
'             Sheets("d_E").Cells(i + 2, 3) = Sheets("d_E").Cells(i + 2, 5) * Sheets("d_E").Cells(i + 2, 60) / Sheets("d_E").Cells(i + 3, 5) / Sheets("d_E").Cells(i + 3, 60)
'          End If
'          Next
'          Sheets("d_E").Cells(Num_all + 2, 2) = 1
'          Sheets("d_E").Cells(Num_all + 2, 3) = 1
        Debug.Print "�նȱ�-------------"
          Call ETABS_DATA_CALC("Story Stiffness")
          
          
                    
        '==================================================================================================================�� Shear Gravity Ratios
        Case ("Shear Gravity Ratios")
          '��ȡ���ر�X
          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
            
                StrSQL = "Select [Story],[LambdaX],[LambdaMin] From [Shear Gravity Ratios] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX���ر����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
                
              Sheets("d_E").Cells(i + 2, 12) = E_RcdSet.Fields("LambdaX").Value * 100
              Sheets("d_E").Cells(i + 2, 13) = E_RcdSet.Fields("LambdaMin").Value * 100
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          '��ȡ���ر�Y
          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
        
               StrSQL = "Select [Story],[LambdaY],[LambdaMin] From [Shear Gravity Ratios] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX���ر����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
                
              Sheets("d_E").Cells(i + 2, 16) = E_RcdSet.Fields("LambdaY").Value * 100
              Sheets("d_E").Cells(i + 2, 17) = E_RcdSet.Fields("LambdaMin").Value * 100
              E_RcdSet.MoveNext
            Next i
            End If
          End If
          
          Call ETABS_DATA_CALC("Shear Gravity Ratios")
          
        '==================================================================================================================�� Shear/Gravity Ratios -----------------------------------------------------for V9
        Case ("Shear/Gravity Ratios")
          '��ȡ���ر�X
          If OUTReader_Main.ComboBox_SPEC_X.Text <> "" Then
                StrSQL = "Select [Story],[Lambda-X],[LambdaMin] From [Shear/Gravity Ratios] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"

            
                'StrSQL = "Select [Story],[LambdaX],[LambdaMin] From [Shear Gravity Ratios] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX���ر����ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")

                    Sheets("d_E").Cells(i + 2, 12) = E_RcdSet.Fields("Lambda-X").Value * 100
                    Sheets("d_E").Cells(i + 2, 13) = E_RcdSet.Fields("LambdaMin").Value * 100

                
'              Sheets("d_E").Cells(i + 2, 12) = E_RcdSet.Fields("LambdaX").Value
'              Sheets("d_E").Cells(i + 2, 13) = E_RcdSet.Fields("LambdaMin").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          '��ȡ���ر�Y
          If OUTReader_Main.ComboBox_SPEC_Y.Text <> "" Then
                StrSQL = "Select [Story],[Lambda-Y],[LambdaMin] From [Shear/Gravity Ratios] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"

            
               ' StrSQL = "Select [Story],[LambdaY],[LambdaMin] From [Shear Gravity Ratios] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
            'Debug.Print StrSQL
            
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "EX���ر����ݲ��㣡"
              'Exit Sub'--------------------------------------------------------------------------------------------------------------------------------------------------����ֱ���˳�sub̫�ֱ��ˡ���

            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")

                    Sheets("d_E").Cells(i + 2, 16) = E_RcdSet.Fields("Lambda-Y").Value * 100
                    Sheets("d_E").Cells(i + 2, 17) = E_RcdSet.Fields("LambdaMin").Value * 100
                
'              Sheets("d_E").Cells(i + 2, 16) = E_RcdSet.Fields("LambdaY").Value
'              Sheets("d_E").Cells(i + 2, 17) = E_RcdSet.Fields("LambdaMin").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
          End If
          
          Call ETABS_DATA_CALC("Shear Gravity Ratios")
          
        '===============================================================================================================�� Mass Summary by Story
        Case ("Mass Summary by Story")
          Dim M_Base As String
          
          '��ȡ¥������
          StrSQL = "Select [Story],[UX] From [Mass Summary by Story]" ' Order By [Mode] ASC"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "�������ݲ��㣡"
            Else
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 54) = E_RcdSet.Fields("UX").Value
              E_RcdSet.MoveNext
            Next i
            End If
            
            '����1������Ϊ1��+Base��
            M_Base = E_RcdSet.Fields("UX").Value
            'Debug.Print M_Base
            Sheets("d_E").Cells(3, 54) = Sheets("d_E").Cells(3, 54) + M_Base
          
          Call ETABS_DATA_CALC("Mass Summary by Story")
          

        '===============================================================================================================��Assembled Point Masses '-------------------for V9
        Case ("Assembled Point Masses")
          
          '��ȡ¥������
          StrSQL = "Select [Story],[Point],[UX] From [Assembled Point Masses]"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount < Num_all Then
              MsgBox "�������ݲ��㣡"
              'Debug.Print "¥����" & E_RcdSet.RecordCount
            Else
                For i = E_RcdSet.RecordCount To 1 Step -1
                     If E_RcdSet.Fields("Point").Value = "All" Then
                        jj = extractNumberFromString2(E_RcdSet.Fields("Story").Value, 1)
                        If jj <> 0 Then
                            Sheets("d_E").Cells(jj + 2, 54) = E_RcdSet.Fields("UX").Value
                        ElseIf E_RcdSet.Fields("Story").Value = "BASE" Then
                            Sheets("d_E").Cells(Num_all + 3, 54) = E_RcdSet.Fields("UX").Value
                        End If

                     End If
                     E_RcdSet.MoveNext
                Next i
            
            End If
             '����1������Ϊ1�� Base��
            a = Sheets("d_E").Cells(3, 54)
            Sheets("d_E").Cells(3, 54) = a + Sheets("d_E").Cells(Num_all + 3, 54)
            Sheets("d_E").Cells(Num_all + 3, 54) = ""

          
          Call ETABS_DATA_CALC("Mass Summary by Story")
          
          
        '===============================================================================================================�� Frame Shear Ratios In Dual Systems And Modifiers
        Case ("Frame Shear Ratios In Dual Systems And Modifiers")
          '��ȡX������
          StrSQL = "Select [Story],[Vo],[Vf],[Vf'],[Ratio] From [Frame Shear Ratios In Dual Systems And Modifiers] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "��ܼ������ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 48) = E_RcdSet.Fields("Vf").Value
              Sheets("d_E").Cells(i + 2, 49) = E_RcdSet.Fields("Vf").Value / E_RcdSet.Fields("Vo").Value
              Sheets("d_E").Cells(i + 2, 50) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
            
          '��ȡY������
          StrSQL = "Select [Story],[Vo],[Vf],[Vf'],[Ratio] From [Frame Shear Ratios In Dual Systems And Modifiers] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "��ܼ������ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 51) = E_RcdSet.Fields("Vf").Value
              Sheets("d_E").Cells(i + 2, 52) = E_RcdSet.Fields("Vf").Value / E_RcdSet.Fields("Vo").Value
              Sheets("d_E").Cells(i + 2, 53) = E_RcdSet.Fields("Ratio").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
          
          
        '===============================================================================================================�� Frame Shear Ratios '-------------------for V9
        Case ("Frame Shear Ratios")
          
          '��ȡX������
          StrSQL = "Select [Story],[Vf],[Vf'],[Vf'/Vf] From [Frame Shear Ratios] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "��ܼ������ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 48) = E_RcdSet.Fields("Vf").Value
              'Sheets("d_E").Cells(i + 2, 49) = E_RcdSet.Fields("Vf").Value
              Sheets("d_E").Cells(i + 2, 50) = E_RcdSet.Fields("Vf'/Vf").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
            
          '��ȡY������
          StrSQL = "Select [Story],[Vf],[Vf'],[Vf'/Vf] From [Frame Shear Ratios] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "��ܼ������ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Average")
              Sheets("d_E").Cells(i + 2, 51) = E_RcdSet.Fields("Vf").Value
              'Sheets("d_E").Cells(i + 2, 49) = E_RcdSet.Fields("Vf").Value
              Sheets("d_E").Cells(i + 2, 53) = E_RcdSet.Fields("Vf'/Vf").Value
              E_RcdSet.MoveNext
            Next i
            
            End If
            
         '===============================================================================================================�� Column Forces '-------------------for V9
        Case ("Column Forces")
          
          '��ȡVEX������
          For i = 1 To Num_all
            StrSQL = "Select [V3] From [Column Forces] Where [Loc] IN (0) AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & " ')"
            'Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               MsgBox i & "��" & "ȱ��Column Forces���ݣ�"
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 76) = WorksheetFunction.Sum(SS)
                Sheets("d_E").Cells(i + 2, 48).Formula = "=RC[28]"
                Sheets("d_E").Cells(i + 2, 49).Formula = "=RC[-1]/R3C80"
            End If
          Next i
         
          '��ȡVEY������
          For i = 1 To Num_all
            StrSQL1 = "Select [V2] From [Column Forces] Where [Loc] IN (0) AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & " ')"
            Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL1, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               'MsgBox i & "��" & "ȱ��Column Forces(EY)���ݣ�"
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 77) = WorksheetFunction.Sum(SS)
                Sheets("d_E").Cells(i + 2, 51).Formula = "=RC[26]"
                Sheets("d_E").Cells(i + 2, 52).Formula = "=RC[-1]/R3C81"
            End If
          Next i
            
           '��ȡMEX������
          For i = 1 To Num_all
            StrSQL = "Select [M2] From [Column Forces] Where [Loc] IN (0) AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XGD.Text & " ')"
            'Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               'MsgBox i & "��" & "ȱ��Column Forces(EX)���ݣ�"
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 82) = WorksheetFunction.Sum(SS)
            End If
          Next i
         
          '��ȡMEY������
          For i = 1 To Num_all
            StrSQL1 = "Select [M3] From [Column Forces] Where [Loc] IN (0) AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YGD.Text & " ')"
            Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL1, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               'MsgBox i & "��" & "ȱ��Column Forces(EY)���ݣ�"
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 83) = WorksheetFunction.Sum(SS)
            End If
          Next i

                     
            
         '===============================================================================================================�� Pier Forces '-------------------for V9
        Case ("Pier Forces")
          
          '��ȡVEX������
          For i = 1 To Num_all
            StrSQL = "Select [V2] From [Pier Forces] Where [Loc] IN ('Bottom') AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & " ')"
            'Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               MsgBox i & "��" & "ȱ��Pier Forces���ݣ�"
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 78) = WorksheetFunction.Sum(SS)
            End If
          Next i
         
          '��ȡVEY������
          For i = 1 To Num_all
            StrSQL1 = "Select [V3] From [Pier Forces] Where [Loc] IN ('Bottom') AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & " ')"
            Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL1, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 79) = WorksheetFunction.Sum(SS)
            End If
          Next i
            
           '��ȡMEX������
          For i = 1 To Num_all
            StrSQL = "Select [M3] From [Pier Forces] Where [Loc] IN ('Bottom') AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XGD.Text & " ')"
            'Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 84) = WorksheetFunction.Sum(SS)
            End If
          Next i
         
          '��ȡMEY������
          For i = 1 To Num_all
            StrSQL1 = "Select [M2] From [Pier Forces] Where [Loc] IN ('Bottom') AND [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YGD.Text & " ')"
            Debug.Print StrSQL
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL1, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 85) = WorksheetFunction.Sum(SS)
            End If
          Next i
          
          For i = 1 To Num_all
             Sheets("d_E").Cells(i + 2, 80).Formula = "=abs(RC[-4])+abs(RC[-2])"
             Sheets("d_E").Cells(i + 2, 81).Formula = "=abs(RC[-4])+abs(RC[-2])"
             Sheets("d_E").Cells(i + 2, 86).Formula = "=abs(RC[-4])+abs(RC[-2])"
             Sheets("d_E").Cells(i + 2, 87).Formula = "=abs(RC[-4])+abs(RC[-2])"
             Sheets("d_E").Cells(3, 88).Formula = "=ABS(RC[-6])/RC[-2]"
             Sheets("d_E").Cells(3, 89).Formula = "=ABS(RC[-6])/RC[-2]"
             Sheets("g_E").Cells(53, 5).Formula = "=d_E!R[-50]C[83]*100"
             Sheets("g_E").Cells(54, 5).Formula = "=d_E!R[-50]C[84]*100"
          Next i
        
            
        '===============================================================================================================�� Diaphragm CM Displacements '-------------------for V9
        Case ("Diaphragm CM Displacements")
          
          '��ȡEX������
          StrSQL = "Select [Story],[UX] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EX��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 18) = E_RcdSet.Fields("UX").Value
              E_RcdSet.MoveNext
            Next i
            End If
          '��ȡEX+������
          StrSQL = "Select [Story],[UX] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EX+��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 19) = E_RcdSet.Fields("UX").Value
              E_RcdSet.MoveNext
            Next i
            End If
          '��ȡEX-������
          StrSQL = "Select [Story],[UX] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & "')"

          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2

            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EX-��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 20) = E_RcdSet.Fields("UX").Value
              E_RcdSet.MoveNext
            Next i
            End If
              '��ȡWX������
          StrSQL = "Select [Story],[UX] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "WX��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 21) = E_RcdSet.Fields("UX").Value
              E_RcdSet.MoveNext
            Next i
            End If
          '��ȡEY������
          StrSQL = "Select [Story],[UY] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EY��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 22) = E_RcdSet.Fields("UY").Value
              E_RcdSet.MoveNext
            Next i
            End If
          '��ȡEY+������
          StrSQL = "Select [Story],[UY] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EY+��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 23) = E_RcdSet.Fields("UY").Value
              E_RcdSet.MoveNext
            Next i
            End If
          '��ȡEY-������
          StrSQL = "Select [Story],[UY] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "EY-��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 24) = E_RcdSet.Fields("UY").Value
              E_RcdSet.MoveNext
            Next i
            End If
              '��ȡWY������
          StrSQL = "Select [Story],[UY] From [Diaphragm CM Displacements] Where [Load] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "WY��λ�����ݲ��㣡"
            Else
            For i = Num_all To 1 Step -1
              Sheets("d_E").Cells(i + 2, 25) = E_RcdSet.Fields("UY").Value
              E_RcdSet.MoveNext
            Next i
            End If
        Call ETABS_DATA_CALC("Diaphragm CM Displacements")
        
        
        

        '===============================================================================================================�� Frame Overturning Moments In Dual Systems
        Case ("Frame Overturning Moments In Dual Systems")
          '��ȡ����X������
          StrSQL = "Select [Story],[Total] From [Frame Overturning Moments In Dual Systems] Where [CaseCombo] IN ('~Static" & OUTReader_Main.ComboBox_SPEC_X.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "�����㸲�������ݲ��㣡"
            Else
              
              E_RcdSet.MoveLast
              Sheets("g_E").Cells(50, 5) = E_RcdSet.Fields("Total").Value
            
            End If
            
          '��ȡ����Y������
          StrSQL = "Select [Story],[Total] From [Frame Overturning Moments In Dual Systems] Where [CaseCombo] IN ('~Static" & OUTReader_Main.ComboBox_SPEC_Y.Text & "')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "�����㸲�������ݲ��㣡"
            Else

              E_RcdSet.MoveLast
              Sheets("g_E").Cells(51, 5) = E_RcdSet.Fields("Total").Value
              
            End If
          
          '��ȡ��X������
          StrSQL = "Select [Story],[Total] From [Frame Overturning Moments In Dual Systems] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_X.Text & " 1')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "���㸲�������ݲ��㣡"
            Else
              
              E_RcdSet.MoveLast
              Sheets("g_E").Cells(48, 5) = E_RcdSet.Fields("Total").Value
            
            End If
            
          '��ȡ��Y������
          StrSQL = "Select [Story],[Total] From [Frame Overturning Moments In Dual Systems] Where [CaseCombo] IN ('" & OUTReader_Main.ComboBox_Wind_Y.Text & " 1')"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount <> Num_all Then
              MsgBox "���㸲�������ݲ��㣡"
            Else

              E_RcdSet.MoveLast
              Sheets("g_E").Cells(49, 5) = E_RcdSet.Fields("Total").Value
              
            End If
        '===============================================================================================================�� Support Reactions
        Case ("Support Reactions")
          '��ȡ��������
          StrSQL = "Select [Story],[Load],[FZ] From [Support Reactions]"
          
          Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            
            If E_RcdSet.RecordCount = 0 Then
              MsgBox "ȱ��Support Reactions���ݣ�"
            Else
            
                For i = E_RcdSet.RecordCount To 1 Step -1
                    If E_RcdSet.Fields("Story").Value = "Summation" And E_RcdSet.Fields("Load").Value = "DEAD" Then
                        Sheets("g_E").Cells(7, 5) = E_RcdSet.Fields("FZ").Value
                    ElseIf E_RcdSet.Fields("Story").Value = "Summation" And E_RcdSet.Fields("Load").Value = "LIVE" Then
                        Sheets("g_E").Cells(6, 5) = E_RcdSet.Fields("FZ").Value
                    End If
                  E_RcdSet.MoveNext
                Next i
            
            End If
          
        '===============================================================================================================�� Point Displacements
        Case ("Point Displacements")
          'Dim SS()
          
          '��ȡEX+
          For i = 1 To Num_all
            StrSQL = "Select [UX] From [Point Displacements] Where [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & " ')"
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               MsgBox "ȱ��Point Displacements(EX+)���ݣ�"
               Exit Sub
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 70) = WorksheetFunction.Max(SS)
                Sheets("d_E").Cells(i + 2, 19) = WorksheetFunction.Average(SS)
            End If
        Next i

          
'          '��ȡEX+
'          For i = 1 To Num_all
'            StrSQL = "Select [UX] ,[STORY] From [Point Displacements] Where [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc.Text & " ')"
'            Set E_RcdSet = New ADODB.Recordset
'            E_RcdSet.Open StrSQL, E_Connect, 3, 2
'            Nu_NZ = E_RcdSet.RecordCount
'            If E_RcdSet.RecordCount = 0 Then
'               MsgBox "ȱ��Point Displacements(EX+)���ݣ�"
'               Exit Sub
'            Else
'                ReDim SS(Nu_NZ - 1)
'                For j = 1 To E_RcdSet.RecordCount
'                    SS(j - 1) = E_RcdSet.Fields("UX").Value
'                    E_RcdSet.MoveNext
'                Next j
'                Sheets("d_E").Cells(i + 2, 70) = WorksheetFunction.Max(SS)
'            End If
'         Next i

          '��ȡEX-
          For i = 1 To Num_all
            StrSQL = "Select [UX] From [Point Displacements] Where [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_XEcc2.Text & " ')"
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               MsgBox "ȱ��Point Displacements(EX-)���ݣ�"
               Exit Sub
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 71) = WorksheetFunction.Max(SS)
                Sheets("d_E").Cells(i + 2, 20) = WorksheetFunction.Average(SS)
            End If
         Next i

          '��ȡEY+
          For i = 1 To Num_all
            StrSQL = "Select [UY]From [Point Displacements] Where [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc.Text & " ')"
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               MsgBox "ȱ��Point Displacements(EY+)���ݣ�"
               Exit Sub
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 72) = WorksheetFunction.Max(SS)
                Sheets("d_E").Cells(i + 2, 23) = WorksheetFunction.Average(SS)
            End If
         Next i
         
          '��ȡEY-
          For i = 1 To Num_all
            StrSQL = "Select [UY] From [Point Displacements] Where [STORY] IN ('" & "Story" & i & "')" & " AND [Load] IN ('" & OUTReader_Main.ComboBox_SPEC_YEcc2.Text & " ')"
            Set E_RcdSet = New ADODB.Recordset
            E_RcdSet.Open StrSQL, E_Connect, 3, 2
            Nu_NZ = E_RcdSet.RecordCount
            If E_RcdSet.RecordCount = 0 Then
               MsgBox "ȱ��Point Displacements(EY-)���ݣ�"
               Exit Sub
            Else
                ReDim SS(Nu_NZ - 1)
                SS = E_RcdSet.GetRows
                Sheets("d_E").Cells(i + 2, 73) = WorksheetFunction.Max(SS)
                Sheets("d_E").Cells(i + 2, 24) = WorksheetFunction.Average(SS)
            End If
         Next i
         
         


            
            
            
            

          
          
        '==================================================================================================================
        Case Else
        
          
        End Select

  End If
  
  E_RxSchema.MoveNext
  
Loop

'�ر�Access�ļ�
E_RcdSet.Close
Set E_RcdSet = Nothing
E_RxSchema.Close
E_Connect.Close
Set E_Connect = Nothing




End Sub

