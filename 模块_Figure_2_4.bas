Attribute VB_Name = "ģ��_Figure_2_4"

Option Explicit


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                         ���ԱȻ�ͼ                                 ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/16

'�������ݣ�
'1.���ӱ�ֵ1��
'2.��Ϊɢ��ͼ

'////////////////////////////////////////////////////////////////////////////////////////////



'���Ա����ݻ�ͼ
'����˵����
'range_X1,range_X2,range_Y, Ϊͼ���X��Y������range��
'range_X1,range_X2,range_Y,���ڵ�sheet��
'name_X, name_YΪͼ���X��Y��ı��⣻
'nameΪ����Series�ı��⣻
' Location_X, Location_YΪͼ����sheet�е�λ�ã�
'Optional NumFormat As String = "G/ͨ�ø�ʽ" ΪX�����ݵĸ�ʽ��ȱʡֵΪͨ�ã���Ϊ��������ѧ�����ȣ�

Sub add_chart_2(sheetname, range_X1, range_X2, range_Y, name_1, name_2, name_X, name_Y, Location_X, Location_Y, Width, Hight, Optional NumFormat As String = "G/ͨ�ø�ʽ")

    Debug.Print "��ʼ��ͼ"
    Debug.Print "..."

    Dim myChart As ChartObject
  
    Dim i, j As Integer
  
    Dim range(), name()
    range = Array(range_X1, range_X2)
    'Debug.Print range(1)
    name = Array(name_1, name_2)
    With Sheets("figure_Info")
                 
        '���ԭ��ͼ��
        '.ChartObjects.Delete
          
        'ָ��ͼ��λ�úʹ�С.add(��߾࣬���߾࣬��ȣ��߶ȣ�������ֵ��λ���ǹ���,Ϊ��
        Set myChart = .ChartObjects.Add(Location_X, Location_Y, Width, Hight)
      
        '��ʾ�߿�
        myChart.Border.LineStyle = 1
              
              
'=====================================================================================��ʼ��ͼ
        With myChart.Chart
      
            '���û�ͼ���Ĵ�С
            With .PlotArea
            On Error Resume Next '�˴��ϳ������Բ�Ӱ��
            .Width = Width * 0.9
            .Height = Hight * 0.9
            .Left = Width * 0.08
            .Top = Hight * 0.02
            End With


            '����ͼ������
            'Ϊ��ƽ���ߵ�ɢ��ͼ,�����Ҫ�����ֲ�ͬ���͵����ߣ�������ͼ�ȣ���ʹ��һ��Select Case...End Select����
            .ChartType = xlXYScatterSmoothNoMarkers
          
           '------------------------------------------------------------------------��2��ϵ��ѭ������
           For i = 0 To 1
          
            '�������ϵ��
            .SeriesCollection.NewSeries
          
            'ѡ��X��ϵ��ֵ
'            Debug.Print range(i)
            .SeriesCollection(i + 1).XValues = Sheets(sheetname).range(range(i))

          
            'ѡ��X����������ʽ
             With .Axes(xlCategory).TickLabels.Font
                 .name = "Times New Roman"    '˫�����м���д����Ҫ������
                 '.FontStyle = ""   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 9   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
             .Axes(xlCategory).TickLabels.NumberFormatLocal = NumFormat
           
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(i + 1).Values = Sheets(sheetname).range(range_Y)
          
          
            'ѡ��Y����������ʽ
             With .Axes(xlValue).TickLabels.Font
                 .name = "Times New Roman"    '˫�����м���д����Ҫ������
                 '.FontStyle = ""   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 9   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
                     
          
            'ѡ��ϵ�б���
            .SeriesCollection(i + 1).name = name(i)
            '���ñ��������ʽ
            .Legend.LegendEntries(i).Font.name = "Times New Roman"
          
            '����ʾ���ݱ�ǩֵ
            .ApplyDataLabels ShowValue:=False
            
                             
            'ѡ��Series���߿�ȸ�ʽ��Ϣ
            With .SeriesCollection(i + 1)
                .ChartType = xlXYScatter
                'ѡ���߿�
'                .Format.line.Weight = 2
          
                'ѡ������ɫ �˴������趨���������������ɫ��һ��
                '.Format.line.ForeColor.RGB = RGB(112, 48, 160)
          
                'ѡ������-����
'                .Format.line.Style = msoLineSingle
          
                'ѡ�����ݵ��С
'                .MarkerStyle = 0
                .MarkerSize = 2
                
'                .Format.line.Visible = msoTrue
          
                'ѡ������-��������
'                .Format.line.DashStyle = msoLineSolid   'ʵ��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineSysDot  'Բ��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineSysDash  '����
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineDash     '�̻���
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineDashDot  '����-��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineLongDash  '������
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineLongDashDot  '������-��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineLongDashDotDot '������-��-��
          
            End With
            
            
            '��ʾ��������
            .SetElement (msoElementPrimaryCategoryGridLinesMajor)

            '�������������߿�����
            With .Axes(xlCategory).MajorGridlines.Format.Line
                .Visible = msoTrue
                .Weight = 0.5
                .DashStyle = msoLineSysDash
            End With
          
            '���ú��������߿�����
            With .Axes(xlValue).MajorGridlines.Format.Line
                .Visible = msoTrue
                .Weight = 0.5
                .DashStyle = msoLineSysDash
            End With
              
            '��ʾX��Y��̶�
            .HasAxis(xlCategory, xlPrimary) = True  'X��
            .HasAxis(xlValue, xlPrimary) = True     'Y��
          
            '����X��Y�����
            .SetElement (msoElementPrimaryValueAxisTitleRotated)
            With .Axes(xlValue).AxisTitle
                .Text = name_Y
                .Font.name = "Times New Roman"
                .Font.Size = 10
                .Font.Bold = False
                '.Characters(10, 8).Font.Italic = True
            End With
            .SetElement (msoElementPrimaryCategoryAxisTitleAdjacentToAxis)
            With .Axes(xlCategory).AxisTitle
                .Text = name_X
                .Font.name = "Times New Roman"
                .Font.Size = 10
                .Font.Bold = False
                '.Characters(10, 8).Font.Italic = True
            End With
             
            '����ʾ��ʾͼ����⣬��д������sheet�Ķ�Ӧλ��д������ռ��ͼ��ռ�
            .HasTitle = False
            '.ChartTitle.Text = "�նȱ�"
            'With .ChartTitle.Font
                '.Size = 20
                '.ColorIndex = 1
                '.Name = "������κ"
            'End With
                      
            '.����ͼ���������ɫ��ȱʡ���ð�ɫ
            'With .ChartArea.Interior
                '.ColorIndex = 2
                '.PatternColorIndex = 1
                '.Pattern = xlSolid
            'End With
          
            '.���û�ͼ�������ɫ
            With .PlotArea.Interior
                .ColorIndex = 20
                .PatternColorIndex = 1
                .Pattern = xlSolid
            End With
            
            
        Next
        
'==============================================================================================================���Ʊ�ֵ1
        '�������ϵ��
        .SeriesCollection.NewSeries
                                       
        'ѡ��X��ϵ��ֵ
        .SeriesCollection(3).XValues = "={1,1}"
                
        'ѡ��Y��ϵ��ֵ
        Dim n_y As Integer
        n_y = Sheets(sheetname).range(range_Y).Cells.Count
        Debug.Print n_y
        Debug.Print Sheets(sheetname).range(range_Y)
        .SeriesCollection(3).Values = "={1," & n_y & "}"
                                   
        'ѡ��ϵ�б���
        .SeriesCollection(3).name = "��ֵ1"
                
        With .SeriesCollection(3)
            'ѡ���߿�
            .Format.Line.Weight = 2
                
            'ѡ������ɫ
            .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
                
            'ѡ������-����
            .Format.Line.Style = msoLineSingle
                
            'ѡ������-��������
            .Format.Line.DashStyle = msoLineSolid   'ʵ��
                    
            'ѡ�����ݵ�����
            .MarkerStyle = 0
                    
        End With
        
        
        .Legend.Select
        Selection.Font.name = "Times New Roman"

        End With
      
        '.��ն���
        Set myChart = Nothing
          
    End With

    Debug.Print "��ͼ����"

End Sub


Sub add_chart_4(sheetname, range_X1, range_X2, range_X3, range_X4, range_Y, name_1, name_2, name_3, name_4, name_X, name_Y, Location_X, Location_Y, Width, Hight, Optional NumFormat As String = "G/ͨ�ø�ʽ")

    Debug.Print "��ʼ��ͼ"
    Debug.Print "..."

    Dim myChart As ChartObject
  
    Dim i, j As Integer
  
    Dim range(), name()
    range = Array(range_X1, range_X2, range_X3, range_X4)
    'Debug.Print range(1)
    name = Array(name_1, name_2, name_3, name_4)
    With Sheets("figure_Info")
                 
        '���ԭ��ͼ��
        '.ChartObjects.Delete
          
        'ָ��ͼ��λ�úʹ�С.add(��߾࣬���߾࣬��ȣ��߶ȣ�������ֵ��λ���ǹ���,Ϊ��
        Set myChart = .ChartObjects.Add(Location_X, Location_Y, Width, Hight)
      
        '��ʾ�߿�
        myChart.Border.LineStyle = 1
              
              
'=====================================================================================��ʼ��ͼ
        With myChart.Chart
      
            '���û�ͼ���Ĵ�С
            With .PlotArea
            On Error Resume Next '�˴��ϳ������Բ�Ӱ��
            .Width = Width * 0.9
            .Height = Hight * 0.9
            .Left = Width * 0.08
            .Top = Hight * 0.02
            End With


            '����ͼ������
            'Ϊ��ƽ���ߵ�ɢ��ͼ,�����Ҫ�����ֲ�ͬ���͵����ߣ�������ͼ�ȣ���ʹ��һ��Select Case...End Select����
            .ChartType = xlXYScatterSmoothNoMarkers
          
           '------------------------------------------------------------------------��4��ϵ��ѭ������
           For i = 0 To 3
          
            '�������ϵ��
            .SeriesCollection.NewSeries
          
            'ѡ��X��ϵ��ֵ
'            Debug.Print range(i)
            .SeriesCollection(i + 1).XValues = Sheets(sheetname).range(range(i))

          
            'ѡ��X����������ʽ
             With .Axes(xlCategory).TickLabels.Font
                 .name = "Times New Roman"    '˫�����м���д����Ҫ������
                 '.FontStyle = ""   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 9   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
             .Axes(xlCategory).TickLabels.NumberFormatLocal = NumFormat
           
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(i + 1).Values = Sheets(sheetname).range(range_Y)
          
          
            'ѡ��Y����������ʽ
             With .Axes(xlValue).TickLabels.Font
                 .name = "Times New Roman"    '˫�����м���д����Ҫ������
                 '.FontStyle = ""   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 9   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
                     
          
            'ѡ��ϵ�б���
            .SeriesCollection(i + 1).name = name(i)
            '���ñ��������ʽ
            .Legend.LegendEntries(i).Font.name = "Times New Roman"
          
            '����ʾ���ݱ�ǩֵ
            .ApplyDataLabels ShowValue:=False
            
                             
            'ѡ��Series���߿�ȸ�ʽ��Ϣ
            With .SeriesCollection(i + 1)
                .ChartType = xlXYScatter
                'ѡ���߿�
'                .Format.line.Weight = 1
'
'                'ѡ������ɫ �˴������趨���������������ɫ��һ��
'                '.Format.line.ForeColor.RGB = RGB(112, 48, 160)
'
'                'ѡ������-����
'                .Format.line.Style = msoLineSingle
'
'                'ѡ�����ݵ��С
'                .MarkerStyle = 0
                .MarkerSize = 2
'
'                .Format.line.Visible = msoTrue
'
'                'ѡ������-��������
'                .Format.line.DashStyle = msoLineSolid   'ʵ��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineSysDot  'Բ��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineSysDash  '����
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineDash     '�̻���
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineDashDot  '����-��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineLongDash  '������
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineLongDashDot  '������-��
            '.SeriesCollection(1).Format.Line.DashStyle = msoLineLongDashDotDot '������-��-��
          
            End With
            
            
            '��ʾ��������
            .SetElement (msoElementPrimaryCategoryGridLinesMajor)

            '�������������߿�����
            With .Axes(xlCategory).MajorGridlines.Format.Line
                .Visible = msoTrue
                .Weight = 0.5
                .DashStyle = msoLineSysDash
            End With
          
            '���ú��������߿�����
            With .Axes(xlValue).MajorGridlines.Format.Line
                .Visible = msoTrue
                .Weight = 0.5
                .DashStyle = msoLineSysDash
            End With
              
            '��ʾX��Y��̶�
            .HasAxis(xlCategory, xlPrimary) = True  'X��
            .HasAxis(xlValue, xlPrimary) = True     'Y��
          
            '����X��Y�����
            .SetElement (msoElementPrimaryValueAxisTitleRotated)
            With .Axes(xlValue).AxisTitle
                .Text = name_Y
                .Font.name = "Times New Roman"
                .Font.Size = 10
                .Font.Bold = False
                '.Characters(10, 8).Font.Italic = True
            End With
            .SetElement (msoElementPrimaryCategoryAxisTitleAdjacentToAxis)
            With .Axes(xlCategory).AxisTitle
                .Text = name_X
                .Font.name = "Times New Roman"
                .Font.Size = 10
                .Font.Bold = False
                '.Characters(10, 8).Font.Italic = True
            End With
             
            '����ʾ��ʾͼ����⣬��д������sheet�Ķ�Ӧλ��д������ռ��ͼ��ռ�
            .HasTitle = False
            '.ChartTitle.Text = "�նȱ�"
            'With .ChartTitle.Font
                '.Size = 20
                '.ColorIndex = 1
                '.Name = "������κ"
            'End With
                      
            '.����ͼ���������ɫ��ȱʡ���ð�ɫ
            'With .ChartArea.Interior
                '.ColorIndex = 2
                '.PatternColorIndex = 1
                '.Pattern = xlSolid
            'End With
          
            '.���û�ͼ�������ɫ
            With .PlotArea.Interior
                .ColorIndex = 20
                .PatternColorIndex = 1
                .Pattern = xlSolid
            End With
            
            
        Next
        
'==============================================================================================================���Ʊ�ֵ1
        '�������ϵ��
        .SeriesCollection.NewSeries
                                       
        'ѡ��X��ϵ��ֵ
        .SeriesCollection(5).XValues = "={1,1}"
                
        'ѡ��Y��ϵ��ֵ
        Dim n_y As Integer
        n_y = Sheets(sheetname).range(range_Y).Cells.Count
        Debug.Print n_y
        Debug.Print Sheets(sheetname).range(range_Y)
        .SeriesCollection(5).Values = "={1," & n_y & "}"
                                   
        'ѡ��ϵ�б���
        .SeriesCollection(5).name = "��ֵ1"
                
        With .SeriesCollection(5)
            'ѡ���߿�
            .Format.Line.Weight = 2
                
            'ѡ������ɫ
            .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
                
            'ѡ������-����
            .Format.Line.Style = msoLineSingle
                
            'ѡ������-��������
            .Format.Line.DashStyle = msoLineSolid   'ʵ��
                    
            'ѡ�����ݵ�����
            .MarkerStyle = 0
                    
        End With
        
        
        
        .Legend.Select
        Selection.Font.name = "Times New Roman"

        End With
      
        '.��ն���
        Set myChart = Nothing
          
    End With

    Debug.Print "��ͼ����"

End Sub

