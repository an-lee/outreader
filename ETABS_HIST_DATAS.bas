Attribute VB_Name = "ETABS_HIST_DATAS"
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                      ETABSʱ�̷������ݶ�ȡ                           ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/3/11
'��������:
'1.�������ܱ���65%��135%��80%��120%��Ӧ������λ�ô���

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'��������:
'1.����X����Y��ѡ��ʱ�̲�������ͬʱY��ƽ��ֵ�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/11
'��������:
'1.ʹ��excel�Դ�����match����ֵ�����У�����with����
'2.���������������ȡ����ֵ��ȡ��ֵ������temp_a�ȱ�������Ϊstring,ԭint��������


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/3/7
'��������:
'1.ʱ�̹���������ȡ���г�����



Public Sub ETABS_HIST_DATA(MDB_Path As String)

'MDB_Path = OUTReader_Main.TextBox_Path_ETABS.Text
'Num_all = 20

'����X���Y��ʱ�̺�������
Dim Num_X, Num_Y, N_LX, N_LY As Integer
Dim name_X() As String
Dim name_Y() As String

Num_X = 0
Num_Y = 0

N_LX = OUTReader_Main.ListBox_TH_X.ListCount
N_LY = OUTReader_Main.ListBox_TH_Y.ListCount

If N_LX + N_LY = 0 Then Exit Sub

ReDim name_X(N_LX - 1)
ReDim name_Y(N_LY - 1)

For i = 0 To OUTReader_Main.ListBox_TH_X.ListCount - 1
    If OUTReader_Main.ListBox_TH_X.Selected(i) = True Then
        name_X(Num_X) = OUTReader_Main.ListBox_TH_X.List(i)
        Num_X = Num_X + 1
        'Debug.Print Name_X(i)
    End If
Next i

For i = 0 To OUTReader_Main.ListBox_TH_Y.ListCount - 1
    If OUTReader_Main.ListBox_TH_Y.Selected(i) = True Then
        name_Y(Num_Y) = OUTReader_Main.ListBox_TH_Y.List(i)
        Num_Y = Num_Y + 1
        'Debug.Print Name_Y(i)
    End If
Next i

If Num_X + Num_Y = 0 Then Exit Sub

'д��ʱ�̱��
'======================================================================================================��ʾ��Ӧ������
'If Sheets("d_P").Cells(3, 6) = "" Or Sheets("d_P").Cells(3, 10) = "" Or Sheets("d_P").Cells(3, 18) = "" Then
   ' MsgBox "ȱ�ٷ�Ӧ�����ݣ��뷵������ѡ��"
'Else


'======================================================================================================�趨���Elastic-Dynamic�ĸ�ʽ
'�������������
Dim ela As String
ela = "e_E"

Call Addsh(ela)
Sheets(ela).Select
ActiveWindow.Zoom = 55

'�����������������
Sheets(ela).Cells.Clear

'======================================================================================================��ӱ��Elastic-Dynamic�ı���

For i = 1 To Num_all
            
    Sheets(ela).Cells(i + 2, 9) = i
                
Next i

'------------------------------------------------------������Elastic-Dynamic�ڵı����ʽ
With Sheets(ela)
    
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
    
    '-------------------------------------------------���ܱ����1
    
    '��Ŀ��Ϣ������
    .Cells(2, 1) = "ʱ�̲�����"
    .Cells(2, 2) = Num_X + Num_Y
    .Cells(2, 3) = "X��"
    .Cells(2, 4) = Num_X
    .Cells(2, 5) = "Y��"
    .Cells(2, 6) = Num_Y
    .Cells(4, 1) = "���ù���"
    .Cells(4, 2) = "���÷���=0��"
    .Cells(4, 5) = "���÷���=90��"
    .Cells(5, 2) = "���׼���"
    .Cells(5, 3) = "ʱ��/��Ӧ��"
    .Cells(5, 4) = "λ�ƽ�"
    .Cells(5, 5) = "���׼���"
    .Cells(5, 6) = "ʱ��/��Ӧ��"
    .Cells(5, 7) = "λ�ƽ�"
    .range("A4:A5").MergeCells = True
    .range("B4:D4").MergeCells = True
    .range("E4:G4").MergeCells = True
    
    '-------------------------------------------------���ܱ����2
    
    '��Ŀ��Ϣ������
    '.Cells(18, 1) = "���ù���"
    '.Cells(18, 2) = "���÷���=0��"
    '.Cells(18, 5) = "���÷���=90��"
    '.Cells(19, 2) = "λ�ƽ�"
    '.Cells(19, 3) = "ʱ��/��Ӧ��"
    '.Cells(19, 4) = "ƽ��ֵ/��Ӧ��"
    '.Cells(19, 5) = "���׼���"
    '.Cells(19, 6) = "ʱ��/��Ӧ��"
    '.Cells(19, 7) = "ƽ��ֵ/��Ӧ��"
    '.Cells(20, 1) = "��Ӧ��"
    '.range("A18:A19").MergeCells = True
    '.range("B18:D18").MergeCells = True
    '.range("E18:G18").MergeCells = True
    
End With

'�ӱ����
Call AddFormLine(ela, "A1:DZ200")

'=====================================================================================================������д����ܱ�
Dim m As Integer
Dim Temp_Colour As Integer
Temp_Colour = -1

For m = 1 To Num_X
    Sheets(ela).Cells(m + 5, 1) = name_X(m - 1)
    
    '��������д���ֲ���
    Sheets(ela).range(Cells(1, (m - 1) * 3 + 10), Cells(1, (m - 1) * 3 + 12)).MergeCells = True
    Sheets(ela).Cells(1, 10 + (m - 1) * 3) = name_X(m - 1)
    Sheets(ela).Cells(2, (m - 1) * 3 + 10) = "���λ�ƽ�X"
    Sheets(ela).Cells(2, (m - 1) * 3 + 11) = "����X"
    Sheets(ela).Cells(2, (m - 1) * 3 + 12) = "�㸲���X"
    
    
    '�ӱ���ɫ
    If Temp_Colour > 0 Then
      Colour = 10091441
    Else
      Colour = 6750207
    End If
    
    Sheets(ela).range(Cells(1, (m - 1) * 3 + 10), Cells(2, (m - 1) * 3 + 12)).Interior.color = Colour
    Temp_Colour = -1 * Temp_Colour

Next m

For m = 1 To Num_Y
    Sheets(ela).Cells(m + Num_X + 5, 1) = name_Y(m - 1)
    
    '��������д���ֲ���
    Sheets(ela).range(Cells(1, (m - 1) * 3 + 10 + 3 * Num_X), Cells(1, (m - 1) * 3 + 12 + 3 * Num_X)).MergeCells = True
    Sheets(ela).Cells(1, 10 + 3 * Num_X + (m - 1) * 3) = name_Y(m - 1)
    Sheets(ela).Cells(2, (m - 1) * 3 + 10 + 3 * Num_X) = "���λ�ƽ�Y"
    Sheets(ela).Cells(2, (m - 1) * 3 + 11 + 3 * Num_X) = "����Y"
    Sheets(ela).Cells(2, (m - 1) * 3 + 12 + 3 * Num_X) = "�㸲���Y"
    
    
    '�ӱ���ɫ
    If Temp_Colour > 0 Then
      Colour = 10091441
    Else
      Colour = 6750207
    End If
    
    Sheets(ela).range(Cells(1, (m - 1) * 3 + 10 + 3 * Num_X), Cells(2, (m - 1) * 3 + 12 + 3 * Num_X)).Interior.color = Colour
    Temp_Colour = -1 * Temp_Colour

Next m



'************************************************************************************************************************��ȡʱ������

'�������
Dim E_Connect As ADODB.Connection
Dim E_RcdSet1 As ADODB.Recordset
Dim E_RcdSet2 As ADODB.Recordset
Dim E_RxSchema As ADODB.Recordset

Dim StrSQL1 As String
Dim StrSQL2 As String

Dim Temp_a, Temp_b, Temp_a1, Temp_b1 As String

'�ж�Access�ļ��Ƿ����
If Dir(MDB_Path) = " " Then
  MsgBox "MDB�ļ������ڣ����ʵ��", vbExclamation, "�޷��������ݿ�"
  Exit Sub
End If

'ʹ��ADO����Access�ļ�
'����Access 2007 ���߰汾EXCEL
Set E_Connect = New ADODB.Connection
E_Connect.Open ConnectionString:="Provider=Microsoft.Ace.OLEDB.12.0;" & "Data Source =" & MDB_Path & ";" '& "Extended Properties=Excel 12.0;"
'�������ڰ汾��Access��Excelʹ��
'myConnect.Open ConnectionString:="Provider=Microsoft.Jet.OLEDB.12.0;" & "Data Source =" & MDB_Path & ";" & "Extended Properties=Excel 8.0;"


'�жϸ����Ƿ����Ȼ���ȡ��Ӧ����
Set E_RxSchema = E_Connect.OpenSchema(20)

Do Until E_RxSchema.EOF

  If UCase(E_RxSchema("TABLE_TYPE")) = "TABLE" Then
  'Debug.Print E_RxSchema("TABLE_TYPE") & "," & E_RxSchema("TABLE_NAME")
      
      Select Case (E_RxSchema("TABLE_NAME"))
          
        '==================================================================================================================�� Story Drifts
        Case ("Story Drifts")
                  
          '��ȡʱ�̲��λ�ƽ�X
          For j = 0 To Num_X - 1
            StrSQL1 = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & name_X(j) & " Max')"
            StrSQL2 = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift X') AND [CaseCombo] IN ('" & name_X(j) & " Min')"
            'Debug.Print StrSQL
            
            Set E_RcdSet1 = New ADODB.Recordset
            E_RcdSet1.Open StrSQL1, E_Connect, 3, 2
            
            Set E_RcdSet2 = New ADODB.Recordset
            E_RcdSet2.Open StrSQL2, E_Connect, 3, 2
            
            If E_RcdSet1.RecordCount <> Num_all Then
              MsgBox "ʱ��" & name_X(j) & "λ�ƽ����ݲ��㣡"
              Exit Sub
            End If
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
              Temp_a = Abs(E_RcdSet1.Fields("Drift").Value)
              Temp_b = Abs(E_RcdSet2.Fields("Drift").Value)
              
              'ȡ����ֵ����Ӧ��ֵ
              'If Application.WorksheetFunction.Max(Temp_a, Temp_b) > -Application.WorksheetFunction.Min(Temp_a, Temp_b) Then
              '    Sheets("e_E").Cells(i + 2, j * 3 + 10) = Round(1 / Application.WorksheetFunction.Max(Temp_a, Temp_b), 0)
              'Else
              '    Sheets("e_E").Cells(i + 2, j * 3 + 10) = Round(1 / Application.WorksheetFunction.Min(Temp_a, Temp_b), 0)
              'End If
                  
              Sheets("e_E").Cells(i + 2, j * 3 + 10) = Round(1 / Application.WorksheetFunction.Max(Temp_a, Temp_b), 0)
                  
              E_RcdSet1.MoveNext
              E_RcdSet2.MoveNext
            Next i
          Next j
          
          '��ȡʱ�̲��λ�ƽ�Y
          For j = 0 To Num_Y - 1
            StrSQL1 = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & name_Y(j) & " Max')"
            StrSQL2 = "Select [Story],[Drift] From [Story Drifts] Where [Item] IN ('Max Drift Y') AND [CaseCombo] IN ('" & name_Y(j) & " Min')"
            'Debug.Print StrSQL
            
            Set E_RcdSet1 = New ADODB.Recordset
            E_RcdSet1.Open StrSQL1, E_Connect, 3, 2
            
            Set E_RcdSet2 = New ADODB.Recordset
            E_RcdSet2.Open StrSQL2, E_Connect, 3, 2
            
            If E_RcdSet1.RecordCount <> Num_all Then
              MsgBox "ʱ��" & name_Y(j) & "λ�ƽ����ݲ��㣡"
              Exit Sub
            End If
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
              Temp_a = Abs(E_RcdSet1.Fields("Drift").Value)
              Temp_b = Abs(E_RcdSet2.Fields("Drift").Value)
              
              'ȡ����ֵ����Ӧ��ֵ
              'If Application.WorksheetFunction.Max(Temp_a, Temp_b) > -Application.WorksheetFunction.Min(Temp_a, Temp_b) Then
              '    Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 10) = Round(1 / Application.WorksheetFunction.Max(Temp_a, Temp_b), 0)
              'Else
              '    Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 10) = Round(1 / Application.WorksheetFunction.Min(Temp_a, Temp_b), 0)
              'End If
              
              Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 10) = Round(1 / Application.WorksheetFunction.Max(Temp_a, Temp_b), 0)
                  
                  
              E_RcdSet1.MoveNext
              E_RcdSet2.MoveNext
            Next i
          Next j
                   
       
          
        '==================================================================================================================�� Story Forces
        Case ("Story Forces")
          '��ȡʱ�̲����X
          For j = 0 To Num_X - 1
            StrSQL1 = "Select [Story],[VX],[MY] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & name_X(j) & " Max')"
            StrSQL2 = "Select [Story],[VX],[MY] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & name_X(j) & " Min')"
            'Debug.Print StrSQL
            
            Set E_RcdSet1 = New ADODB.Recordset
            E_RcdSet1.Open StrSQL1, E_Connect, 3, 2
            
            Set E_RcdSet2 = New ADODB.Recordset
            E_RcdSet2.Open StrSQL2, E_Connect, 3, 2
            
            If E_RcdSet1.RecordCount <> Num_all Then
              MsgBox "ʱ��" & name_X(j) & "��������ݲ��㣡"
              Exit Sub
            End If
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
              Temp_a = Abs(E_RcdSet1.Fields("VX").Value)
              Temp_b = Abs(E_RcdSet2.Fields("VX").Value)
              Temp_a1 = Abs(E_RcdSet1.Fields("MY").Value)
              Temp_b1 = Abs(E_RcdSet2.Fields("MY").Value)
                            
              Sheets("e_E").Cells(i + 2, j * 3 + 11) = Application.WorksheetFunction.Max(Temp_a, Temp_b)
              Sheets("e_E").Cells(i + 2, j * 3 + 12) = Application.WorksheetFunction.Max(Temp_a1, Temp_b1)
                  
              E_RcdSet1.MoveNext
              E_RcdSet2.MoveNext
            Next i
          Next j
          
          '��ȡʱ�̲����Y
          For j = 0 To Num_Y - 1
            StrSQL1 = "Select [Story],[VY],[MX] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & name_Y(j) & " Max')"
            StrSQL2 = "Select [Story],[VY],[MX] From [Story Forces] Where [Location] IN ('Bottom') AND [CaseCombo] IN ('" & name_Y(j) & " Min')"
            'Debug.Print StrSQL
            
            Set E_RcdSet1 = New ADODB.Recordset
            E_RcdSet1.Open StrSQL1, E_Connect, 3, 2
            
            Set E_RcdSet2 = New ADODB.Recordset
            E_RcdSet2.Open StrSQL2, E_Connect, 3, 2
            
            If E_RcdSet1.RecordCount <> Num_all Then
              MsgBox "ʱ��" & name_Y(j) & "��������ݲ��㣡"
              Exit Sub
            End If
            
            For i = Num_all To 1 Step -1
              'Debug.Print E_RcdSet.Fields("Story") & "," & E_RcdSet.Fields("Drift")
              Temp_a = Abs(E_RcdSet1.Fields("VY").Value)
              Temp_b = Abs(E_RcdSet2.Fields("VY").Value)
              Temp_a1 = Abs(E_RcdSet1.Fields("MX").Value)
              Temp_b1 = Abs(E_RcdSet2.Fields("MX").Value)
              
              'ȡ����ֵ����Ӧ��ֵ
              'If Application.WorksheetFunction.Max(Temp_a, Temp_b) > -Application.WorksheetFunction.Min(Temp_a, Temp_b) Then
              '    Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 10) = Round(1 / Application.WorksheetFunction.Max(Temp_a, Temp_b), 0)
              'Else
              '    Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 10) = Round(1 / Application.WorksheetFunction.Min(Temp_a, Temp_b), 0)
              'End If
              
              Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 11) = Application.WorksheetFunction.Max(Temp_a, Temp_b)
              Sheets("e_E").Cells(i + 2, (j + Num_X) * 3 + 12) = Application.WorksheetFunction.Max(Temp_a1, Temp_b1)
                  
              E_RcdSet1.MoveNext
              E_RcdSet2.MoveNext
            Next i
          Next j
          

        '==================================================================================================================
        Case Else
        
          
        End Select

  End If
  
  E_RxSchema.MoveNext
  
Loop


'�ر�Access�ļ�
E_RcdSet1.Close
Set E_RcdSet1 = Nothing
E_RcdSet2.Close
Set E_RcdSet2 = Nothing
E_RxSchema.Close
E_Connect.Close
Set E_Connect = Nothing


'*************************************************************************************************************��ƽ��ֵ���ֵ������д���ֲ���
Dim Sum1, Max1, Sum2, Max2, Sum3, Max3

If Num_X <> 0 Then
    '----------------------------ƽ��ֵX
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y)), Cells(1, 12 + 3 * (Num_X + Num_Y))).MergeCells = True
    Sheets(ela).Cells(1, 10 + 3 * (Num_X + Num_Y)) = "ƽ��ֵX"
    Sheets(ela).Cells(2, 10 + 3 * (Num_X + Num_Y)) = "���λ�ƽ�X"
    Sheets(ela).Cells(2, 11 + 3 * (Num_X + Num_Y)) = "����X"
    Sheets(ela).Cells(2, 12 + 3 * (Num_X + Num_Y)) = "�㸲���X"
    '�ӱ���ɫ
    If Temp_Colour > 0 Then
      Colour = 10091441
    Else
      Colour = 6750207
    End If
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y)), Cells(2, 12 + 3 * (Num_X + Num_Y))).Interior.color = Colour
    Temp_Colour = 1 * Temp_Colour
    
    '----------------------------���ֵX
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y + 2)), Cells(1, 12 + 3 * (Num_X + Num_Y + 2))).MergeCells = True
    Sheets(ela).Cells(1, 10 + 3 * (Num_X + Num_Y + 2)) = "���ֵX"
    Sheets(ela).Cells(2, 10 + 3 * (Num_X + Num_Y + 2)) = "���λ�ƽ�X"
    Sheets(ela).Cells(2, 11 + 3 * (Num_X + Num_Y + 2)) = "����X"
    Sheets(ela).Cells(2, 12 + 3 * (Num_X + Num_Y + 2)) = "�㸲���X"
    '�ӱ���ɫ
    If Temp_Colour > 0 Then
      Colour = 10091441
    Else
      Colour = 6750207
    End If
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y + 2)), Cells(2, 12 + 3 * (Num_X + Num_Y + 2))).Interior.color = Colour
    Temp_Colour = -1 * Temp_Colour
    
    '----------------------------����
    For i = 1 To Num_all
    
        Sum1 = 0
        Max1 = 1E+64
        Sum2 = 0
        Max2 = 0
        Sum3 = 0
        Max3 = 0
        
        For j = 1 To Num_X
            
            Sum1 = Sum1 + Sheets(ela).Cells(i + 2, 10 + 3 * (j - 1))
            Max1 = Application.WorksheetFunction.Min(Max1, Sheets(ela).Cells(i + 2, 10 + 3 * (j - 1)))
            Sum2 = Sum2 + Sheets(ela).Cells(i + 2, 11 + 3 * (j - 1))
            Max2 = Application.WorksheetFunction.Max(Max2, Sheets(ela).Cells(i + 2, 11 + 3 * (j - 1)))
            Sum3 = Sum3 + Sheets(ela).Cells(i + 2, 12 + 3 * (j - 1))
            Max3 = Application.WorksheetFunction.Max(Max3, Sheets(ela).Cells(i + 2, 12 + 3 * (j - 1)))
        Next j
        
        Sheets(ela).Cells(i + 2, 10 + 3 * (Num_X + Num_Y)) = Sum1 / Num_X
        Sheets(ela).Cells(i + 2, 10 + 3 * (Num_X + Num_Y + 2)) = Max1
        Sheets(ela).Cells(i + 2, 11 + 3 * (Num_X + Num_Y)) = Sum2 / Num_X
        Sheets(ela).Cells(i + 2, 11 + 3 * (Num_X + Num_Y + 2)) = Max2
        Sheets(ela).Cells(i + 2, 12 + 3 * (Num_X + Num_Y)) = Sum3 / Num_X
        Sheets(ela).Cells(i + 2, 12 + 3 * (Num_X + Num_Y + 2)) = Max3
    Next i
