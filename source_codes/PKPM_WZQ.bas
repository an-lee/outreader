Attribute VB_Name = "PKPM_WZQ"
Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/19/ 9:16
'��������:
'1.�ײ���������µļ��������д��general
'2.ɾ����distribution����ʽ������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/16/ 17:22
'��������:
'1.������ڱȴ��ڻ�С��0.85

'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/15 17:14
'�������ݣ�
'1.����µ�general���������ݣ�Z����������ϵ��Ŀǰ���ڼ������͸���λ�ã�����������δ��ȡ��
'2.���ڱȺ���������Ԫ��ȡ���ϲ��������ڱȰ����鹫ʽ���㣬�ϲ���Ԫ���ܼ���


'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/25 22:14
'�������ݣ�
'1.¥���������ļ������ȡ


'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/7
'�������ݣ�
'1.ȫ�ֱ����Ѿ����ã�ȡ����������ã�


'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/6 23:48
'�������ݣ�
'1.��Ӷ�ȡƽ��ϵ�����
'2.��ȡ��С���ر�ʱ�����ǵ�����¥�㣬������¥������ĳɴ��⴫�ݽ���

'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/20 22:38
'�������ݣ�
'1.��ȡZ����������ϵ��
'2.�жϵ�һŤת���ڣ��������ڱ�
'////////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            PKPM_WZQ.OUT���ִ���                      ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_PKPM_WZQ(Path As String)

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

'��������Ҳ���,��¥����
Dim num_floor As Integer
num_floor = 0

'�ı���ǰ����
Dim n As Integer


'==========================================================================================����ؼ��ʱ���


'����
Dim Keyword_Period As String
'��ֵ
Keyword_Period = "���ͺ�    �� ��"

'��������ϵ��
Dim Keyword_Mass_Ratio_X, Keyword_Mass_Ratio_Y, Keyword_Mass_Ratio_Z As String
'��ֵ
Keyword_Mass_Ratio_X = "X �������Ч����ϵ��:"
Keyword_Mass_Ratio_Y = "Y �������Ч����ϵ��:"
Keyword_Mass_Ratio_Z = "Z �������Ч����ϵ��:"


'��������
Dim Keyword_Earthquake_X, Keyword_Earthquake_Y As String
'��ֵ
Keyword_Earthquake_X = "���� X �����������(CQC)"
Keyword_Earthquake_Y = "���� Y �����������(CQC)"

'��С���ر�
Dim Keyword_Shear_Weight_X, Keyword_Shear_Weight_Y As String
'��ֵ
Keyword_Shear_Weight_X = "X��¥����С���ر�"
Keyword_Shear_Weight_Y = "Y��¥����С���ر�"

'��������ر�
Dim Keyword_Shear_Weight_Ratio As String
'��ֵ
Keyword_Shear_Weight_Ratio = "��¥��������ϵ���������"


'==========================================================================================�������ַ�����


'����
Dim Firststring_Period As String

'��������ϵ��
Dim Firststring_Mass_Ratio As String

'��������
Dim Firststring_Earthquake As String

'��С���ر�
Dim Firststring_Shear_Weight As String

'��������ر�
Dim Firststring_Shear_Weight_Ratio As String


'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���ΪWZQ.out
Filename = "WZQ.OUT"

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�WZQ.out"
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
    Firststring_Period = Mid(data, 5, 10)
    '��������ϵ��
    Firststring_Mass_Ratio = Mid(data, 8, 12)
    '��������
    Firststring_Earthquake = Mid(data, 4, 16)
    '��С���ر�
    Firststring_Shear_Weight = Mid(data, 23, 9)
    '��С���ر�
    Firststring_Shear_Weight_Ratio = Mid(data, 12, 13)

   

    '-------------------------------------------------------------------------------------------��ȡ����

    If Firststring_Period = Keyword_Period Then

        '������ʽ����7�п�ʼд������
        j = 28

        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){3}") = True Then
                '��һд�����ڡ�ת�ǡ�ƽ��ϵ����Ťתϵ��
                Sheets("g_P").Cells(j, 4) = extractNumberFromString(data, 2)
                Sheets("g_P").Cells(j, 5) = extractNumberFromString(data, 3)
                'Sheets("g_P").Cells(j, 6) = extractNumberFromString(data, 4)
                Sheets("g_P").Cells(j, 6) = StringfromStringforReg(data, "\(.*\)", 1)
                Sheets("g_P").Cells(j, 7) = extractNumberFromString(data, 6)

                '����
                j = j + 1

            End If

            '�����ָ�����==�����˳�Сѭ��
            If j = 38 Then

                '�����ʾ��
                Debug.Print "��ȡ������Ϣ"
                Debug.Print "��ʱ: " & Timer - sngStart
                Debug.Print "����"

                Exit Do

            End If

        Loop

    End If
    
    '-------------------------------------------------------------------------------------------��ȡ��������ϵ��


    Select Case Firststring_Mass_Ratio

        Case Keyword_Mass_Ratio_X
        
            '��ȡ��������ϵ�����ݣ���д�빤������Ӧλ��
            Sheets("g_P").Cells(39, 5) = extractNumberFromString(data, 1) '& "%"

            Debug.Print "��ȡX����������ϵ��"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"

        Case Keyword_Mass_Ratio_Y

            '��ȡ��������ϵ�����ݣ���д�빤������Ӧλ��
            Sheets("g_P").Cells(39, 7) = extractNumberFromString(data, 1) '& "%"

            Debug.Print "��ȡY����������ϵ��"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"
            
        'Case Keyword_Mass_Ratio_Z

            '��ȡ��������ϵ�����ݣ���д�빤������Ӧλ��
            'Sheets("g_P").Cells(38, 7) = extractNumberFromString(data, 1)

            'Debug.Print "��ȡZ����������ϵ��"
            'Debug.Print "��ʱ: " & Timer - sngStart
            'Debug.Print "����"

    End Select
    
    '-------------------------------------------------------------------------------------------��ȡ��������


    Select Case Firststring_Earthquake
    
    Case Keyword_Earthquake_X
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "=") Then
            
                '��ȡ��С���رȹ淶��ֵ����д�빤������Ӧλ��
                Sheets("g_P").Cells(24, 7) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��һд���š�����X�����X�����ر�X
                Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                Sheets("d_P").Cells(j, 10) = StringfromStringforReg(data, "\d*\.\d*", 2)
                Sheets("d_P").Cells(j, 11) = StringfromStringforReg(data, "\d*\.\d*", 5)
                Sheets("d_P").Cells(j, 12) = StringfromStringforReg(data, "\d*\.\d*", 4)
                '��¼��¥����
                num_floor = num_floor + 1
            
            End If
            
        Loop
        
        Debug.Print "��ȡX���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    Case Keyword_Earthquake_Y
    
        Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "=") Then
                
                    '��ȡ��С���رȹ淶��ֵ����д�빤������Ӧλ��
                    Sheets("g_P").Cells(25, 7) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��һд���š�����Y�����Y�����ر�Y
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                    Sheets("d_P").Cells(j, 14) = StringfromStringforReg(data, "\d*\.\d*", 2)
                    Sheets("d_P").Cells(j, 15) = StringfromStringforReg(data, "\d*\.\d*", 5)
                    Sheets("d_P").Cells(j, 16) = StringfromStringforReg(data, "\d*\.\d*", 4)
                
                End If
                
            Loop
            
            Debug.Print "��ȡY���������"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"

        End Select
        

    '-------------------------------------------------------------------------------------------��ȡ��������ر�

    If Firststring_Shear_Weight_Ratio = Keyword_Shear_Weight_Ratio Then

        Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���ļ�������ڵ�������CQC�µ�ͳ�ƽ��") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��һд���š���������ر�X����������ر�Y
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                    Sheets("d_P").Cells(j, 13) = StringfromStringforReg(data, "\d*\.\d*", 1) * Sheets("d_P").Cells(j, 12)
                    Sheets("d_P").Cells(j, 17) = StringfromStringforReg(data, "\d*\.\d*", 2) * Sheets("d_P").Cells(j, 16)
                
                End If
                
        Loop
        
        Debug.Print "��ȡ��������ر�"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If
    
        
Loop

'�رս���ļ�WZQ.OUT
Close #i
    
    
'-------------------------------------------------------------------------------------------��ȡ��С���ر�
Sheets("g_P").Cells(24, 5).Formula = "=MIN(d_P!L" & CStr(Num_Base + 3) & ":L" & num_floor + 2 & ")"
Sheets("g_P").Cells(25, 5).Formula = "=MIN(d_P!P" & CStr(Num_Base + 3) & ":P" & num_floor + 2 & ")"

'-------------------------------------------------------------------------------------------�������ڱ�
Sheets("g_P").Cells(38, 4).FormulaArray = "=INDEX($D$28:$D$37,MATCH(TRUE,$G$28:$G$37>0.5,))/INDEX($D$28:$D$37,MATCH(TRUE,$G$28:$G$37<0.5,))"
Sheets("g_P").Cells(38, 5).Formula = "=if(d38<0.85,""< 0.85"",""> 0.85"")"
    
'-------------------------------------------------------------------------------------------��ȡ�ײ���������µļ��������
'X�����
Sheets("g_P").Cells(44, 4).Formula = "=d_P!J" & Num_Base + 3
'X�����
Sheets("g_P").Cells(44, 6).Formula = "=d_P!K" & Num_Base + 3
'Y�����
Sheets("g_P").Cells(45, 4).Formula = "=d_P!N" & Num_Base + 3
'Y�����
Sheets("g_P").Cells(45, 6).Formula = "=d_P!O" & Num_Base + 3

'Sheets("g_P").Cells.EntireColumn.AutoFit
'Sheets("d_P").Cells.EntireColumn.AutoFit
'Sheets("d_P").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"

Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub


