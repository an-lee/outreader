Attribute VB_Name = "YJK_WDISP"
Option Explicit

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/12/20
'��������:
'1.������ȡ������bug��


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/08/22
'��������:
'1.����YJK1.6.3.1��


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

'����ʱ��:2013/11/17
'1.������������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/9/29
'1.����1.4��YJK��wdisp�й��������б仯�����繤��9��ɹ���10������Mid�����������λ�����󣻸�ΪRight���������ַ���ĩβ��ʼ����λ��

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

'����ʱ��:2013/7/19/ 10:18
'��������:
'1.ɾ����distribution����ʽ������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/18 22:05

'�������ݣ�
'1.find��Ӿ�ȷ���Ҳ�����lookat:=1


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/15/ 21:13
'��������:
'1.���µ�general������


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/3/ 17:13
'��������:
'1.��ֲPKPM��alpha��
'2.YJK�и������Ĺؼ���λ�ò�һ������ԭ��ͳһ�жϵ�select case��Ϊ������if
'3.YJK�в��λ�ƽ�ĩβû��С���㣬ԭ�е��ж�ʧЧ������ȡ"1/XXXX"������MIDȡ�����λ
'4.���������λ�ƽ�ȡֵ��Χ�������繤��

'///////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            YJK_WDISP.OUT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_YJK_WDISP(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename  As String, filepath  As String, inputstring  As String


'����dataΪ�����е��ַ���
Dim data As String


'����ѭ������
Dim i As Integer, j As Integer

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

Keyword_Story_Drift_WX = "+X �������������µ�¥�����λ��"

Keyword_Story_Drift_WY = "+Y �������������µ�¥�����λ��"



'λ�Ʊ�
Dim Keyword_Disp_Ratio_FEX As String

Dim Keyword_Disp_Ratio_FEXP As String

Dim Keyword_Disp_Ratio_FEXN As String

Dim Keyword_Disp_Ratio_FEY As String

Dim Keyword_Disp_Ratio_FEYP As String

Dim Keyword_Disp_Ratio_FEYN As String

'��ֵ
Keyword_Disp_Ratio_FEX = "X ����涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEXP = "X+ �涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEXN = "X- �涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEY = "Y ����涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEYP = "Y+ �涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEYN = "Y- �涨ˮƽ�������µ�¥�����λ��"

'==========================================================================================�������ַ�����


'���λ�ƽ�/λ�Ʊ�

Dim Firststring_Disp, Firststring_Story_Drift_EX, Firststring_Story_Drift_EXP, Firststring_Story_Drift_EXN, Firststring_Story_Drift_EY, Firststring_Story_Drift_EYP, Firststring_Story_Drift_EYN As String

