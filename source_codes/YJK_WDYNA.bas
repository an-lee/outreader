Attribute VB_Name = "YJK_WDYNA"
Option Explicit

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            YJK_WDYNA.OUT���ִ���                     ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2014/1/8
'1.����ƽ��ֵ���ֵȡֵ
'2.Ƕ�̲㲻Ϊ0ʱ����/��ز��λ�ƽǵ�ƽ��ֵ/���ֵ�޷�ȡ����Ŀǰ��ȡ��3������
'3.���ӱ�ͷ����ɫ

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/12/02
'1.�������35%������20%��Ӧ�׼�������

'////////////////////////////////////////////////////////////////////////////
'����ʱ��:2013/8/27
'1.������Ӧ�׻�������λ�õ�ĩβ�������ͼ����Ӽ�¼ʱ�̲�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/19
'1.�Ե�������ȡ�����Ż���������1.4�汾��
'3.����ƽ��ֵ�����ֵ��ȡbug��
'2.��Ӧ��λ�ƽǶ�ȡbug��


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/08/04

'�������ݣ�
'1.���´���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/26

'�������ݣ�
'1.ɾȥƽ��ֵ/��Ӧ�ף�����λ�ƽǣ�
'2.����Ӧ���������룬�Է�����ڻ�ͼ��


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/16 21:30

Sub OUTReader_YJK_WDYNA(Path)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer

'======================================================================================================�趨���Elastic-Dynamic�ĸ�ʽ
'�������������
Dim ela As String
ela = "e_YJK"

Debug.Print "��ʼ�趨���Elastic-Dynamic�ĸ�ʽ"
Debug.Print "����"

'�����������������
Sheets(ela).Cells.Clear

Debug.Print "�趨���Elastic-Dynamic�ĸ�ʽ���"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"

'======================================================================================================��ӱ��Elastic-Dynamic�ı���

Debug.Print "��ʼ��ӱ��Elastic-Dynamic�ı���"
Debug.Print "����"

'�ӱ����
Call AddFormLine(ela, "A1:DZ200")

'------------------------------------------------------������Elastic-Dynamic�ڵı����ʽ
With Sheets(ela)
    
    '��������
    .Cells.Font.name = "Times New Roman"
    '���������С
    .Cells.Font.Size = "11"
    'ˮƽ����
    .Cells.HorizontalAlignment = xlCenter
    '��ֱ����
    .Cells.VerticalAlignment = xlCenter
    '���Զ�����
    .Cells.WrapText = False
    
    '-------------------------------------------------���ܱ����1
    
    '��Ŀ��Ϣ������
    .Cells(2, 1) = "ʱ�̲���"
    .Cells(4, 1) = "���ù���"
    .Cells(4, 2) = "���÷���=0��"
    .Cells(4, 5) = "���÷���=90��"
    .Cells(5, 2) = "���׼���"
    .Cells(5, 3) = "ʱ��/��Ӧ��"
    .Cells(5, 4) = "λ�ƽ�"
    .Cells(5, 5) = "���׼���"
    .Cells(5, 6) = "ʱ��/��Ӧ��"
    .Cells(5, 7) = "λ�ƽ�"
    .range("A4:A5").MergeCells = True
    .range("B4:D4").MergeCells = True
    .range("E4:G4").MergeCells = True
    
End With

Debug.Print "��ӱ��Elastic-Dynamic�ı������"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, inputstring As String

'����dataΪ�����е��ַ���
Dim data As String

Dim i, j, k, n As Integer

'����m��¼�������
Dim m As Integer
m = 0
'����N_th��¼������
Dim N_th As Integer
'������ʱ�������
Dim Sum_temp1, Sum_temp2 As Long
'������ɫ����
Dim Temp_Colour, Colour As Long
Temp_Colour = 1
'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���Ϊwdyna.out
Filename = "WDYNA.OUT"

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
'Debug.Print path
'Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================��һ��ѭ�����ж�ȡ�ı�

Debug.Print "��ʼ��һ�α�������ļ�wdyna.out"
Debug.Print "����"

Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------��ȡ�����ٶ�
    '��һ��Mid�ļ��жϣ�����Ҫÿһ�䶼���������ж�
    '��ע�����������жϲ���ȡ�����ٶȡ���������ǰ����һ��MID���ɾѡ�ǹؼ��У�����ʱ������Ϊԭ����40%����
    If Mid(data, 2, 2) = "����" Then
        '������
        If CheckRegExpfromString(data, "������") Then
            Sheets(ela).Cells(3, 1).Value = "AmaxX="
            Sheets(ela).Cells(3, 2).Value = StringfromStringforReg(data, "\s?\d+", 1)
            Debug.Print "��ȡ�����������ٶ�"
            Debug.Print "����"
        End If
    
        '�η���
        If CheckRegExpfromString(data, "�η���") Then
            Sheets(ela).Cells(3, 3).Value = "AmaxY="
            Sheets(ela).Cells(3, 4).Value = StringfromStringforReg(data, "\s?\d+", 1)
            Debug.Print "��ȡ�η��������ٶ�"
            Debug.Print "����"
        End If
    
        '��ֱ����
        If CheckRegExpfromString(data, "����") Then '------------------------------------------------------------------------������
            Sheets(ela).Cells(3, 5).Value = "AmaxZ="
            Sheets(ela).Cells(3, 6).Value = StringfromStringforReg(data, "\s?\d+", 1)
            Debug.Print "��ȡ��ֱ���������ٶ�"
            Debug.Print "����"
        End If
    End If

    
    '-------------------------------------------------------------------------------------------��ȡ��������
    
    '��һ��Mid�ļ��жϣ������������ȡ�������ƣ��������������Ч��
    If Mid(data, 2, 13) = "=============" Then
    
        '�������Ƹ�ʽΪ"[����]"
        If CheckRegExpfromString(data, "�������Ӧ") Then
            '��¼���𲨵����
            m = m + 1
            '��¼��������
            Sheets(ela).Cells(2, 2) = m
            N_th = m
            '������д����ܱ�
            Dim name As String
            name = StringfromStringforReg(data, "��.+,\b|��.+\b", 1)
            Debug.Print name
            name = Replace(name, "��", "")
            name = Replace(name, ",", "")
            Sheets(ela).Cells(m + 5, 1) = name
            '��������д���ֲ���
            Sheets(ela).Cells(1, 10 + (m - 1) * 6) = name
            Sheets(ela).Cells(2, (m - 1) * 6 + 10) = "���λ�ƽ�"
            Sheets(ela).Cells(2, (m - 1) * 6 + 13) = "���λ�ƽ�"
            Sheets(ela).Cells(2, (m - 1) * 6 + 11) = "����"
            Sheets(ela).Cells(2, (m - 1) * 6 + 14) = "����"
            Sheets(ela).Cells(2, (m - 1) * 6 + 12) = "�㸲���"
            Sheets(ela).Cells(2, (m - 1) * 6 + 15) = "�㸲���"
            
            '�ӱ���ɫ
            If Temp_Colour > 0 Then
              Colour = 10091441
            Else
              Colour = 6750207
            End If
            
            Sheets(ela).range(Cells(1, (m - 1) * 6 + 10), Cells(2, (m - 1) * 6 + 15)).Interior.color = Colour
            Temp_Colour = -1 * Temp_Colour
        
            Debug.Print "��" & m & "���������ƶ�ȡ���"
            Debug.Print "����ʱ��: " & Timer - sngStart
            Debug.Print "����"

        End If
    End If
    
    
    '���е��𲨽������֮�����������ݣ�һ�������ֵ��ƽ��ֵ
    If CheckRegExpfromString(data, "������ƽ��ֵ") Then
        Debug.Print "ƽ��ֵ������"
        '��¼���𲨵����
        m = m + 1
        '������д����ܱ�
        Sheets(ela).Cells(m + 5, 1) = "ƽ��ֵ"
        '��������д���ֲ���
        Sheets(ela).Cells(1, 10 + (m - 1) * 6) = "ƽ��ֵ"
        Sheets(ela).Cells(2, (m - 1) * 6 + 10) = "���λ�ƽ�"
        Sheets(ela).Cells(2, (m - 1) * 6 + 13) = "���λ�ƽ�"
        Sheets(ela).Cells(2, (m - 1) * 6 + 11) = "����"
        Sheets(ela).Cells(2, (m - 1) * 6 + 14) = "����"
        Sheets(ela).Cells(2, (m - 1) * 6 + 12) = "�㸲���"
        Sheets(ela).Cells(2, (m - 1) * 6 + 15) = "�㸲���"
        
        '�ӱ���ɫ
        If Temp_Colour > 0 Then
          Colour = 10091441
        Else
          Colour = 6750207
        End If

        Sheets(ela).range(Cells(1, (m - 1) * 6 + 10), Cells(2, (m - 1) * 6 + 15)).Interior.color = Colour
        Temp_Colour = -1 * Temp_Colour
        
        Debug.Print "The Average of Max_Response���ƶ�ȡ���"
        Debug.Print "����ʱ��: " & Timer - sngStart
        Debug.Print "����"
        
    End If
    
    '��һ�������Ӧ�����ֵ
    If CheckRegExpfromString(data, "����������ֵ") Then
        '��¼���𲨵����
        m = m + 1
        '������д����ܱ�
        Sheets(ela).Cells(m + 5, 1) = "���ֵ"
        '��������д���ֲ���
        Sheets(ela).Cells(1, 10 + (m - 1) * 6) = "���ֵ"
        Sheets(ela).Cells(2, (m - 1) * 6 + 10) = "���λ�ƽ�"
        Sheets(ela).Cells(2, (m - 1) * 6 + 13) = "���λ�ƽ�"
        Sheets(ela).Cells(2, (m - 1) * 6 + 11) = "����"
        Sheets(ela).Cells(2, (m - 1) * 6 + 14) = "����"
        Sheets(ela).Cells(2, (m - 1) * 6 + 12) = "�㸲���"
        Sheets(ela).Cells(2, (m - 1) * 6 + 15) = "�㸲���"
        
        '�ӱ���ɫ
        If Temp_Colour > 0 Then
          Colour = 10091441
        Else
          Colour = 6750207
        End If

        Sheets(ela).range(Cells(1, (m - 1) * 6 + 10), Cells(2, (m - 1) * 6 + 15)).Interior.color = Colour
        Temp_Colour = -1 * Temp_Colour
        

        Debug.Print "The Maximum of Max_Response���ƶ�ȡ���"
        Debug.Print "����ʱ��: " & Timer - sngStart
        Debug.Print "����"
        
    End If
    
