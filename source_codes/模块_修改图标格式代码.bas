Attribute VB_Name = "ģ��_�޸�ͼ���ʽ����"
Option Explicit

Sub ChangeDataName()
Attribute ChangeDataName.VB_ProcData.VB_Invoke_Func = "g\n14"
'
'
Dim name1 As String, name2 As String

name1 = InputBox("����������һ������", "������������", "����һ")
name2 = InputBox("���������ݶ�������", "������������", "������")

    ActiveChart.SeriesCollection(1).Select
    Selection.name = name1
    ActiveChart.SeriesCollection(2).Select
    Selection.name = name2
    
End Sub



Option Explicit

Sub changeformat()
'
' �޸�ͼ��ĸ�ʽ
' �������ڶԱȵ�ͼ��
' ϵ��1��Ϊ��ɫ��ϵ��2��Ϊ��ɫ����������Ϊ��ɫ

Dim i As Integer

For i = 1 To ActiveSheet.ChartObjects.Count
ActiveSheet.ChartObjects("ͼ�� " & i).Activate
   ActiveChart.SeriesCollection(1).Select
    With Selection.Format.Fill
        .Visible = msoTrue
        .ForeColor.RGB = RGB(0, 176, 80)
        .Transparency = 0
        .Solid
    End With
    With Selection.Format.Line
        .Visible = msoTrue
        .ForeColor.RGB = RGB(0, 176, 80)
        .Transparency = 0
    End With
    With Selection.Format.Line
        .Visible = msoTrue
        .ForeColor.RGB = RGB(0, 176, 80)
        .Transparency = 0
    End With
    ActiveChart.SeriesCollection(2).Select
    With Selection.Format.Fill
        .Visible = msoTrue
        .ForeColor.RGB = RGB(0, 176, 80)
        .Solid
    End With
    With Selection.Format.Fill
        .Visible = msoTrue
        .ForeColor.RGB = RGB(112, 48, 160)
        .Transparency = 0
        .Solid
    End With
    With Selection.Format.Line
        .Visible = msoTrue
        .ForeColor.RGB = RGB(112, 48, 160)
        .Transparency = 0
    End With
    With Selection.Format.Line
        .Visible = msoTrue
        .ForeColor.RGB = RGB(112, 48, 160)
        .Transparency = 0
    End With
    ActiveChart.PlotArea.Select
    With Selection.Format.Fill
        .Visible = msoTrue
        .ForeColor.ObjectThemeColor = msoThemeColorBackground1
        .ForeColor.TintAndShade = 0
        .ForeColor.Brightness = 0
        .Transparency = 0
        .Solid
    End With
Next

End Sub

