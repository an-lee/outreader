Attribute VB_Name = "MBuilding_��������"
Option Explicit


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'1.��Ӵ���,���ģ�ͽ��������ҵ����ݶ�ȡ���⡣

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/31 14:00
'��������:
'1.�޸�ƽ��ϵ���ĸ�ʽ
'2.�������Ͳ�������ϵ����д��

'/////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/29 14:19
'��������:
'1.��ֲYJK��prebeta��

'////////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                  MBuilding_���ڡ��������ü����Ͳ��ִ���              ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_MBuilding_��������(Path As String)

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
'X��Y�����ƽ��ϵ��
Dim Cof_Px, Cof_Py As Single


'==========================================================================================����ؼ��ʱ���


'����
Dim Keyword_Period As String
'��ֵ
Keyword_Period = "���ͺ�       ��  ��"

'��������ϵ��
Dim Keyword_Mass_Ratio_X, Keyword_Mass_Ratio_Y, Keyword_Mass_Ratio_Z As String
'��ֵ
Keyword_Mass_Ratio_X = "X��ƽ�����Ͳ�������ϵ���ܼ�"
Keyword_Mass_Ratio_Y = "Y��ƽ�����Ͳ�������ϵ���ܼ�"
Keyword_Mass_Ratio_Z = "Z��Ťת���Ͳ�������ϵ���ܼ�"


'��������
Dim Keyword_Earthquake_X, Keyword_Earthquake_Y As String
'��ֵ
Keyword_Earthquake_X = "[RS_0] ����������� (CQC(����))"
Keyword_Earthquake_Y = "[RS_90] ����������� (CQC(����))"

'��С���ر�
Dim Keyword_Shear_Weight_X, Keyword_Shear_Weight_Y As String
'��ֵ
Keyword_Shear_Weight_X = "����淶(5.2.5��)��Ҫ�����С���ر�"
Keyword_Shear_Weight_Y = "����淶(5.2.5��)��Ҫ�����С���ر�"

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
Dim Firststring_Earthquake_X As String, Firststring_Earthquake_Y As String

'��С���ر�
Dim Firststring_Shear_Weight As String

'��������ر�
Dim Firststring_Shear_Weight_Ratio As String


'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���ΪWDISP.out
Filename = Dir(Path & "\*_���ڡ��������ü�����.txt")

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ�������" & Filename
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
    Firststring_Period = Mid(data, 3, 14)
    '��������ϵ��
    Firststring_Mass_Ratio = Mid(data, 5, 14)
    '��������
    Firststring_Earthquake_X = Mid(data, 3, 23)
    Firststring_Earthquake_Y = Mid(data, 3, 24)
    '��С���ر�
    Firststring_Shear_Weight = Mid(data, 3, 21)
    '��������ر�
    'Firststring_Shear_Weight_Ratio = Mid(data, 12, 13)

   

    '-------------------------------------------------------------------------------------------��ȡ����

    If Firststring_Period = Keyword_Period Then

        '������ʽ����7�п�ʼд������
        j = 28

        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){3}") = True Then
                '��һд�����ڡ�ת�ǡ�ƽ��ϵ����Ťתϵ��
                Sheets("g_M").Cells(j, 4) = extractNumberFromString(data, 2)
                Sheets("g_M").Cells(j, 5) = "-"
                'Sheets("g_M").Cells(j, 6) = extractNumberFromString(data, 4)
                Cof_Px = Round(extractNumberFromString(data, 3) / 100, 2)
                Cof_Py = Round(extractNumberFromString(data, 4) / 100, 2)
                Sheets("g_M").Cells(j, 6) = "(" & Cof_Px & "+" & Cof_Py & ")"
                Sheets("g_M").Cells(j, 7) = StringfromStringforReg(data, "\S+", 5) / 100

                '����
                j = j + 1

            End If

            '����10�У����˳�
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
            Sheets("g_M").Cells(39, 5) = extractNumberFromString(data, 1)

            Debug.Print "��ȡX����������ϵ��"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"

        Case Keyword_Mass_Ratio_Y

            '��ȡ��������ϵ�����ݣ���д�빤������Ӧλ��
            Sheets("g_M").Cells(39, 7) = extractNumberFromString(data, 1)

            Debug.Print "��ȡY����������ϵ��"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"
            
       ' Case Keyword_Mass_Ratio_Z

            '��ȡ��������ϵ�����ݣ���д�빤������Ӧλ��
            'Sheets("g_M").Cells(38, 7) = extractNumberFromString(data, 1)

            'Debug.Print "��ȡZ����������ϵ��"
            'Debug.Print "��ʱ: " & Timer - sngStart
            'Debug.Print "����"

    End Select
    
    '-------------------------------------------------------------------------------------------��ȡ��������


    Select Case Firststring_Earthquake_X
    
    Case Keyword_Earthquake_X
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "=") Then
            
                '��ȡ��С���رȹ淶��ֵ����д�빤������Ӧλ��
                Sheets("g_M").Cells(24, 7) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If
                
                '��һд�����X�����X�����ر�X
'                Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                Sheets("d_M").Cells(j, 10) = StringfromStringforReg(data, "\d*\.\d*", 2)
                Sheets("d_M").Cells(j, 11) = StringfromStringforReg(data, "\d*\.\d*", 4)
                Sheets("d_M").Cells(j, 12) = StringfromStringforReg(data, "\d*\.\d*", 3)
                '��¼��¥����
                num_floor = num_floor + 1
            
            End If
            
        Loop
        
        Debug.Print "��ȡX���������"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"
        End Select
        
    Select Case Firststring_Earthquake_Y
    Case Keyword_Earthquake_Y
    
        Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "=") Then
                
                    '��ȡ��С���رȹ淶��ֵ����д�빤������Ӧλ��
                    Sheets("g_M").Cells(25, 7) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If
                    
                    '��һд�����Y�����Y�����ر�Y
                    'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\S+", 1)
                    Sheets("d_M").Cells(j, 14) = StringfromStringforReg(data, "\d*\.\d*", 2)
                    Sheets("d_M").Cells(j, 15) = StringfromStringforReg(data, "\d*\.\d*", 4)
                    Sheets("d_M").Cells(j, 16) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop
            
            Debug.Print "��ȡY���������"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"

        End Select
        
    
        
Loop

'�رս���ļ�
Close #i
    
    
'-------------------------------------------------------------------------------------------��ȡ��С���ر�
Sheets("g_M").Cells(24, 5).Formula = "=MIN(d_M!L" & CStr(Num_Base + 3) & ":L" & num_floor + 2 & ")"
Sheets("g_M").Cells(25, 5).Formula = "=MIN(d_M!P" & CStr(Num_Base + 3) & ":P" & num_floor + 2 & ")"

'-------------------------------------------------------------------------------------------�������ڱ�
Sheets("g_M").Cells(38, 4).FormulaArray = "=INDEX($D$28:$D$37,MATCH(TRUE,$G$28:$G$37>0.5,))/INDEX($D$28:$D$37,MATCH(TRUE,$G$28:$G$37<0.5,))"
Sheets("g_M").Cells(38, 5).Formula = "=if(d38<0.85,""< 0.85"",""> 0.85"")"

'-------------------------------------------------------------------------------------------��ȡ�ײ���������µļ��������
'X�����
Sheets("g_M").Cells(44, 4).Formula = "=d_M!J" & Num_Base + 3
'X�����
Sheets("g_M").Cells(44, 6).Formula = "=d_M!K" & Num_Base + 3
'Y�����
Sheets("g_M").Cells(45, 4).Formula = "=d_M!N" & Num_Base + 3
'Y�����
Sheets("g_M").Cells(45, 6).Formula = "=d_M!O" & Num_Base + 3


'Sheets("g_M").Cells.EntireColumn.AutoFit
'Sheets("d_M").Cells.EntireColumn.AutoFit
'Sheets("d_M").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"

Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub

