Attribute VB_Name = "MBuilding_����Ϣ"
Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/24
'1.����жϴ���,���¥��û�������ǳ������⡣

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'1.��Ӵ���,���ģ�ͽ��������ҵ����ݶ�ȡ���⡣

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/15
'1.��Ӷ�ȡ�������Ͳ��
'2.������������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29
'1.���Ӹ�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/08/01

'�������ݣ�
'1.�޸ĸ��رȶ�����룻


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/30

'�������ݣ�
'1.�޸�Num_All��ȡ���룻
'2.д��·�������򡢼������ڡ�¥�����ɶȡ������ۼ�ϵ������Ϣ��


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/18

'�������ݣ�
'1.


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                  MBuilding_�ṹ����Ϣ.TXT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************



Sub OUTReader_MBuilding_����Ϣ(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename  As String, filepath  As String, inputstring  As String

'����dataΪ�����е��ַ���
Dim data As String


'����ѭ������
Dim i As Integer, j As Integer, NN As Integer

Dim i_m As Integer, i_k1 As Integer, i_k2 As Integer, i_w As Integer

'i_k1��i_k2�ֱ�Ϊ���ָնȱȵ�д��������¼����3��Ϊ��1�㣬ǰ����Ϊ������
i_k1 = 3
i_k2 = 3


'�ı���ǰ����
Dim n As Integer

Dim Mass, kWeight


'==========================================================================================����ؼ��ʱ���

'����
Dim Keyword_Mass1 As String, Keyword_Mass2 As String, Keyword_Mass3 As String, Keyword_Mass4 As String
'��ֵ
Keyword_Mass1 = "���ز�����������(t)"
Keyword_Mass2 = "���ز�����������(t)"
Keyword_Mass3 = "���������� (t):  " '------------------------MB��û����
Keyword_Mass4 = "�ṹ��������(t)"

'��λ�������
Dim Keyword_MassAve As String
'��ֵ
Keyword_MassAve = "��������������" '----------------------MB��û��ֱ�������λ���������ֻ�в��������

'�����
Dim Keyword_Wind As String
'��ֵ
Keyword_Wind = "�淶����" '---------------------------------MB��ṹ�㸲�������������������淶�����ͽṹ��ѧ�������˴����ù淶����


'�㸲����
Dim Keyword_Over As String
'��ֵ
Keyword_Over = "���㸲���ROTM"

'¥������'--------------------------------?
Dim Keyword_Flo As String
'��ֵ
Keyword_Flo = "¥������"

'���ر�
Dim Keyword_kWeight0, Keyword_kWeight1, Keyword_kWeight2 As String '-----------MB��ô������ر��أ�
'��ֵ
Keyword_kWeight0 = "EJd"
Keyword_kWeight1 = " RS_0"
Keyword_kWeight2 = "RS_90"

'��ֵ
Dim Keyword_FloShear  As String
Keyword_FloShear = "Ratio_Bu"

'�����ۼ�ϵ��
Dim Keyword_TD, Keyword_TA As String
Keyword_TD = "�����ۼ�ϵ��"

'����������
Keyword_TA = "����������"


'==========================================================================================�������ַ�����

'����
Dim FirstString_Mass As String
Dim FirstString_Mass_2 As String

'��λ�������
Dim FirstString_MassAve As String


'�����
Dim FirstString_Wind As String

'�㸲����
Dim FirstString_Over As String

'¥������
Dim FirstString_Flo As String

'���ر�
Dim FirstString_kWeight As String


'�����ۼ�ϵ��
Dim FirstString_TD As String

'����������
Dim FirstString_TA As String



'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���Ϊwmass.out
Filename = Dir(Path & "\*_�ṹ����Ϣ.txt")

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wmass.out"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�
    
    '����
    FirstString_Mass = Mid(data, 3, 11)
    FirstString_Mass_2 = Mid(data, 3, 9)
    '��λ�������
    FirstString_MassAve = Mid(data, 6, 8)
    '�����
    FirstString_Wind = Mid(data, 52, 4)
    '���㸲
    FirstString_Over = Mid(data, 13, 9)
    '¥������'-----------------------------------?
    FirstString_Flo = Mid(data, 30, 4)
    '���ر�
    'FirstString_kWeight = Mid(data, 6, 15) '-----------
    
    '�����ۼ�ϵ��
    FirstString_TD = Mid(data, 3, 6)
    '����������
    FirstString_TA = Mid(data, 3, 5)
    
    
    If Mid(data, 64, 4) = "��������" Then
        'CalTime = Mid(data, 57, 11)
        'Debug.Print "����ʱ��:" & CalTime
        Sheets("g_M").Cells(4, 7) = Mid(data, 70, 8)
    End If
    

    '-------------------------------------------------------------------------------------------��ȡ�ṹ��ϵ��������Ϣ
    'Dim StrType As Integer
    'StrType = 1
    'If Mid(data, 3, 5) = "�ṹ��ϵ:" Then
        'If CheckRegExpfromString(data, "�ṹ��ϵ:\s+\w*����ǽ\w*") Then
            'StrType = 2
            '�նȱ����¸�ֵ
            'Keyword_Rate = "Ratx2="
            'Debug.Print data
        'End If
    'End If

    If Mid(data, 3, 6) = "�����Ҳ���:" Then
        Num_Base = StringfromStringforReg(data, "\S+", 2)
        Debug.Print "�����Ҳ���:"; Num_Base
    End If

    Dim Num_Change As Integer
    If Mid(data, 6, 8) = "ת��������¥�㣺" Then
        Num_Change = StringfromStringforReg(data, "\S+", 2)
        Debug.Print "ת�������ڲ�ţ�"; Num_Change
    End If


    If FirstString_TA = Keyword_TA Then
        Sheets("g_M").Cells(38, 7) = extractNumberFromString(data, 1)
    End If
    
    If FirstString_TD = Keyword_TD Then
        Sheets("g_M").Cells(5, 7) = extractNumberFromString(data, 1)
    End If
    
    
'        '-------------------------------------------------------------------------------------------��ȡ������------------------------------------------���
'
'    If Mid(data, 6, 5) = "���������" Then
'        Line Input #i, data
'        Line Input #i, data
'        Line Input #i, data
'        Line Input #i, data
'        Do While Not EOF(1)
'            Line Input #i, data
'            '�����������������Ϊ��������
'
'                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
'                'jΪ��ȡ������д������������������б�����
'                j = extractNumberFromString(data, 1) + 2
'
'                '��һд������
'                Sheets("d_M").Cells(j, 54) = extractNumberFromString(data, 5) + extractNumberFromString(data, 6)
'                Sheets("d_M").Cells(j, 54) = Round(Sheets("d_M").Cells(j, 54), 1)
'                'Sheets("d_M").Cells(j, 54) = StringfromStringforReg(data, "\S+", 6) & "+" & StringfromStringforReg(data, "\S+", 7)
'            If CheckRegExpfromString(data, "--") = True Then
'                Exit Do
'            End If
'        Loop

'        Debug.Print "��ȡ�������Ϣ"
'        Debug.Print "��ʱ: " & Timer - sngStart
'        Debug.Print "����"
'
'    End If

    '�����ַ����ϡ�����ء��ؼ���
    If FirstString_Mass = Keyword_Mass1 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_M").Cells(6, 5) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ�����ء��ؼ���
    If FirstString_Mass = Keyword_Mass2 Then

         '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_M").Cells(7, 5) = extractNumberFromString(data, 1)


        Debug.Print "��ȡ���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ����Ӻ��ء��ؼ���
    If FirstString_Mass = Keyword_Mass3 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_M").Cells(9, 5) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ���Ӻ�������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ����������ؼ���
    If FirstString_Mass_2 = Keyword_Mass4 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_M").Cells(7, 7) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ�ṹ������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    
            '-------------------------------------------------------------------------------------------��ȡ���------------------------------------------���

    If Mid(data, 6, 6) = "���㹹������" Then
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then

                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                    Debug.Print j & "11111111111111111111111111111111"
                End If
                Sheets("d_M").Cells(j, 60) = StringfromStringforReg(data, "\S+", 8)
            End If
            If CheckRegExpfromString(data, "--") = True Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ���"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If


    
    '-------------------------------------------------------------------------------------------��ȡ�������Ϣ

    If FirstString_Wind = Keyword_Wind Then
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then

                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If

                '��һд���š�����X���㸲���X������Y���㸲���Y
                Sheets("d_M").Cells(j, 1) = j - 2
                Sheets("d_M").Cells(j, 6) = StringfromStringforReg(data, "\S+", 4)
                Sheets("d_M").Cells(j, 7) = StringfromStringforReg(data, "\S+", 5)
                Sheets("d_M").Cells(j, 8) = StringfromStringforReg(data, "\S+", 7)
                Sheets("d_M").Cells(j, 9) = StringfromStringforReg(data, "\S+", 8)

            End If
            If CheckRegExpfromString(data, "--") = True Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ�������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If


    '-------------------------------------------------------------------------------------------��ȡ���㸲��Ϣ

    If FirstString_Over = Keyword_Over Then

        '������ʽ����26�п�ʼд������
        j = 48
    
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){3}") = True Then

                '��һд�뿹�㸲���ء��㸲���ء���ֵ����Ӧ����
                Sheets("g_M").Cells(j, 4) = extractNumberFromString(data, 1)
                Sheets("g_M").Cells(j, 5) = extractNumberFromString(data, 2)
                Sheets("g_M").Cells(j, 6) = extractNumberFromString(data, 3)
                Sheets("g_M").Cells(j, 7) = "-"

                '����
                j = j + 1

            End If

            '�����ָ�����==�����˳�Сѭ��
            If CheckRegExpfromString(data, "==") = True Then

                '�����ʾ��
                Debug.Print "��ȡ���㸲��Ϣ"
                Debug.Print "��ʱ: " & Timer - sngStart
                Debug.Print "����"

                Exit Do

            End If

        Loop

    End If

    '-------------------------------------------------------------------------------------------��ȡ���ر�
    If CheckRegExpfromString(data, "\s���ر�") Then
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
                '���ر�
            FirstString_kWeight = Mid(data, 6, 5) '-----------
            
             'X����ر��ж�
            If FirstString_kWeight = Keyword_kWeight1 Then
'           Debug.Print FirstString_kWeight
'           Debug.Print data

            Sheets("g_M").Cells(20, 5) = extractNumberFromString(data, 4)
            End If


            'Y����ر��ж�
             If FirstString_kWeight = Keyword_kWeight2 Then
'            Debug.Print FirstString_kWeight
'           Debug.Print data

            Sheets("g_M").Cells(21, 5) = extractNumberFromString(data, 4)
            End If
            
            If CheckRegExpfromString(data, "==") = True Then
                Exit Do
            End If
        Loop
    End If
    
    
    '-------------------------------------------------------------------------------------------��ȡ��λ�������
    NN = 0
    If FirstString_MassAve = Keyword_MassAve Then
        Do While Not EOF(1)
            Line Input #i, data
                '���ر�
            FirstString_kWeight = Mid(data, 6, 15) '-----------
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If

                '��һд���š���λ���������������
                Dim aa As String
                aa = StringfromStringforReg(data, "\S+", 3)
                If aa = "-" Then
                    Sheets("d_M").Cells(j, 54) = 1
                    Sheets("d_M").Cells(j, 55) = 1
                Else
                    Sheets("d_M").Cells(j, 54) = aa / 1000
                    Sheets("d_M").Cells(j, 55) = StringfromStringforReg(data, "\S+", 4)
                End If
