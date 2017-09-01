Attribute VB_Name = "ģ��_add_chart"
Option Explicit

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                           ���Ƶ�������ͼ                             ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/5/12
'1.ͼ��߿��Ϊ�ⲿ�������룬�����޸�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/12/25
'1.����λ�Ʊ���ֵ��ͼ���ڱ�g_*����д��ֵ��ͼȡ��ֵ������д��淶1.2��1.4��������
'2.����������ޣ�λ�ƱȺ������1��ʼ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/27
'1.����Ϊ�������ͨ���ͣ������������ѡ���ͼ��
'2.����ģ�������������ͬ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/18

'�������ݣ�
'1.���λ�Ʊ�,�նȱ�,���ر�,������,��������������ֵ����.
'2.���λ�ƽ���ṹ��ʽ��ݭ�ṹ�߶�ԭ��δ��ȷ�������ֽ��������1���ֶ����룬��Ŀǰѡ�񣩣�2������жϣ��鷳��

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/6

'�������ݣ�
'1.���˵����

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/5

'�������ݣ�
'1.��ͼ������ߣ�������Щ��


'///////////////////////////////////////////////////////////
'��ֻ�ǻ�ͼ��ģ�壬�����ͼʱ��Ҫ�Ľ�
'��������ʽ��д��ͼ����ʱ���������ú������ñ�������ͼ���������ǲ���ģ���������Ĳ�ͬ��������ͬ��ͼ��
'///////////////////////////////////////////////////////////



'��ȡ¥��������ר���ͼ
'����˵����
'softname Ϊ�������
'range_X, range_YΪͼ���X��Y������range��
'dis_sheetΪrange_X, range_Y���ڵ�sheet��
'name_X, name_YΪͼ���X��Y��ı��⣻
'nameΪ����Series�ı��⣻
' Location_X, Location_YΪͼ����sheet�е�λ�ã�
'Optional NumFormat As String = "G/ͨ�ø�ʽ" ΪX�����ݵĸ�ʽ��ȱʡֵΪͨ�ã���Ϊ��������ѧ�����ȣ�

Sub add_chart(softname, range_X, range_Y, name, name_X, name_Y, Location_X, Location_Y, Width, Hight, Optional NumFormat As String = "G/ͨ�ø�ʽ")

    Debug.Print "��ʼ��ͼ"
    Debug.Print "..."

    Dim myChart As ChartObject
    
    Dim i, j As Integer
    
    Dim dis_sheet, gen_sheet, fig_sheet As String
    
    If softname = "PKPM" Then
        dis_sheet = "d_P"
        gen_sheet = "g_P"
        fig_sheet = "figure_PKPM"
    ElseIf softname = "YJK" Then
        dis_sheet = "d_Y"
        gen_sheet = "g_Y"
        fig_sheet = "figure_YJK"
    ElseIf softname = "MBuilding" Then
        dis_sheet = "d_M"
        gen_sheet = "g_M"
        fig_sheet = "figure_MBuilding"
    ElseIf softname = "ETABS" Then
        dis_sheet = "d_E"
        gen_sheet = "g_E"
        fig_sheet = "figure_ETABS"
    Else
        MsgBox "�����������"
    End If
    
    With Sheets(fig_sheet)
            
        'ָ��ͼ��λ�úʹ�С.add(��߾࣬���߾࣬��ȣ��߶ȣ�������ֵ��λ���ǹ���,Ϊ��
        Set myChart = .ChartObjects.Add(Location_X, Location_Y, Width, Hight)
        
        '��ʾ�߿�
        myChart.Border.LineStyle = 1
                
                
