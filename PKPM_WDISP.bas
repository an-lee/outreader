Attribute VB_Name = "PKPM_WDISP"
Option Explicit

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/11
'��������:
'1.���range�Ƿ�Ϊ���ж�,���ȱ������ʱwith��������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'��������:
'1.������ݸ�ʽ����,���with��������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/04/18
'��������:
'1.λ�Ʊ�ȡ��ֵǰ���format���ƴ���

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/15
'1.������������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29
'1.��Ӹ�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/29 10:13

'�������ݣ�
'1.�޸������λ�ƽ�ȡֵ��Χ��ֻ���ڵ�����磬����ƫ��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/18/ 17:22
'��������:
'1.find������Ϊ��ȷ���ң���ĩβ������ lookat:=1


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/15/ 17:22
'��������:
'1.����µ�general���������ݡ�
'2.�����λ�ƽǰ���������ȡ


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/3/ 17:22
'��������:
'1.���������λ�ƽ�ȡֵ��Χ�������繤��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/27/ 21:57
'��������:
'1.��ȷ��λ���λ�ƽǺͲ��λ��������
'2.��ȷ��λ���λ�Ʊ�����¥��


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/23/ 23:57
'��������:
'1.��ȷ��λ���λ�ƽǺͲ��λ��������
'2.��ȷ��λ���λ�Ʊ�����¥��


'///////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/5/20 22:40
'��������
'1.���������������µĶ�ȡ

'///////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            PKPM_WDISP.OUT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_PKPM_WDISP(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer


'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename  As String, filepath  As String, inputstring  As String


'����dataΪ�����е��ַ���
Dim data As String


'����ѭ������
Dim i, j As Integer

Dim i_m As Integer, i_k1 As Integer, i_k2 As Integer, i_w As Integer, i_q As Integer

'i_k1��i_k2�ֱ�Ϊ���ָնȱȵ�д��������¼����3��Ϊ��1�㣬ǰ����Ϊ������
i_k1 = 3
i_k2 = 3


'�ı���ǰ����
Dim n As Integer

'��������¥���ѯ����
Dim iRng_X As range, iRng_Y As range


'==========================================================================================����ؼ��ʱ���


'���λ�ƽ�
Dim Keyword_Story_Drift_EX As String

Dim Keyword_Story_Drift_EXP As String

Dim Keyword_Story_Drift_EXN As String

Dim Keyword_Story_Drift_EY As String

Dim Keyword_Story_Drift_EYP As String

Dim Keyword_Story_Drift_EYN As String

Dim Keyword_Story_Drift_WX As String

Dim Keyword_Story_Drift_WY As String

'��ֵ
Keyword_Story_Drift_EX = "X ������������µ�¥�����λ��"

Keyword_Story_Drift_EXP = "X+ żȻƫ�ĵ��������µ�¥�����λ��"

Keyword_Story_Drift_EXN = "X- żȻƫ�ĵ��������µ�¥�����λ��"

Keyword_Story_Drift_EY = "Y ������������µ�¥�����λ��"

Keyword_Story_Drift_EYP = "Y+ żȻƫ�ĵ��������µ�¥�����λ��"

Keyword_Story_Drift_EYN = "Y- żȻƫ�ĵ��������µ�¥�����λ��"

Keyword_Story_Drift_WX = "X �������������µ�¥�����λ��"

Keyword_Story_Drift_WY = "Y �������������µ�¥�����λ��"



'λ�Ʊ�
Dim Keyword_Disp_Ratio_FEX As String

Dim Keyword_Disp_Ratio_FEXP As String

Dim Keyword_Disp_Ratio_FEXN As String

Dim Keyword_Disp_Ratio_FEY As String

Dim Keyword_Disp_Ratio_FEYP As String

Dim Keyword_Disp_Ratio_FEYN As String

'��ֵ
Keyword_Disp_Ratio_FEX = "X ����������ù涨ˮƽ���µ�¥�����λ��"

Keyword_Disp_Ratio_FEXP = "X+żȻƫ�ĵ������ù涨ˮƽ���µ�¥�����λ��"

Keyword_Disp_Ratio_FEXN = "X-żȻƫ�ĵ������ù涨ˮƽ���µ�¥�����λ��"

Keyword_Disp_Ratio_FEY = "Y ����������ù涨ˮƽ���µ�¥�����λ��"

Keyword_Disp_Ratio_FEYP = "Y+żȻƫ�ĵ������ù涨ˮƽ���µ�¥�����λ��"

Keyword_Disp_Ratio_FEYN = "Y-żȻƫ�ĵ������ù涨ˮƽ���µ�¥�����λ��"


'==========================================================================================�������ַ�����


'���λ�ƽ�/λ�Ʊ�
Dim Firststring_Disp As String