Else

End If

If Num_Y <> 0 Then
    '----------------------------ƽ��ֵY
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y + 1)), Cells(1, 12 + 3 * (Num_X + Num_Y + 1))).MergeCells = True
    Sheets(ela).Cells(1, 10 + 3 * (Num_X + Num_Y + 1)) = "ƽ��ֵY"
    Sheets(ela).Cells(2, 10 + 3 * (Num_X + Num_Y + 1)) = "���λ�ƽ�Y"
    Sheets(ela).Cells(2, 11 + 3 * (Num_X + Num_Y + 1)) = "����Y"
    Sheets(ela).Cells(2, 12 + 3 * (Num_X + Num_Y + 1)) = "�㸲���Y"
    '�ӱ���ɫ
    If Temp_Colour > 0 Then
      Colour = 10091441
    Else
      Colour = 6750207
    End If
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y + 1)), Cells(2, 12 + 3 * (Num_X + Num_Y + 1))).Interior.color = Colour
    Temp_Colour = 1 * Temp_Colour
    
    '----------------------------���ֵY
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y + 3)), Cells(1, 12 + 3 * (Num_X + Num_Y + 3))).MergeCells = True
    Sheets(ela).Cells(1, 10 + 3 * (Num_X + Num_Y + 3)) = "���ֵY"
    Sheets(ela).Cells(2, 10 + 3 * (Num_X + Num_Y + 3)) = "���λ�ƽ�Y"
    Sheets(ela).Cells(2, 11 + 3 * (Num_X + Num_Y + 3)) = "����Y"
    Sheets(ela).Cells(2, 12 + 3 * (Num_X + Num_Y + 3)) = "�㸲���Y"
    '�ӱ���ɫ
    If Temp_Colour > 0 Then
      Colour = 10091441
    Else
      Colour = 6750207
    End If
    Sheets(ela).range(Cells(1, 10 + 3 * (Num_X + Num_Y + 3)), Cells(2, 12 + 3 * (Num_X + Num_Y + 3))).Interior.color = Colour
    Temp_Colour = -1 * Temp_Colour
    
    '----------------------------����
    For i = 1 To Num_all
    
        Sum1 = 0
        Max1 = 1E+64
        Sum2 = 0
        Max2 = 0
        Sum3 = 0
        Max3 = 0
        
        For j = 1 To Num_Y
            
            Sum1 = Sum1 + Sheets(ela).Cells(i + 2, 10 + 3 * (Num_X + j - 1))
            Max1 = Application.WorksheetFunction.Min(Max1, Sheets(ela).Cells(i + 2, 10 + 3 * (Num_X + j - 1)))
            Sum2 = Sum2 + Sheets(ela).Cells(i + 2, 11 + 3 * (Num_X + j - 1))
            Max2 = Application.WorksheetFunction.Max(Max2, Sheets(ela).Cells(i + 2, 11 + 3 * (Num_X + j - 1)))
            Sum3 = Sum3 + Sheets(ela).Cells(i + 2, 12 + 3 * (Num_X + j - 1))
            Max3 = Application.WorksheetFunction.Max(Max3, Sheets(ela).Cells(i + 2, 12 + 3 * (Num_X + j - 1)))
        Next j
        
        Sheets(ela).Cells(i + 2, 10 + 3 * (Num_X + Num_Y + 1)) = Sum1 / Num_Y
        Sheets(ela).Cells(i + 2, 10 + 3 * (Num_X + Num_Y + 3)) = Max1
        Sheets(ela).Cells(i + 2, 11 + 3 * (Num_X + Num_Y + 1)) = Sum2 / Num_Y
        Sheets(ela).Cells(i + 2, 11 + 3 * (Num_X + Num_Y + 3)) = Max2
        Sheets(ela).Cells(i + 2, 12 + 3 * (Num_X + Num_Y + 1)) = Sum3 / Num_Y
        Sheets(ela).Cells(i + 2, 12 + 3 * (Num_X + Num_Y + 3)) = Max3
        
    Next i
Else

End If



'*************************************************************************************************************д�뷴Ӧ������

Sheets(ela).Cells(Num_X + Num_Y + 6, 1) = "ƽ��ֵ"
Sheets(ela).Cells(Num_X + Num_Y + 7, 1) = "���ֵ"
Sheets(ela).Cells(Num_X + Num_Y + 8, 1) = "��Ӧ��"
Sheets(ela).Cells(Num_X + Num_Y + 9, 1) = "65%��Ӧ��"
Sheets(ela).Cells(Num_X + Num_Y + 10, 1) = "135%��Ӧ��"
Sheets(ela).Cells(Num_X + Num_Y + 11, 1) = "80%��Ӧ��"
Sheets(ela).Cells(Num_X + Num_Y + 12, 1) = "120%��Ӧ��"

'=============================================================================================================================����Ӧ������ת��
Sheets(ela).Cells(1, 10 + (Num_X + Num_Y + 4) * 3) = "��Ӧ��"
Sheets(ela).range(Cells(1, (Num_X + Num_Y + 4) * 3 + 10), Cells(1, (Num_X + Num_Y + 4) * 3 + 23)).MergeCells = True
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 10) = "X���λ�ƽ�"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 13) = "Y���λ�ƽ�"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 11) = "X����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 14) = "Y����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 12) = "X�㸲���"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 15) = "Y�㸲���"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 16) = "65%X����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 17) = "135%X����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 18) = "80%X����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 19) = "120%X����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 20) = "65%Y����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 21) = "135%Y����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 22) = "80%Y����"
Sheets(ela).Cells(2, (Num_X + Num_Y + 4) * 3 + 23) = "120%Y����"

'�ӱ���ɫ
If Temp_Colour > 0 Then
  Colour = 10091441
Else
  Colour = 6750207
End If

Sheets(ela).range(Cells(1, (Num_X + Num_Y + 4) * 3 + 10), Cells(2, (Num_X + Num_Y + 4) * 3 + 23)).Interior.color = Colour
Temp_Colour = -1 * Temp_Colour


'���λ�ƽ�
Sheets(ela).range(Sheets(ela).Cells(3, (Num_X + Num_Y + 4) * 3 + 10), Sheets(ela).Cells(Num_all + 2, (Num_X + Num_Y + 4) * 3 + 10)).Value = Sheets("d_E").range("Z3:" & "Z" & Num_all + 2).Value
Sheets(ela).range(Sheets(ela).Cells(3, (Num_X + Num_Y + 4) * 3 + 13), Sheets(ela).Cells(Num_all + 2, (Num_X + Num_Y + 4) * 3 + 13)).Value = Sheets("d_E").range("AD3:" & "AD" & Num_all + 2).Value
'����
Sheets(ela).range(Sheets(ela).Cells(3, (Num_X + Num_Y + 4) * 3 + 11), Sheets(ela).Cells(Num_all + 2, (Num_X + Num_Y + 4) * 3 + 11)).Value = Sheets("d_E").range("J3:" & "J" & Num_all + 2).Value
Sheets(ela).range(Sheets(ela).Cells(3, (Num_X + Num_Y + 4) * 3 + 14), Sheets(ela).Cells(Num_all + 2, (Num_X + Num_Y + 4) * 3 + 14)).Value = Sheets("d_E").range("N3:" & "N" & Num_all + 2).Value
'���
Sheets(ela).range(Sheets(ela).Cells(3, (Num_X + Num_Y + 4) * 3 + 12), Sheets(ela).Cells(Num_all + 2, (Num_X + Num_Y + 4) * 3 + 12)).Value = Sheets("d_E").range("K3:" & "K" & Num_all + 2).Value
Sheets(ela).range(Sheets(ela).Cells(3, (Num_X + Num_Y + 4) * 3 + 15), Sheets(ela).Cells(Num_all + 2, (Num_X + Num_Y + 4) * 3 + 15)).Value = Sheets("d_E").range("O3:" & "O" & Num_all + 2).Value

For i = 1 To Num_all
'X����35%����
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 16) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 11) * 0.65
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 17) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 11) * 1.35
'X����20%����
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 18) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 11) * 0.8
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 19) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 11) * 1.2
'Y����35%����
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 20) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 14) * 0.65
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 21) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 14) * 1.35
'Y����20%����
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 22) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 14) * 0.8
Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 23) = Sheets(ela).Cells(i + 2, (Num_X + Num_Y + 4) * 3 + 14) * 1.2
Next i

'=============================================================================================================================��д���ܱ��

'��ȡ��Ӧ�׵Ļ��׼���
Sheets(ela).Cells(Num_X + Num_Y + 8, 2) = Sheets("d_E").Cells(3, 10)
Sheets(ela).Cells(Num_X + Num_Y + 8, 5) = Sheets("d_E").Cells(3, 14)
Sheets(ela).Cells(Num_X + Num_Y + 9, 2) = Sheets("d_E").Cells(3, 10) * 0.65
Sheets(ela).Cells(Num_X + Num_Y + 9, 5) = Sheets("d_E").Cells(3, 14) * 0.65
Sheets(ela).Cells(Num_X + Num_Y + 10, 2) = Sheets("d_E").Cells(3, 10) * 1.35
Sheets(ela).Cells(Num_X + Num_Y + 10, 5) = Sheets("d_E").Cells(3, 14) * 1.35
Sheets(ela).Cells(Num_X + Num_Y + 11, 2) = Sheets("d_E").Cells(3, 10) * 0.8
Sheets(ela).Cells(Num_X + Num_Y + 11, 5) = Sheets("d_E").Cells(3, 14) * 0.8
Sheets(ela).Cells(Num_X + Num_Y + 12, 2) = Sheets("d_E").Cells(3, 10) * 1.2
Sheets(ela).Cells(Num_X + Num_Y + 12, 5) = Sheets("d_E").Cells(3, 14) * 1.2

'��ȡ��ʱ���»��׼��������������
'X��
For i = 1 To Num_X

    '���׼�������
    Sheets(ela).Cells(5 + i, 2).Value = Sheets(ela).Cells(3, 11 + (i - 1) * 3)
    
    'ʱ�̽���뷴Ӧ�׽���ı�ֵ
    If Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 2) = "" Then
        'Debug.Print "ȱ�ٷ�Ӧ�����ݣ�"
    Else
        Sheets(ela).Cells(5 + i, 3).Value = Round(Sheets(ela).Cells(5 + i, 2).Value / Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 2).Value, 3)
        
    End If
    
    'λ�ƽǻ���
    '���λ�ƽ���������
    Dim RRX, RRY As Integer
    'RRX = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (i - 1) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (i - 1) * 3)))(1)
    'ʹ��excel�Դ���������ֵ����λ�ã�����with����
    RRX = Application.WorksheetFunction.Match(Application.WorksheetFunction.Min(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (i - 1) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (i - 1) * 3))), Sheets(ela).range(Sheets(ela).Cells(3, 10 + (i - 1) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (i - 1) * 3)), 0)
    'Debug.Print RRX
    '�����λ�ƽǼ��������д����
    Sheets(ela).Cells(5 + i, 4) = Worksheets(ela).Cells(RRX + 2, 10 + (i - 1) * 3)
    Worksheets(ela).Cells(RRX + 2, 10 + (i - 1) * 3).Interior.ColorIndex = 4
    
Next i

'Y��
For i = 1 To Num_Y

    '���׼�������
    Sheets(ela).Cells(5 + Num_X + i, 5).Value = Sheets(ela).Cells(3, 11 + (Num_X + i - 1) * 3)
    
    'ʱ�̽���뷴Ӧ�׽���ı�ֵ
    If Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 5) = "" Then
        'Debug.Print "ȱ�ٷ�Ӧ�����ݣ�"
    Else
        Sheets(ela).Cells(5 + Num_X + i, 6).Value = Round(Sheets(ela).Cells(5 + Num_X + i, 5).Value / Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 5).Value, 3)
        
    End If
    
    'λ�ƽǻ���
    '���λ�ƽ���������
    'RRX = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (Num_X + i - 1) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (Num_X + i - 1) * 3)))(1)
    RRX = Application.WorksheetFunction.Match(Application.WorksheetFunction.Min(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (Num_X + i - 1) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (Num_X + i - 1) * 3))), Sheets(ela).range(Sheets(ela).Cells(3, 10 + (Num_X + i - 1) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (Num_X + i - 1) * 3)), 0)
    '�����λ�ƽǼ��������д����
    Sheets(ela).Cells(Num_X + 5 + i, 7) = Worksheets(ela).Cells(RRX + 2, 10 + (Num_X + i - 1) * 3)
    Worksheets(ela).Cells(RRX + 2, 10 + (Num_X + i - 1) * 3).Interior.ColorIndex = 4
    
Next i

'ƽ��ֵ�����ֵ
For i = 1 To 2

    '���׼�������
    Sheets(ela).Cells(5 + Num_X + Num_Y + i, 2).Value = Sheets(ela).Cells(3, 11 + (Num_X + Num_Y + 2 * (i - 1)) * 3)
    Sheets(ela).Cells(5 + Num_X + Num_Y + i, 5).Value = Sheets(ela).Cells(3, 14 + (Num_X + Num_Y + 2 * (i - 1)) * 3)
    
    'ʱ�̽���뷴Ӧ�׽���ı�ֵ
    If Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 2) = "" Or Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 5) = "" Then
        'Debug.Print "ȱ�ٷ�Ӧ�����ݣ�"
    Else
        Sheets(ela).Cells(5 + Num_X + Num_Y + i, 3).Value = Round(Sheets(ela).Cells(5 + Num_X + Num_Y + i, 2).Value / Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 2).Value, 3)
        Sheets(ela).Cells(5 + Num_X + Num_Y + i, 6).Value = Round(Sheets(ela).Cells(5 + Num_X + Num_Y + i, 5).Value / Sheets(ela).Cells(Num_X + Num_Y + 2 + 6, 5).Value, 3)
        
    End If
    
    'λ�ƽǻ���,X
    If Num_X <> 0 Then
        '���λ�ƽ���������
        'RRX = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3)))(1)
        RRX = Application.WorksheetFunction.Match(Application.WorksheetFunction.Min(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3))), Sheets(ela).range(Sheets(ela).Cells(3, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3), Sheets(ela).Cells(Num_all + 2, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3)), 0)
        '�����λ�ƽǼ��������д����
        Sheets(ela).Cells(Num_X + Num_Y + 5 + i, 4) = Worksheets(ela).Cells(RRX + 2, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3)
        Worksheets(ela).Cells(RRX + 2, 10 + (Num_X + Num_Y + 2 * (i - 1)) * 3).Interior.ColorIndex = 4
    End If
    
    
    'λ�ƽǻ��ܣ�Y
    If Num_Y <> 0 Then
        '���λ�ƽ���������
        'RRX = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3), Sheets(ela).Cells(Num_all + 2, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3)))(1)
        RRX = Application.WorksheetFunction.Match(Application.WorksheetFunction.Min(Sheets(ela).range(Sheets(ela).Cells(3, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3), Sheets(ela).Cells(Num_all + 2, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3))), Sheets(ela).range(Sheets(ela).Cells(3, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3), Sheets(ela).Cells(Num_all + 2, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3)), 0)
        '�����λ�ƽǼ��������д����
        Sheets(ela).Cells(Num_X + Num_Y + 5 + i, 7) = Worksheets(ela).Cells(RRX + 2, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3)
        Worksheets(ela).Cells(RRX + 2, 13 + (Num_X + Num_Y + 2 * (i - 1)) * 3).Interior.ColorIndex = 4
    End If
    
Next i

'�ӱ���ɫ
Call AddShadow(ela, "A2:A" & Num_X + Num_Y + 12, 10092441)
Call AddShadow(ela, "B4:G5,C2:C3,E2:E3", 10092441)
Call AddShadow(ela, "B2:B3,D2:D3,F2:F3", 6750207)
Call AddShadow(ela, "B6:G" & Num_X + Num_Y + 12, 6750207)

'���е�Ԫ�����Զ�����
Sheets(ela).Cells.EntireColumn.AutoFit

End Sub

Function IndexMinofRange(index_Range As range)
Dim Min, R, C As Integer
Min = WorksheetFunction.Min(index_Range)
R = index_Range.Find(Min, LookIn:=xlValues).Row
'C = index_Range.Find(Min, After:=index_Range.Cells(index_Range.Rows.Count, index_Range.Columns.Count), LookIn:=xlValues).Columns
IndexMinofRange = Array(Min, R) ', C)
End Function


