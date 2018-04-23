Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxHtmlEditor
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxHtmlEditor.Localization
Imports DevExpress.Web.ASPxClasses.Internal
Imports DevExpress.Web.ASPxFileManager

Partial Public Class SelectImageForm
    Inherits HtmlEditorUserControl
    Protected Overrides Sub PrepareChildControls()
        Localize()

        MyBase.PrepareChildControls()

        PrepareFileManager()
    End Sub
    Private Sub Localize()
        SelectButton.Text = ASPxHtmlEditorLocalizer.GetString(ASPxHtmlEditorStringId.ButtonSelect)
        CancelButton.Text = ASPxHtmlEditorLocalizer.GetString(ASPxHtmlEditorStringId.ButtonCancel)
    End Sub
    Protected Overrides Function GetChildDxEdits() As ASPxEditBase()
        Return New ASPxEditBase() {}
    End Function
    Protected Overrides Function GetChildDxButtons() As ASPxButton()
        Return New ASPxButton() {SelectButton, CancelButton}
    End Function
    Protected Overrides Function GetChildDxHtmlEditorRoundPanels() As ASPxHtmlEditorRoundPanel()
        Return New ASPxHtmlEditorRoundPanel() {}
    End Function

    Protected Sub PrepareFileManager()
        FileManager.Styles.CopyFrom(HtmlEditor.StylesFileManager)
        FileManager.ControlStyle.CopyFrom(HtmlEditor.StylesFileManager.Control)

        FileManager.Settings.Assign(HtmlEditor.SettingsImageSelector.CommonSettings)
        FileManager.SettingsEditing.Assign(HtmlEditor.SettingsImageSelector.EditingSettings)
        FileManager.SettingsFolders.Assign(HtmlEditor.SettingsImageSelector.FoldersSettings)
        FileManager.SettingsToolbar.Assign(HtmlEditor.SettingsImageSelector.ToolbarSettings)
        FileManager.SettingsUpload.Assign(HtmlEditor.SettingsImageSelector.UploadSettings)
        FileManager.SettingsUpload.ValidationSettings.Assign(HtmlEditor.SettingsImageUpload.ValidationSettings)

        AddHandler FileManager.FolderCreating, AddressOf FileManager_FolderCreating
        AddHandler FileManager.ItemDeleting, AddressOf FileManager_ItemDeleting
        AddHandler FileManager.ItemMoving, AddressOf FileManager_ItemMoving
        AddHandler FileManager.ItemRenaming, AddressOf FileManager_ItemRenaming
        AddHandler FileManager.FileUploading, AddressOf FileManager_FileUploading

        If String.IsNullOrEmpty(FileManager.Settings.RootFolder) Then
            FileManager.Settings.RootFolder = HtmlEditor.SettingsImageUpload.UploadImageFolder
        End If
    End Sub
    Protected Sub FileManager_FolderCreating(ByVal sender As Object, ByVal e As FileManagerFolderCreateEventArgs)
        HtmlEditor.RaiseImageSelectorFolderCreating(e)
    End Sub
    Protected Sub FileManager_ItemDeleting(ByVal sender As Object, ByVal e As FileManagerItemDeleteEventArgs)
        HtmlEditor.RaiseImageSelectorItemDeleting(e)
    End Sub
    Protected Sub FileManager_ItemMoving(ByVal sender As Object, ByVal e As FileManagerItemMoveEventArgs)
        HtmlEditor.RaiseImageSelectorItemMoving(e)
    End Sub
    Protected Sub FileManager_ItemRenaming(ByVal sender As Object, ByVal e As FileManagerItemRenameEventArgs)
        HtmlEditor.RaiseImageSelectorItemRenaming(e)
    End Sub
    Protected Sub FileManager_FileUploading(ByVal sender As Object, ByVal e As FileManagerFileUploadEventArgs)
        HtmlEditor.RaiseImageSelectorFileUploading(e)
    End Sub
    Protected Sub FileManager_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CustomJSPropertiesEventArgs)
        e.Properties("cp_RootFolderRelativePath") = FileManager.GetAppRelativeRootFolder()
    End Sub
End Class