Attribute VB_Name = "ģ��_����Range������ʽ"
'����Range������ʽ�Ĵ���


'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2014/3/14

'�������ݣ�
'1.֧��ͬʱ�������ֵ����Сֵ��������ʽ


'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/12/09

'�������ݣ�
'1.��Ϊ07��office�������������������

'����˵��:
'1.rΪRange������
'2.maxormin��Ϊ"max"����"min"��
'3.serΪ start and end string,max��ʽ�еķ�Χ

Sub maxormin(R As range, maxormin As String, ser As String)

On Error Resume Next

Dim rr As String
rr = "=" & maxormin & "(" & ser & ")"

R.FormatConditions(R.FormatConditions.Count).SetFirstPriority

If maxormin = "max" Then

    With R.FormatConditions.Add(xlCellValue, xlEqual, rr)
        With R.FormatConditions(R.FormatConditions.Count)
            .Font.color = -16383844
            .Font.TintAndShade = 0
            .Interior.PatternColorIndex = xlAutomatic
            .Interior.color = 13551615
            .Interior.TintAndShade = 0
        End With
    End With
    
    ElseIf maxormin = "min" Then
    
        With R.FormatConditions.Add(xlCellValue, xlEqual, rr)
            With R.FormatConditions(R.FormatConditions.Count)
                .Font.color = -16383844
                .Font.TintAndShade = 0
                .Interior.PatternColorIndex = xlAutomatic
                .Interior.color = 10284031
                .Interior.TintAndShade = 0
            End With
            i = i + 1
        End With
End If

End Sub

