Attribute VB_Name = "MBuilding_�������"
Option Explicit

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'1.��Ӵ���,���ģ�ͽ��������ҵ����ݶ�ȡ���⡣

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////


'����ʱ��:2013/7/29 19:19
'�������ݣ�
'1.���ӵ�������رȵĶ�ȡ

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/20 13:56
'�������ݣ�
'1.��ֲPKPM_WV02Q���룬�ֲ�������

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****           MBuilding_¥��������õ���ϵ��.TXT���ִ���                 ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_MBuilding_�������(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, data  As String

Dim i As Integer, j As Integer

'����ѭ������

Dim i_ As Integer: i = FreeFile


'==========================================================================================����ؼ��ʱ���
'������
Dim Keyword_VC As String
Keyword_VC = "��ܳе��ĵ��������"

Dim Keyword_VCX As String
Keyword_VCX = "RS_0"

Dim Keyword_VCY As String
Keyword_VCY = "RS_90"

'��������ϵ��
Dim Keyword_VT As String
Keyword_VT = "0.2Q0����ϵ��"

Dim Keyword_VTX As String
Keyword_VTX = "RS_0"

Dim Keyword_VTY As String
Keyword_VTY = "RS_90"

'���رȵ���
Dim Keyword_Shear_Weight_Ratio As String
Keyword_Shear_Weight_Ratio = "���رȵ���ϵ��"

'==========================================================================================�������ַ�����
'������
Dim FirstString_VC As String
Dim FirstString_VCX As String
Dim FirstString_VCY As String
'��������ϵ��
Dim FirstString_VT As String
Dim FirstString_VTX As String
Dim FirstString_VTY As String
'���رȵ���
Dim Firststring_Shear_Weight_Ratio As String

'==========================================================================================�����ļ���ȡ·��

'ָ���ļ���
Filename = Dir(Path & "\*_¥��������õ���ϵ��.txt")

'���������ļ�·��
filepath = Path & "\" & Filename
'Debug.Print path
'Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ���¥��������õ���ϵ��.txt��"
Debug.Print "��ȡ�������"
Debug.Print "����"

Do While Not EOF(1)

    Line Input #i, data '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = data

    '--------------------------------------------------------------------------�����ָ����б��ַ�
    FirstString_VC = Mid(data, 6, 10)
    FirstString_VT = Mid(data, 6, 9)
    Firststring_Shear_Weight_Ratio = Mid(data, 6, 7)
   
   
    '--------------------------------------------------------------------------��ȡ������������ռ�ܼ����İٷֱ�

    'Ѱ��¥����
    Dim NA As Integer
        
    If FirstString_VC = Keyword_VC Then
        
        Debug.Print "��ȡ������������ռ�ܼ����İٷֱȡ���"
        
        '�����һ��=====��
        Line Input #i, data

        Do While Not EOF(1)
        
            Line Input #i, data
            
            If CheckRegExpfromString(data, "======") Then
                '�˳�
                Exit Do
            End If
            
            '����ָ���б��ַ�
            FirstString_VCX = Mid(data, 10, 4)
            FirstString_VCY = Mid(data, 10, 5)
            
            '��ȡX�������ֵ�������
            If FirstString_VCX = Keyword_VCX Then
                
                '�����һ��-----��
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                
                Do While Not EOF(1)
                
                    Line Input #i, data
                    
                    If CheckRegExpfromString(data, "----") Then
                        '�˳�
                        Exit Do
                    End If
                    
                    '��ѯ¥��
                    If CheckRegExpfromString(data, "B\S\F") = False Then
                        NA = extractNumberFromString(data, 1) + 2 + Num_Base
                    Else
                        NA = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                    End If
                    'Debug.Print NA
                    '��ȡ���������
                    Sheets("d_M").Cells(NA, 48) = StringfromStringforReg(data, "\S+", 4)
                    '������������е��ٷֱȣ�������� - ǽ������ / �����
                    Sheets("d_M").Cells(NA, 49) = Format((StringfromStringforReg(data, "\S+", 3) - StringfromStringforReg(data, "\S+", 6)) / StringfromStringforReg(data, "\S+", 3) * 100, "0.00")
                    '������������е��ٷֱȣ������� / �����
                    'Sheets("d_M").Cells(NA + 2, 49) = StringfromStringforReg(data, "\S+", 4) / StringfromStringforReg(data, "\S+", 3)
                Loop
            End If
            
            '��ȡY�������ֵ�������
            If FirstString_VCY = Keyword_VCY Then
                
                '�����һ��-----��
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                
                Do While Not EOF(1)
                
                    Line Input #i, data
                    
                    If CheckRegExpfromString(data, "----") Then
                        '�˳�
                        Exit Do
                    End If
                    
                    '��ѯ¥��
                    If CheckRegExpfromString(data, "B\S\F") = False Then
                        NA = extractNumberFromString(data, 1) + 2 + Num_Base
                    Else
                        NA = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                    End If
                    'Debug.Print NA
                    '��ȡ���������
                    Sheets("d_M").Cells(NA, 51) = StringfromStringforReg(data, "\S+", 4)
                    '������������е��ٷֱȣ�������� - ǽ������ / �����
                    Sheets("d_M").Cells(NA, 52) = Format((StringfromStringforReg(data, "\S+", 3) - StringfromStringforReg(data, "\S+", 6)) / StringfromStringforReg(data, "\S+", 3) * 100, "0.00")
                    '������������е��ٷֱȣ������� / �����
                    'Sheets("d_M").Cells(NA + 2, 52) = StringfromStringforReg(data, "\S+", 4) / StringfromStringforReg(data, "\S+", 3)
                Loop
            End If
            
        Loop
        
        Debug.Print "��ȡ������������ռ�ܼ����İٷֱȺķ�ʱ��: " & Timer - sngStart
        
    End If

    '--------------------------------------------------------------------------��ȡX/Y���������ϵ��
    'Ѱ�Ҳ���
    Dim NA2 As Integer
    
    If FirstString_VT = Keyword_VT Then

        Debug.Print "��ȡ����������ϵ������"
        
        '�����һ��====��
        Line Input #i, data
        
        Do While Not EOF(1)
        
            Line Input #i, data
            
            If CheckRegExpfromString(data, "======") Then
                '�˳�
                Exit Do
            End If
            
            '����ָ���б��ַ�
            FirstString_VTX = Mid(data, 10, 4)
            FirstString_VTY = Mid(data, 10, 5)
            
            '��ȡX���������ϵ��
            If FirstString_VTX = Keyword_VTX Then
                
                '�����һ��------��
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                
                Do While Not EOF(1)
                
                    Line Input #i, data
                    
                    If CheckRegExpfromString(data, "----") Then
                        '�˳�
                        Exit Do
                    End If
                    
                    '��ѯ¥��
                    If CheckRegExpfromString(data, "B\S\F") = False Then
                        NA2 = extractNumberFromString(data, 1) + 2 + Num_Base
                    Else
                        NA2 = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                    End If
                    'NA2 = extractNumberFromString(data, 1)
                    'Debug.Print NA2
                    '��ȡ��������ϵ��
                    Sheets("d_M").Cells(NA2, 50) = StringfromStringforReg(data, "\S+", 5)
                                   
                Loop
            End If
            
            '��ȡX���������ϵ��
            If FirstString_VTY = Keyword_VTY Then
                
                '�����һ��------��
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                Line Input #i, data
                
                Do While Not EOF(1)
                
                    Line Input #i, data
                    
                    If CheckRegExpfromString(data, "----") Then
                        '�˳�
                        Exit Do
                    End If
                    If CheckRegExpfromString(data, "B\S\F") = False Then
                        NA2 = extractNumberFromString(data, 1) + 2 + Num_Base
                    Else
                        NA2 = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                    End If
                     '��ѯ¥��
                    'NA2 = extractNumberFromString(data, 1)
                    'Debug.Print NA2
                    '��ȡ��������ϵ��
                    Sheets("d_M").Cells(NA2, 53) = StringfromStringforReg(data, "\S+", 5)
                                    
                Loop
            End If
                        
        Loop
        
        Debug.Print "��ȡ����������ϵ���ķ�ʱ��: " & Timer - sngStart
        
    End If
    
    
    '-------------------------------------------------------------------------------------------��ȡ��������ر�

    If Firststring_Shear_Weight_Ratio = Keyword_Shear_Weight_Ratio Then
        Debug.Print "��ȡ��������رȡ���"
        
        Do While Not EOF(1)
            Line Input #i, data
                
                If Mid(data, 3, 4) = "���� 1" Then
                
                    Do While Not EOF(1)
                    Line Input #i, data
                    
                    If Mid(data, 3, 4) = "���� 2" Then
                        Exit Do
                    End If
                    
                '�����������������Ϊ��������
                    If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                        'jΪ��ȡ������д������������������б�����
                        If CheckRegExpfromString(data, "B\S\F") = False Then
                            j = extractNumberFromString(data, 1) + 2 + Num_Base
                            Sheets("d_M").Cells(j, 13) = StringfromStringforReg(data, "\d*\.\d*", 4) * Sheets("d_M").Cells(j, 12)
                        Else
                            j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                            Sheets("d_M").Cells(j, 13) = Sheets("d_M").Cells(j, 12) * extractNumberFromString(data, 3)
                        End If
                        '��һд���������ر�X
                        'Sheets("d_M").Cells(j, 13) = StringfromStringforReg(data, "\d*\.\d*", 4) * Sheets("d_M").Cells(j, 12)
                
                    End If
                    Loop
                End If
                
                '�����������������Ϊ��������
                    If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){4}") Then
                
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                        'jΪ��ȡ������д������������������б�����
                        If CheckRegExpfromString(data, "B\S\F") = False Then
                            j = extractNumberFromString(data, 1) + 2 + Num_Base
                            Sheets("d_M").Cells(j, 17) = StringfromStringforReg(data, "\d*\.\d*", 4) * Sheets("d_M").Cells(j, 16)
                        Else
                            j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                            Sheets("d_M").Cells(j, 17) = Sheets("d_M").Cells(j, 16) * extractNumberFromString(data, 3)
                        End If
                    
                        '��һд���������ر�Y
                        'Sheets("d_M").Cells(j, 17) = StringfromStringforReg(data, "\d*\.\d*", 4) * Sheets("d_M").Cells(j, 16)
                
                    End If
                
        Loop
        
        Debug.Print "��ȡ��������ر�"
        Debug.Print "��ʱ: " & Timer - sngStart
        Debug.Print "����"

    End If


Loop

Close #i


Debug.Print "��ȡ��������Ϣ�ķ�ʱ��: " & Timer - sngStart


End Sub