'                Sheets("d_M").Cells(j, 55) = StringfromStringforReg(data, "\S+", 4)
                NN = NN + 1

            End If
            'If CheckRegExpfromString(data, "==") = True Then
                '��¼�ܲ���
                'Num_All = j - 2
                'Debug.Print Num_All
                'Exit Do
            'End If
        Loop

    End If
'
    
Loop

Num_all = NN
Debug.Print Num_all

'�رս���ļ�

'-------------------------------------------------------------------------------------------������ֵ
'Sheets("d_M").Cells.EntireColumn.AutoFit
'
'Num_All = Sheets("d_M").range("a65536").End(xlUp)
'Debug.Print "��¥��="; Num_All
'
'Dim ii As Integer
'Dim i_RowID As Integer
'Dim i_Rng As range
'
'
''---------------------------------------------------------������
'For ii = 55 To 55
'Dim R As range
'Set R = Worksheets("d_M").range(Cells(4, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_M!R4C" & CStr(ii) & ":R" & CStr(Num_All + 2) & "C" & CStr(ii))
'Next


Close #i
'-------------------------------------------------------------------------------------------�жϼ��ر����
Select Case Sheets("g_M").Cells(20, 5).Value
    Case Is < 1.4: Sheets("g_M").Cells(20, 7) = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_M").Cells(20, 7) = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_M").Cells(20, 7) = "�����ȶ�,���ƶ���"
End Select

Select Case Sheets("g_M").Cells(21, 5).Value
    Case Is < 1.4: Sheets("g_M").Cells(21, 7) = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_M").Cells(21, 7) = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_M").Cells(21, 7) = "�����ȶ�,���ƶ���"
End Select

'-------------------------------------------------------------------------------------------��ȡ�ײ������µļ��������
'X�����
Sheets("g_M").Cells(42, 4).Formula = "=d_M!F" & Num_Base + 3
'X�����
Sheets("g_M").Cells(42, 6).Formula = "=d_M!G" & Num_Base + 3
'Y�����
Sheets("g_M").Cells(43, 4).Formula = "=d_M!H" & Num_Base + 3
'Y�����
Sheets("g_M").Cells(43, 6).Formula = "=d_M!I" & Num_Base + 3

'-------------------------------------------------------------------------------------------д������·���ͼ����������
Sheets("g_M").Cells(3, 4) = OUTReader_Main.TextBox_Path.Text
Sheets("g_M").Cells(4, 4) = "Midas Building"

'-------------------------------------------------------------------------------------------����λ���������Ϊ¥������
Sheets("d_M").Cells(1, 54) = "¥�������ֲ�"
Sheets("d_M").Cells(2, 54) = "¥������"
Sheets("d_M").Cells(Num_Base + 3, 55) = 1



Sheets("d_M").Cells(1, 60) = "���"
Sheets("d_M").Cells(2, 60) = "m"


Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub

