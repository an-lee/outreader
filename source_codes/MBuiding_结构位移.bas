Attribute VB_Name = "MBuiding_�ṹλ��"
Option Explicit

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/11
'��������:
'1.���range�Ƿ�Ϊ���ж�,���ȱ������ʱwith��������


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'��������:
'1.������ݸ�ʽ����,���with��������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'1.��Ӵ���,���ģ�ͽ��������ҵ����ݶ�ȡ���⡣

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/04/18
'��������:
'1.λ�Ʊ�ȡ��ֵǰ���format���ƴ���

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/15

'�������ݣ�
'1.����MIDAS����Ťתʱ����ع�����λ�ƽǵ���ȡ��
'2.�޸ĸ������룻

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29

'�������ݣ�
'1.���Ӹ�������

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12 17:13

'�������ݣ�
'1.�޸������λ�ƽ�ȡֵ��Χ��ֻ���ڵ�����磬����ƫ��
'2.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/31 13:58
'��������:
'1.����λ�Ʊ��������ݸ�ʽΪС�������λ������λ�Ʊ�ȡ��ֵʱ����

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/29 12:48
'��������:
'1.��ֲPKPM��prebeta��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/12 14:42
'��������:
'1.MBuilding���λ�ƽǷ�ĸ�����ܴ���9999�����Ƕ�ȡ��ĸΪ5λ�����



'///////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            MBuilding_�ṹλ�Ʋ��ִ���                ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_MBuilding_�ṹλ��(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, inputstring  As String


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
Keyword_Story_Drift_EX = "RS_0������¥��λ��"

'Keyword_Story_Drift_EXP = "X+ żȻƫ�ĵ��������µ�¥�����λ��"

'Keyword_Story_Drift_EXN = "X- żȻƫ�ĵ��������µ�¥�����λ��"

Keyword_Story_Drift_EY = "RS_90������¥��λ��"

'Keyword_Story_Drift_EYP = "Y+ żȻƫ�ĵ��������µ�¥�����λ��"

'Keyword_Story_Drift_EYN = "Y- żȻƫ�ĵ��������µ�¥�����λ��"

Keyword_Story_Drift_WX = "WL_0������"

Keyword_Story_Drift_WY = "WL_90����"



'λ�Ʊ�
Dim Keyword_Disp_Ratio_FEX As String

Dim Keyword_Disp_Ratio_FEXP As String

Dim Keyword_Disp_Ratio_FEXN As String

Dim Keyword_Disp_Ratio_FEY As String

Dim Keyword_Disp_Ratio_FEYP As String

Dim Keyword_Disp_Ratio_FEYN As String

'��ֵ
'Keyword_Disp_Ratio_FEX = "X ����涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEXP = "RS_0+ES_0����"

Keyword_Disp_Ratio_FEXN = "RS_0-ES_0����"

'Keyword_Disp_Ratio_FEY = "Y ����涨ˮƽ�������µ�¥�����λ��"

Keyword_Disp_Ratio_FEYP = "RS_90+ES_90����"

Keyword_Disp_Ratio_FEYN = "RS_90-ES_90����"

'==========================================================================================�������ַ�����


'���λ�ƽ�/λ�Ʊ�

Dim Firststring_Disp, Firststring_Story_Drift_EX, Firststring_Story_Drift_EXP, Firststring_Story_Drift_EXN, Firststring_Story_Drift_EY, Firststring_Story_Drift_EYP, Firststring_Story_Drift_EYN As String

Dim Firststring_Story_Drift_WX, Firststring_Story_Drift_WY, Firststring_Disp_Ratio_FEX, Firststring_Disp_Ratio_FEXP, Firststring_Disp_Ratio_FEXN, Firststring_Disp_Ratio_FEY, Firststring_Disp_Ratio_FEYP, Firststring_Disp_Ratio_FEYN As String

'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���ΪWDISP.out
Filename = Dir(Path & "\*_�ṹλ��.txt")

Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�" & Filename
Debug.Print "��ȡ���ָ��"
Debug.Print "����"


Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    '��¼����
    n = n + 1
    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�
   
    '���λ�ƽ�/λ�Ʊ�
    Firststring_Disp = Mid(data, 17, 25)
    
    Firststring_Story_Drift_EX = Mid(data, 6, 11)

    'Firststring_Story_Drift_EXP = Mid(data, 15, 19)

    'Firststring_Story_Drift_EXN = Mid(data, 15, 19)

    Firststring_Story_Drift_EY = Mid(data, 6, 12)

    'Firststring_Story_Drift_EYP = Mid(data, 16, 25)

    'Firststring_Story_Drift_EYN = Mid(data, 16, 25)

    Firststring_Story_Drift_WX = Mid(data, 6, 7)

    Firststring_Story_Drift_WY = Mid(data, 6, 7)

    'Firststring_Disp_Ratio_FEX = Mid(data, 15, 25)

    Firststring_Disp_Ratio_FEXP = Mid(data, 6, 11)

    Firststring_Disp_Ratio_FEXN = Mid(data, 6, 11)

    'Firststring_Disp_Ratio_FEY = Mid(data, 16, 25)

    Firststring_Disp_Ratio_FEYP = Mid(data, 6, 13)

    Firststring_Disp_Ratio_FEYN = Mid(data, 6, 13)
    
    '-------------------------------------------------------------------------------------------��ȡ���λ�ƽ�/λ�Ʊ�

    
    '----------------------------------------------------------��ȡX ������������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EX = Keyword_Story_Drift_EX Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 3, 7) = "�����λ�ƽ�" Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If
                
                '��ȡ¥��
                'Sheets("d_M").Cells(j, 1) = extractNumberFromString(data, 1)
                
                'д�����λ��
                Sheets("d_M").Cells(j, 18) = StringfromStringforReg(data, "\b\d*\.\d*", 1)
                
                '��ȡ���λ�ƽ�����
                'д����λ�ƽ�
                Sheets("d_M").Cells(j, 26) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
            End If
        Loop
        
    End If


        '----------------------------------------------------------��ȡY ������������µ�λ�ơ����λ�ƽ�
    If Firststring_Story_Drift_EY = Keyword_Story_Drift_EY Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 3, 7) = "�����λ�ƽ�" Then
                '�˳�
                Exit Do
            End If
            
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If
                
                '��ȡ¥��
                'Sheets("d_M").Cells(j, 1) = extractNumberFromString(data, 1)
                
                'д�����λ��
                Sheets("d_M").Cells(j, 22) = StringfromStringforReg(data, "\b\d*\.\d*", 1)
                
                '��ȡ���λ�ƽ�����
                'д����λ�ƽ�
                Sheets("d_M").Cells(j, 30) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
            End If
        Loop
    End If
        
    ''----------------------------------------------------------��ȡX+ żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
    'If Firststring_Story_Drift_EXP = Keyword_Story_Drift_EXP Then
    '    Debug.Print data
    '    Do While Not EOF(1)
    '        Line Input #i, data
            
    '        If CheckRegExpfromString(data, "���λ�ƽ�") Then
    '            '�˳�
    '            Exit Do
    '        End If
            
    '        '�����������������Ϊ��������
    '        If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
    '            '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
    '            'jΪ��ȡ������д������������������б�����
    '            j = extractNumberFromString(data, 1) + 2
                
    '            '��ȡ¥��
    '            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
    '            'д��ƽ��λ��
    '            Sheets("d_M").Cells(j, 19) = StringfromStringforReg(data, "\d*\.\d*", 4)
                
                
    '            '��ȡ��һ���в��λ�ƽ�����
    '            Line Input #i, data
    '            'д����λ�ƽ�
    '            Sheets("d_M").Cells(j, 27) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
    '        End If
    '    Loop
    ' End If
        
    ''----------------------------------------------------------��ȡX- żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
    'If Firststring_Story_Drift_EXN = Keyword_Story_Drift_EXN Then
    '    Debug.Print data
    '    Do While Not EOF(1)
    '        Line Input #i, data
            
    '        If CheckRegExpfromString(data, "�����λ�ƽ�") Then
    '            '�˳�
    '            Exit Do
    '        End If
            
    '        '�����������������Ϊ��������
    '        If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
    '            '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
    '            'jΪ��ȡ������д������������������б�����
    '            j = extractNumberFromString(data, 1) + 2
                
    '            '��ȡ¥��
    '            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
    '            'д��ƽ��λ��
    '            Sheets("d_M").Cells(j, 20) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
    '            '��ȡ��һ���в��λ�ƽ�����
    '            Line Input #i, data
    '            'д����λ�ƽ�
    '            Sheets("d_M").Cells(j, 28) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
    '        End If
    '    Loop
    ' End If
        
    ''----------------------------------------------------------��ȡY+ żȻƫ�ĵ��������µ�λ�ơ����λ�ƽ�
    'If Firststring_Story_Drift_EYP = Keyword_Story_Drift_EYP Then
    '    Debug.Print data
    '    Do While Not EOF(1)
    '        Line Input #i, data
            
    '        If CheckRegExpfromString(data, "�����λ�ƽ�") Then
    '            '�˳�
    '            Exit Do
    '        End If
            
    '        '�����������������Ϊ��������
    '        If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
    '            '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
    '            'jΪ��ȡ������д������������������б�����
    '            j = extractNumberFromString(data, 1) + 2
                
    '            '��ȡ¥��
    '            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
    '            'д��ƽ��λ��
    '            Sheets("d_M").Cells(j, 23) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
    '            '��ȡ��һ���в��λ�ƽ�����
    '            Line Input #i, data
    '            'д����λ�ƽ�
    '            Sheets("d_M").Cells(j, 31) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
    '        End If
    '    Loop
        
    ' End If
             
    ''----------------------------------------------------------��ȡY- żȻƫ�ĵ��������µĲ��λ�ƽ�
    'If Firststring_Story_Drift_EYN = Keyword_Story_Drift_EYN Then
    '    Debug.Print data
    '    Do While Not EOF(1)
    '        Line Input #i, data
            
    '        If CheckRegExpfromString(data, "�����λ�ƽ�") Then
    '            '�˳�
    '            Exit Do
    '        End If
            
    '        '�����������������Ϊ��������
    '        If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
            
    '            '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                
    '            'jΪ��ȡ������д������������������б�����
    '            j = extractNumberFromString(data, 1) + 2
                
    '            '��ȡ¥��
    '            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                
    '            'д��ƽ��λ��
    '            Sheets("d_M").Cells(j, 24) = StringfromStringforReg(data, "\d*\.\d*", 2)
                
    '            '��ȡ��һ���в��λ�ƽ�����
    '            Line Input #i, data
    '            'д����λ�ƽ�
    '            Sheets("d_M").Cells(j, 32) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
    '        End If
    '    Loop
        
    ' End If
        
    '----------------------------------------------------------X �������������µĲ��λ�ƽ�
    If Mid(data, 6, 7) = "WL_0������" Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 3, 7) = "�����λ�ƽ�" Then
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
                
                '��ȡ¥��
                'Sheets("d_M").Cells(j, 1) = extractNumberFromString(data, 1)
                
                'д�����λ��
                Sheets("d_M").Cells(j, 21) = StringfromStringforReg(data, "\b\d*\.\d*", 1)
                
                '��ȡ���λ�ƽ�����
                'д����λ�ƽ�
                Sheets("d_M").Cells(j, 29) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
            End If
        Loop
        
     End If
     
    '----------------------------------------------------------X �������������µĲ��λ�ƽ�
    If Mid(data, 6, 7) = "WL_0_DK" Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 3, 7) = "�����λ�ƽ�" Then
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
                
                '��ȡ¥��
                'Sheets("d_M").Cells(j, 1) = extractNumberFromString(data, 1) + Num_Base
                
                'д�����λ��
                Sheets("d_M").Cells(j, 21) = StringfromStringforReg(data, "\b\d*\.\d*", 1)
                
                '��ȡ���λ�ƽ�����
                'д����λ�ƽ�
                Sheets("d_M").Cells(j, 29) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
            End If
        Loop
        
     End If
        
    '----------------------------------------------------------Y �������������µĲ��λ�ƽ�
    If Firststring_Story_Drift_WY = Keyword_Story_Drift_WY Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 3, 7) = "�����λ�ƽ�" Then
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
                
                '��ȡ¥��
                'Sheets("d_M").Cells(j, 1) = extractNumberFromString(data, 1) + Num_Base
                
                
                'д�����λ��
                Sheets("d_M").Cells(j, 25) = StringfromStringforReg(data, "\b\d*\.\d*", 1)
                
                '��ȡ���λ�ƽ�����
                'д����λ�ƽ�
                Sheets("d_M").Cells(j, 33) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
            End If
        Loop
        
    End If
    
    '----------------------------------------------------------Y �������������µĲ��λ�ƽ�
    If Firststring_Story_Drift_WY = "WL_90_D" Then
        Debug.Print data
        Do While Not EOF(1)
            Line Input #i, data
            
            If Mid(data, 3, 7) = "�����λ�ƽ�" Then
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
                
                '��ȡ¥��
                'Sheets("d_M").Cells(j, 1) = extractNumberFromString(data, 1)
                
                'д�����λ��
                Sheets("d_M").Cells(j, 25) = StringfromStringforReg(data, "\b\d*\.\d*", 1)
                
                '��ȡ���λ�ƽ�����
                'д����λ�ƽ�
                Sheets("d_M").Cells(j, 33) = Mid(StringfromStringforReg(data, "1/\s*\d+\s", 1), 3, 5)
            
            End If
        Loop
        
    End If
        
        
    ''----------------------------------------------------------��ȡX ����������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
    'If Firststring_Disp_Ratio_FEX = Keyword_Disp_Ratio_FEX Then
    '        Debug.Print data
    '        Do While Not EOF(1)
    '            Line Input #i, data
                
    '            If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
    '                '�˳�
    '                Exit Do
    '            End If
                
    '            '�����������������Ϊ��������
    '            If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
    '                '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
    '                'jΪ��ȡ������д������������������б�����
    '                j = extractNumberFromString(data, 1) + 2
                    
    '                '��ȡ¥��
    '                'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
    '                'д��λ�Ʊ�
    '                Sheets("d_M").Cells(j, 34) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
    '                '��ȡ��һ���в��λ�Ʊ�����
    '                Line Input #i, data
    '                'д����λ�Ʊ�
    '                Sheets("d_M").Cells(j, 40) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
    '            End If
    '        Loop
            
    '  End If
            
    '----------------------------------------------------------��ȡX+żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
    If Firststring_Disp_Ratio_FEXP = Keyword_Disp_Ratio_FEXP Then
            Line Input #i, data
            
            Do While Not EOF(1)
                Line Input #i, data
                
                If Mid(data, 3, 11) = "¥��Ťתλ�Ʊ�(�߹�)" Then
                    Do While Not EOF(1)
                        Line Input #i, data
                        
                        '�����������������Ϊ��������
                        If CheckRegExpfromString(data, "Base") Then
                
                            '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                            'jΪ��ȡ������д������������������б�����
                            If CheckRegExpfromString(data, "B\S\F") = False Then
                                j = extractNumberFromString(data, 1) + 2 + Num_Base
                            Else
                                j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                            End If
                    
                            '��ȡ¥��
                            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                            'д��λ�Ʊ�
                            Sheets("d_M").Cells(j, 35) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    

                            'д����λ�Ʊ�
                            Sheets("d_M").Cells(j, 41) = StringfromStringforReg(data, "\d*\.\d*", 6)
                
                        End If
                
                
                        If CheckRegExpfromString(data, "==") Then
                            '�˳�
                            Exit Do
                        End If
                    Loop
                    
                End If
                
                If CheckRegExpfromString(data, "==") Then
                    Exit Do
                End If
            Loop
            
      End If
        
      '----------------------------------------------------------��ȡX-żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
      If Firststring_Disp_Ratio_FEXN = Keyword_Disp_Ratio_FEXN Then
            Line Input #i, data
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If Mid(data, 3, 11) = "¥��Ťתλ�Ʊ�(�߹�)" Then
                    Do While Not EOF(1)
                        Line Input #i, data
                
                        '�����������������Ϊ��������
                        If CheckRegExpfromString(data, "Base") Then
                
                             '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                             'jΪ��ȡ������д������������������б�����
                            If CheckRegExpfromString(data, "B\S\F") = False Then
                                j = extractNumberFromString(data, 1) + 2 + Num_Base
                            Else
                                j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                            End If
                    
                            '��ȡ¥��
                            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                            'д��λ�Ʊ�
                            Sheets("d_M").Cells(j, 36) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                            'д����λ�Ʊ�
                            Sheets("d_M").Cells(j, 42) = StringfromStringforReg(data, "\d*\.\d*", 6)
                
                        End If
                        
                        If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Then
                            '�˳�
                            Exit Do
                        End If
                    Loop
                End If
                
                If CheckRegExpfromString(data, "==") Then
                    Exit Do
                End If
            Loop
            
       End If
            
        '----------------------------------------------------------��ȡY ����������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
      'If Firststring_Disp_Ratio_FEY = Keyword_Disp_Ratio_FEY Then
      '      Debug.Print data
      '      Do While Not EOF(1)
      '          Line Input #i, data
                
      '          If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Or CheckRegExpfromString(data, "�����λ�ƽ�") Then
      '              '�˳�
      '              Exit Do
      '          End If
                
      '          '�����������������Ϊ��������
      '          If CheckRegExpfromString(data, "(\s*(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)){2}") Then
                
      '              '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
      '              'jΪ��ȡ������д������������������б�����
      '              j = extractNumberFromString(data, 1) + 2
                    
      '              '��ȡ¥��
      '              'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
      '              'д��λ�Ʊ�
      '              Sheets("d_M").Cells(j, 37) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
      '              '��ȡ��һ���в��λ�Ʊ�����
      '              Line Input #i, data
      '              'д����λ�Ʊ�
      '              Sheets("d_M").Cells(j, 43) = StringfromStringforReg(data, "\d*\.\d*", 3)
                
      '          End If
      '      Loop
            
      '  End If
            
        '----------------------------------------------------------��ȡY+żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        If Firststring_Disp_Ratio_FEYP = Keyword_Disp_Ratio_FEYP Then
            Line Input #i, data
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If Mid(data, 3, 11) = "¥��Ťתλ�Ʊ�(�߹�)" Then
                    Do While Not EOF(1)
                        Line Input #i, data
                
                        '�����������������Ϊ��������
                        If CheckRegExpfromString(data, "Base") Then
                
                             '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                            'jΪ��ȡ������д������������������б�����
                        If CheckRegExpfromString(data, "B\S\F") = False Then
                            j = extractNumberFromString(data, 1) + 2 + Num_Base
                        Else
                            j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                        End If
                    
                            '��ȡ¥��
                            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                            'д��λ�Ʊ�
                            Sheets("d_M").Cells(j, 38) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                            'д����λ�Ʊ�
                            Sheets("d_M").Cells(j, 44) = StringfromStringforReg(data, "\d*\.\d*", 6)
                
                        End If
                        If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Then
                            '�˳�
                            Exit Do
                        End If
                    Loop
                End If
                
                If CheckRegExpfromString(data, "==") Then
                    Exit Do
                End If

            Loop
            
         End If
        
        '----------------------------------------------------------��ȡY-żȻƫ�ĵ������ù涨ˮƽ���µ�λ�Ʊȡ����λ�Ʊ�
        If Firststring_Disp_Ratio_FEYN = Keyword_Disp_Ratio_FEYN Then
            Line Input #i, data
            Debug.Print data
            Do While Not EOF(1)
                Line Input #i, data
                
                If Mid(data, 3, 11) = "¥��Ťתλ�Ʊ�(�߹�)" Then
                    Do While Not EOF(1)
                        Line Input #i, data
                        
                        '�����������������Ϊ��������
                        If CheckRegExpfromString(data, "Base") Then
                
                            '����ļ������ݶ�Ӧ��ŴӴ���С��ͳһΪ��С��������
                    
                            'jΪ��ȡ������д������������������б�����
                            If CheckRegExpfromString(data, "B\S\F") = False Then
                                j = extractNumberFromString(data, 1) + 2 + Num_Base
                            Else
                                j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                            End If
                    
                            '��ȡ¥��
                            'Sheets("d_M").Cells(j, 1) = StringfromStringforReg(data, "\b\d*\b", 1)
                    
                            'д��λ�Ʊ�
                            Sheets("d_M").Cells(j, 39) = StringfromStringforReg(data, "\d*\.\d*", 3)
                    
                            'д����λ�Ʊ�
                            Sheets("d_M").Cells(j, 45) = StringfromStringforReg(data, "\d*\.\d*", 6)
                
                        End If
                        If CheckRegExpfromString(data, "���λ�����ƽ��λ�Ƶı�ֵ") Then
                            '�˳�
                            Exit Do
                        End If
                    Loop
                End If
                
                If CheckRegExpfromString(data, "==") Then
                    Exit Do
                End If

            Loop
        End If

Loop

    Debug.Print "��ȡ��������"
    Debug.Print "��ʱ: " & Timer - sngStart
    Debug.Print "����"

'�رս���ļ�WDISP.OUT
Close #i

''-------------------------------------------------------------------------------------------������ֵ
'
'Sheets("d_M").Cells.EntireColumn.AutoFit
'
'Num_All = Sheets("d_M").range("a65536").End(xlUp)
'
'
'Dim ii As Integer
'Dim i_RowID As Integer
'Dim i_Rng As range
'
'
''---------------------------------------------------------λ�ƽ�
'For ii = 26 To 26
'Dim R As range
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "min", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
'For ii = 29 To 30
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "min", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
'For ii = 33 To 33
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "min", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
'
''---------------------------------------------------------λ�Ʊ�
'For ii = 35 To 36
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'For ii = 38 To 39
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'For ii = 41 To 42
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'For ii = 44 To 45
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 2, ii))
'Call maxormin(R, "max", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next
'
'Sheets("g_M").Cells.EntireColumn.AutoFit
'Sheets("d_M").Cells.EntireColumn.AutoFit
'Sheets("d_M").Cells.NumberFormatLocal = "G/ͨ�ø�ʽ"


'-------------------------------------------------------------------------------------------��ȡ�����λ�ƽǡ�����¥�㼰����
'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  �����
Sheets("g_M").Cells(10, 5).Formula = "=1&"" / ""&MIN(d_M!AC:AC)"
Sheets("g_M").Cells(10, 7).Formula = "=1&"" / ""&MIN(d_M!AG:AG)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����
Sheets("g_M").Cells(11, 5).Formula = "=1&"" / ""&MIN(d_M!Z:Z)"
Sheets("g_M").Cells(11, 7).Formula = "=1&"" / ""&MIN(d_M!AD:AD)"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����+
'Sheets("g_M").Cells(12, 5).Formula = "=1&"" / ""&MIN(d_M!AA:AA)"
Sheets("g_M").Cells(12, 5).Formula = "-"
'Sheets("g_M").Cells(12, 7).Formula = "=1&"" / ""&MIN(d_M!AE:AE)"
Sheets("g_M").Cells(12, 7).Formula = "-"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ����-
'Sheets("g_M").Cells(13, 5).Formula = "=1&"" / ""&MIN(d_M!AB:AB)"
Sheets("g_M").Cells(13, 5).Formula = "-"
'Sheets("g_M").Cells(13, 7).Formula = "=1&"" / ""&MIN(d_M!AF:AF)"
Sheets("g_M").Cells(13, 7).Formula = "-"

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  �����λ�ƽ�
Sheets("g_M").Cells(14, 4).Formula = "=1&"" / ""&MIN(d_M!Z:Z,d_M!AC:AD,d_M!AG:AG)"


