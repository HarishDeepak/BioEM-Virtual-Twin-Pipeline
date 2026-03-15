' CST VBA Macro to automate the export we just did manually
Sub Main ()
    SelectTreeItem ("1D Results\Power\Excitation [pw]\Loss per Material\Volume loss in Water (distilled)")
    
    ' Automatically exports the data to a folder for the Python script to read
    With ASCIIExport
        .Reset
        .FileName ("C:\Project\3_VBA_Compliance_Reporting\power_loss_data.txt")
        .Execute
    End With
    
    MsgBox "Automation Complete: Data exported for Python analysis."
End Sub