using System;
using System.Web;

using DevExpress.ExpressApp.Web;
using DevExpress.Web.ASPxClasses;

using DevExpress.ExpressApp.Xpo;

namespace ContextNavigation.Web {
    public class Global : System.Web.HttpApplication {
        public Global() {
            InitializeComponent();
        }
        protected void Application_Start(Object sender, EventArgs e) {
            
            ASPxWebControl.CallbackError += Application_Error;
        }
        protected void Session_Start(Object sender, EventArgs e) {
            WebApplication.SetInstance(Session, new ContextNavigationAspNetApplication());
            InMemoryDataStoreProvider.Register();
            WebApplication.Instance.ConnectionString = InMemoryDataStoreProvider.ConnectionString;
            WebApplication.Instance.Setup();
            WebApplication.Instance.Start();
        }
        protected void Application_BeginRequest(Object sender, EventArgs e) {
            string filePath = HttpContext.Current.Request.PhysicalPath;
            if (!string.IsNullOrEmpty(filePath)
                && (filePath.IndexOf("Images") >= 0) && !System.IO.File.Exists(filePath)) {
                HttpContext.Current.Response.End();
            }
        }
        protected void Application_Error(Object sender, EventArgs e) { 
            ErrorHandling.Instance.ProcessApplicationError();
        }
        protected void Session_End(Object sender, EventArgs e) {
            WebApplication.LogOff(Session);
            WebApplication.DisposeInstance(Session);
        }
        #region Web Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
        }
        #endregion
    }
}
