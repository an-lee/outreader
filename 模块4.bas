Attribute VB_Name = "ģ��4"
Option Explicit

'���ַ���sStr����ȡ��iNum�����ִ���ͨ�ú�����
'�޸��� officefans.net �� VBA���� ��������Сfisher���Ĵ���

Function extractNumberFromString2(sStr As String, iNum As Integer) As Single
    Dim regEx '������ʽ����Regular Expression��
    Dim mc 'ƥ����ϣ�Match Collection��
    Set regEx = CreateObject("VBScript.RegExp") '�����µ�������ʽ����
    With regEx
        .Global = True 'ȫ��ƥ�䣬����ȫ��ƥ������Ϊfalseֻ���ص�һ��ƥ����
        .Pattern = "\s?(\-?)(\d*)(\.?)(\d*)([E]?)([+]?)([-]?)(\d+)" '������ʽΪ[-]#[.#][E?]#
        Set mc = .Execute(sStr)  'ִ��ƥ�������
        '����ַ�����ƥ������Ŀ��С��iNum���򷵻ص�iNum��ƥ����
        If mc.Count >= iNum Then
            extractNumberFromString2 = mc(iNum - 1).Value
        '���򱨸����
        'Else
        '    Err.Raise 1, , "�ַ����в�������Ӧ����"
        End If
    End With
End Function

