Attribute VB_Name = "YJK_WMASS"
'Public Num_All, Num_Base As Integer

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            YJK_WMASS.OUT���ִ���                     ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/9/2
'��������:
'1.������������ȡ���󣬻����Ѿ��ۼ������ٳ�0.5

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/4/16
'��������:
'1.�޸�������ȡ

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/3/27
'��������:
'1.��Ӷ�ȡ¥����
'2.����1.6����ʱ��ͳ���Ķ�ȡ


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/3/8
'��������:
'1.������߶�ȡ��1.6.2���޷���ȡ������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/11/03
'��������:
'1.����YJK¥�㿹������������ؼ��֣�ԭ�ؼ�����YJK V1.5�����޷���ȡ��Ӧ����


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/05/05
'��������:
'1.�����ṹ���͵��жϣ����ӡ���������ж�


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/03/18
'��������:
'1.���Ӷ�ȡ��ߣ�
'2.����YJK�ն�����


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/17
'��������:
'1.�����նȱȡ��������ȡ������ȵĸ�������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/10/29
'��������:
'1.�����ṹ���͵��жϣ����롰Ͳ�����ж�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/9/30
'��������:
'1.�����û�������������ȡ

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/30
'��������:
'1.�޸ĸնȱ�����������ʽ��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29
'1.��Ӹ������룻

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/29
'��������:
'1.���Ӽ������ڵĶ�ȡ

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/19
'��������:
'1.�����ײ㡰¥�㿹����������Ϊ0��bug
'2.�ײ������µļ��������д��general

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/12
'��������:
'1.�����°�general�޸�������Ϣ��λ�ü�����

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/02
'��������:��ֲPKPM��alpha��



'////////////////////////////////////////////////////////////////////////////////////////////



Sub OUTReader_YJK_WMASS(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'=================================================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, inputstring  As String

'����dataΪ�����е��ַ���
Dim data As String


'����ѭ������
Dim i, j As Integer

Dim i_m, i_k1, i_k2, i_w As Integer

'i_k1��i_k2�ֱ�Ϊ���ָնȱȵ�д��������¼����3��Ϊ��1�㣬ǰ����Ϊ������
i_k1 = 3
i_k2 = 3


'�ı���ǰ����
Dim n As Integer

Dim Mass, kWeight


'=================================================================================================================����ؼ��ʱ���

'����
Dim Keyword_Mass1, Keyword_Mass2, Keyword_Mass3, Keyword_Mass4 As String
'��ֵ
Keyword_Mass1 = "���������� (t):"
Keyword_Mass2 = "���������� (t):"
Keyword_Mass3 = "���������� (t):"
Keyword_Mass4 = "�ṹ������ (t):"

'��λ�������
Dim Keyword_MassAve As String
'��ֵ
Keyword_MassAve = "���   ����    ¥������   ��λ�������"

'�����
Dim Keyword_Wind As String
'��ֵ
Keyword_Wind = "���   ����  �����X"

'�նȱ�
Dim Keyword_Rate As String
'��ֵ
Keyword_Rate = "Ratx1="

'�ն�
Dim Keyword_K As String
'��ֵ
Keyword_K = "RJX3 ="

'�㸲����
Dim Keyword_Over As String
'��ֵ
Keyword_Over = "���㸲����Mr"

'¥������
Dim Keyword_Flo As String
'��ֵ
Keyword_Flo = "¥������"

'���ر�
Dim Keyword_kWeight1, Keyword_kWeight2 As String
'��ֵ
Keyword_kWeight1 = "X����ر�"
Keyword_kWeight2 = "Y����ر�"

'¥���������
Dim Keyword_FloShear As String
'��ֵ
Keyword_FloShear = "Ratio_X,Ratio_Y"


'=================================================================================================================�������ַ�����

'����
Dim FirstString_Mass As String

'��λ�������
Dim FirstString_MassAve As String

'�նȱ�
Dim FirstString_kRate As String

'�նȱ�
Dim FirstString_K As String

'�����
Dim FirstString_Wind As String

'�㸲����
Dim FirstString_Over As String

'¥������
Dim FirstString_Flo As String

'���ر�
Dim FirstString_kWeight As String

'¥�������
Dim Firststring_FloShear As String


'=================================================================================================================�����ļ���ȡ·��

'ָ���ļ���Ϊwmass.out
Filename = "WMASS.OUT"

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�wmass.out"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    '��¼����
    n = n + 1
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�
    
    '����
    FirstString_Mass = Mid(data, 3, 10)
    '��λ�������
    FirstString_MassAve = Mid(data, 3, 24)
    '�����
    FirstString_Wind = Mid(data, 3, 13)
    '�նȱ�
    FirstString_kRate = Mid(data, 3, 6)
    '�ն�
    FirstString_K = Mid(data, 3, 6)
    '���㸲
    FirstString_Over = Mid(data, 16, 7)
    '¥������
    FirstString_Flo = Mid(data, 30, 4)
    '���ر�
    FirstString_kWeight = Mid(data, 3, 5)
    '¥�����
    Firststring_FloShear = Mid(data, 3, 15)
    

    '-------------------------------------------------------------------------------------------��ȡ�ṹ��ϵ��������Ϣ
    Dim CalTime As String
    If Mid(data, 9, 4) = "��������" Or Mid(data, 13, 4) = "��������" Then
        CalTime = Mid(data, 14, 11)
        Debug.Print "����ʱ��:" & CalTime
        Sheets("g_Y").Cells(4, 7) = CalTime
    End If
    
    If Mid(data, 13, 4) = "��������" Then '���֧��1.6
        CalTime = Mid(data, 18, 11)
        Debug.Print "����ʱ��:" & CalTime
        Sheets("g_Y").Cells(4, 7) = CalTime
    End If

    Dim StrType As Integer
    StrType = 1
    'PKPM�ؼ���Ϊ���ṹ���
    If Mid(data, 8, 5) = "�ṹ��ϵ:" Then
        If CheckRegExpfromString(data, ".*��.*") Or CheckRegExpfromString(data, ".*Ͳ.*") Then
            StrType = 2
            '�նȱ����¸�ֵ
            Keyword_Rate = "Ratx2="
            Debug.Print data
        End If
    End If

    If Mid(data, 8, 6) = "�����Ҳ���:" Then
        Num_Base = StringfromStringforReg(data, "\S+", 2)
        Debug.Print "�����Ҳ���:"; Num_Base
    End If

    Dim Num_Change As Integer
    If Mid(data, 8, 8) = "ת�������ڲ�ţ�" Then
        Num_Change = StringfromStringforReg(data, "\S+", 2)
        Debug.Print "ת�������ڲ�ţ�"; Num_Change
    End If

    If Mid(data, 9, 4) = "�������" Then
        Sheets("g_Y").Cells(4, 4) = Mid(data, 14, 20)
    End If
    
    If Mid(data, 13, 4) = "�������" Then
        Sheets("g_Y").Cells(4, 4) = Mid(data, 18, 12)
    End If

    If Mid(data, 8, 6) = "����¥��ٶ�" Then
        Sheets("g_Y").Cells(5, 5) = StringfromStringforReg(data, "\S+", 3)
    End If

    If Mid(data, 8, 6) = "�����ۼ�ϵ��" Then
        Sheets("g_Y").Cells(5, 7) = extractNumberFromString(data, 1)
    End If
    
    If Mid(data, 8, 7) = "�û�����������" Then
        Sheets("g_Y").Cells(38, 7) = extractNumberFromString(data, 1)
    End If
    '-------------------------------------------------------------------------------------------��ȡ����


'    Select Case FirstString_Mass
'
'        Case Keyword_Mass1
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_Y").Cells(7, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ���������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'        Case Keyword_Mass2
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_Y").Cells(8, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ���������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'        Case Keyword_Mass3
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_Y").Cells(9, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ���Ӻ�������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'        Case Keyword_Mass4
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_Y").Cells(11, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ�ṹ������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'    End Select

    If Mid(data, 18, 4) = "��������" Then
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If Mid(data, 3, 2) = "�ϼ�" Then
                Exit Do
            End If
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then

                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2

                '��һд�������
                Sheets("d_Y").Cells(j, 54) = extractNumberFromString(data, 6) + extractNumberFromString(data, 7)
                Sheets("d_Y").Cells(j, 54) = Round(Sheets("d_Y").Cells(j, 54), 1)
                Sheets("d_Y").Cells(j, 55).Formula = "=RC[-1]/R[-1]C[-1]"

                'Sheets("d_P").Cells(j, 54) = StringfromStringforReg(data, "\S+", 6) & "+" & StringfromStringforReg(data, "\S+", 7)
  

            End If

        Loop
        Sheets("d_Y").Cells(3, 55) = 1
        Debug.Print "��ȡ��������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If



    '�����ַ����ϡ�����ء��ؼ���
    If FirstString_Mass = Keyword_Mass1 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_Y").Cells(6, 5) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ�����ء��ؼ���
    If FirstString_Mass = Keyword_Mass2 Then

         '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_Y").Cells(7, 5) = extractNumberFromString(data, 1)


        Debug.Print "��ȡ���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ����Ӻ��ء��ؼ���
    If FirstString_Mass = Keyword_Mass3 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_Y").Cells(6, 7) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ���Ӻ�������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ����������ؼ���
    If FirstString_Mass = Keyword_Mass4 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_Y").Cells(7, 7) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ�ṹ������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    
    '-------------------------------------------------------------------------------------------��ȡ�������Ϣ

    If FirstString_Wind = Keyword_Wind Then
'        Debug.Print "����������Ϣ"
'        Debug.Print data
        Dim cs As Integer
        cs = 0
        Do While Not EOF(1)
            Line Input #i, data
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then
'                Debug.Print "�ҵ�������"
'                Debug.Print data
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                cs = cs + 1

                '��һд���š�����X���㸲���X������Y���㸲���Y
                Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                Sheets("d_Y").Cells(j, 6) = StringfromStringforReg(data, "\S+", 4)
                Sheets("d_Y").Cells(j, 7) = StringfromStringforReg(data, "\S+", 5)
                Sheets("d_Y").Cells(j, 8) = StringfromStringforReg(data, "\S+", 7)
                Sheets("d_Y").Cells(j, 9) = StringfromStringforReg(data, "\S+", 8)

            End If
            If CheckRegExpfromString(data, "\*\*\*") = True Then
                Exit Do
            End If
        Loop
        Num_all = cs

        Debug.Print "��ȡ�������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    
                '-------------------------------------------------------------------------------------------��ȡ���

    If Mid(data, 10, 6) = "���㹹������" Or Mid(data, 24, 6) = "���㹹������" Then

        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            'jΪ��ȡ������д������������������б�����
            j = extractNumberFromString(data, 1) + 2
            '��һд����
            Sheets("d_Y").Cells(j, 60) = StringfromStringforReg(data, "\S+", 7)
            If CheckRegExpfromString(data, "--------") = True Then
                Exit Do
            End If

        Loop

        Debug.Print "��ȡ��������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '-------------------------------------------------------------------------------------------��ȡ��λ�������

'    If FirstString_MassAve = Keyword_MassAve Then
'        Do While Not EOF(1)
'            Line Input #i, data
'            '�����������������Ϊ��������
'            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then
'
'                'jΪ��ȡ������д������������������б�����
'                j = extractNumberFromString(data, 1) + 2
'
'                '��һд���š���λ���������������
'                Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
'                Sheets("d_Y").Cells(j, 54) = StringfromStringforReg(data, "\S+", 4)
'                Sheets("d_Y").Cells(j, 55) = StringfromStringforReg(data, "\S+", 5)
'
'            End If
'            If CheckRegExpfromString(data, "\*\*\*") = True Then
'
'                Exit Do
'            End If
'        Loop
'
'        Debug.Print "��ȡ��λ�������"
'        Debug.Print "��ʱ: " & Timer - sngStart
'        Debug.Print "����"
'
'    End If



    '-------------------------------------------------------------------------------------------��ȡ�նȱ�
    
        
    If FirstString_kRate = Keyword_Rate Then
'       Debug.Print data
'       Debug.Print extractNumberFromString(data, 2)
        Sheets("d_Y").Cells(i_k1, 2) = extractNumberFromString(data, 1)
        Sheets("d_Y").Cells(i_k1, 2) = Round(Sheets("d_Y").Cells(i_k1, 2), 4)
        Sheets("d_Y").Cells(i_k1, 3) = extractNumberFromString(data, 2)
        Sheets("d_Y").Cells(i_k1, 3) = Round(Sheets("d_Y").Cells(i_k1, 3), 4)
        i_k1 = i_k1 + 1
    End If


    '-------------------------------------------------------------------------------------------��ȡ�ն�


    If FirstString_K = Keyword_K Then
'       Debug.Print data
'       Debug.Print extractNumberFromString(data, 2)
        Sheets("d_Y").Cells(i_k2, 4) = extractNumberFromString(data, 1)
        Sheets("d_Y").Cells(i_k2, 5) = extractNumberFromString(data, 2)
        i_k2 = i_k2 + 1
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
                Sheets("g_Y").Cells(j, 4) = extractNumberFromString(data, 1)
                Sheets("g_Y").Cells(j, 5) = extractNumberFromString(data, 2)
                Sheets("g_Y").Cells(j, 6) = extractNumberFromString(data, 3)
                Sheets("g_Y").Cells(j, 7) = extractNumberFromString(data, 4)

                '����
                j = j + 1

            End If

            '�����ָ�����\*\*\*�����˳�Сѭ��
            If CheckRegExpfromString(data, "\*\*\*") = True Then

                '�����ʾ��
                Debug.Print "��ȡ���㸲��Ϣ"
                Debug.Print "��ʱ: " & Timer - sngStart
                Debug.Print "����"

                Exit Do

            End If

        Loop

    End If

    '-------------------------------------------------------------------------------------------��ȡ���ر�

    'X����ر��ж�
    If FirstString_kWeight = Keyword_kWeight1 Then
'        Debug.Print FirstString_kWeight
'        Debug.Print data

        Sheets("g_Y").Cells(20, 5) = extractNumberFromString(data, 1)

    End If


    'Y����ر��ж�
    If FirstString_kWeight = Keyword_kWeight2 Then
'        Debug.Print FirstString_kWeight
'        Debug.Print data

        Sheets("g_Y").Cells(21, 5) = extractNumberFromString(data, 1)

    End If



    '-------------------------------------------------------------------------------------------��ȡ¥�����������

    If Firststring_FloShear = Keyword_FloShear Then

        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){3}") = True Then

                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������

                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2

                '��һд��Ratio_X��Ratio_Y
                Sheets("d_Y").Cells(j, 46) = extractNumberFromString(data, 5)
                Sheets("d_Y").Cells(j, 46) = Round(Sheets("d_Y").Cells(j, 46), 4)
                Sheets("d_Y").Cells(j, 47) = extractNumberFromString(data, 6)
                Sheets("d_Y").Cells(j, 47) = Round(Sheets("d_Y").Cells(j, 47), 4)

            End If
            If j = 3 Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ¥�����������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
'
    
Loop



'�رս���ļ�WMASS.OUT
Close #i



''-------------------------------------------------------------------------------------------������ֵ
'Sheets("d_Y").Cells.EntireColumn.AutoFit
'
'Num_All = Sheets("d_Y").range("a65536").End(xlUp)
'Debug.Print "��¥��="; Num_All
'
'Dim i_RowID As Integer
'Dim i_Rng As range
'
''---------------------------------------------------------�նȱ�
'For ii = 2 To 3
'Dim R As range
'Set R = Worksheets("d_Y").range(Cells(3, ii), Cells(Num_All + 1, ii))
'Call maxormin(R, "min", "d_Y!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
''---------------------------------------------------------��������
'For ii = 46 To 47
'Set R = Worksheets("d_Y").range(Cells(3, ii), Cells(Num_All + 1, ii))
'Call maxormin(R, "min", "d_Y!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
''---------------------------------------------------------������
'ii = 55
'Set R = Worksheets("d_Y").range(Cells(4, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_Y!R4C" & CStr(ii) & ":R" & CStr(Num_All + 2) & "C" & CStr(ii))


'-------------------------------------------------------------------------------------------��ȡ��С�նȱ�
'Sheets("g_Y").Cells(11, 14).Formula = "=MIN(d_Y!B:B)"
Sheets("g_Y").Cells(22, 5).Formula = "=MIN(d_Y!B" & Num_Base + 3 & ":B" & Num_all + 1 & ")"
'Sheets("g_Y").Cells(11, 15).Formula = "=MIN(d_Y!C:C)"
Sheets("g_Y").Cells(22, 7).Formula = "=MIN(d_Y!C" & Num_Base + 3 & ":C" & Num_all + 1 & ")"

'-------------------------------------------------------------------------------------------��ȡ���¥�㿹����������
'Sheets("g_Y").Cells(13, 14).Formula = "=Min(d_Y!AT:AT)"
Sheets("g_Y").Cells(23, 5).Formula = "=MIN(d_Y!AT" & Num_Base + 3 & ":AT" & Num_all + 2 & ")"
'Sheets("g_Y").Cells(13, 15).Formula = "=Min(d_Y!AU:AU)"
Sheets("g_Y").Cells(23, 7).Formula = "=MIN(d_Y!AU" & Num_Base + 3 & ":AU" & Num_all + 2 & ")"

'-------------------------------------------------------------------------------------------��ȡ�ײ������µļ��������
'X�����
Sheets("g_Y").Cells(42, 4).Formula = "=d_Y!F" & Num_Base + 3
'X�����
Sheets("g_Y").Cells(42, 6).Formula = "=d_Y!G" & Num_Base + 3
'Y�����
Sheets("g_Y").Cells(43, 4).Formula = "=d_Y!H" & Num_Base + 3
'Y�����
Sheets("g_Y").Cells(43, 6).Formula = "=d_Y!I" & Num_Base + 3

'-------------------------------------------------------------------------------------------���رȽ���ж�
Select Case Sheets("g_Y").Cells(20, 5).Value
    Case Is < 1.4: Sheets("g_Y").Cells(20, 7) = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_Y").Cells(20, 7) = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_Y").Cells(20, 7) = "�����ȶ�,���ƶ���"
End Select

Select Case Sheets("g_Y").Cells(21, 5).Value
    Case Is < 1.4: Sheets("g_Y").Cells(21, 7) = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_Y").Cells(21, 7) = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_Y").Cells(21, 7) = "�����ȶ�,���ƶ���"
End Select

'Sheets("g_Y").Cells.EntireColumn.AutoFit


Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub


Sub test112()
Select Case Sheets("g_Y").Cells(21, 5).Value
    Case Is < 1.4: Sheets("g_Y").Cells(21, 7).Value = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_Y").Cells(21, 7).Value = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_Y").Cells(21, 7).Value = "�����ȶ�,���ƶ���"
End Select


End Sub

'------------------------------------------------------------------------------------------------------------------------��ӹ��̶ԸնȱȽ�������
Sub modi_stiff_Y()
'-------------------------------------------------------------------------------------------�ԸնȽ��в������
Num_all = Sheets("d_Y").range("a65536").End(xlUp)
For ii = 4 To 5
    For jj = 3 To Num_all + 2
    Sheets("d_Y").Cells(jj, ii) = Sheets("d_Y").Cells(jj, ii) * Sheets("d_Y").Cells(jj, 60)
    Next
Next

'-------------------------------------------------------------------------------------------�ԸնȱȽ�������
For ii = 2 To 3
    'Sheets("d_P").Cells(Num_Base+3, ii).Value = Sheets("d_P").Cells(3, ii).Value * 1.5 '-------------------------Ĭ���ײ�Ƕ��
    Sheets("d_Y").Cells(Num_Base + 3, ii).Interior.ColorIndex = 7
        For jj = 3 To Num_all + 1
            If Sheets("d_Y").Cells(jj, 60).Value / Sheets("d_Y").Cells(jj + 1, 60).Value > 1.5 Then
            Sheets("d_Y").Cells(jj, ii).Value = Sheets("d_Y").Cells(jj, ii + 2).Value / Sheets("d_Y").Cells(jj + 1, ii + 2).Value
            Sheets("d_Y").Cells(jj, ii).Interior.ColorIndex = 7
        Else
            Sheets("d_Y").Cells(jj, ii).Value = Sheets("d_Y").Cells(jj, ii + 2).Value / Sheets("d_Y").Cells(jj + 1, ii + 2).Value
        End If
    Next
Next
End Sub