Dim Firststring_Story_Drift_WX, Firststring_Story_Drift_WY, Firststring_Disp_Ratio_FEX, Firststring_Disp_Ratio_FEXP, Firststring_Disp_Ratio_FEXN, Firststring_Disp_Ratio_FEY, Firststring_Disp_Ratio_FEYP, Firststring_Disp_Ratio_FEYN As String

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
    'n = n + 1
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�
   
    '���λ�ƽ�/λ�Ʊ�
    Firststring_Disp = Mid(data, 17, 25)
    
    Firststring_Story_Drift_EX = Right(data, 16)

    Firststring_Story_Drift_EXP = Right(data, 19)

    Firststring_Story_Drift_EXN = Right(data, 19)

    Firststring_Story_Drift_EY = Right(data, 16)

    Firststring_Story_Drift_EYP = Right(data, 19)

    Firststring_Story_Drift_EYN = Right(data, 19)

    Firststring_Story_Drift_WX = Right(data, 18)

    Firststring_Story_Drift_WY = Right(data, 18)

    Firststring_Disp_Ratio_FEX = Right(data, 19)

    Firststring_Disp_Ratio_FEXP = Right(data, 18)

    Firststring_Disp_Ratio_FEXN = Right(data, 18)

    Firststring_Disp_Ratio_FEY = Right(data, 19)

    Firststring_Disp_Ratio_FEYP = Right(data, 18)

    Firststring_Disp_Ratio_FEYN = Right(data, 18)
    
    '-------------------------------------------------------------------------------------------��ȡ���λ�ƽ�/λ�Ʊ�

    
    '----------------------------------------------------------��ȡX ������������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EX = Keyword_Story_Drift_EX Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 18) = StringfromStringforReg(data, "\b\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 26) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
        
    End If
        
    '----------------------------------------------------------��ȡX+ żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EXP = Keyword_Story_Drift_EXP Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 19) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 27) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
     End If
        
    '----------------------------------------------------------��ȡX- żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EXN = Keyword_Story_Drift_EXN Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 20) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 28) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
     End If
        
        '----------------------------------------------------------��ȡY ������������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EY = Keyword_Story_Drift_EY Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 22) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 30) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
    End If
        
    '----------------------------------------------------------��ȡY+ żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EYP = Keyword_Story_Drift_EYP Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 23) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 31) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
        
     End If
             
    '----------------------------------------------------------��ȡY- żȻƫ�ĵ��������µĲ��λ�ƽ�
    If Firststring_Story_Drift_EYN = Keyword_Story_Drift_EYN Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 24) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 32) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
        
     End If
        
    '----------------------------------------------------------X �������������µĲ��λ�ƽ�
    If Firststring_Story_Drift_WX = Keyword_Story_Drift_WX Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 21) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 29) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
        
     End If
        
    '----------------------------------------------------------Y �������������µĲ��λ�ƽ�
    If Firststring_Story_Drift_WY = Keyword_Story_Drift_WY Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If CheckRegExpfromString(data, "�����λ�ƽ�") Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                'jΪ��ȡ������д������������������б�����
                j = extractNumberFromString(data, 1) + 2
                
                '��ȡ¥��
                'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
                'д��ƽ��λ��
                Sheets("d_Y").Cells(j, 25) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
                '��ȡ��һ���в��λ�ƽ�����
                Line Input #i, data
                'д����λ�ƽ�
                Sheets("d_Y").Cells(j, 33) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 4)
            
            End If
        Loop
        
    End If
        
        
    '----------------------------------------------------------��ȡX ����������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
    If Firststring_Disp_Ratio_FEX = Keyword_Disp_Ratio_FEX Then
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_Y").Cells(j, 34) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_Y").Cells(j, 40) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
            Loop
            
      End If
            
    '----------------------------------------------------------��ȡX+żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
    If Firststring_Disp_Ratio_FEXP = Keyword_Disp_Ratio_FEXP Or Right(data, 22) = "X+ żȻƫ�Ĺ涨ˮƽ�������µ�¥�����λ��" Then
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_Y").Cells(j, 35) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_Y").Cells(j, 41) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
            Loop
            
      End If
        
      '----------------------------------------------------------��ȡX-żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
      If Firststring_Disp_Ratio_FEXN = Keyword_Disp_Ratio_FEXN Or Right(data, 22) = "X- żȻƫ�Ĺ涨ˮƽ�������µ�¥�����λ��" Then
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_Y").Cells(j, 36) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_Y").Cells(j, 42) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
            Loop
            
       End If
            
        '----------------------------------------------------------��ȡY ����������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
      If Firststring_Disp_Ratio_FEY = Keyword_Disp_Ratio_FEY Then
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_Y").Cells(j, 37) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_Y").Cells(j, 43) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
            Loop
            
        End If
            
        '----------------------------------------------------------��ȡY+żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        If Firststring_Disp_Ratio_FEYP = Keyword_Disp_Ratio_FEYP Or Right(data, 22) = "Y+ żȻƫ�Ĺ涨ˮƽ�������µ�¥�����λ��" Then
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_Y").Cells(j, 38) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_Y").Cells(j, 44) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
            Loop
            
         End If
        
        '----------------------------------------------------------��ȡY-żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        If Firststring_Disp_Ratio_FEYN = Keyword_Disp_Ratio_FEYN Or Right(data, 22) = "Y- żȻƫ�Ĺ涨ˮƽ�������µ�¥�����λ��" Then
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
                    '�˳�
                    Exit Do
                End If
                
                '�����������������Ϊ��������
                If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
                    '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                    'jΪ��ȡ������д������������������б�����
                    j = extractNumberFromString(data, 1) + 2
                    
                    '��ȡ¥��
                    'Sheets("d_Y").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                    'д��λ�Ʊ�
                    Sheets("d_Y").Cells(j, 39) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                    '��ȡ��һ���в��λ�Ʊ�����
                    Line Input #i, data
                    'д����λ�Ʊ�
                    Sheets("d_Y").Cells(j, 45) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
                End If
            Loop
        End If

Loop

    Debug.Print "��ȡ��������"
    Debug.Print "��ʱ: " & Timer - sngStart
    Debug.Print "����"

'�رս���ļ�WDISP.OUT
Close #i


'-------------------------------------------------------------------------------------------������ֵ

Sheets("d_Y").Cells.EntireColumn.AutoFit

Num_all = Sheets("d_Y").range("a65536").End(xlUp)


Dim ii As Integer
Dim i_RowID As Integer
Dim i_Rng As range

'---------------------------------------------------------λ��
For ii = 18 To 25
Dim R As range
Set R = Worksheets("d_Y").range(Cells(3, ii), Cells(Num_all + 2, ii))
Call maxormin(R, "min", "d_Y!R3C" & CStr(ii) & ":R" & CStr(Num_all + 2) & "C" & CStr(ii))
Next

'---------------------------------------------------------λ�ƽ�
For ii = 26 To 33
Set R = Worksheets("d_Y").range(Cells(3, ii), Cells(Num_all + 2, ii))
Call maxormin(R, "min", "d_Y!R3C" & CStr(ii) & ":R" & CStr(Num_all + 2) & "C" & CStr(ii))
Next

'---------------------------------------------------------λ�Ʊ�
For ii = 34 To 45
Set R = Worksheets("d_Y").range(Cells(3, ii), Cells(Num_all + 2, ii))
Call maxormin(R, "max", "d_Y!R3C" & CStr(ii) & ":R" & CStr(Num_all + 2) & "C" & CStr(ii))
Next


Sheets("g_Y").Cells.EntireColumn.AutoFit
Sheets("d_Y").Cells.EntireColumn.AutoFit
Sheets("d_Y").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"


'-------------------------------------------------------------------------------------------��ȡ�����λ�ƽǡ�����¥�㼰����
'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  �����
Sheets("g_Y").Cells(10, 5).Formula = "=1&"" / ""&MIN(d_Y!AC:AC)"
Sheets("g_Y").Cells(10, 7).Formula = "=1&"" / ""&MIN(d_Y!AG:AG)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����
Sheets("g_Y").Cells(11, 5).Formula = "=1&"" / ""&MIN(d_Y!Z:Z)"
Sheets("g_Y").Cells(11, 7).Formula = "=1&"" / ""&MIN(d_Y!AD:AD)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����+
Sheets("g_Y").Cells(12, 5).Formula = "=1&"" / ""&MIN(d_Y!AA:AA)"
Sheets("g_Y").Cells(12, 7).Formula = "=1&"" / ""&MIN(d_Y!AE:AE)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����-
Sheets("g_Y").Cells(13, 5).Formula = "=1&"" / ""&MIN(d_Y!AB:AB)"
Sheets("g_Y").Cells(13, 7).Formula = "=1&"" / ""&MIN(d_Y!AF:AF)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  �����λ�ƽ�
Sheets("g_Y").Cells(14, 4).Formula = "=1&"" / ""&MIN(d_Y!Z:Z,d_Y!AC:AD,d_Y!AG:AG)"


'//////////////////////////////////////////////////////////////////////////////////////////////
'����EXCEl��ʽ����������ÿ���������ԭ�ȵĹ�ʽ����
'Sheets("g_Y").Cells(18, 14).FormulaArray = "=INDEX(d_Y!C[-13],SMALL(IF(d_Y!C[12]:C[14]=MIN(d_Y!C[12]:C[14]),ROW(R[-17]:R[4982]),4^8),ROW(R[-17])))&"""""
'Sheets("g_Y").Cells(18, 15).FormulaArray = "=INDEX(d_Y!C[-14],SMALL(IF(d_Y!C[14]:C[16]=MIN(d_Y!C[14]:C[16]),ROW(R[-17]:R[4982]),4^8),ROW(R[-17])))&"""""
'//////////////////////////////////////////////////////////////////////////////////////////////