Loop

Close #i

Sheets(ela).Cells(m + 6, 1) = "��Ӧ��"
Sheets(ela).Cells(m + 7, 1) = "65%��Ӧ��"
Sheets(ela).Cells(m + 8, 1) = "135%��Ӧ��"
Sheets(ela).Cells(m + 9, 1) = "80%��Ӧ��"
Sheets(ela).Cells(m + 10, 1) = "120%��Ӧ��"

Debug.Print "��һ��ѭ�����"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"

'=============================================================================================================================�ڶ���ѭ�����ж�ȡ�ı�

'���ڱ��ı���ʽ�������ԣ�Ƕ��ѭ��ʱ������ͬʱ��˵������ƶ�ȡ�����ݴ�ȡ(�޷��ҵ����ʵ��˳�Сѭ���ķָ���)����һ��ѭ����ȫ����ȡ������
'����ѭ�����ж������Ե�������ýǶȣ���"Angle :     0.000"��Ϊ�ؼ��ʣ����ζ�ȡÿһ�������ڲ�ͬ���ýǶ���������Ľ������

Debug.Print "��ʼ�ڶ��α�������ļ�wdyna.out"
Debug.Print "����"


'��ʼ��m��nֵ
m = 0
n = 0

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i

Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    '��¼����
    n = n + 1
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------��ȡ�������ýǶ�=0����
    
    If CheckRegExpfromString(data, "��ǰ��������ٶȽǣ�0.000") Then
        
        m = m + 1
        Sheets(ela).range(Cells(1, (m - 1) * 6 + 10), Cells(1, (m - 1) * 6 + 15)).MergeCells = True
        
        '---------------------------------------------------------------------------------------Ƕ�׵�һ��ѭ��
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "Jmax") = True Then
                '-------------------------------------------------------------------------------Ƕ�׵ڶ���ѭ��
                Do While Not EOF(1)
                Line Input #i, data
                '��������ţ�Ϊ������
                    If CheckRegExpfromString(data, "\s1\s") = True Then
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                        'jΪ��ȡ������д������������������б�����
                        j = StringfromStringforReg(data, "\S+", 1) + 2
                        'j = extractNumberFromString(data, 1) + 2
                        Debug.Print "j=" & j
                        Sheets(ela).Cells(j, 9) = StringfromStringforReg(data, "\S+", 1)
                        '��һд�������λ�ƽ�
                        Sheets(ela).Cells(j, (m - 1) * 6 + 10).Value = Replace(StringfromStringforReg(data, "\S+", 6), "1/", "")
                    End If
                    '��Ϊλ�ƽǺͼ�����ز���ͬһ�б��ڣ���⵽Shear���˳��ڶ���Ƕ��ѭ��
                    If CheckRegExpfromString(data, "����") Then
                        Exit Do
                    End If
                Loop
            End If
        
            '�������4��������Ϊ��Ŀ��������
            If CheckRegExpfromString(data, "\s1\s") = True Then
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                'jΪ��ȡ������д������������������б�����
                j = StringfromStringforReg(data, "\S+", 1) + 2
                'j = extractNumberFromString(data, 1) + 2
                '��һд����������
                Sheets(ela).Cells(j, 11 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 3)
                Sheets(ela).Cells(j, 12 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 4)
            End If
            
            'ֻ��������Ľ������⵽�η���ؼ���Minor-Direction���˳���һ��Ƕ��ѭ��
            If CheckRegExpfromString(data, "��ǰ��������ٶȽǣ�90.000") = True Then
                Exit Do
            End If
        
        Loop
        
    End If

    '-------------------------------------------------------------------------------------------��ȡ�������ýǶ�=90����
    
    If CheckRegExpfromString(data, "Jmax") Then
        '---------------------------------------------------------------------------------------Ƕ�׵�һ��ѭ��
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "JmaxD") = True Then
                '-------------------------------------------------------------------------------Ƕ�׵ڶ���ѭ��
                Do While Not EOF(1)
                Line Input #i, data
                    '����1
                    If CheckRegExpfromString(data, "\s1\s") = True Then
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                        'jΪ��ȡ������д������������������б�����
                        j = StringfromStringforReg(data, "\S+", 1) + 2
                        'j = extractNumberFromString(data, 1) + 2
                        '��һд�������λ�ƽ�
                         Sheets(ela).Cells(j, (m - 1) * 6 + 13).Value = Replace(StringfromStringforReg(data, "\S+", 6), "1/", "")
                    End If
                    '��Ϊλ�ƽǺͼ�����ز���ͬһ�б��ڣ���⵽Shear���˳��ڶ���Ƕ��ѭ��
                    If CheckRegExpfromString(data, "����") Then
                        Exit Do
                    End If
                Loop
            End If
        
            '�������4��������Ϊ��������
            If CheckRegExpfromString(data, "\s1\s") = True Then
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                'jΪ��ȡ������д������������������б�����
                j = StringfromStringforReg(data, "\S+", 1) + 2
                'j = extractNumberFromString(data, 1) + 2
                '��һд���š����������
                Sheets(ela).Cells(j, 14 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 3)
                Sheets(ela).Cells(j, 15 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 4)
            End If
        
            'ֻ��������Ľ������⵽�η���ؼ���Minor-Direction���˳���һ��Ƕ��ѭ��
            If CheckRegExpfromString(data, "==") = True Then
                Debug.Print "��" & m & "���������ݶ�ȡ���"
                Debug.Print "����ʱ��: " & Timer - sngStart
                Debug.Print "����"
                Exit Do
            End If
            If Mid(data, 1, 2) = "//" Then
                Debug.Print "��" & m & "���������ݶ�ȡ���"
                Debug.Print "����ʱ��: " & Timer - sngStart
                Debug.Print "����"
                Exit Do
            End If

        Loop
    End If
    '-------------------------------------------------------------------------------------------��ȡƽ��ֵ
    
    If CheckRegExpfromString(data, "������ƽ��ֵ") Then
        m = m + 1
        Sheets(ela).range(Cells(1, (m - 1) * 6 + 10), Cells(1, (m - 1) * 6 + 15)).MergeCells = True
        '---------------------------------------------------------------------------------------Ƕ�׵�һ��ѭ��
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 1, 12) = "��ǰ������ 0.0 ��" Then
                '-------------------------------------------------------------------------------Ƕ�׵ڶ���ѭ��
                Do While Not EOF(1)
                    Line Input #i, data
                    '����1
                    If CheckRegExpfromString(data, "\s1\s") = True Then
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                        'jΪ��ȡ������д������������������б�����
                        j = StringfromStringforReg(data, "\S+", 1) + 2
                        'j = extractNumberFromString(data, 1) + 2
                        '��һд�����
                        Sheets(ela).Cells(j, 11 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 3)
                        
                        Sum_temp1 = 0
                        Sum_temp2 = 0
                        
                        For k = 1 To N_th
                          '���λ�ƽ����
                          Sum_temp1 = Sum_temp1 + 1 / Sheets(ela).Cells(j, 10 + (k - 1) * 6)
                          '������
                          Sum_temp2 = Sum_temp2 + Sheets(ela).Cells(j, 12 + (k - 1) * 6)
                        Next k
                        
                        '��һд����λ�ƽ�
                        Sheets(ela).Cells(j, 10 + (m - 1) * 6) = Round(N_th / Sum_temp1, 0)
                        '��һд�����
                        Sheets(ela).Cells(j, 12 + (m - 1) * 6) = Round(Sum_temp2 / N_th, 0)
                        
                          '��һд�������λ�ƽ�
                          'Sheets(ela).Cells(j, 10 + (m - 1) * 6) = Round(6 / WorksheetFunction.Sum(1 / Sheets(ela).Cells(j, 10 + (1 - 1) * 6), 1 / Sheets(ela).Cells(j, 10 + (2 - 1) * 6), 1 / Sheets(ela).Cells(j, 10 + (3 - 1) * 6), _
                                                     1 / Sheets(ela).Cells(j, 10 + (4 - 1) * 6), 1 / Sheets(ela).Cells(j, 10 + (5 - 1) * 6), 1 / Sheets(ela).Cells(j, 10 + (6 - 1) * 6), 1 / Sheets(ela).Cells(j, 10 + (7 - 1) * 6)))
                          'Sheets(ela).Cells(j, 12 + (m - 1) * 6) = WorksheetFunction.Sum(Sheets(ela).Cells(j, 12 + (1 - 1) * 6), Sheets(ela).Cells(j, 12 + (2 - 1) * 6), Sheets(ela).Cells(j, 12 + (3 - 1) * 6), _
                                                     Sheets(ela).Cells(j, 12 + (4 - 1) * 6), Sheets(ela).Cells(j, 12 + (5 - 1) * 6), Sheets(ela).Cells(j, 12 + (6 - 1) * 6), Sheets(ela).Cells(j, 12 + (7 - 1) * 6)) / 6
                          
                        
                    End If
                    '��Ϊλ�ƽǺͼ�����ز���ͬһ�б��ڣ���⵽Shear���˳��ڶ���Ƕ��ѭ��
                    If Mid(data, 1, 2) = "0��" Then
                        Exit Do
                    End If
                Loop
            End If

            
            If Mid(data, 1, 13) = "��ǰ������ 90.0 ��" Then
                '-------------------------------------------------------------------------------Ƕ�׵ڶ���ѭ��
                Do While Not EOF(1)
                    Line Input #i, data
                    '����1
                    If CheckRegExpfromString(data, "\s1\s") = True Then
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                        'jΪ��ȡ������д������������������б�����
                        j = StringfromStringforReg(data, "\S+", 1) + 2
                        'j = extractNumberFromString(data, 1) + 2
                        '��һд���������
                        Sheets(ela).Cells(j, 14 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 3)
                        
                        Sum_temp1 = 0
                        Sum_temp2 = 0
                        
                        For k = 1 To N_th
                          'ȡ�����λ�ƽ�
                          Sum_temp1 = Sum_temp1 + 1 / Sheets(ela).Cells(j, 13 + (k - 1) * 6)
                          'ȡ�������
                          Sum_temp2 = Sum_temp2 + Sheets(ela).Cells(j, 15 + (k - 1) * 6)
                        Next k
                        
                        '��һд�������λ�ƽ�
                        Sheets(ela).Cells(j, 13 + (m - 1) * 6) = Round(N_th / Sum_temp1, 0)
                        '��һд���������
                        Sheets(ela).Cells(j, 15 + (m - 1) * 6) = Round(Sum_temp2 / N_th, 0)
                        
                        'Sheets(ela).Cells(j, 13 + (m - 1) * 6) = Round(6 / WorksheetFunction.Sum(1 / Sheets(ela).Cells(j, 13 + (1 - 1) * 6), 1 / Sheets(ela).Cells(j, 13 + (2 - 1) * 6), 1 / Sheets(ela).Cells(j, 13 + (3 - 1) * 6), _
                                                   1 / Sheets(ela).Cells(j, 13 + (4 - 1) * 6), 1 / Sheets(ela).Cells(j, 13 + (5 - 1) * 6), 1 / Sheets(ela).Cells(j, 13 + (6 - 1) * 6), 1 / Sheets(ela).Cells(j, 13 + (7 - 1) * 6)))
                        'Sheets(ela).Cells(j, 15 + (m - 1) * 6) = WorksheetFunction.Sum(Sheets(ela).Cells(j, 15 + (1 - 1) * 6), Sheets(ela).Cells(j, 15 + (2 - 1) * 6), Sheets(ela).Cells(j, 15 + (3 - 1) * 6), _
                                                   Sheets(ela).Cells(j, 15 + (4 - 1) * 6), Sheets(ela).Cells(j, 15 + (5 - 1) * 6), Sheets(ela).Cells(j, 15 + (6 - 1) * 6), Sheets(ela).Cells(j, 15 + (7 - 1) * 6)) / 6
                    End If
                    '��Ϊλ�ƽǺͼ�����ز���ͬһ�б��ڣ���⵽Shear���˳��ڶ���Ƕ��ѭ��
                    If Mid(data, 1, 3) = "90��" Then
                        Exit Do
                    End If
                Loop
            End If
            
            If Mid(data, 1, 1) = "/" Then
                Debug.Print "ƽ��ֵ���ݶ�ȡ���"
                Debug.Print "����ʱ��: " & Timer - sngStart
                Debug.Print "����"
                Exit Do
            End If
         Loop
            
    End If
    '-------------------------------------------------------------------------------------------��ȡ���
    
    If CheckRegExpfromString(data, "����������ֵ") Then
        m = m + 1
        Sheets(ela).range(Cells(1, (m - 1) * 6 + 10), Cells(1, (m - 1) * 6 + 15)).MergeCells = True
        '---------------------------------------------------------------------------------------Ƕ�׵�һ��ѭ��
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 1, 12) = "��ǰ������ 0.0 ��" Then
                '-------------------------------------------------------------------------------Ƕ�׵ڶ���ѭ��
                Do While Not EOF(1)
                Line Input #i, data
                    '����1
                    If CheckRegExpfromString(data, "\s1\s") = True Then
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                        'jΪ��ȡ������д������������������б�����
                        j = StringfromStringforReg(data, "\S+", 1) + 2
                        'j = extractNumberFromString(data, 1) + 2
                        '��һд���������
                        Sheets(ela).Cells(j, 11 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 3)
                        
                        Sum_temp1 = 1000000
                        Sum_temp2 = 0
                        
                        For k = 1 To N_th
                          'ȡ�����λ�ƽ�
                          Sum_temp1 = WorksheetFunction.Min(Sheets(ela).Cells(j, 10 + (k - 1) * 6), Sum_temp1)
                          'ȡ�������
                          Sum_temp2 = WorksheetFunction.Max(Sheets(ela).Cells(j, 12 + (k - 1) * 6), Sum_temp2)
                        Next k
                        
                        '��һд�������λ�ƽ�
                        Sheets(ela).Cells(j, 10 + (m - 1) * 6) = Sum_temp1
                        '��һд���������
                        Sheets(ela).Cells(j, 12 + (m - 1) * 6) = Sum_temp2
                        
                        'Sheets(ela).Cells(j, 10 + (m - 1) * 6) = WorksheetFunction.Min(Sheets(ela).Cells(j, 10 + (1 - 1) * 6), Sheets(ela).Cells(j, 10 + (2 - 1) * 6), Sheets(ela).Cells(j, 10 + (3 - 1) * 6), _
                                                   Sheets(ela).Cells(j, 10 + (4 - 1) * 6), Sheets(ela).Cells(j, 10 + (5 - 1) * 6), Sheets(ela).Cells(j, 10 + (6 - 1) * 6), Sheets(ela).Cells(j, 10 + (7 - 1) * 6))
                        'Sheets(ela).Cells(j, 12 + (m - 1) * 6) = WorksheetFunction.Max(Sheets(ela).Cells(j, 12 + (1 - 1) * 6), Sheets(ela).Cells(j, 12 + (2 - 1) * 6), Sheets(ela).Cells(j, 12 + (3 - 1) * 6), _
                                                   Sheets(ela).Cells(j, 12 + (4 - 1) * 6), Sheets(ela).Cells(j, 12 + (5 - 1) * 6), Sheets(ela).Cells(j, 12 + (6 - 1) * 6), Sheets(ela).Cells(j, 12 + (7 - 1) * 6))
                        
                        
                    End If
                    '��Ϊλ�ƽǺͼ�����ز���ͬһ�б��ڣ���⵽Shear���˳��ڶ���Ƕ��ѭ��
                    If Mid(data, 1, 2) = "0��" Then
                        Exit Do
                    End If
                Loop
            End If
            
            If Mid(data, 1, 13) = "��ǰ������ 90.0 ��" Then
                '-------------------------------------------------------------------------------Ƕ�׵ڶ���ѭ��
                Do While Not EOF(1)
                Line Input #i, data
                    '����1
                    If CheckRegExpfromString(data, "\s1\s") = True Then
                        '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                        'jΪ��ȡ������д������������������б�����
                        j = StringfromStringforReg(data, "\S+", 1) + 2
                        'j = extractNumberFromString(data, 1) + 2
                        '��һд���������
                        Sheets(ela).Cells(j, 14 + (m - 1) * 6) = StringfromStringforReg(data, "\S+", 3)
                        
                        Sum_temp1 = 1000000
                        Sum_temp2 = 0
                        
                        For k = 1 To N_th
                          'ȡ�����λ�ƽ�
                          Sum_temp1 = WorksheetFunction.Min(Sheets(ela).Cells(j, 13 + (k - 1) * 6), Sum_temp1)
                          'ȡ�������
                          Sum_temp2 = WorksheetFunction.Max(Sheets(ela).Cells(j, 15 + (k - 1) * 6), Sum_temp2)
                        Next k
                        
                        '��һд�������λ�ƽ�
                        Sheets(ela).Cells(j, 13 + (m - 1) * 6) = Sum_temp1
                        '��һд���������
                        Sheets(ela).Cells(j, 15 + (m - 1) * 6) = Sum_temp2
                        
                        'Sheets(ela).Cells(j, 13 + (m - 1) * 6) = WorksheetFunction.Min(Sheets(ela).Cells(j, 13 + (1 - 1) * 6), Sheets(ela).Cells(j, 13 + (2 - 1) * 6), Sheets(ela).Cells(j, 13 + (3 - 1) * 6), _
                                                   Sheets(ela).Cells(j, 13 + (4 - 1) * 6), Sheets(ela).Cells(j, 13 + (5 - 1) * 6), Sheets(ela).Cells(j, 13 + (6 - 1) * 6), Sheets(ela).Cells(j, 13 + (7 - 1) * 6))
                        'Sheets(ela).Cells(j, 15 + (m - 1) * 6) = WorksheetFunction.Max(Sheets(ela).Cells(j, 15 + (1 - 1) * 6), Sheets(ela).Cells(j, 15 + (2 - 1) * 6), Sheets(ela).Cells(j, 15 + (3 - 1) * 6), _
                                                   Sheets(ela).Cells(j, 15 + (4 - 1) * 6), Sheets(ela).Cells(j, 15 + (5 - 1) * 6), Sheets(ela).Cells(j, 15 + (6 - 1) * 6), Sheets(ela).Cells(j, 15 + (7 - 1) * 6))
                    End If
                    '��Ϊλ�ƽǺͼ�����ز���ͬһ�б��ڣ���⵽Shear���˳��ڶ���Ƕ��ѭ��
                    If Mid(data, 1, 3) = "90��" Then
                        Exit Do
                    End If
                Loop
            End If
            If Mid(data, 1, 1) = "/" Then
                Debug.Print "ƽ��ֵ���ݶ�ȡ���"
                Debug.Print "����ʱ��: " & Timer - sngStart
                Debug.Print "����"
                Exit Do
            End If

        Loop
    End If

       
Loop

Close #i

Debug.Print "�ڶ���ѭ�����"
Debug.Print "����ʱ��: " & Timer - sngStart
Debug.Print "����"

'=============================================================================================================================����Ӧ������ת��
Sheets(ela).Cells(1, 10 + m * 6) = "��Ӧ��"
Sheets(ela).range(Cells(1, m * 6 + 10), Cells(1, m * 6 + 23)).MergeCells = True
Sheets(ela).Cells(2, m * 6 + 10) = "X���λ�ƽ�"
Sheets(ela).Cells(2, m * 6 + 13) = "Y���λ�ƽ�"
Sheets(ela).Cells(2, m * 6 + 11) = "X����"
Sheets(ela).Cells(2, m * 6 + 14) = "Y����"
Sheets(ela).Cells(2, m * 6 + 12) = "X�㸲���"
Sheets(ela).Cells(2, m * 6 + 15) = "Y�㸲���"
Sheets(ela).Cells(2, m * 6 + 16) = "65%X����"
Sheets(ela).Cells(2, m * 6 + 17) = "135%X����"
Sheets(ela).Cells(2, m * 6 + 18) = "80%X����"
Sheets(ela).Cells(2, m * 6 + 19) = "120%X����"
Sheets(ela).Cells(2, m * 6 + 20) = "65%Y����"
Sheets(ela).Cells(2, m * 6 + 21) = "135%Y����"
Sheets(ela).Cells(2, m * 6 + 22) = "80%Y����"
Sheets(ela).Cells(2, m * 6 + 23) = "120%Y����"