'============================��ʼ��ͼ==========================
        
        With myChart.Chart
        
            '���û�ͼ���Ĵ�С
            .PlotArea.Select
            Selection.Width = Width * 0.9
            Selection.Height = Hight * 0.9
            Selection.Left = Width * 0.08
            Selection.Top = Hight * 0.02


            '����ͼ������Ϊ��ƽ���ߵ�ɢ��ͼ,�����Ҫ�����ֲ�ͬ���͵����ߣ�������ͼ�ȣ���ʹ��һ��Select Case...End Select����
            .ChartType = xlXYScatterSmoothNoMarkers
            
            '�������ϵ��
            .SeriesCollection.NewSeries
            
            'ѡ��X��ϵ��ֵ
            .SeriesCollection(1).XValues = Sheets(dis_sheet).range(range_X)
            
            'ѡ��X����������ʽ
             With .Axes(xlCategory).TickLabels.Font
                 .name = "Arial"    '˫�����м���д����Ҫ������
                 '.FontStyle = "Bold"   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 10   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
             .Axes(xlCategory).TickLabels.NumberFormatLocal = NumFormat
             
             '����X��̶���
             .Axes(xlCategory).MajorTickMark = xlNone
              With .Axes(xlCategory).Format.Line
                .ForeColor.RGB = RGB(0, 112, 192)
                .Visible = msoTrue
                .ForeColor.ObjectThemeColor = msoThemeColorText1
                .Weight = 1
              End With
             
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(1).Values = Sheets(dis_sheet).range(range_Y)
                        
            'ѡ��Y����������ʽ
             With .Axes(xlValue).TickLabels.Font
                 .name = "Arial"    '˫�����м���д����Ҫ������
                 '.FontStyle = "Bold"   '�Ƿ�Ӵֵȸ�ʽ
                 .Size = 10   'ѡ�������С
                 .ColorIndex = 1    '������ɫ
             End With
             
             '����Y��̶���
             .Axes(xlValue).MajorTickMark = xlNone
              With .Axes(xlValue).Format.Line
                .ForeColor.RGB = RGB(0, 112, 192)
                .Visible = msoTrue
                .ForeColor.ObjectThemeColor = msoThemeColorText1
                .Weight = 1
              End With
                       
              '�趨Y������������(��ͼʱ�������6%)
              .Axes(xlValue).MaximumScale = Int(Num_all / 5 + 1) * 5
            
            'ѡ��ϵ�б���
            .SeriesCollection(1).name = name
            .Legend.Select
            Selection.Font.name = "Arial"
            
            '����ʾ���ݱ�ǩֵ
            .ApplyDataLabels ShowValue:=False
                               
            'ѡ��Series���߿�ȸ�ʽ��Ϣ
            With .SeriesCollection(1)
                'ѡ���߿�
                .Format.Line.Weight = 2
            
                'ѡ������ɫ
                .Format.Line.ForeColor.RGB = RGB(0, 112, 192)
            
                'ѡ������-����
                .Format.Line.Style = msoLineSingle
            
                'ѡ�����ݵ��С
                .MarkerStyle = 0
                '.MarkerSize = 2
            
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
                .Weight = 0.25
                .DashStyle = msoLineDash
            End With
            
            '���ú��������߿�����
            With .Axes(xlValue).MajorGridlines.Format.Line
                .Visible = msoTrue
                .Weight = 0.25
                .DashStyle = msoLineDash
            End With
                
            '��ʾX��Y��̶�
            .HasAxis(xlCategory, xlPrimary) = True  'X��
            .HasAxis(xlValue, xlPrimary) = True     'Y��
            
            '����X��Y�����
            .SetElement (msoElementPrimaryValueAxisTitleRotated)
            With .Axes(xlValue).AxisTitle
                .Text = name_Y
                .Font.name = "Arial"
                .Font.Size = 10
                .Font.Bold = True
                '.Characters(10, 8).Font.Italic = True
            End With
            .SetElement (msoElementPrimaryCategoryAxisTitleAdjacentToAxis)
            With .Axes(xlCategory).AxisTitle
                .Text = name_X
                .Font.name = "Arial"
                .Font.Size = 10
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
            
            '.���û�ͼ�������ɫ
            With .PlotArea.Interior
                .ColorIndex = 20
                .PatternColorIndex = 1
                .Pattern = xlSolid
            End With

        '-------------------------------------------------------------λ�Ʊ���ֵ
        If name_X = "λ�Ʊ�" Then
        
            'X���1��ʼ
            .Axes(xlCategory).MinimumScale = 1
        
            If Not IsEmpty(Sheets(gen_sheet).Cells(16, 7)) Then
            
                '�������ϵ��
                .SeriesCollection.NewSeries
                                       
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(2).XValues = "={" & Sheets(gen_sheet).Cells(16, 7) & "," & Sheets(gen_sheet).Cells(16, 7) & "}"
                
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(2).Values = "={0," & Num_all & "}"
                                   
                'ѡ��ϵ�б���
                .SeriesCollection(2).name = "��ֵ" & Sheets(gen_sheet).Cells(16, 7)
                
                With .SeriesCollection(2)
                    'ѡ���߿�
                    .Format.Line.Weight = 2
                
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
                
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
                
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                    
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                    
                End With
            
            Else
            
                '�������ϵ��
                .SeriesCollection.NewSeries
                                       
                'ѡ��X��ϵ��ֵ
                '.SeriesCollection(2).XValues = "={" & Sheets(gen_sheet).Cells(16, 7) & "," & Sheets(gen_sheet).Cells(16, 7) & "}"
                .SeriesCollection(2).XValues = "={1.2,1.2}"
                
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(2).Values = "={0," & Num_all & "}"
                                   
                'ѡ��ϵ�б���
                .SeriesCollection(2).name = "��ֵ1.2"
                
                With .SeriesCollection(2)
                    'ѡ���߿�
                    .Format.Line.Weight = 2
                
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
                
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
                
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                    
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                    
                End With
                
                '�������ϵ��
                .SeriesCollection.NewSeries
                                       
                'ѡ��X��ϵ��ֵ
                .SeriesCollection(3).XValues = "={1.4,1.4}"
                
                'ѡ��Y��ϵ��ֵ
                .SeriesCollection(3).Values = "={0," & Num_all & "}"
                                   
                'ѡ��ϵ�б���
                .SeriesCollection(3).name = "��ֵ1.4"
                
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
            
            End If
        
        End If
        
        
        '-------------------------------------------------------------λ�ƽ���ֵ
        If name_X = "λ�ƽ�" Then
        
            If Not IsEmpty(Sheets(gen_sheet).Cells(14, 7)) Then
            
                '�������ϵ��
                .SeriesCollection.NewSeries
                                        
                'ѡ��X��ϵ��ֵ��
                .SeriesCollection(2).XValues = "={" & Sheets(gen_sheet).Cells(14, 7) & "," & Sheets(gen_sheet).Cells(14, 7) & "}"
                 
                 'ѡ��Y��ϵ��ֵ
                .SeriesCollection(2).Values = "={0," & Num_all & "}"
                                    
                'ѡ��ϵ�б���
                .SeriesCollection(2).name = "�淶��ֵ"
            
                With .SeriesCollection(2)
                    'ѡ���߿�
                    .Format.Line.Weight = 2
                
                    'ѡ������ɫ
                    .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
                
                    'ѡ������-����
                    .Format.Line.Style = msoLineSingle
                
                    'ѡ������-��������
                    .Format.Line.DashStyle = msoLineSolid   'ʵ��
                    
                    'ѡ�����ݵ�����
                    .MarkerStyle = 0
                    
                End With
            
            End If
        
        End If
        
        
        '-------------------------------------------------------------���ر���ֵ
        If name = "X����ر�" Then
        
            
            If Not IsEmpty(Sheets(gen_sheet).Cells(24, 7)) Then
            
                    '�������ϵ��
                    .SeriesCollection.NewSeries
                    
                    'ѡ��X��ϵ��ֵ
                    .SeriesCollection(2).XValues = "={" & Sheets(gen_sheet).Cells(24, 7) & "," & Sheets(gen_sheet).Cells(24, 7) & "}"
                    
                    'ѡ��Y��ϵ��ֵ
                    .SeriesCollection(2).Values = "={0," & Num_all & "}"
                    
                    'ѡ��ϵ�б���
                    .SeriesCollection(2).name = "�淶��ֵ" & Sheets(gen_sheet).Cells(25, 7)
                    
                    With .SeriesCollection(2)
                        'ѡ���߿�
                        .Format.Line.Weight = 2
                    
                        'ѡ������ɫ
                        .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
                    
                        'ѡ������-����
                        .Format.Line.Style = msoLineSingle
                    
                        'ѡ������-��������
                        .Format.Line.DashStyle = msoLineSolid   'ʵ��
                        
                        'ѡ�����ݵ�����
                        .MarkerStyle = 0
                        
                    End With
                    
            End If
        
        End If
        
        If name = "Y����ر�" Then
        
            If Not IsEmpty(Sheets(gen_sheet).Cells(25, 7)) Then
            
                    '�������ϵ��
                    .SeriesCollection.NewSeries
                    
                    'ѡ��X��ϵ��ֵ
                    .SeriesCollection(2).XValues = "={" & Sheets(gen_sheet).Cells(25, 7) & "," & Sheets(gen_sheet).Cells(24, 7) & "}"
                    
                    'ѡ��Y��ϵ��ֵ
                    .SeriesCollection(2).Values = "={0," & Num_all & "}"
                    
                    'ѡ��ϵ�б���
                    .SeriesCollection(2).name = "�淶��ֵ" & Sheets(gen_sheet).Cells(25, 7)
                    
                    With .SeriesCollection(2)
                        'ѡ���߿�
                        .Format.Line.Weight = 2
                    
                        'ѡ������ɫ
                        .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
                    
                        'ѡ������-����
                        .Format.Line.Style = msoLineSingle
                    
                        'ѡ������-��������
                        .Format.Line.DashStyle = msoLineSolid   'ʵ��
                        
                        'ѡ�����ݵ�����
                        .MarkerStyle = 0
                        
                    End With
            
            End If
        
        End If
        
        '-------------------------------------------------------------�նȱ���ֵ
        If name = "X��նȱ�" Then
        
            '�������ϵ��
            .SeriesCollection.NewSeries
            
            'ѡ��X��ϵ��ֵ
            .SeriesCollection(2).XValues = "={1,1}"
            
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(2).Values = "={0," & Num_all & "}"
            
            'ѡ��ϵ�б���
            .SeriesCollection(2).name = "�淶��ֵ"
            
            With .SeriesCollection(2)
                'ѡ���߿�
                .Format.Line.Weight = 2
            
                'ѡ������ɫ
                .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
            
                'ѡ������-����
                .Format.Line.Style = msoLineSingle
            
                'ѡ������-��������
                .Format.Line.DashStyle = msoLineSolid   'ʵ��
                
                'ѡ�����ݵ�����
                .MarkerStyle = 0
                
            End With
        
        End If
        
        If name = "Y��նȱ�" Then
        
            '�������ϵ��
            .SeriesCollection.NewSeries
            
            'ѡ��X��ϵ��ֵ
            .SeriesCollection(2).XValues = "={1,1}"
            
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(2).Values = "={0," & Num_all & "}"
            
            'ѡ��ϵ�б���
            .SeriesCollection(2).name = "�淶��ֵ"
            
            With .SeriesCollection(2)
                'ѡ���߿�
                .Format.Line.Weight = 2
            
                'ѡ������ɫ
                .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
            
                'ѡ������-����
                .Format.Line.Style = msoLineSingle
            
                'ѡ������-��������
                .Format.Line.DashStyle = msoLineSolid   'ʵ��
                
                'ѡ�����ݵ�����
                .MarkerStyle = 0
                
            End With
        
        End If
        
        
        '-------------------------------------------------------------��������������ֵ
        If name_X = "������������" Then
        
            '�������ϵ��
            .SeriesCollection.NewSeries
            
            'ѡ��X��ϵ��ֵ
            .SeriesCollection(2).XValues = "={0.75,0.75}"
            
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(2).Values = "={0," & Num_all & "}"
            
            'ѡ��ϵ�б���
            .SeriesCollection(2).name = "�淶��ֵ"
            
            With .SeriesCollection(2)
                'ѡ���߿�
                .Format.Line.Weight = 2
            
                'ѡ������ɫ
                .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
            
                'ѡ������-����
                .Format.Line.Style = msoLineSingle
            
                'ѡ������-��������
                .Format.Line.DashStyle = msoLineSolid   'ʵ��
                
                'ѡ�����ݵ�����
                .MarkerStyle = 0
                
            End With
        
        End If
        
        
        '-------------------------------------------------------------��������ֵ
        If name_X = "������" Then
        
            '�������ϵ��
            .SeriesCollection.NewSeries
            
            'ѡ��X��ϵ��ֵ
            .SeriesCollection(2).XValues = "={1.5,1.5}"
            
            'ѡ��Y��ϵ��ֵ
            .SeriesCollection(2).Values = "={0," & Num_all & "}"
            
            'ѡ��ϵ�б���
            .SeriesCollection(2).name = "�淶��ֵ"
            
            With .SeriesCollection(2)
                'ѡ���߿�
                .Format.Line.Weight = 2
            
                'ѡ������ɫ
                .Format.Line.ForeColor.RGB = RGB(0, 176, 80)
            
                'ѡ������-����
                .Format.Line.Style = msoLineSingle
            
                'ѡ������-��������
                .Format.Line.DashStyle = msoLineSolid   'ʵ��
                
                'ѡ�����ݵ�����
                .MarkerStyle = 0
                
            End With
        
        End If
        
        End With
        
        '.��ն���
        Set myChart = Nothing
            
    End With

    Debug.Print "��ͼ����"

End Sub


