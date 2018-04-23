<%@ Page Language="C#" AutoEventWireup="true" Inherits="DefaultVertical" EnableViewState="false"
    ValidateRequest="false" CodeBehind="DefaultVertical.aspx.cs" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxSplitter"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxGlobalEvents"
    TagPrefix="dxge" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v11.1" Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers"
    TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v11.1" Namespace="DevExpress.ExpressApp.Web.Controls"
    TagPrefix="cc4" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v11.1" Namespace="DevExpress.ExpressApp.Web.Templates.Controls"
    TagPrefix="tc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <meta http-equiv="Expires" content="0" />
</head>
<script type="text/javascript" src="MoveFooter.js"> </script>
<body class="VerticalTemplate BodyBackColor" onload="OnLoad()">
    <form id="form2" runat="server">
    <dxge:ASPxGlobalEvents ID="GE" ClientSideEvents-EndCallback="AdjustSize" runat="server" />
    <cc4:ASPxProgressControl ID="ProgressControl" runat="server" />
    <asp:PlaceHolder runat="server">
        <table id="MT" border="0" width="100%" cellpadding="0" cellspacing="0" class="dxsplControl_<%= Theme %>">
            <tbody>
                <tr>
                    <td style="vertical-align: top; height: 10px;" class="dxsplPane_<%= Theme %>">
                        <div id="VerticalTemplateHeader" class="VerticalTemplateHeader">
                            <table cellpadding="0" cellspacing="0" border="0" class="Top" width="100%">
                                <tr>
                                    <td class="Logo">
                                        <asp:HyperLink runat="server" NavigateUrl="~/" ID="LogoLink">
                                            <cc4:ThemedImageControl ID="TIC" DefaultThemeImageLocation="App_Themes/{0}/Xaf" ImageName="Logo.png"
                                                BorderWidth="0px" runat="server" />
                                        </asp:HyperLink>
                                    </td>
                                    <td class="Security">
                                        <cc2:ActionContainerHolder runat="server" ID="SAC" CssClass="Security" Categories="Security"
                                            ContainerStyle="Links" SeparatorHeight="23px" ShowSeparators="True" />
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ACPanel">
                                <tr class="Content">
                                    <td class="Content WithPaddings" align="right">
                                        <cc2:ActionContainerHolder ID="ShC" runat="server" Categories="RootObjectsCreation;Appearance;Search;FullTextSearch"
                                            ContainerStyle="Links" CssClass="TabsContainer" SeparatorHeight="15px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <table id="MRC" style="width: 100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td id="LPcell" style="width: 30px; vertical-align: top">
                                    <div id="LP" class="LeftPane">
                                        <cc2:NavigationActionContainer ID="NC" runat="server" CssClass="xafNavigationBarActionContainer"
                                            ContainerId="ViewsNavigation" AutoCollapse="True" />
                                        <div id="TP" class="ToolsActionContainerPanel">
                                            <dxrp:ASPxRoundPanel ID="TRP" runat="server" HeaderText="Tools">
                                                <PanelCollection>
                                                    <dxrp:PanelContent ID="PanelContent1" runat="server">
                                                        <cc2:ActionContainerHolder ID="VTC" runat="server" Menu-Width="100%" Categories="Tools"
                                                            Orientation="Vertical" ContainerStyle="Links" ShowSeparators="False" />
                                                    </dxrp:PanelContent>
                                                </PanelCollection>
                                            </dxrp:ASPxRoundPanel>
                                            <cc2:ActionContainerHolder ID="DAC" runat="server" Orientation="Vertical" Categories="Diagnostic"
                                                BorderWidth="0px" ContainerStyle="Links" ShowSeparators="False" />
                                            <br />
                                        </div>
                                    </div>
                                </td>
                                <td style="width: 6px; border-bottom-style: none; border-top-style: none" class="dxsplVSeparator_<%= Theme %> dxsplPane_<%= Theme %>">
                                    <div id="separatorButton" class="dxsplVSeparatorButton_<%= Theme %>" onmouseenter="OnMouseEnter()"
                                        onmouseleave="OnMouseLeave()" onclick="OnClick()">
                                        <div id="separatorImage" style="width: 6px;" class="dxWeb_splVCollapseBackwardButton_<%= Theme %>">
                                        </div>
                                    </div>
                                </td>
                                <td style="vertical-align: top;">
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <cc2:ActionContainerHolder CssClass="ACH MainToolbar" runat="server" ID="TB" ContainerStyle="ToolBar"
                                                        Orientation="Horizontal" Categories="ObjectsCreation;Edit;RecordEdit;View;Export;Reports;Filters">
                                                        <Menu Width="100%" ItemAutoWidth="False" ClientInstanceName="mainMenu">
                                                            <BorderTop BorderStyle="None" />
                                                            <BorderLeft BorderStyle="None" />
                                                            <BorderRight BorderStyle="None" />
                                                        </Menu>
                                                    </cc2:ActionContainerHolder>
                                                    <table border="0" cellpadding="0" cellspacing="0" class="MainContent" width="100%">
                                                        <tr>
                                                            <td class="ViewHeader">
                                                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="ViewHeader">
                                                                    <tr>
                                                                        <td class="ViewImage">
                                                                            <cc4:ViewImageControl ID="VIC" runat="server" />
                                                                        </td>
                                                                        <td class="ViewCaption">
                                                                            <h1>
                                                                                <cc4:ViewCaptionControl ID="VCC" runat="server">
                                                                                </cc4:ViewCaptionControl>
                                                                            </h1>
                                                                            <cc2:NavigationHistoryActionContainer ID="VHC" runat="server" CssClass="NavigationHistoryLinks"
                                                                                ContainerId="ViewsHistoryNavigation" Delimiter=" / " />
                                                                        </td>
                                                                        <td align="right">
                                                                            <cc2:ActionContainerHolder runat="server" ID="RNC" ContainerStyle="Links" Orientation="Horizontal"
                                                                                Categories="RecordsNavigation" UseLargeImage="True" ImageTextStyle="Image" CssClass="RecordsNavigationContainer">
                                                                                <Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right" />
                                                                            </cc2:ActionContainerHolder>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <cc2:ActionContainerHolder runat="server" ID="EMA" ContainerStyle="Links" Orientation="Horizontal"
                                                        Categories="Save;UndoRedo" CssClass="EditModeActions">
                                                        <Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right" />
                                                    </cc2:ActionContainerHolder>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="CP" style="overflow: auto; width: 100%;">
                                                        <table border="0" cellpadding="0" cellspacing="0" class="MainContent" width="100%">
                                                            <tr class="Content">
                                                                <td class="Content">
                                                                    <tc:ErrorInfoControl ID="ErrorInfo" Style="margin: 10px 0px 10px 0px" runat="server">
                                                                    </tc:ErrorInfoControl>
                                                                    <cc4:ViewSiteControl ID="VSC" runat="server" />
                                                                    <div id="Spacer" class="Spacer">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr class="Content">
                                                                <td class="Content Links" align="center">
                                                                    <cc2:QuickAccessNavigationActionContainer CssClass="NavigationLinks" ID="QC" runat="server"
                                                                        ContainerId="ViewsNavigation" ImageTextStyle="Caption" ShowSeparators="True" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 20px; vertical-align: bottom" class="BodyBackColor">
                        <asp:Literal ID="InfoMessagesPanel" runat="server" Text="" Visible="False"></asp:Literal>
                        <div id="Footer" class="Footer">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td align="left">
                                        <div class="FooterCopyright">
                                            <cc4:AboutInfoControl ID="AIC" runat="server">Copyright text</cc4:AboutInfoControl>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <script type="text/javascript" language="javascript">
     <!--
            function OnMouseEnter() {
                var separatorButton = document.getElementById('separatorButton');
                separatorButton.className += ' dxsplVSeparatorButtonHover_<%= Theme %>';
            }
            function OnMouseLeave() {
                var separatorButton = document.getElementById('separatorButton');
                separatorButton.className = 'dxsplVSeparatorButton_<%= Theme %>';
            }
            function UpdateSeparatorImage() {
                var LPcell = document.getElementById('LPcell');
                var separatorImage = document.getElementById('separatorImage');
                separatorImage.className = (LPcell.style.display == 'none' ? 'dxWeb_splVCollapseForwardButton_' : 'dxWeb_splVCollapseBackwardButton_');
                separatorImage.className += '<%= Theme %>';
            }
            function OnClick() {
                var LPcell = document.getElementById('LPcell');
                LPcell.style.display = (!LPcell.style.display || LPcell.style.display == 'table-cell') ? 'none' : 'table-cell';
                if (!__aspxIE) {
                    LPcell.style.width = LPcellSize + 'px';
                }
                UpdateSeparatorImage();
                _aspxSetCookie('LPcell_Vertical', LPcell.style.display);
                AdjustSize();
            }
            var LPcellSize;
            function OnLoad() {
                var LPcell = document.getElementById("LPcell");
                if (__aspxIE && __aspxBrowserVersion == 7) {
                    LPcell.style.width = "200px";
                }
                if (!__aspxIE) {
                    LPcellSize = LPcell.offsetWidth;
                }
                var leftPanelDisplay = _aspxGetCookie("LPcell_Vertical");
                if (leftPanelDisplay) {
                    LPcell.style.display = leftPanelDisplay;
                }
                UpdateSeparatorImage();
                AdjustSize();
                DXattachEventToElement(window, "resize", AdjustSize);
                var LP = document.getElementById("LP");
                LPcell.style.width = LP.scrollWidth + 5 + "px";
            }
         // -->
        </script>
    </asp:PlaceHolder>
    </form>
</body>
</html>
