Attribute VB_Name = "YJK_WV02Q"
'��ģ���ȡָ���ļ�·���µ�WV02Q�ļ�����Distribution����������������������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/3/19
'1.������ȡ�����ȵĴ���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/3/16
'1.���ݶ�ȡ��©���޸Ĵ��룻


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/4/18
'1.��Ӷ�ȡ�㸲���ذٷֱȴ���


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/18
'1.�����������ٷֱȵĶ�ȡλ��

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/4

'�������ݣ�
'1.������������д��bug;

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/7/3

'�������ݣ�
'1.���Ĵ��룬��ȥ��ȫ�ֱ�����������

'////////////////////////////////////////////////////////////////////////////////////////////

'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****                            YJK_WV02Q.OUT���ִ���                    ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************


Sub OUTReader_YJK_WV02Q(Path As String)

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
Keyword_VT = "0.2V0"

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
Debug.Print Path
Debug.Print filepath

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
    FirstString_VC = Mid(data, 23, 10)
    FirstString_VT = Mid(data, 28, 5)
    FirstString_MRK = Mid(data, 11, 22)
    'FirstString_MRZ = Mid(data, 16, 27)
   
   
    '--------------------------------------------------------------------------��ȡ������������ռ�ܼ����İٷֱ�
    'c_i = 0
    'c_j = 0
    'Ѱ��¥����
    Dim NA As Integer
    If FirstString_VC = Keyword_VC Then
        Line Input #1, data
        Debug.Print "��ȡ������������ռ�ܼ����İٷֱȡ���"
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_VCX = Mid(data, 16, 1)
            FirstString_VCY = Mid(data, 16, 1)
            If FirstString_VCX = Keyword_VCX Then
                 'Debug.Print "������test"
                 NA = extractNumberFromString(data, 1)
                 Sheets("d_Y").Cells(NA + 2, 48) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_Y").Cells(NA + 2, 49) = StringfromStringforReg(data, "\S+", 8)
                 'c_i = c_i + 1
            End If
            If FirstString_VCY = Keyword_VCY Then
                NA = extractNumberFromString(data, 1)
                 Sheets("d_Y").Cells(NA + 2, 51) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_Y").Cells(NA + 2, 52) = StringfromStringforReg(data, "\S+", 8)
                 'c_j = c_j + 1
            End If
            If CheckRegExpfromString(data, "\*") Then
                'Debug.Print "��������ֹtest"
                Exit Do
            End If
        Loop
    End If

    '--------------------------------------------------------------------------��ȡX/Y���������ϵ��
    'Ѱ�Ҳ���
    Dim NA2 As Integer
    NA2 = 1
    If FirstString_VT = Keyword_VT Then
        'NA2 = extractNumberFromString(data, 1)
        Debug.Print "��ȡ����������ϵ������"
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_V = Mid(data, 10, 6)
            If FirstString_V = Keyword_V Then
                 'Debug.Print "��������test"
                 Line Input #1, data
                 'Line Input #1, data
                 Sheets("d_Y").Cells(NA2 + 2, 50) = StringfromStringforReg(data, "\S+", 1)
                 Sheets("d_Y").Cells(NA2 + 2, 53) = StringfromStringforReg(data, "\S+", 2)
                 NA2 = NA2 + 1
            End If
            'If CheckRegExpfromString(data, "==") Then
                'Debug.Print "����������ֹtest"
                'Exit Do
            'End If
        Loop
    End If
    
    '--------------------------------------------------------------------------��ȡX/Y���㸲���ذٷֱ�(����)
    If FirstString_MRK = "�涨ˮƽ���¿��������֫ǽ�����㸲��ذٷֱ�" Then
        Debug.Print "��ȡ�ٷֱȣ�K������"
        Line Input #1, data
        Line Input #1, data
        Do While Not EOF(1)
            Line Input #1, data
            FirstString_VCX = Mid(data, 16, 1)
            FirstString_VCY = Mid(data, 16, 1)
            If FirstString_VCX = "X" Then
                 'Debug.Print "������test"
                 NA = extractNumberFromString(data, 1)
                 'Debug.Print NA
                 Sheets("d_Y").Cells(NA + 2, 70) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_Y").Cells(NA + 2, 72) = StringfromStringforReg(data, "\S+", 5)
                 'c_i = c_i + 1
            End If
            If FirstString_VCY = "Y" Then
                NA = extractNumberFromString(data, 1)
                 Sheets("d_Y").Cells(NA + 2, 71) = StringfromStringforReg(data, "\S+", 4)
                 Sheets("d_Y").Cells(NA + 2, 73) = StringfromStringforReg(data, "\S+", 5)
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
Sheets("g_Y").Cells(53, 5).Formula = "=d_Y!" & "BR" & Num_Base + 3
Sheets("g_Y").Cells(53, 7).Formula = "��"
Sheets("g_Y").Cells(54, 5).Formula = "=d_Y!" & "BS" & Num_Base + 3
Sheets("g_Y").Cells(54, 7).Formula = "��"

Debug.Print "��ȡ��������Ϣ�ķ�ʱ��: " & Timer - sngStart


End Sub
