Attribute VB_Name = "ģ��_Shortcut"
'��ģ����ʾ���壬��Ͽ�ݼ�ʹ��
Sub UF()
    OUTReader_Main.Show 0
    Call dic
End Sub
'д��·��
Sub dic()
    Dim MyFile As Object
    Set MyFile = CreateObject("Scripting.FileSystemObject")


    If MyFile.FileExists("d:\dic.ini") = False Then
        'Call UserForm1
        
    ElseIf FileLen("d:\dic.ini") > 0 Then
        Open "d:\dic.ini" For Input As #2
        Dim aa As String
        Input #2, aa
        OUTReader_Main.TextBox_Path.Text = aa
        OUTReader_Main.Dic_TextBox.Text = aa
        OUTReader_Main.MD_path.Text = aa
        Close #2
    End If
End Sub