'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���ΪWDISP.out
Filename = "WDISP.OUT"

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�WDISP.out"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    '��¼����
'    n = n + 1
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�
   
    '���λ�ƽ�/λ�Ʊ�
    Firststring_Disp = Mid(data, 17, 25)

    
    '-------------------------------------------------------------------------------------------��ȡ���λ�ƽ�/λ�Ʊ�


    Select Case Firststring_Disp
    
    '----------------------------------------------------------��ȡX ������������µ�λ�ơ����λ�ƽ�
    Case Keyword_Story_Drift_EX
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 18) = StringfromStringforReg(data, "\b\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 26) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
    '----------------------------------------------------------��ȡX+ żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
        Case Keyword_Story_Drift_EXP
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 19) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 27) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
    '----------------------------------------------------------��ȡX- żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
        Case Keyword_Story_Drift_EXN
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 20) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 28) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
        '----------------------------------------------------------��ȡY ������������µ�λ�ơ����λ�ƽ�
    Case Keyword_Story_Drift_EY
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 22) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 30) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
    '----------------------------------------------------------��ȡY+ żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
        Case Keyword_Story_Drift_EYP
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 23) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 31) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
    '----------------------------------------------------------��ȡY- żȻƫ�ĵ��������µĲ��λ�ƽ�
        Case Keyword_Story_Drift_EYN
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 24) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 32) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
        '----------------------------------------------------------X �������������µĲ��λ�ƽ�
        Case Keyword_Story_Drift_WX
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 21) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 29) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
        '----------------------------------------------------------Y �������������µĲ��λ�ƽ�
        Case Keyword_Story_Drift_WY
    
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "���λ�ƽ�:") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_P").Cells(j, 25) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_P").Cells(j, 33) = StringfromStringforReg(data, "\b\d+\.\s", 1)
            
            End If
            
        Loop
        
        
        '----------------------------------------------------------��ȡX ����������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        Case Keyword_Disp_Ratio_FEX
        
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ:") Or CheckRegExpfromString(data, "���λ�ƽ�:") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_P").Cells(j, 34) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_P").Cells(j, 40) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop
            
        '----------------------------------------------------------��ȡX+żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        Case Keyword_Disp_Ratio_FEXP
        
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ:") Or CheckRegExpfromString(data, "���λ�ƽ�:") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_P").Cells(j, 35) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_P").Cells(j, 41) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop
        
        '----------------------------------------------------------��ȡX-żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        Case Keyword_Disp_Ratio_FEXN
        
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ:") Or CheckRegExpfromString(data, "���λ�ƽ�:") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_P").Cells(j, 36) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_P").Cells(j, 42) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop
            
        '----------------------------------------------------------��ȡY ����������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        Case Keyword_Disp_Ratio_FEY
        
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ:") Or CheckRegExpfromString(data, "���λ�ƽ�:") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_P").Cells(j, 37) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_P").Cells(j, 43) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop
            
        '----------------------------------------------------------��ȡY+żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        Case Keyword_Disp_Ratio_FEYP
        
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ:") Or CheckRegExpfromString(data, "���λ�ƽ�:") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_P").Cells(j, 38) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_P").Cells(j, 44) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop
        
        '----------------------------------------------------------��ȡY-żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        Case Keyword_Disp_Ratio_FEYN
        
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "���λ�ƽ�:") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_P").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_P").Cells(j, 39) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_P").Cells(j, 45) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
                
            Loop

           
            Debug.Print "��ȡ��������"
            Debug.Print "��ʱ: " & Timer - sngStart
            Debug.Print "����"

        End Select
    
        
Loop

'�رս���ļ�WDISP.OUT
Close #i

'-------------------------------------------------------------------------------------------������ֵ

'Sheets("d_P").Cells.EntireColumn.AutoFit
'
'Num_All = Sheets("d_P").range("a65536").End(xlUp)
'
'
'Dim ii As Integer
'Dim i_RowID As Integer
'Dim i_Rng As range
'
'
''---------------------------------------------------------λ�ƽ�
'For ii = 26 To 33
'Dim RT As range
'Set RT = Worksheets("d_P").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(RT, "min", "d_P!R3C" & CStr(ii) & ":R" & CStr(Num_All + 2) & "C" & CStr(ii))
'Next
'
''---------------------------------------------------------λ�Ʊ�
'For ii = 34 To 45
'Set RT = Worksheets("d_P").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(RT, "max", "d_P!R3C" & CStr(ii) & ":R" & CStr(Num_All + 2) & "C" & CStr(ii))
'Next
    
'Sheets("g_P").Cells.EntireColumn.AutoFit
'Sheets("d_P").Cells.EntireColumn.AutoFit
'Sheets("d_P").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"


'-------------------------------------------------------------------------------------------��ȡ�����λ�ƽǡ�����¥�㼰����
'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  �����
Sheets("g_P").Cells(10, 5).Formula = "=1&"" / ""&MIN(d_P!AC:AC)"
Sheets("g_P").Cells(10, 7).Formula = "=1&"" / ""&MIN(d_P!AG:AG)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����
Sheets("g_P").Cells(11, 5).Formula = "=1&"" / ""&MIN(d_P!Z:Z)"
Sheets("g_P").Cells(11, 7).Formula = "=1&"" / ""&MIN(d_P!AD:AD)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����+
Sheets("g_P").Cells(12, 5).Formula = "=1&"" / ""&MIN(d_P!AA:AA)"
Sheets("g_P").Cells(12, 7).Formula = "=1&"" / ""&MIN(d_P!AE:AE)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����-
Sheets("g_P").Cells(13, 5).Formula = "=1&"" / ""&MIN(d_P!AB:AB)"
Sheets("g_P").Cells(13, 7).Formula = "=1&"" / ""&MIN(d_P!AF:AF)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ���λ�ƽ�
Sheets("g_P").Cells(14, 4).Formula = "=1&"" / ""&MIN(d_P!Z:Z,d_P!AC:AD,d_P!AG:AG)"


'//////////////////////////////////////////////////////////////////////////////////////////////
'����EXCEl��ʽ����������ÿ���������ԭ�ȵĹ�ʽ����
'Sheets("g_P").Cells(18, 14).FormulaArray = "=INDEX(d_P!C[-13],SMALL(IF(d_P!C[12]:C[14]=MIN(d_P!C[12]:C[14]),ROW(R[-17]:R[4982]),4^8),ROW(R[-17])))&"""""
'Sheets("g_P").Cells(18, 15).FormulaArray = "=INDEX(d_P!C[-14],SMALL(IF(d_P!C[14]:C[16]=MIN(d_P!C[14]:C[16]),ROW(R[-17]:R[4982]),4^8),ROW(R[-17])))&"""""
'//////////////////////////////////////////////////////////////////////////////////////////////


'//////////////////////////////////////////////////////////////////////////////////////////////
'ʹ��VBA��ѯ���ܣ�����


'���������λ�ƽǲ�ѯ����
Set iRng_X = Application.Union(range("d_P!Z:Z"), range("d_P!AC:AD"), range("d_P!AG:AG"))

'�����ѯ����
Dim i_Min As Double, i_Row As Integer, i_Col As Integer
Dim i_Temp As range

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ�����������λ�ƽǣ�ʵ���ǲ�ѯ���λ�ƽǵ���С��ĸ��
i_Min = WorksheetFunction.Min(iRng_X)
'i_Min = Format(i_Min, "0000")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '���������λ�ƽ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '���������λ�ƽ����ڲ㣬���乤��
    Sheets("g_P").Cells(15, 7) = Sheets("d_P").Cells(i_Row, 1)
    Sheets("g_P").Cells(15, 5) = Sheets("d_P").Cells(2, i_Col)
End If

'���������λ�ƽ������кš��к�
'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'���������λ�ƽ����ڲ㣬���乤��
'Sheets("g_P").Cells(15, 7) = Sheets("d_P").Cells(i_Row, 1)
'Sheets("g_P").Cells(15, 5) = Sheets("d_P").Cells(2, i_Col)

Sheets("d_P").Columns("AH:AS").NumberFormatLocal = "0.00"
'-------------------------------------------------------------------------------------------��ȡ���λ�Ʊ�
Sheets("g_P").Cells(16, 4).Formula = "=MAX(d_P!AH:AM)"

'------------------------------------------------------------------------------------------- ��ѯ���λ�Ʊ�����¥��

'�������λ�ƱȲ�ѯ����
Set iRng_X = range("d_P!AH:AM")

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ���������λ�Ʊ�
i_Min = Application.WorksheetFunction.Max(range("d_P!AH:AM"))
i_Min = Format(i_Min, "0.00")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '�������λ�Ʊ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '�������λ�Ʊ����ڲ㣬���乤��
    Sheets("g_P").Cells(17, 7) = Sheets("d_P").Cells(i_Row, 1)
    Sheets("g_P").Cells(17, 5) = Sheets("d_P").Cells(2, i_Col)
End If

'�������λ�Ʊ������кš��к�
'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'�������λ�Ʊ����ڲ㣬���乤��
'Sheets("g_P").Cells(17, 7) = Sheets("d_P").Cells(i_Row, 1)
'Sheets("g_P").Cells(17, 5) = Sheets("d_P").Cells(2, i_Col)


'-------------------------------------------------------------------------------------------��ȡ�����λ�Ʊ�
Sheets("g_P").Cells(18, 4).Formula = "=MAX(d_P!AN:AS)"

'------------------------------------------------------------------------------------------- ��ѯ�����λ�Ʊ�����¥��

'�������λ�ƱȲ�ѯ����
Set iRng_X = range("d_P!AN:AS")

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ���������λ�Ʊ�
i_Min = WorksheetFunction.Max(range("d_P!AN:AS"))
i_Min = Format(i_Min, "0.00")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '�������λ�Ʊ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '�������λ�Ʊ����ڲ㣬���乤��
    Sheets("g_P").Cells(19, 7) = Sheets("d_P").Cells(i_Row, 1)
    Sheets("g_P").Cells(19, 5) = Sheets("d_P").Cells(2, i_Col)
End If

'�������λ�Ʊ������кš��к�
'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'�������λ�Ʊ����ڲ㣬���乤��
'Sheets("g_P").Cells(19, 7) = Sheets("d_P").Cells(i_Row, 1)
'Sheets("g_P").Cells(19, 5) = Sheets("d_P").Cells(2, i_Col)

Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub



