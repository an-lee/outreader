Attribute VB_Name = "PKPM_WV02Q"


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            PKPM_WV02Q.OUT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


'��ģ���ȡָ���ļ�·���µ�WV02Q�ļ�����Distribution����������������������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/11/21
'1.ƥ��PKPM v2.2�档1����ܳ������ֵ��ٷֱȣ� 2���������������ϵ��


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/4/18
'1.��Ӷ�ȡ�㸲���ذٷֱȴ���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/6/27

'�������ݣ�
'1.���Ĵ��룬��ȥ��ȫ�ֱ�����������

'////////////////////////////////////////////////////////////////////////////////////////////


Sub OUTReader_PKPM_WV02Q(Path As String)

'��������ʱ��
Dim sngStart As Single
sngStart = Timer

'==========================================================================================������Ҫ��������

'�����ļ�·�����ļ������ļ�����·�����ַ�����
Dim Filename, filepath, inputstring  As String

'����dataΪ�����е��ַ���
Dim data As String

'����ѭ������
Dim c_i, c_j As Integer
Dim i As Integer


'==========================================================================================����ؼ��ʱ���
'������
Dim Keyword_VC As String
Keyword_VC = "�������������ٷֱ�"

Dim Keyword_VCX As String
Keyword_VCX = "X"

Dim Keyword_VCY As String
Keyword_VCY = "Y"

'��������ϵ��
Dim Keyword_VT As String
'Keyword_VT = "��" 'PKPM v2010
Keyword_VT = "   ����Ϊ�������û��Զ����ϵ����ʵ�ʲ��õĵ���ϵ��"

Dim Keyword_V As String
Keyword_V = "Coef_x"



'==========================================================================================�������ַ�����
'������
Dim FirstString_VC As String
Dim FirstString_VCX As String
Dim FirstString_VCY As String
'��������ϵ��
Dim FirstString_V As String
Dim FirstString_VT As String


'==========================================================================================�����ļ���ȡ·��

'ָ���ļ���
Filename = "WV02Q.OUT"

'���������ļ�·��
filepath = Path & "\" & Filename
'Debug.Print path
'Debug.Print filepath

'�򿪽���ļ�
Open (filepath) For Input Access Read As #1

'===========================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ�WV02Q.OUT��"
Debug.Print "��ȡ�������"
Debug.Print "����"

'��ʼ����������ϵ��ѭ������
i = 0

Do While Not EOF(1)

    Line Input #1, inputstring '���ı��ļ�һ��
   
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring

    '--------------------------------------------------------------------------�����ָ����б��ַ�
'    FirstString_VC = Mid(data, 21, 10) 'PKPM v2010
    FirstString_VC = Mid(data, 29, 10)
    FirstString_VT = Mid(data, 6, 1)
    FirstString_MRK = Mid(data, 16, 25)
    FirstString_MRZ = Mid(data, 16, 27)
   
   
    '--------------------------------------------------------------------------��ȡ������������ռ�ܼ����İٷֱ�
    'c_i = 0
    'c_j = 0
    'Ѱ��¥����
    Dim NA As Integer
    If FirstString_VC = Keyword_VC Then
        Debug.Print "��ȡ������������ռ�ܼ����İٷֱȡ���"
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_VCX = Mid(data, 18, 1)
            FirstString_VCY = Mid(data, 18, 1)
            If FirstString_VCX = Keyword_VCX Then
                 'Debug.Print "������test"
                 NA = extractNumberFromString(data, 1)
                 Sheets("d_P").Cells(NA + 2, 48) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_P").Cells(NA + 2, 49) = StringfromStringforReg(data, "\S+", 6)
                 'c_i = c_i + 1
            End If
            If FirstString_VCY = Keyword_VCY Then
                 Sheets("d_P").Cells(NA + 2, 51) = StringfromStringforReg(data, "\S+", 2)
                 Sheets("d_P").Cells(NA + 2, 52) = StringfromStringforReg(data, "\S+", 4)
                 'c_j = c_j + 1
            End If
            If CheckRegExpfromString(data, "����ϵ��") Then
                'Debug.Print "��������ֹtest"
                Exit Do
            End If
        Loop
    End If

    '--------------------------------------------------------------------------��ȡX/Y���������ϵ��
    'Ѱ�Ҳ���
'    PKPM v2010
'    Dim NA2 As Integer
'    If FirstString_VT = Keyword_VT Then
'        NA2 = extractNumberFromString(data, 1)
'        Debug.Print "��ȡ����������ϵ������"
'        Do While Not EOF(1)
'            Line Input #1, data
'            FirstString_V = Mid(data, 8, 6)
'            If FirstString_V = Keyword_V Then
'                 'Debug.Print "��������test"
'                 Line Input #1, data
'                 Line Input #1, data
'                 Sheets("d_P").Cells(NA2 + 2, 50) = StringfromStringforReg(data, "\S+", 1)
'                 Sheets("d_P").Cells(NA2 + 2, 53) = StringfromStringforReg(data, "\S+", 2)
'                 'c_i = c_i + 1
'            End If
'            If CheckRegExpfromString(data, "==") Then
'                'Debug.Print "����������ֹtest"
'                Exit Do
'            End If
'        Loop
'    End If


'    PKPM v2.2
    If data = Keyword_VT Then
        Line Input #1, data
        Line Input #1, data
        Debug.Print "��ȡ����������ϵ������"
        Do While Not EOF(1)
            Line Input #1, data
            
            NA2 = extractNumberFromString(data, 1)

            Sheets("d_P").Cells(NA2 + 2, 50) = StringfromStringforReg(data, "\S+", 3)
            Sheets("d_P").Cells(NA2 + 2, 53) = StringfromStringforReg(data, "\S+", 4)
            'c_i = c_i + 1
            If CheckRegExpfromString(data, "==") Then
                'Debug.Print "����������ֹtest"
                Exit Do
            End If
        Loop
    End If
    
    '--------------------------------------------------------------------------��ȡX/Y���㸲���ذٷֱ�(����)
    If FirstString_MRK = "�涨ˮƽ�����������֫ǽ�����㸲���ذٷֱ�(����)" Then
        Debug.Print "��ȡ�ٷֱȣ�K������"
        Line Input #1, data
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_VCX = Mid(data, 18, 1)
            FirstString_VCY = Mid(data, 18, 1)
            If FirstString_VCX = "X" Then
                 'Debug.Print "������test"
                 NA = extractNumberFromString(data, 1)
                 Debug.Print NA
                 Sheets("d_P").Cells(NA + 2, 70) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_P").Cells(NA + 2, 72) = StringfromStringforReg(data, "\S+", 5)
                 'c_i = c_i + 1
            End If
            If FirstString_VCY = "Y" Then
                 Sheets("d_P").Cells(NA + 2, 71) = StringfromStringforReg(data, "\S+", 2)
                 Sheets("d_P").Cells(NA + 2, 73) = StringfromStringforReg(data, "\S+", 3)
                 'c_j = c_j + 1
            End If
            If CheckRegExpfromString(data, "\*") Then
                'Debug.Print "��������ֹtest"
                Exit Do
            End If
        Loop
    End If
    
    '--------------------------------------------------------------------------��ȡX/Y���㸲���ذٷֱ�(����)
    If FirstString_MRZ = "�涨ˮƽ�����������֫ǽ�����㸲���ذٷֱ�(������ʽ)" Then
        Debug.Print "��ȡ�ٷֱȣ�Z������"
        Line Input #1, data
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_VCX = Mid(data, 17, 1)
            FirstString_VCY = Mid(data, 17, 1)
            If FirstString_VCX = "X" Then
                 'Debug.Print "������test"
                 NA = extractNumberFromString(data, 1)
                 Debug.Print NA
                 Sheets("d_P").Cells(NA + 2, 74) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_P").Cells(NA + 2, 76) = StringfromStringforReg(data, "\S+", 5)
                 'c_i = c_i + 1
            End If
            If FirstString_VCY = "Y" Then
                 Sheets("d_P").Cells(NA + 2, 75) = StringfromStringforReg(data, "\S+", 2)
                 Sheets("d_P").Cells(NA + 2, 77) = StringfromStringforReg(data, "\S+", 3)
                 'c_j = c_j + 1
            End If
            If CheckRegExpfromString(data, "\*") Then
                'Debug.Print "��������ֹtest"
                Exit Do
            End If
        Loop
    End If
Loop

Close #1

Sheets("g_P").Cells(53, 5).Formula = "=d_P!" & "BR" & Num_Base + 3
Sheets("g_P").Cells(53, 7).Formula = "=d_P!" & "BV" & Num_Base + 3
Sheets("g_P").Cells(54, 5).Formula = "=d_P!" & "BS" & Num_Base + 3
Sheets("g_P").Cells(54, 7).Formula = "=d_P!" & "BW" & Num_Base + 3

Debug.Print "��ȡ��������Ϣ�ķ�ʱ��: " & Timer - sngStart


End Sub