'�ӱ���ɫ
If Temp_Colour > 0 Then
  Colour = 10091441
Else
  Colour = 6750207
End If

Sheets(ela).range(Cells(1, m * 6 + 10), Cells(2, m * 6 + 23)).Interior.color = Colour
Temp_Colour = -1 * Temp_Colour


'ȷ��¥����
Dim NN As Integer: NN = Cells(Rows.Count, "j").End(3).Row - 2

Sheets(ela).range(Sheets(ela).Cells(3, m * 6 + 10), Sheets(ela).Cells(NN + 2, m * 6 + 10)).Value = Sheets("d_Y").range("Z3:" & "Z" & NN + 2).Value
Sheets(ela).range(Sheets(ela).Cells(3, m * 6 + 13), Sheets(ela).Cells(NN + 2, m * 6 + 13)).Value = Sheets("d_Y").range("AD3:" & "AD" & NN + 2).Value

Sheets(ela).range(Sheets(ela).Cells(3, m * 6 + 11), Sheets(ela).Cells(NN + 2, m * 6 + 11)).Value = Sheets("d_Y").range("J3:" & "J" & NN + 2).Value
Sheets(ela).range(Sheets(ela).Cells(3, m * 6 + 14), Sheets(ela).Cells(NN + 2, m * 6 + 14)).Value = Sheets("d_Y").range("N3:" & "N" & NN + 2).Value

Sheets(ela).range(Sheets(ela).Cells(3, m * 6 + 12), Sheets(ela).Cells(NN + 2, m * 6 + 12)).Value = Sheets("d_Y").range("K3:" & "K" & NN + 2).Value
Sheets(ela).range(Sheets(ela).Cells(3, m * 6 + 15), Sheets(ela).Cells(NN + 2, m * 6 + 15)).Value = Sheets("d_Y").range("O3:" & "O" & NN + 2).Value

For i = 1 To NN
'X����35%����
Sheets(ela).Cells(i + 2, m * 6 + 16) = Sheets(ela).Cells(i + 2, m * 6 + 11) * 0.65
Sheets(ela).Cells(i + 2, m * 6 + 17) = Sheets(ela).Cells(i + 2, m * 6 + 11) * 1.35
'X����20%����
Sheets(ela).Cells(i + 2, m * 6 + 18) = Sheets(ela).Cells(i + 2, m * 6 + 11) * 0.8
Sheets(ela).Cells(i + 2, m * 6 + 19) = Sheets(ela).Cells(i + 2, m * 6 + 11) * 1.2
'Y����35%����
Sheets(ela).Cells(i + 2, m * 6 + 20) = Sheets(ela).Cells(i + 2, m * 6 + 14) * 0.65
Sheets(ela).Cells(i + 2, m * 6 + 21) = Sheets(ela).Cells(i + 2, m * 6 + 14) * 1.35
'Y����20%����
Sheets(ela).Cells(i + 2, m * 6 + 22) = Sheets(ela).Cells(i + 2, m * 6 + 14) * 0.8
Sheets(ela).Cells(i + 2, m * 6 + 23) = Sheets(ela).Cells(i + 2, m * 6 + 14) * 1.2
Next i

'=============================================================================================================================��д���ܱ��

'��ȡ��Ӧ�׵Ļ��׼���
Sheets(ela).Cells(m + 6, 2) = Sheets("d_Y").Cells(3, 10)
Sheets(ela).Cells(m + 6, 5) = Sheets("d_Y").Cells(3, 14)
Sheets(ela).Cells(m + 7, 2) = Sheets("d_Y").Cells(3, 10) * 0.65
Sheets(ela).Cells(m + 7, 5) = Sheets("d_Y").Cells(3, 14) * 1.35
Sheets(ela).Cells(m + 8, 2) = Sheets("d_Y").Cells(3, 10) * 0.8
Sheets(ela).Cells(m + 8, 5) = Sheets("d_Y").Cells(3, 14) * 1.2
Sheets(ela).Cells(m + 9, 2) = Sheets("d_Y").Cells(3, 10) * 0.65
Sheets(ela).Cells(m + 9, 5) = Sheets("d_Y").Cells(3, 14) * 1.35
Sheets(ela).Cells(m + 10, 2) = Sheets("d_Y").Cells(3, 10) * 0.8
Sheets(ela).Cells(m + 10, 5) = Sheets("d_Y").Cells(3, 14) * 1.2

'��ȡ��ʱ���»��׼��������������
For i = 1 To m

    '���׼�������
    Sheets(ela).Cells(5 + i, 2).Value = Sheets(ela).Cells(3, 11 + (i - 1) * 6)
    Sheets(ela).Cells(5 + i, 5).Value = Sheets(ela).Cells(3, 14 + (i - 1) * 6)
    'ʱ�̽���뷴Ӧ�׽���ı�ֵ
    If Sheets(ela).Cells(m + 6, 2) = "" Then
        'Debug.Print "ȱ�ٷ�Ӧ�����ݣ�"
    Else
        Sheets(ela).Cells(5 + i, 3).Value = Round(Sheets(ela).Cells(5 + i, 2).Value / Sheets(ela).Cells(m + 6, 2).Value, 3)
        Sheets(ela).Cells(5 + i, 6).Value = Round(Sheets(ela).Cells(5 + i, 5).Value / Sheets(ela).Cells(m + 6, 5).Value, 3)
    End If
    
    'λ�ƽǻ���
    '���λ�ƽ���������
    Dim RRX, RRY As Integer
    RRX = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 10 + (i - 1) * 6), Sheets(ela).Cells(NN + 2, 10 + (i - 1) * 6)))(1)
    Debug.Print "test" & RRX
    RRY = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 13 + (i - 1) * 6), Sheets(ela).Cells(NN + 2, 13 + (i - 1) * 6)))(1)
    '�����λ�ƽǼ��������д����
    Sheets(ela).Cells(5 + i, 4) = Worksheets(ela).Cells(RRX, 10 + (i - 1) * 6)
    Worksheets(ela).Cells(RRX, 10 + (i - 1) * 6).Interior.ColorIndex = 4
    Sheets(ela).Cells(5 + i, 7) = Worksheets(ela).Cells(RRY, 13 + (i - 1) * 6)
    Worksheets(ela).Cells(RRY, 13 + (i - 1) * 6).Interior.ColorIndex = 4

    'ʱ�̽���뷴Ӧ�׽���ı�ֵ
    'Sheets(ela).Cells(6 + i, 3).Value = Round(Sheets(ela).Cells(6 + i, 2).Value / Sheets(ela).Cells(6, 2).Value, 3)
    'Sheets(ela).Cells(6 + i, 6).Value = Round(Sheets(ela).Cells(6 + i, 5).Value / Sheets(ela).Cells(6, 5).Value, 3)
    'Sheets(ela).Cells(20 + i, 3).Value = Round(Sheets(ela).Cells(20, 2).Value / Sheets(ela).Cells(20 + i, 2).Value, 3)
    'Sheets(ela).Cells(20 + i, 6).Value = Round(Sheets(ela).Cells(20, 5).Value / Sheets(ela).Cells(20 + i, 5).Value, 3)
    
Next

'��ȡ��Ӧ�׵����λ�ƽ�
If Sheets(ela).Cells(m + 6, 2) = "" Then
MsgBox "ȱ�ٷ�Ӧ�����ݣ�"
Else
RRX = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 10 + m * 6), Sheets(ela).Cells(NN + 2, 10 + m * 6)))(1)
RRY = IndexMinofRange(Sheets(ela).range(Sheets(ela).Cells(3, 13 + m * 6), Sheets(ela).Cells(NN + 2, 13 + m * 6)))(1)
Sheets(ela).Cells(m + 6, 4) = Worksheets(ela).Cells(RRX, 10 + m * 6)
Worksheets(ela).Cells(RRX, 10 + m * 6).Interior.ColorIndex = 4
Sheets(ela).Cells(m + 6, 7) = Worksheets(ela).Cells(RRY, 13 + m * 6)
Worksheets(ela).Cells(RRY, 13 + m * 6).Interior.ColorIndex = 4
End If

'ƽ��ֵ�뷴Ӧ��ֵ�ı�ֵ
'Sheets(ela).Cells(7, 4).Value = Round(Sheets(ela).Cells(5 + m, 2).Value / Sheets(ela).Cells(6, 2).Value, 3)
'Sheets(ela).Cells(7, 7).Value = Round(Sheets(ela).Cells(5 + m, 5).Value / Sheets(ela).Cells(6, 5).Value, 3)

'Sheets(ela).Cells(21, 4).Value = Round(Sheets(ela).Cells(19 + m, 2).Value / Sheets(ela).Cells(20, 2).Value, 3)
'Sheets(ela).Cells(21, 7).Value = Round(Sheets(ela).Cells(19 + m, 5).Value / Sheets(ela).Cells(20, 5).Value, 3)

'=============================================================================================================================��ʽ����

'Sheets(ela).range("D7:D" & m + 4).MergeCells = True
'Sheets(ela).range("G7:G" & m + 4).MergeCells = True


'�ӱ���ɫ
Call AddShadow(ela, "A2:A" & m + 10, 10092441)
Call AddShadow(ela, "B4:G5,C3:C3,E3:E3", 10092441)
Call AddShadow(ela, "B2:B3,D3:D3,F3:F3", 6750207)
Call AddShadow(ela, "B6:G" & m + 10, 6750207)


'���е�Ԫ�����Զ�����
Sheets(ela).Cells.EntireColumn.AutoFit


'�ܺ�ʱ
Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub

Function IndexMinofRange(index_Range As range)
Dim Min, R, C As Integer
Min = WorksheetFunction.Min(index_Range)
R = index_Range.Find(Min, After:=index_Range.Cells(index_Range.Rows.Count, index_Range.Columns.Count), LookIn:=xlValues).Row
C = index_Range.Find(Min, After:=index_Range.Cells(index_Range.Rows.Count, index_Range.Columns.Count), LookIn:=xlValues).Columns
IndexMinofRange = Array(Min, R, C)


End Function





