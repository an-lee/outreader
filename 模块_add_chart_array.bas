Attribute VB_Name = "ģ��_add_chart_array"
Option Explicit

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                         ���ƶ�������ͼ                               ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/4/20
'1.��Y��ָ���Ϊ10��


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.��Զ�ģ�ͶԱ��޸���ֵ����
'2.���͸ı�Ϊʵ��
'3.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/8
'�������ݣ�
'1.�޷�ȴ��С��ʹ����ʱ�̷������λ�ƽ���ֵ��ȡ����ֵ��ͼ��֮ǰһֱ����������ʱ��ͼ����������ˣ����ڿ�û���ˣ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/7
'�������ݣ�
'1.����ʱ�̷������λ�ƽ���ֵ

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/1/5

'�������ݣ�
'1.�������رȡ��ֳ�X��Y������


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/27

'�������ݣ�
'1.��Ϊʹ�����鴫�ݽ��л�ͼ��ͨ���ԽϺ�
'2.����ģ�������������ͬ


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/25

'�������ݣ�
'1.��ȥ.Format.line.ForeColor.RGB�趨��ʹ��ɫ�ֿ���
'2..MarkerStyle = I +��Ϊ.MarkerStyle = I + 1��ʹ�õ�һ������Ϊ���߸�ʽ��


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/18 22:28

'�������ݣ�
'1.��ӵ����������


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/24

'�������ݣ�
'1.���˵����

'ʱ�̷������ݻ�ͼ
'����˵����
'sheetname() Ϊ������������sheet����1 X N_C+1 ά���飬���һ��ֵΪͼ������sheet��
'N_C Ϊͼ����������
'range_X() Ϊͼ���X������range��1 X N_C ά����
'range_Y() Ϊͼ���Y������range��1 X 1 ά����
'name() Ϊ����Series�ı��⣬1 X N_C ά����
'name_XY() 1 X 2 ά���飬��һ��ֵΪͼ���X��ı��⣬�ڶ���ֵΪY�����
'Location() 1 X 2 ά���飬Ϊͼ����sheet�е�λ�ã�
'Optional NumFormat As String = "G/ͨ�ø�ʽ" ΪX�����ݵĸ�ʽ��ȱʡֵΪͨ�ã���Ϊ��������ѧ�����ȣ�

Sub add_chart_array(sheetname(), N_C, range_X(), range_Y(), name(), name_XY(), Location() As Integer, Width, Hight, Optional NumFormat As String = "G/ͨ�ø�ʽ")

    Debug.Print "��ʼ��ͼ"
    Debug.Print "..."
   
    'ͳһ�趨����
    Dim ft As String
    ft = "Arial"

    Dim myChart As ChartObject
     
    Dim i, j As Integer

    With Sheets(sheetname(UBound(sheetname())))
                
        '���ԭ��ͼ��
        '.ChartObjects.Delete
         
        'ָ��ͼ��λ�úʹ�С.add(��߾࣬���߾࣬��ȣ��߶ȣ�������ֵ��λ���ǹ���,Ϊ��
        Set myChart = .ChartObjects.Add(Location(0), Location(1), Width, Hight)
     
        '��ʾ�߿�
        myChart.Border.LineStyle = 1
             
             
'=====================================================================================��ʼ��ͼ
        With myChart.Chart
       
            .ChartArea.Format.Line.Visible = msoFalse '---------------ȥ����Χ��
     
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
         
           '------------------------------------------------------------------------��10��ϵ��ѭ������
           For i = 0 To N_C - 1
         
            '�������ϵ��
            .SeriesCollection.NewSeries
         
            'ѡ��X��ϵ��ֵ

            .SeriesCollection(i + 1).XValues = sheetname(i) & "!" & range_X(i)
            '.SeriesCollection(i + 1).XValues = Sheets(sheetname).range(range_X(i))
         
            'ѡ��X����������ʽ
             With .Axes(xlCategory).TickLabels.Font
                 .name = ft    '˫�����м���д����Ҫ������
                 '.FontStyle = ""   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 9   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
             .Axes(xlCategory).TickLabels.NumberFormatLocal = NumFormat
            
             '����X��̶���
             .Axes(xlCategory).MajorTickMark = xlInside
              With .Axes(xlCategory).Format.Line
                .ForeColor.RGB = RGB(153, 76, 0)
                .Visible = msoTrue
                .ForeColor.ObjectThemeColor = msoThemeColorText1
                .Weight = 0.75
              End With
          
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(i + 1).Values = sheetname(i) & "!" & range_Y(0)
            '.SeriesCollection(i + 1).Values = Sheets(sheetname).range(range_Y(0))
         
            'ѡ��Y����������ʽ
             With .Axes(xlValue).TickLabels.Font
                 .name = ft    '˫�����м���д����Ҫ������
                 '.FontStyle = ""   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 9   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
            
             '����Y��̶���
             .Axes(xlValue).MajorTickMark = xlInside 'xlnone
              With .Axes(xlValue).Format.Line
                .ForeColor.RGB = RGB(153, 76, 0)
                .Visible = msoTrue
                .ForeColor.ObjectThemeColor = msoThemeColorText1
                .Weight = 0.75
              End With
             
              '�趨Y������������(��ͼʱ�������6%)
              .Axes(xlValue).MaximumScale = Int(Num_all / 10 + 1) * 10
                    
         
            'ѡ��ϵ�б���
            .SeriesCollection(i + 1).name = name(i)
            '���ñ��������ʽ
            .Legend.LegendEntries(i).Font.name = ft
            .Legend.LegendEntries(i).Font.Size = 9
            .Legend.Format.TextFrame2.TextRange.Font.Size = 9
            .Legend.Format.Fill.Visible = msoTrue
            .Legend.Format.Fill.ForeColor.RGB = RGB(255, 255, 255)
            With .Legend.Format.Line
                .Visible = msoTrue
                 .ForeColor.RGB = RGB(0, 0, 0)
            End With
           
            '.Legend.Position = xlLegendPositionTop
            '.Legend.Top = 0
'            .Legend.Format.
'    With Selection.Format.Line
'        .Visible = msoTrue
'        .ForeColor.RGB = RGB(238, 236, 225)
'    End With
'    ActiveChart.Axes(xlCategory).Select
'    With Selection.Format.Fill
'        .Visible = msoTrue
'        .ForeColor.ObjectThemeColor = msoThemeColorBackground1
'        .ForeColor.TintAndShade = 0
'        .ForeColor.Brightness = 0
'        .Transparency = 0
'        .Solid
'    End With
           
            '����ʾ���ݱ�ǩֵ
            .ApplyDataLabels ShowValue:=False
           
                            
            'ѡ��Series���߿�ȸ�ʽ��Ϣ
            With .SeriesCollection(i + 1)
                'ѡ���߿�
                .Format.Line.Weight = 1.5
                If i = 0 Then
                 .Format.Line.ForeColor.RGB = RGB(0, 153, 0) '(204, 51, 0)
                ElseIf i = 1 Then
                 .Format.Line.ForeColor.RGB = RGB(0, 102, 255)
                End If
         
                'ѡ������ɫ �˴������趨���������������ɫ��һ��
                '.Format.line.ForeColor.RGB = RGB(112, 48, 160)
         
                'ѡ������-����
                .Format.Line.Style = msoLineSingle
         
                'ѡ�����ݵ��С
                .MarkerStyle = 0
                '.MarkerStyle = i + 1
                '.MarkerSize = 2.5
               
                .Format.Line.Visible = msoTrue
         
                'ѡ������-��������
                .Format.Line.DashStyle = msoLineSolid   'ʵ��
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
                .Weight = 0.1
                .DashStyle = msoLineDash
                .ForeColor.RGB = RGB(0, 0, 0)
            End With
         
            '���ú��������߿�����
            With .Axes(xlValue).MajorGridlines.Format.Line
                .Visible = msoTrue
                .Weight = 0.1
                .DashStyle = msoLineDash
                .ForeColor.RGB = RGB(0, 0, 0)
            End With
             
            '��ʾX��Y��̶�
            .HasAxis(xlCategory, xlPrimary) = True  'X��
            .HasAxis(xlValue, xlPrimary) = True     'Y��
         
            '����X��Y�����
            .SetElement (msoElementPrimaryValueAxisTitleRotated)
            With .Axes(xlValue).AxisTitle
                .Text = name_XY(1)
                .Font.name = ft
                .Font.Size = 9
                .Font.Bold = True
                '.Characters(10, 8).Font.Italic = True
            End With
            .SetElement (msoElementPrimaryCategoryAxisTitleAdjacentToAxis)
            With .Axes(xlCategory).AxisTitle
                .Text = name_XY(0)
                .Font.name = ft
                .Font.Size = 9
                .Font.Bold = True
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
         
            '.���û�ͼ�������ɫ��ȱʡ���ð�ɫ
'            With .PlotArea.Interior
'                .ColorIndex = 20
'                .PatternColorIndex = 1
'                .Pattern = xlSolid
'            End With
'.Line
            ' .���û�ͼ�������ɫ��ȱʡ���ð�ɫ
            With .PlotArea.Format.Line
                .Visible = msoTrue
                .Weight = 1
                .DashStyle = msoLineSolid
                .ForeColor.RGB = RGB(0, 0, 0)
            End With
                       
        Next
       
        '-------------------------------------------------------------ʱ�̷���λ�ƽ���ֵ
'        Dim Temp_String As String
'       Temp_String = name_XY(0)
       
  '      If CheckRegExpfromString(Temp_String, "���λ�ƽ�") Then
                            
                '�������ϵ��
   '             .SeriesCollection.NewSeries
                                       
                'ѡ��X��ϵ��ֵ��
    '            .SeriesCollection(N_C + 1).XValues = "={ 0.01��0.01}"
                
                 'ѡ��Y��ϵ��ֵ
     '           .SeriesCollection(N_C + 1).Values = "={0," & Num_All & "}"
                                   
                'ѡ��ϵ�б���
      '          .SeriesCollection(N_C + 1).name = "�淶��ֵ1/100"
           
       '         With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
        '            .Format.Line.Weight = 2
               
                    'ѡ������ɫ
         '           .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
               
                    'ѡ������-����
          '          .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
           '         .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
            '        .MarkerStyle = 0
                   
             '   End With
       
        'End If
       
        '-------------------------------------------------------------λ�Ʊ���ֵ
        Dim name11 As String
        name11 = name_XY(0)
        If CheckRegExpfromString(name11, "λ�Ʊ�") Then
       
           
                '�������ϵ��
                .SeriesCollection.NewSeries
                                      
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(N_C + 1).XValues = "={1.4,1.4}"
               
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(N_C + 1).Values = "={0," & Num_all & "}"
                                  
                'ѡ��ϵ�б���
                .SeriesCollection(N_C + 1).name = "��ֵ1.4"
               
                With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
                    .Format.Line.Weight = 1.5
               
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
               
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                   
                End With
       
        End If
       
        '-------------------------------------------------------------λ�ƽ���ֵ
        If CheckRegExpfromString(name11, "��λ�ƽ�") Then
       
           
                '�������ϵ��
                .SeriesCollection.NewSeries
                                      
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(N_C + 1).XValues = "={" & 1 / OUTReader_Main.DisLimit_TextBox.Text & "," & 1 / OUTReader_Main.DisLimit_TextBox.Text & "}"
               
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(N_C + 1).Values = "={0," & Num_all & "}"
                                  
                'ѡ��ϵ�б���
                .SeriesCollection(N_C + 1).name = "��ֵ1/" & OUTReader_Main.DisLimit_TextBox.Text
               
                With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
                    .Format.Line.Weight = 1.5
               
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
               
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                   
                End With
       
        End If

        '-------------------------------------------------------------X���ر���ֵ
        If CheckRegExpfromString(name11, "X����ر�") Then
       
           
                '�������ϵ��
                .SeriesCollection.NewSeries
                                      
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(N_C + 1).XValues = "={" & OUTReader_Main.RatioLimitX_TextBox.Text & "," & OUTReader_Main.RatioLimitX_TextBox.Text & "}"
               
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(N_C + 1).Values = "={0," & Num_all & "}"
                                  
                'ѡ��ϵ�б���
                .SeriesCollection(N_C + 1).name = "��ֵ(" & OUTReader_Main.RatioLimitX_TextBox.Text
               
                With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
                    .Format.Line.Weight = 1.5
               
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
               
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                   
                End With
       
        End If
       
        '-------------------------------------------------------------Y���ر���ֵ
        If CheckRegExpfromString(name11, "Y����ر�") Then
       
           
                '�������ϵ��
                .SeriesCollection.NewSeries
                                      
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(N_C + 1).XValues = "={" & OUTReader_Main.RatioLimitY_TextBox.Text & "," & OUTReader_Main.RatioLimitY_TextBox.Text & "}"
               
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(N_C + 1).Values = "={0," & Num_all & "}"
                                  
                'ѡ��ϵ�б���
                .SeriesCollection(N_C + 1).name = "��ֵ(" & OUTReader_Main.RatioLimitY_TextBox.Text
               
                With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
                    .Format.Line.Weight = 1.5
               
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
               
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                   
                End With
       
        End If
        '-------------------------------------------------------------����������ֵ
        If CheckRegExpfromString(name11, "������") Then
       
           
                '�������ϵ��
                .SeriesCollection.NewSeries
                                      
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(N_C + 1).XValues = "={0.75,0.75}"
               
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(N_C + 1).Values = "={0," & Num_all & "}"
                                  
                'ѡ��ϵ�б���
                .SeriesCollection(N_C + 1).name = "��ֵ0.75"
               
                With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
                    .Format.Line.Weight = 1.5
               
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
               
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                   
                End With
       
        End If
       
        '-------------------------------------------------------------��������ֵ
        If CheckRegExpfromString(name11, "������") Then
       
           
                '�������ϵ��
                .SeriesCollection.NewSeries
                                      
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(N_C + 1).XValues = "={1.5,1.5}"
               
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(N_C + 1).Values = "={0," & Num_all & "}"
                                  
                'ѡ��ϵ�б���
                .SeriesCollection(N_C + 1).name = "��ֵ1.5"
               
                With .SeriesCollection(N_C + 1)
                    'ѡ���߿�
                    .Format.Line.Weight = 1.5
               
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(255, 0, 0)
               
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
               
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                   
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                   
                End With
       
        End If
       
       
        .Legend.Select
        Selection.Font.name = ft

        End With
     
        '.��ն���
        Set myChart = Nothing
         
    End With

    Debug.Print "��ͼ����"

End Sub


