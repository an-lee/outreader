Attribute VB_Name = "PKPM_WMASS"
Public Num_all, Num_Base As Integer

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            PKPM_WMASS.OUT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/11/21
'��������:
'1.ƥ��PKPM v2.2 �汾���������ݰ�����1�������Ҳ��� 2)�������ȡ 3) ���


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/07/057
'��������:
'1.����PKPM�նȱ�����ʱ��ʼ�������󡣣�YJK��ȷ��

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/05/05
'��������:
'1.�����ṹ���͵��жϣ����ӡ���������ж�


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/03/18
'��������:
'1.�����ն�����ģ�飬�ԸնȱȽ�������ʱ���ӵ�3�п�ʼ


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/15
'��������:
'1.��Ӷ�ȡ���
'2.�޸Ķ�ȡ������(1.0D+1.0L)��������
'3.�����նȱȡ��������ȡ������ȵĸ�������
'4.�����ײ������¼�����ع�ʽ��+4��Ϊ+3�������û�ҵ������ﰡ��
'5.��ӹ��̶Ընȼ��նȱȽ����������Ժ�midas�Ƚϣ���ť���ڡ�ģ�ͶԱȡ���������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/10/29
'��������:
'1.�����ṹ���͵��жϣ����롰Ͳ�����ж�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29
'��������:
'1.��Ӹ�������
'2.�նȱȺͳ�������ȡ��Ч����

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'��������:
'1.��������¥��ٶ���ȡbug
'2.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

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

'����ʱ��:2013/7/16
'��������:
'1.���Ӷ�ȡ���͸���

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/12
'��������:
'1.�����°�general�޸�������Ϣ��λ�ü�����


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/8

'�������ݣ�
'1.�޸ĸնȱȼ������������ȵĹ�ʽ��

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/6 20:44

'�������ݣ�
'1.�����ܲ����͵����Ҳ�����ȫ�ֱ�������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/3 20:45

'�������ݣ�
'1.�������ر�д��λ��

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/27 19:37

'�������ݣ�
'1.�޸�ÿ�㵥λ�����е�λ��

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/21 21:15

'�������ݣ�
'1.ɾ�����õĶ������Row_over��Row_wind��Row_FloShear��Row_Flo
'2.Num_All��ֵΪȫ¥¥�������ڶ�ȡ��λ�����������ʱ�洢����Num_All����MainProgram�ﶨ��Ϊȫ�ֱ���
'3.��������նȱȡ����¥���������
'4.��ӵ�λ��������������ȶ�ȡ

'////////////////////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/5/17 18:01

'////////////////////////////////////////////////////////////////////////////////////////////



Sub OUTReader_PKPM_WMASS(Path As String)

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

Dim i_m, i_k1, i_k2, i_w As Integer

'i_k1��i_k2�ֱ�Ϊ���ָնȱȵ�д��������¼����3��Ϊ��1�㣬ǰ����Ϊ������
i_k1 = 3
i_k2 = 3


'�ı���ǰ����
Dim n As Integer

Dim Mass, kWeight


'==========================================================================================����ؼ��ʱ���

'����
Dim Keyword_Mass1, Keyword_Mass2, Keyword_Mass3, Keyword_Mass4 As String
'��ֵ
Keyword_Mass1 = "���ز����������� (t)"
Keyword_Mass2 = "���ز����������� (t)"
Keyword_Mass3 = "���������� (t):  "
Keyword_Mass4 = "�ṹ�������� (t): "

'��λ�������
Dim Keyword_MassAve As String
'��ֵ
Keyword_MassAve = "���   ����    ��λ�������"

'�����
Dim Keyword_Wind1 As String
Dim Keyword_Wind2 As String
'��ֵ
Keyword_Wind1 = "���  ����   �����X" '�޺����Ťת
Keyword_Wind2 = "���  ���� �����÷���"

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
Keyword_FloShear = "Ratio_Bu"


'==========================================================================================�������ַ�����

'����
Dim FirstString_Mass As String

'��λ�������
Dim FirstString_MassAve As String

'�նȱ�
Dim FirstString_kRate As String

'�նȱ�
Dim FirstString_K As String

'�����
Dim FirstString_Wind1 As String
Dim FirstString_Wind2 As String

'�㸲����
Dim FirstString_Over As String

'¥������
Dim FirstString_Flo As String

'���ر�
Dim FirstString_kWeight As String

'¥�������
Dim Firststring_FloShear As String


'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���Ϊwmass.out
Filename = "WMASS.OUT"

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

    '��¼����
    n = n + 1
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�
    
    '����
    FirstString_Mass = Mid(data, 6, 12)
    '��λ�������
    FirstString_MassAve = Mid(data, 2, 17)
    '�����
    FirstString_Wind1 = Mid(data, 2, 13) '�޺���Ťת
    FirstString_Wind2 = Mid(data, 2, 12)
    '�նȱ�
    FirstString_kRate = Mid(data, 3, 6)
    '�ն�
    FirstString_K = Mid(data, 3, 6)
    '���㸲
    FirstString_Over = Mid(data, 14, 7)
    '¥������
    FirstString_Flo = Mid(data, 30, 4)
    '���ر�
    FirstString_kWeight = Mid(data, 2, 5)
    '¥�����
    Firststring_FloShear = Mid(data, 11, 8)
    

    '-------------------------------------------------------------------------------------------��ȡ�ṹ��ϵ��������Ϣ��ģ����Ϣ
    Dim CalTime As String
    If Mid(data, 54, 2) = "����" Then
        CalTime = Mid(data, 57, 11)
        Debug.Print "����ʱ��:" & CalTime
        Sheets("g_P").Cells(4, 7) = CalTime
    End If
    
    Dim StrType As Integer
    StrType = 1
    If Mid(data, 6, 5) = "�ṹ���:" Then
        If CheckRegExpfromString(data, "�ṹ���:\s+.*��.*") Or CheckRegExpfromString(data, "�ṹ���:\s+.*Ͳ.*") Then
            StrType = 2
            '�նȱ����¸�ֵ
            Keyword_Rate = "Ratx2="
            Debug.Print data
        End If
    End If

    If Mid(data, 6, 6) = "�����Ҳ���:" Then
'        Num_Base = StringfromStringforReg(data, "\S+", 3) 'PKPM 2010��
        Num_Base = StringfromStringforReg(data, "\S+", 3)
        Debug.Print "�����Ҳ���:"; Num_Base
    End If

    Dim Num_Change As Integer
    If Mid(data, 6, 8) = "ת�������ڲ�ţ�" Then
        Num_Change = StringfromStringforReg(data, "\S+", 3)
        Debug.Print "ת�������ڲ�ţ�"; Num_Change
    End If


    Sheets("g_P").Cells(4, 4) = "SATWE ���İ�"

    If Mid(data, 6, 15) = "�Ƿ��ȫ¥ǿ�Ʋ��ø���¥��ٶ�" Then
        If Mid(data, 29, 1) = "��" Then Sheets("g_P").Cells(5, 5) = "����¥��ٶ�"
        If Mid(data, 29, 1) = "��" Then Sheets("g_P").Cells(5, 5) = "�Ǹ���¥��ٶ�"
    End If

    If Mid(data, 6, 6) = "�����ۼ�ϵ��" Then
        Sheets("g_P").Cells(5, 7) = extractNumberFromString(data, 1)
    End If


    If Mid(data, 6, 5) = "����������" Then
        Sheets("g_P").Cells(38, 7) = extractNumberFromString(data, 1)
    End If
    
    Sheets("g_P").Cells(38, 7).NumberFormatLocal = "0"
    
            '-------------------------------------------------------------------------------------------��ȡ������
    Dim ks As String

    If Mid(data, 25, 5) = "���������" Then
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then

                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2

                '��һд�������
                Sheets("d_P").Cells(j, 54) = extractNumberFromString(data, 6) + extractNumberFromString(data, 7)
                Sheets("d_P").Cells(j, 54) = Round(Sheets("d_P").Cells(j, 54), 1)
                'Sheets("d_P").Cells(j, 54) = StringfromStringforReg(data, "\S+", 6) & "+" & StringfromStringforReg(data, "\S+", 7)
  

            End If
            If j = 3 Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ��������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    

    '-------------------------------------------------------------------------------------------��ȡ����


'    Select Case FirstString_Mass
'
'        Case Keyword_Mass1
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_P").Cells(7, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ���������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'        Case Keyword_Mass2
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_P").Cells(8, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ���������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'        Case Keyword_Mass3
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_P").Cells(9, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ���Ӻ�������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'        Case Keyword_Mass4
'
'            '��ȡ�������ݣ���д�빤������Ӧλ��
'            Sheets("g_P").Cells(11, 5) = extractNumberFromString(data, 1)
'
'            Debug.Print "��ȡ�ṹ������"
'            Debug.Print "��ʱ: " & Timer - sngStart
'            Debug.Print "����"
'
'    End Select



    '�����ַ����ϡ�����ء��ؼ���
    If FirstString_Mass = Keyword_Mass1 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_P").Cells(6, 5) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ�����ء��ؼ���
    If FirstString_Mass = Keyword_Mass2 Then

         '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_P").Cells(7, 5) = extractNumberFromString(data, 1)


        Debug.Print "��ȡ���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ����Ӻ��ء��ؼ���
    If FirstString_Mass = Keyword_Mass3 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_P").Cells(6, 7) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ���Ӻ�������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If

    '�����ַ����ϡ����������ؼ���
    If FirstString_Mass = Keyword_Mass4 Then

        '��ȡ�������ݣ���д�빤������Ӧλ��
        Sheets("g_P").Cells(7, 7) = extractNumberFromString(data, 1)

        Debug.Print "��ȡ�ṹ������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    
                '-------------------------------------------------------------------------------------------��ȡ���

    If Mid(data, 20, 6) = "���㹹������" Then

        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data

                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                '��һд����
'                Sheets("d_P").Cells(j, 60) = StringfromStringforReg(data, "\S+", 10) 'PKPM v2010
                Sheets("d_P").Cells(j, 60) = StringfromStringforReg(data, "\S+", 14)
            If CheckRegExpfromString(data, "\*") = True Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ��������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If



    '-------------------------------------------------------------------------------------------��ȡ��λ�������

    If FirstString_MassAve = Keyword_MassAve Then
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then

                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2

                '��һд���š���λ���������������
                Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                'Sheets("d_P").Cells(j, 54) = StringfromStringforReg(data, "\S+", 3)'-------------------------------
                Sheets("d_P").Cells(j, 55) = StringfromStringforReg(data, "\S+", 4)

            End If
            If CheckRegExpfromString(data, "==") = True Then
                '��¼�ܲ���
                Num_all = j - 2
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ�������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If


    
    '-------------------------------------------------------------------------------------------��ȡ�������Ϣ

'    �޺�����Ťת
    If FirstString_Wind1 = Keyword_Wind1 Then
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then

                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2

                '��һд���š�����X���㸲���X������Y���㸲���Y
                Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                Sheets("d_P").Cells(j, 6) = StringfromStringforReg(data, "\S+", 4)
                Sheets("d_P").Cells(j, 7) = StringfromStringforReg(data, "\S+", 5)
                Sheets("d_P").Cells(j, 8) = StringfromStringforReg(data, "\S+", 7)
                Sheets("d_P").Cells(j, 9) = StringfromStringforReg(data, "\S+", 8)

            End If
            If CheckRegExpfromString(data, "==") = True Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ�������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    
'   �к�����Ťת
    If FirstString_Wind2 = Keyword_Wind2 Then
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") = True Then

                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2

                '��һд���š�����X���㸲���X������Y���㸲���Y
                Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                Sheets("d_P").Cells(j, 6) = StringfromStringforReg(data, "\S+", 5)
                Sheets("d_P").Cells(j, 7) = StringfromStringforReg(data, "\S+", 6)
                
                Line Input #i, data
                
                Sheets("d_P").Cells(j, 8) = StringfromStringforReg(data, "\S+", 3)
                Sheets("d_P").Cells(j, 9) = StringfromStringforReg(data, "\S+", 4)
                

            End If
            If CheckRegExpfromString(data, "==") = True Then
                Exit Do
            End If
        Loop

        Debug.Print "��ȡ�������Ϣ"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    
    

    '-------------------------------------------------------------------------------------------��ȡ�նȱ�
    
        
    If FirstString_kRate = Keyword_Rate Then
'       Debug.Print data
'       Debug.Print extractNumberFromString(data, 2)
        Sheets("d_P").Cells(i_k1, 2) = extractNumberFromString(data, 1)
        Sheets("d_P").Cells(i_k1, 2) = Round(Sheets("d_P").Cells(i_k1, 2), 4)
        Sheets("d_P").Cells(i_k1, 3) = extractNumberFromString(data, 2)
        Sheets("d_P").Cells(i_k1, 3) = Round(Sheets("d_P").Cells(i_k1, 3), 4)
        i_k1 = i_k1 + 1
    End If


    '-------------------------------------------------------------------------------------------��ȡ�ն�


    If FirstString_K = Keyword_K Then
'       Debug.Print data
'       Debug.Print extractNumberFromString(data, 2)
        Sheets("d_P").Cells(i_k2, 4) = extractNumberFromString(data, 1)
        Sheets("d_P").Cells(i_k2, 5) = extractNumberFromString(data, 2)
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
                Sheets("g_P").Cells(j, 4) = extractNumberFromString(data, 1)
                Sheets("g_P").Cells(j, 5) = extractNumberFromString(data, 2)
                Sheets("g_P").Cells(j, 6) = extractNumberFromString(data, 3)
                Sheets("g_P").Cells(j, 7) = extractNumberFromString(data, 4)

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

    'X����ر��ж�
    If FirstString_kWeight = Keyword_kWeight1 Then
'        Debug.Print FirstString_kWeight
'        Debug.Print data

        Sheets("g_P").Cells(20, 5) = extractNumberFromString(data, 1)

    End If


    'Y����ر��ж�
    If FirstString_kWeight = Keyword_kWeight2 Then
'        Debug.Print FirstString_kWeight
'        Debug.Print data

        Sheets("g_P").Cells(21, 5) = extractNumberFromString(data, 1)

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
                Sheets("d_P").Cells(j, 46) = extractNumberFromString(data, 5)
                Sheets("d_P").Cells(j, 46) = Round(Sheets("d_P").Cells(j, 46), 2)
                Sheets("d_P").Cells(j, 47) = extractNumberFromString(data, 6)
                Sheets("d_P").Cells(j, 47) = Round(Sheets("d_P").Cells(j, 47), 2)

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

'-------------------------------------------------------------------------------------------���¼���������
Sheets("d_P").Cells(1, 54) = "¥�������ֲ�"
Sheets("d_P").Cells(2, 54) = "¥������"
Sheets("d_P").Cells(3, 55).Value = 1
For ii = 4 To Num_all + 2
    Sheets("d_P").Cells(ii, 55).Value = Sheets("d_P").Cells(ii, 54).Value / Sheets("d_P").Cells(ii - 1, 54).Value
    Sheets("d_P").Cells(ii, 55).Value = Round(Sheets("d_P").Cells(ii, 55).Value, 2)
Next




'-------------------------------------------------------------------------------------------��ȡ��С�նȱ�
'Sheets("g_P").Cells(11, 14).Formula = "=MIN(d_P!B:B)"
Sheets("g_P").Cells(22, 5).Formula = "=MIN(d_P!B" & Num_Base + 3 & ":B" & Num_all + 1 & ")"
'Sheets("g_P").Cells(11, 15).Formula = "=MIN(d_P!C:C)"
Sheets("g_P").Cells(22, 7).Formula = "=MIN(d_P!C" & Num_Base + 3 & ":C" & Num_all + 1 & ")"

'-------------------------------------------------------------------------------------------��ȡ���¥�㿹����������
'Sheets("g_P").Cells(13, 14).Formula = "=Min(d_P!AT:AT)"
Sheets("g_P").Cells(23, 5).Formula = "=MIN(d_P!AT" & Num_Base + 3 & ":AT" & Num_all + 2 & ")"
'Sheets("g_P").Cells(13, 15).Formula = "=Min(d_P!AU:AU)"
Sheets("g_P").Cells(23, 7).Formula = "=MIN(d_P!AU" & Num_Base + 3 & ":AU" & Num_all + 2 & ")"

'-------------------------------------------------------------------------------------------��ȡ�ײ������µļ��������
'X�����
Sheets("g_P").Cells(42, 4).Formula = "=d_P!F" & Num_Base + 3
'X�����
Sheets("g_P").Cells(42, 6).Formula = "=d_P!G" & Num_Base + 3
'Y�����
Sheets("g_P").Cells(43, 4).Formula = "=d_P!H" & Num_Base + 3
'Y�����
Sheets("g_P").Cells(43, 6).Formula = "=d_P!I" & Num_Base + 3


'-------------------------------------------------------------------------------------------���رȽ���ж�
Select Case Sheets("g_P").Cells(20, 5).Value
    Case Is < 1.4: Sheets("g_P").Cells(20, 7) = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_P").Cells(20, 7) = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_P").Cells(20, 7) = "�����ȶ�,���ƶ���"
End Select

Select Case Sheets("g_P").Cells(21, 5).Value
    Case Is < 1.4: Sheets("g_P").Cells(21, 7) = "�ȶ�����,���Ƕ���"
    Case 1.4 To 2.7: Sheets("g_P").Cells(21, 7) = "�����ȶ�,���Ƕ���"
    Case Is > 2.7: Sheets("g_P").Cells(21, 7) = "�����ȶ�,���ƶ���"
End Select



Sheets("d_P").Cells(1, 60) = "���"
Sheets("d_P").Cells(2, 60) = "m"


'-------------------------------------------------------------------------------------------������ֵ
'Sheets("d_P").Cells.EntireColumn.AutoFit
''
'Num_All = Sheets("d_P").range("a65536").End(xlUp)
'Debug.Print "��¥��="; Num_All
'
'Dim i_RowID As Integer
'Dim i_Rng As range
'
''---------------------------------------------------------�նȱ�
'For ii = 2 To 3
'Dim R As range
'Set R = Worksheets("d_P").range(Cells(3, ii), Cells(Num_All + 1, ii))
'Call maxormin(R, "min", "d_P!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
''---------------------------------------------------------��������
'For ii = 46 To 47
'Set R = Worksheets("d_P").range(Cells(3, ii), Cells(Num_All + 1, ii))
'Call maxormin(R, "min", "d_P!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
''---------------------------------------------------------������
'ii = 55
'Set R = Worksheets("d_P").range(Cells(4, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_P!R4C" & CStr(ii) & ":R" & CStr(Num_All + 2) & "C" & CStr(ii))
'
''
''Sheets("d_P").Cells.EntireColumn.AutoFit

Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub



'------------------------------------------------------------------------------------------------------------------------��ӹ��̶ԸնȱȽ�������
Sub modi_stiff()
'-------------------------------------------------------------------------------------------�ԸնȽ��в������
Num_all = Sheets("d_P").range("a65536").End(xlUp)
For ii = 4 To 5
    For jj = 3 To Num_all + 2
    Sheets("d_P").Cells(jj, ii) = Sheets("d_P").Cells(jj, ii) * Sheets("d_P").Cells(jj, 60)
    Next
Next

'-------------------------------------------------------------------------------------------�ԸնȱȽ�������
For ii = 2 To 3
    'Sheets("d_P").Cells(Num_Base+3, ii).Value = Sheets("d_P").Cells(3, ii).Value * 1.5 '-------------------------Ĭ���ײ�Ƕ��
    Sheets("d_P").Cells(Num_Base + 3, ii).Interior.ColorIndex = 7
        For jj = 3 To Num_all + 1
            If Sheets("d_P").Cells(jj, 60).Value / Sheets("d_P").Cells(jj + 1, 60).Value > 1.5 Then
            Sheets("d_P").Cells(jj, ii).Value = Sheets("d_P").Cells(jj, ii + 2).Value / Sheets("d_P").Cells(jj + 1, ii + 2).Value
            Sheets("d_P").Cells(jj, ii).Interior.ColorIndex = 7
        Else
            Sheets("d_P").Cells(jj, ii).Value = Sheets("d_P").Cells(jj, ii + 2).Value / Sheets("d_P").Cells(jj + 1, ii + 2).Value
        End If
    Next
Next
End Sub