'//////////////////////////////////////////////////////////////////////////////////////////////
'����EXCEl��ʽ����������ÿ���������ԭ�ȵĹ�ʽ����
'Sheets("g_M").Cells(18, 14).FormulaArray = "=INDEX(d_M!C[-13],SMALL(IF(d_M!C[12]:C[14]=MIN(d_M!C[12]:C[14]),ROW(R[-17]:R[4982]),4^8),ROW(R[-17])))&"""""
'Sheets("g_M").Cells(18, 15).FormulaArray = "=INDEX(d_M!C[-14],SMALL(IF(d_M!C[14]:C[16]=MIN(d_M!C[14]:C[16]),ROW(R[-17]:R[4982]),4^8),ROW(R[-17])))&"""""
'//////////////////////////////////////////////////////////////////////////////////////////////


'//////////////////////////////////////////////////////////////////////////////////////////////
'ʹ��VBA��ѯ���ܣ�����


'���������λ�ƽǲ�ѯ����
Set iRng_X = Application.Union(range("d_M!Z:Z"), range("d_M!AC:AD"), range("d_M!AG:AG"))

'�����ѯ����
Dim i_Min As Double, i_Row As Integer, i_Col As Integer
Dim i_Temp As range

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ�����������λ�ƽǣ�ʵ���ǲ�ѯ���λ�ƽǵ���С��ĸ��
i_Min = WorksheetFunction.Min(range("d_M!Z:AG"))

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '���������λ�ƽ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '���������λ�ƽ����ڲ㣬���乤��
    Sheets("g_M").Cells(15, 7) = Sheets("d_M").Cells(i_Row, 1)
    Sheets("g_M").Cells(15, 5) = Sheets("d_M").Cells(2, i_Col)
End If

'���������λ�ƽ������кš��к�
'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'���������λ�ƽ����ڲ㣬���乤��
'Sheets("g_M").Cells(15, 7) = Sheets("d_M").Cells(i_Row, 1)
'Sheets("g_M").Cells(15, 5) = Sheets("d_M").Cells(2, i_Col)

Sheets("d_M").Columns("AH:AS").NumberFormatLocal = "0.000"
    
'-------------------------------------------------------------------------------------------��ȡ���λ�Ʊ�
Sheets("g_M").Cells(16, 4).Formula = "=MAX(d_M!AH:AM)"

'------------------------------------------------------------------------------------------- ��ѯ���λ�Ʊ�����¥��

'�������λ�ƱȲ�ѯ����
Set iRng_X = range("d_M!AH:AM")
'MBuildingλ�Ʊ�ԭʼ����С���������λ�����ĵ�Ԫ���ʽ��Ӧ�������ѯ����ʱ�����
Sheets("d_M").range("AH:AS").NumberFormatLocal = "0.000"


'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ���������λ�Ʊ�
i_Min = WorksheetFunction.Max(range("d_M!AH:AM"))
i_Min = Format(i_Min, "0.000")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '�������λ�Ʊ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '�������λ�Ʊ����ڲ㣬���乤��
    Sheets("g_M").Cells(17, 7) = Sheets("d_M").Cells(i_Row, 1)
    Sheets("g_M").Cells(17, 5) = Sheets("d_M").Cells(2, i_Col)
End If

'�������λ�Ʊ������кš��к�
'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'�������λ�Ʊ����ڲ㣬���乤��
'Sheets("g_M").Cells(17, 7) = Sheets("d_M").Cells(i_Row, 1)
'Sheets("g_M").Cells(17, 5) = Sheets("d_M").Cells(2, i_Col)


'-------------------------------------------------------------------------------------------��ȡ�����λ�Ʊ�
Sheets("g_M").Cells(18, 4).Formula = "=MAX(d_M!AN:AS)"

'------------------------------------------------------------------------------------------- ��ѯ�����λ�Ʊ�����¥��

'�������λ�ƱȲ�ѯ����
Set iRng_X = range("d_M!AN:AS")

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  XY��
'��ѯ���������λ�Ʊ�
i_Min = WorksheetFunction.Max(range("d_M!AN:AS"))
i_Min = Format(i_Min, "0.000")

Set i_Temp = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=xlWhole)

If Not i_Temp Is Nothing Then
    '�������λ�Ʊ������кš��к�
    i_Row = i_Temp.Row
    i_Col = i_Temp.column
    '�������λ�Ʊ����ڲ㣬���乤��
    Sheets("g_M").Cells(19, 7) = Sheets("d_M").Cells(i_Row, 1)
    Sheets("g_M").Cells(19, 5) = Sheets("d_M").Cells(2, i_Col)
End If
    
'�������λ�Ʊ������кš��к�
'i_Row = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).Row
'i_Col = iRng_X.Find(i_Min, After:=iRng_X.Cells(iRng_X.Rows.Count, iRng_X.Columns.Count), LookIn:=xlValues, lookat:=1).column
'�������λ�Ʊ����ڲ㣬���乤��
'Sheets("g_M").Cells(19, 7) = Sheets("d_M").Cells(i_Row, 1)
'Sheets("g_M").Cells(19, 5) = Sheets("d_M").Cells(2, i_Col)



Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End Sub


