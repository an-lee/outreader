Attribute VB_Name = "MBuilding_����ն�"

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'1.��Ӵ���,���ģ�ͽ��������ҵ����ݶ�ȡ���⡣

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/05/20
'��������:
'1.����жϣ������նȱ���ȡ
'2.Midas����ĸնȱȰ汾��ͬ�в�һ�µĵط����ɰ�Ϊ˵����ļ���/λ�ƽǣ��°�о��ֳ��˼���/λ�ƣ��Ա�ʱ������ע�⡣

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/15
'1.�޸ĸ������룬��Ϊ������ʽ
'2.�Ըն�����λ�ý��и���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29
'1.���Ӹ�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/18

'�������ݣ�
'1.


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****            MBuilding_¥�����ն�����.TXT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************



Sub OUTReader_MBuilding_����ն�(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, inputstring  As String

'����dataΪ�����е��ַ���
Dim data As String


'����ѭ������
Dim i, j As Integer

Dim ii As Integer




'==========================================================================================����ؼ��ʱ���


'�նȱ�
Dim Keyword_Rate1, Keyword_Rate2   As String
'��ֵ
Keyword_Rate1 = "RS_0"
Keyword_Rate2 = "RS_90"



'==========================================================================================�������ַ�����


'�նȱ�
Dim FirstString_kRate1 As String
Dim FirstString_kRate2 As String

'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���Ϊwmass.out
Filename = Dir(Path & "\*_¥�����ն�����.txt")

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ���¥�����ն�����.TXT"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"

ii = 0
Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�

    '�նȱ�
    FirstString_kRate1 = Mid(data, 10, 4)
    FirstString_kRate2 = Mid(data, 10, 5)
       

    '-------------------------------------------------------------------------------------------��ȡ�նȱ�
    
        
    If FirstString_kRate1 = Keyword_Rate1 Then
        'Debug.Print "aaaaaaaaaaaaaa"
        Line Input #i, data
        Line Input #i, data
        
        Dim str As String
        Dim m, i2 As Integer
        For m = 1 To 6
        
        With CreateObject("VBScript.RegExp")
        .Global = True
        .Pattern = "\S+"
        Dim mc
        Set mc = .Execute(data)  'ִ��ƥ�������
        If mc.Count >= m Then
            str = mc(m - 1).Value
        End If
        End With
    
'        str = StringfromStringforReg(data, "\S+", m)
        If str = "Rat1" Then
        i2 = m
        End If
        Next
        
        
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "Base") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If
                Sheets("d_M").Cells(j, 2) = StringfromStringforReg(data, "\S+", i2)
                Sheets("d_M").Cells(j, 4) = StringfromStringforReg(data, "\S+", 3)
            End If
            If CheckRegExpfromString(data, "--") = True Then
                Exit Do
            End If
        Loop

    End If
    If FirstString_kRate2 = Keyword_Rate2 Then
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "Base") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If
                Sheets("d_M").Cells(j, 3) = StringfromStringforReg(data, "\S+", i2)
                Sheets("d_M").Cells(j, 5) = StringfromStringforReg(data, "\S+", 3)
            End If
            If CheckRegExpfromString(data, "--") = True Then
                Exit Do
            End If
            
            ii = ii + 1
                       
        Loop
        'Num_all = ii
        'Debug.Print Num_All

    End If
    
          
Loop

Sheets("d_M").Cells(Num_all + 2, 2) = 1
Sheets("d_M").Cells(Num_all + 2, 3) = 1

'Sheets("d_M").Cells(Num_all + 2, 4) = Sheets("d_M").Cells(Num_all + 1, 4)
'Sheets("d_M").Cells(Num_all + 2, 5) = Sheets("d_M").Cells(Num_all + 1, 5)

'�رս���ļ�WMASS.OUT
Close #i

'-------------------------------------------------------------------------------------------������ֵ
'Sheets("d_M").Cells.EntireColumn.AutoFit
'
'Num_All = Sheets("d_M").range("a65536").End(xlUp)
'Debug.Print "��¥��="; Num_All
'
''Dim ii As Integer
'Dim i_RowID As Integer
'Dim i_Rng As range
'
''---------------------------------------------------------�նȱ�
'For ii = 2 To 3
'Dim R As range
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 1, ii))
'Call maxormin(R, "min", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next


'-------------------------------------------------------------------------------------------��ȡ��С�նȱ�
Sheets("g_M").Cells(22, 5).Formula = "=MIN(d_M!B" & Num_Base + 3 & ":B" & Num_all + 1 & ")"
Sheets("g_M").Cells(22, 7).Formula = "=MIN(d_M!C" & Num_Base + 3 & ":C" & Num_all + 1 & ")"

'-------------------------------------------------------------------------------------------�ԸնȱȽ�������
For ii = 2 To 3
    Sheets("d_M").Cells(Num_Base + 3, ii).Interior.ColorIndex = 7
        For jj = 4 To Num_all + 1
            If Sheets("d_M").Cells(jj, 60).Value / Sheets("d_M").Cells(jj + 1, 60).Value > 1.5 Then
            Sheets("d_M").Cells(jj, ii).Interior.ColorIndex = 7
        End If
    Next
Next
'
'If i2 = 6 Then
'Num_all = Sheets("d_M").range("a65536").End(xlUp)
'For ii = 4 To 5
'    For jj = 3 To Num_all + 2
'    Sheets("d_M").Cells(jj, ii) = Sheets("d_M").Cells(jj, ii) * Sheets("d_M").Cells(jj, 60)
'    Next
'Next
'End If

Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub
