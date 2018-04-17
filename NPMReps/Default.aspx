<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NPMReps.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <script>
        location.assign("RepShiftPerfM1.aspx")
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" target="_blank"  runat="server" NavigateUrl="~/RepShiftPerfM1.aspx">1 - Team Leaders Daily Report - Module 1</asp:HyperLink>
    </div>
    <div>
        <asp:HyperLink ID="HyperLink4" target="_blank" runat="server" NavigateUrl="~/RepShiftPerfM2.aspx">2 - Team Leaders Daily Report - Module 2</asp:HyperLink>
    </div>
    <div>
        <asp:HyperLink ID="HyperLink2" target="_blank" runat="server" NavigateUrl="~/RepDewatering.aspx">2 - Dewatering Report</asp:HyperLink>
    </div>
    </form>
</body>
</html>
