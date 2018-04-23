Imports Microsoft.VisualBasic
Imports System
Imports System.Configuration
Imports System.Windows.Forms

Imports DevExpress.ExpressApp.Security
Imports DevExpress.ExpressApp.Xpo


Namespace ContextNavigation.Win
	Friend NotInheritable Class Program
		''' <summary>
		''' The main entry point for the application.
		''' </summary>
		Private Sub New()
		End Sub
		<STAThread> _
		Shared Sub Main()
			Application.EnableVisualStyles()
			Application.SetCompatibleTextRenderingDefault(False)
			EditModelPermission.AlwaysGranted = System.Diagnostics.Debugger.IsAttached
			Dim winApplication As New ContextNavigationWindowsFormsApplication()
			Try
				InMemoryDataStoreProvider.Register()
				winApplication.ConnectionString = InMemoryDataStoreProvider.ConnectionString
				winApplication.Setup()
				winApplication.Start()
			Catch e As Exception
				winApplication.HandleException(e)
			End Try
		End Sub
	End Class
End Namespace
