Attribute VB_Name = "MBuilding_����������"


'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2015/03/19
'1.����жϴ��룬���û�п����������������⡣

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/06/10
'1.��Ӵ���,���ģ�ͽ��������ҵ����ݶ�ȡ���⡣

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2014/01/09
'��������:
'1.��ȥ�������룻

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/11/15
'1.�޸ĸ������룬��Ϊ������ʽ

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/29
'1.���Ӹ�������

'////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/8/12
'1.�򻯱�������general_PKPM:d_P��distribution_YJK:d_Y�ȡ�


'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/30

'�������ݣ�
'1.�����������Ŀ�ʼ�У�ӦΪNum_Base + 3

'////////////////////////////////////////////////////////////////////////////////////////////

'����ʱ��:2013/07/18

'�������ݣ�
'1.


'******************************************************************************
'******************************************************************************
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'****        MBuilding_¥�㿹��������ͻ������.TXT���ִ���                  ****
'****                                                                      ****
'****                                                                      ****
'****                                                                      ****
'******************************************************************************
'******************************************************************************



Sub OUTReader_MBuilding_����������(Path As String)

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

Dim ii As Integer




'==========================================================================================����ؼ��ʱ���


'�նȱ�
Dim Keyword_VRate1, Keyword_VRate2   As String
'��ֵ
Keyword_Rate1 = "RS_0"
Keyword_Rate2 = "RS_90"



'==========================================================================================�������ַ�����


'�նȱ�
Dim FirstString_kRate1 As String
Dim FirstString_kRate2 As String

'=============================================================================================================================�����ļ���ȡ·��

'ָ���ļ���Ϊwmass.out
Filename = Dir(Path & "\*_¥�㿹��������ͻ������.txt")

'Dim Fliename1, Filename2 As String
'Filename1 = Dir(Path & "\*_�ṹ����Ϣ.txt")
'Debug.Print "AA" & Filename1
'Filename2 = CheckRegExpfromString(Fliename, "\w+_")


Dim i_ As Integer: i = FreeFile

'���������ļ�·��
filepath = Path & "\" & Filename
Debug.Print Path
Debug.Print filepath

'�򿪽���ļ�


If Dir(Path & "\" & "*_¥�㿹��������ͻ������.txt") <> "" Then  '------------------------------------------------------------------------------------------------------------------------------���

Open (filepath) For Input Access Read As #i


'=============================================================================================================================���ж�ȡ�ı�

Debug.Print "��ʼ��������ļ���¥�㿹��������ͻ������.TXT"
Debug.Print "��ȡ���ָ��"
Debug.Print "����"

ii = 0
Do While Not EOF(1)

    Line Input #i, inputstring '���ı��ļ�һ��

    
    '����ȡ��һ���ַ�����ֵ��data����
    data = inputstring
    
    '-------------------------------------------------------------------------------------------�����ָ����б��ַ�

    '�նȱ�
    FirstString_kRate1 = Mid(data, 10, 4)
    FirstString_kRate2 = Mid(data, 10, 5)
       

    '-------------------------------------------------------------------------------------------��ȡ����������
    
        
    If FirstString_kRate1 = Keyword_Rate1 Then
        'Debug.Print "aaaaaaaaaaaaaa"
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "Base") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If

                Sheets("d_M").Cells(j, 46) = StringfromStringforReg(data, "\S+", 4)
            End If
            If CheckRegExpfromString(data, "--") = True Then
                Exit Do
            End If
        Loop

    End If
    If FirstString_kRate2 = Keyword_Rate2 Then
        Line Input #i, data
        Line Input #i, data
        Line Input #i, data
        Do While Not EOF(1)
            Line Input #i, data
            '�����������������Ϊ��������
            If CheckRegExpfromString(data, "Base") = True Then
                If CheckRegExpfromString(data, "B\S\F") = False Then
                    j = extractNumberFromString(data, 1) + 2 + Num_Base
                Else
                    j = Num_Base - CInt(Mid(StringfromStringforReg(data, "B\S\F", 1), 2, 1)) + 1 + 2
                End If

                '��һд��X��նȼ��նȱ�
                Sheets("d_M").Cells(j, 47) = StringfromStringforReg(data, "\S+", 4)
            End If
            If CheckRegExpfromString(data, "--") = True Then
                Exit Do
            End If
            
            ii = ii + 1
                       
        Loop
        Num_all = ii
        'Debug.Print Num_All

    End If
    
          
Loop

Sheets("d_M").Cells(ii + 2, 46) = 1
Sheets("d_M").Cells(ii + 2, 47) = 1

'�رս���ļ�WMASS.OUT
Close #i

'-------------------------------------------------------------------------------------------������ֵ
'Sheets("d_M").Cells.EntireColumn.AutoFit
'
'Num_All = Sheets("d_M").range("a65536").End(xlUp)
'Debug.Print "��¥��="; Num_All
'
''Dim ii As Integer
'Dim i_RowID As Integer
'Dim i_Rng As range


''---------------------------------------------------------��������
'For ii = 46 To 47
'Dim R As range
'Set R = Worksheets("d_M").range(Cells(3, ii), Cells(Num_All + 1, ii))
'Call maxormin(R, "min", "d_M!R3C" & CStr(ii) & ":R" & CStr(Num_All + 1) & "C" & CStr(ii))
'Next


'-------------------------------------------------------------------------------------------��ȡ���¥�㿹����������
Sheets("g_M").Cells(23, 5).Formula = "=MIN(d_M!AT" & Num_Base + 3 & ":AT" & Num_all + 1 & ")"
Sheets("g_M").Cells(23, 7).Formula = "=MIN(d_M!AU" & Num_Base + 3 & ":AU" & Num_all + 1 & ")"

Debug.Print "�ķ�ʱ��: " & Timer - sngStart

End If

End Sub