'//////////////////////////////////////////////////////////////////////////////////////////////
'ʹ��VBA��ѯ���ܣ�����


'���������λ�ƽǲ�ѯ����
Set iRng_X = Application.Union(range("d_Y!Z:Z"), range("d_Y!AC:AD"), range("d_Y!AG:AG"))
'�����ѯ����
Dim i_Min As Double, i_Row As Integer, i_Col As Integer
Dim i_Temp As range

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ�����������λ�ƽǣ�ʵ���ǲ�ѯ���λ�ƽǵ���С��ĸ��
i_Min = WorksheetFunction.Min(range("d_Y!Z:Z"), range("d_Y!AC:AD"), range("d_Y!AG:AG"))

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '���������λ�ƽ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '���������λ�ƽ����ڲ㣬���乤��
    Sheets("g_Y").Cells(15, 7) = Sheets("d_Y").Cells(i_Row, 1)
    Sheets("g_Y").Cells(15, 5) = Sheets("d_Y").Cells(2, i_Col)
End If

'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'���������λ�ƽ����ڲ㣬���乤��
'Sheets("g_Y").Cells(15, 7) = Sheets("d_Y").Cells(i_Row, 1)
'Sheets("g_Y").Cells(15, 5) = Sheets("d_Y").Cells(2, i_Col)


Sheets("d_Y").Columns("AH:AS").NumberFormatLocal = "0.00"

'-------------------------------------------------------------------------------------------��ȡ���λ�Ʊ�
Sheets("g_Y").Cells(16, 4).Formula = "=MAX(d_Y!AH:AM)"

'------------------------------------------------------------------------------------------- ��ѯ���λ�Ʊ�����¥��

'�������λ�ƱȲ�ѯ����
Set iRng_X = range("d_Y!AH:AM")

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ���������λ�Ʊ�
i_Min = WorksheetFunction.Max(range("d_Y!AH:AM"))
i_Min = Format(i_Min, "0.00")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '�������λ�Ʊ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '�������λ�Ʊ����ڲ㣬���乤��
    Sheets("g_Y").Cells(17, 7) = Sheets("d_Y").Cells(i_Row, 1)
    Sheets("g_Y").Cells(17, 5) = Sheets("d_Y").Cells(2, i_Col)
End If

'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlPart).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlPart).column
'�������λ�Ʊ����ڲ㣬���乤��
'Sheets("g_Y").Cells(17, 7) = Sheets("d_Y").Cells(i_Row, 1)
'Sheets("g_Y").Cells(17, 5) = Sheets("d_Y").Cells(2, i_Col)


'-------------------------------------------------------------------------------------------��ȡ�����λ�Ʊ�
Sheets("g_Y").Cells(18, 4).Formula = "=MAX(d_Y!AN:AS)"

'------------------------------------------------------------------------------------------- ��ѯ�����λ�Ʊ�����¥��

'�������λ�ƱȲ�ѯ����
Set iRng_X = range("d_Y!AN:AS")

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ���������λ�Ʊ�
i_Min = WorksheetFunction.Max(range("d_Y!AN:AS"))
i_Min = Format(i_Min, "0.00")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '�������λ�Ʊ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '�������λ�Ʊ����ڲ㣬���乤��
    Sheets("g_Y").Cells(19, 7) = Sheets("d_Y").Cells(i_Row, 1)
    Sheets("g_Y").Cells(19, 5) = Sheets("d_Y").Cells(2, i_Col)
End If

'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlPart).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlPart).column
'�������λ�Ʊ����ڲ㣬���乤��
'Sheets("g_Y").Cells(19, 7) = Sheets("d_Y").Cells(i_Row, 1)
'Sheets("g_Y").Cells(19, 5) = Sheets("d_Y").Cells(2, i_Col)



Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub



