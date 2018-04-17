<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepDewatering.aspx.cs" Inherits="NPMReps.RepDewateringpage" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dewatering</title>
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <script>
        var prevSecs = 0;
        //var userName = "Anonymous";
        //function getUserName() {
        //    try {
        //        var loc = new ActiveXObject("WbemScripting.SWbemLocator");
        //        var svc = loc.ConnectServer(".", "root\\cimv2");
        //        coll = svc.ExecQuery("Select * From win32_computersystem");
        //        e = new Enumerator(coll);
        //        var data = e.item();
        //        userName = data.UserName.toLowerCase();
        //    }
        //    catch (err) {
        //        //userName = "Unknown";
        //        userName = "npm\\thomas.trott";
        //    }
        //}
        function writeCountDown() {
            var cdiv = document.getElementById("CountDownDiv");
            var currentdate = new Date();
            var mins = (currentdate.getMinutes() + 55) % 60;
            var secs = currentdate.getSeconds();
            var hourSecs = mins * 60 + secs;
            if (hourSecs < prevSecs) location.reload(true);
            var cdown = "Next Auto Refresh in MM:SS -> " + (59 - mins) + ":" + (59 - secs);
            cdiv.innerText = cdown;
            prevSecs = hourSecs;
            //var cdiv = document.getElementById("UserDiv");
            //var ctxt = document.getElementById("UserName");
            //if (cdiv.innerText != userName && document.readyState === "complete") {
            //    cdiv.innerText = ctxt.value = userName;
            //}
        }
        //getUserName();
        setInterval(writeCountDown, 1000);
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <span style="width:300px" class="noprint">
        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>--%>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <a href="javascript:window.print();">Print..</a>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <%--USER:--%>&nbsp
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RepShiftPerfM1.aspx">Module 1</asp:HyperLink>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/RepShiftPerfM2.aspx">Module 2</asp:HyperLink>
    </span>
    <span id="UserDiv"></span>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
        <ContentTemplate>
       <asp:HiddenField ID="UserName" runat="server" ClientIDMode="Static"></asp:HiddenField>
        <table class="noprint">
            <tr>
                <td>
        <ew:CalendarPopup ID="CalendarPopup1" runat="server" Culture="en-AU">
        </ew:CalendarPopup>
                </td>
                <td>
        <ew:TimePicker ID="TimePicker1" runat="server" Culture="en-AU" MinuteInterval="OneHour">
        </ew:TimePicker>
                </td>
                <td>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" CausesValidation="False"/>
                </td>
                <td>
                    <div id="CountDownDiv">Next Auto Refresh in MM:SS -></div>
                </td>
                <td>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>Getting Data From PI. Please wait....</ProgressTemplate>
        </asp:UpdateProgress>
                </td>
            </tr>
        </table>
            <asp:Table ID="Table" runat="server" Height="20px" CellPadding="2" CellSpacing="0" Width="100%">
                <asp:TableRow ID="TitleRow" runat="server">
                    <asp:TableCell ID="TitleCell" runat="server" HorizontalAlign="Center" Wrap="False" ColumnSpan="100">Parameter Compliance - Dewatering</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="HeaderRow" runat="server">
                    <asp:TableCell ID="HeaderCellTime" runat="server" HorizontalAlign="Center" Wrap="False">##/##/## ##:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCellSHIFTAVG" runat="server" HorizontalAlign="Center">SHIFT <br/> AVG</asp:TableCell>
                    <asp:TableCell ID="HeaderCellLower" runat="server" HorizontalAlign="Center" Wrap="False">Lower</asp:TableCell>
                    <asp:TableCell ID="HeaderCellUpper" runat="server" HorizontalAlign="Center" Wrap="False">Upper</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_0" runat="server" HorizontalAlign="Center" Wrap="False">00:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_1" runat="server" HorizontalAlign="Center" Wrap="False">-1:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_2" runat="server" HorizontalAlign="Center" Wrap="False">-2:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_3" runat="server" HorizontalAlign="Center" Wrap="False">-3:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_4" runat="server" HorizontalAlign="Center" Wrap="False">-4:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_5" runat="server" HorizontalAlign="Center" Wrap="False">-5:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_6" runat="server" HorizontalAlign="Center" Wrap="False">-6:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_7" runat="server" HorizontalAlign="Center" Wrap="False">-7:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_8" runat="server" HorizontalAlign="Center" Wrap="False">-8:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_9" runat="server" HorizontalAlign="Center" Wrap="False">-9:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_10" runat="server" HorizontalAlign="Center" Wrap="False">-10:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_11" runat="server" HorizontalAlign="Center" Wrap="False">-11:00</asp:TableCell>
                    <asp:TableCell ID="HeaderCell_12" runat="server" HorizontalAlign="Center" Wrap="False">-12:00</asp:TableCell>
                    <%--<asp:TableCell ID="HeaderCellComments" runat="server" HorizontalAlign="Center" Wrap="False" Width="400px">Comments</asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleTH01Row" runat="server">
                     <asp:TableCell ID="SubtitleTH01Cell" CssClass="head2" runat="server" ColumnSpan="100">TH01</asp:TableCell>
               </asp:TableRow>
                <asp:TableRow 
                    LowerInit="67" 
                    UpperInit="74" 
                    PrtFmt="00.0" 
                    ID="TH01UFDRow" 
                    PITag="DTP89s" 
                    PIFilter="'DTP89s'" 
                    AFTemplate="Thickener" 
                    AFAsset="355TH001" 
                    AFAttribute="Underflow Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="TH01UFDCellHeader" runat="server" CssClass="head1">TH01 UF Density</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01UFDCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01UFDCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01UFDCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFD0Cell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH01UFDCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow Visible="false"
                    LowerInit="67" 
                    UpperInit="74" 
                    PrtFmt="00.0" 
                    ID="TH01UFDSPRow" 
                    PITag="PLC15_Pd00Stp" 
                    PIFilter="'PLC15_Pd00Stp'" 
                    runat="server"
                    AFTemplate="Thickener" 
                    AFAsset="355TH001" 
                    AFAttribute="Underflow Density" 
                    >
                    <asp:TableCell ID="TH01UFDSPHeader" runat="server" CssClass="head1">TH01 UF Density SP</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01UFDSPCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01UFDSPCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01UFDSPCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH01UFDSPCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="10" 
                    UpperInit="30" 
                    PrtFmt="00" 
                    ID="TH01BMRow" 
                    PITag="PTTH1s" 
                    PIFilter="'PTTH1S'" 
                    runat="server"
                    AFTemplate="Thickener" 
                    AFAsset="355TH001" 
                    AFAttribute="Bed Mass" 
                    >
                    <asp:TableCell ID="TH01BMCellHeader" runat="server" CssClass="head1">TH01 Bed Mass</asp:TableCell>
                    <asp:TableCell ID="TH01BMCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01BMCellLowerTextBox" runat="server" >###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01BMCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01BMCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BMCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH01BMCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="10" 
                    UpperInit="70" 
                    PrtFmt="00" 
                    ID="TH01BLRow" 
                    PITag="LETH1s" 
                    PIFilter="'LETH1s'" 
                    runat="server"
                    AFTemplate="Thickener" 
                    AFAsset="355TH001" 
                    AFAttribute="Underflow Density" 
                    >
                    <asp:TableCell ID="TH01BLCellHeader" runat="server" CssClass="head1">TH01 Bed Level</asp:TableCell>
                    <asp:TableCell ID="TH01BLCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01BLCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01BLCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH01BLCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH01BLCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH01BLCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                     <asp:TableRow ID="SubTitleTH04Row" runat="server">
                     <asp:TableCell ID="SubTitleTH04Cell" CssClass="head2" runat="server" ColumnSpan="100">TH04</asp:TableCell>
               </asp:TableRow>
                <asp:TableRow 
                    LowerInit="60" 
                    UpperInit="74" 
                    PrtFmt="00.0" 
                    ID="TH04UFDRow" 
                    PITag="DTP56s" 
                    PIFilter="'DTP56s'" 
                    AFTemplate="Thickener" 
                    AFAsset="355TH004" 
                    AFAttribute="Underflow Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="TH04UFDCellHeader" runat="server" CssClass="head1">TH04 UF Density</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04UFDCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04UFDCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04UFDCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH04UFDCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow Visible="false"
                    LowerInit="67"
                    UpperInit="74"
                    PrtFmt="00.0"
                    ID="TH04UFDSPRow"
                    PITag="PLC15_Pd05Stp"
                    PIFilter="'PLC15_Pd05Stp'"
                    AFTemplate="Thickener" 
                    AFAsset="355TH004" 
                    AFAttribute="Underflow Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="TH04UFDSPHeader" runat="server" CssClass="head1">TH04 UF Density SP</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04UFDSPCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04UFDSPCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04UFDSPCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH04UFDSPCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="10"
                    UpperInit="30"
                    PrtFmt="00"
                    ID="TH04BMRow"
                    PITag="PTTH4s"
                    PIFilter="'PTTH4s'"
                    AFTemplate="Thickener" 
                    AFAsset="355TH004" 
                    AFAttribute="Bed Mass" 
                    runat="server"
                    >
                    <asp:TableCell ID="TH04BMCellHeader" runat="server" CssClass="head1">TH04 Bed Mass</asp:TableCell>
                    <asp:TableCell ID="TH04BMCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04BMCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04BMCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04BMCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BMCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH04BMCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="10"
                    UpperInit="70"
                    PrtFmt="00"
                    ID="TH04BLRow"
                    PITag="LETH4s"
                    PIFilter="'LETH4s'"
                    AFTemplate="Thickener" 
                    AFAsset="355TH004" 
                    AFAttribute="Bed Level" 
                    runat="server"
                    >
                    <asp:TableCell ID="TH04BLCellHeader" runat="server" CssClass="head1">TH04 Bed Level</asp:TableCell>
                    <asp:TableCell ID="TH04BLCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04BLCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04BLCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH04BLCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH04BLCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH04BLCell_Comments" runat="server"></asp:TableCell>--%>       
                </asp:TableRow>
                     <asp:TableRow ID="SubtitleTH02Row" runat="server">
                     <asp:TableCell ID="SubtitleTH02Cell" CssClass="head2" runat="server" ColumnSpan="100">TH02</asp:TableCell>
               </asp:TableRow>
                <asp:TableRow
                    LowerInit="67"
                    UpperInit="74"
                    PrtFmt="00"
                    ID="TH02UFDRow"
                    PITag="DITTH02s"
                    PIFilter="'DITTH02s'"
                    AFTemplate="Thickener"
                    AFAsset="355TH002"
                    AFAttribute="Underflow Density"
                    runat="server">
                    <asp:TableCell ID="TH02UFDCellHeader" runat="server" CssClass="head1">TH02 UF Density</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02UFDCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02UFDCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02UFDCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH02UFDCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                    <asp:TableRow Visible="false"
                        LowerInit="67"
                        UpperInit="74"
                        PrtFmt="00.0"
                        ID="TH02UFDSPRow"
                        PITag="PLC15_Pd03Stp"
                        PIFilter="'PLC15_Pd03Stp'"
                        AFTemplate="Thickener"
                        AFAsset="355TH002"
                        AFAttribute="Underflow Density"
                        runat="server">
                    <asp:TableCell ID="TH02UFDSPHeader" runat="server" CssClass="head1">TH02 UF Density SP</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02UFDSPCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02UFDSPCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02UFDSPCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH02UFDSPCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="10"
                    UpperInit="30"
                    PrtFmt="00"
                    ID="TH02BMRow"
                    PITag="PTTH2s"
                    PIFilter="'PTTH2s'"
                    AFTemplate="Thickener"
                    AFAsset="355TH002"
                    AFAttribute="Bed Mass"
                    runat="server"
                    >
                    <asp:TableCell ID="TH02BMCellHeader" runat="server" CssClass="head1">TH02 Bed Mass</asp:TableCell>
                    <asp:TableCell ID="TH02BMCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02BMCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02BMCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02BMCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BMCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH02BMCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="10"
                    UpperInit="70"
                    PrtFmt="00"
                    ID="TH02BLRow"
                    PITag="LETH2s"
                    PIFilter="'LETH2s'"
                    AFTemplate="Thickener"
                    AFAsset="355TH002"
                    AFAttribute="Bed Level"
                    runat="server"
                    >
                    <asp:TableCell ID="TH02BLCellHeader" runat="server" CssClass="head1">TH02 Bed Level</asp:TableCell>
                    <asp:TableCell ID="TH02BLCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02BLCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02BLCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH02BLCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH02BLCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH02BLCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>

                <asp:TableRow ID="SubtitleFL01Row" runat="server">
                    <asp:TableCell ID="SubtitleFL01Cell" CssClass="head2" runat="server" ColumnSpan="100">FL01</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="8"
                    UpperInit="10.5"
                    PrtFmt="00.0"
                    ID="FL01MRow"
                    PITag="Assay_Moisture_FL01"
                    PIFilter="'Assay_Moisture_FL01'"
                    AFTemplate="Filtration Analysis"
                    AFAsset="Filtration"
                    AFAttribute="Moisture"
                    runat="server"
                    >
                    <asp:TableCell ID="FL01MCellHeader" runat="server" CssClass="head1">FL01 Moisture</asp:TableCell>
                    <asp:TableCell ID="FL01MCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01MCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01MCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01MCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01MCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01MCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL01MCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="60"
                    UpperInit="100"
                    PrtFmt="000"
                    ID="FL01DSRow"
                    PITag="FL01_DRUM_SPD"
                    PIFilter="'FL01_DRUM_SPD'"
                    AFTemplate="Filter"
                    AFAsset="360FL001"
                    AFAttribute="Drum Speed"
                    runat="server"
                    >
                    <asp:TableCell ID="FL01DSCellHeader" runat="server" CssClass="head1">FL01 Drum Speed</asp:TableCell>
                    <asp:TableCell ID="FL01DSCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01DSCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01DSCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01DSCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01DSCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL01DSCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="50"
                    UpperInit="80"
                    PrtFmt="00"
                    ID="FL01BLRow"
                    PITag="LTFL1s"
                    PIFilter="'LTFL1s'"
                    AFTemplate="Filter"
                    AFAsset="360FL001"
                    AFAttribute="Bath Level"
                    runat="server"
                    >
                    <asp:TableCell ID="FL01BLCellHeader" runat="server" CssClass="head1">FL01 Bath Level</asp:TableCell>
                    <asp:TableCell ID="FL01BLCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01BLCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01BLCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01BLCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01BLCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL01BLCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="10"
                    UpperInit="12"
                    PrtFmt="00"
                    ID="FL01OTRow"
                    PITag="WT07s"
                    PIFilter="'WT07s'"
                    AFTemplate="Filter"
                    AFAsset="360FL001"
                    AFAttribute="Throughput Rate"
                    runat="server"
                    >
                    <asp:TableCell ID="FL01OTCellHeader" runat="server" CssClass="head1">FL01 Throughput Rate</asp:TableCell>
                    <asp:TableCell ID="FL01OTCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01OTCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01OTCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL01OTCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL01OTCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL01OTCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleFL02Row" runat="server">
                    <asp:TableCell ID="SubtitleFL02Cell" CssClass="head2" runat="server" ColumnSpan="100">FL02</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="8"
                    UpperInit="10"
                    PrtFmt="00.0"
                    ID="FL02MRow"
                    PITag="Assay_Moisture_FL02"
                    PIFilter="'Assay_Moisture_FL02'"
                    AFTemplate="Filtration Analysis"
                    AFAsset="Filtration"
                    AFAttribute="Moisture"
                    runat="server"
                    >
                    <asp:TableCell ID="FL02MCellHeader" runat="server" CssClass="head1">FL02 Moisture</asp:TableCell>
                    <asp:TableCell ID="FL02MCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02MCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02MCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02MCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02MCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02MCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL02MCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>

                <asp:TableRow
                    LowerInit="60"
                    UpperInit="100"
                    PrtFmt="000"
                    ID="FL02DSRow"
                    PITag="FL02_DRUM_SPD"
                    PIFilter="'FL02_DRUM_SPD'"
                    AFTemplate="Filter"
                    AFAsset="360FL002"
                    AFAttribute="Drum Speed"
                    runat="server"
                    >
                    <asp:TableCell ID="FL02DSCellHeader" runat="server" CssClass="head1">FL02 Drum Speed</asp:TableCell>
                    <asp:TableCell ID="FL02DSCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02DSCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02DSCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02DSCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02DSCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL02DSCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="50"
                    UpperInit="80"
                    PrtFmt="00"
                    ID="FL02BLRow"
                    PITag="LTFL2s"
                    PIFilter="'LTFL2s'"
                    AFTemplate="Filter"
                    AFAsset="360FL002"
                    AFAttribute="Bath Level"
                    runat="server"
                    >
                    <asp:TableCell ID="FL02BLCellHeader" runat="server" CssClass="head1">FL02 Bath Level</asp:TableCell>
                    <asp:TableCell ID="FL02BLCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02BLCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02BLCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02BLCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02BLCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL02BLCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="10"
                    UpperInit="12"
                    PrtFmt="00"
                    ID="FL02OTRow"
                    PITag="WT08s"
                    PIFilter="'WT08s'"
                    AFTemplate="Filter"
                    AFAsset="360FL002"
                    AFAttribute="Throughput Rate"
                    runat="server"
                    >
                    <asp:TableCell ID="FL02OTCellHeader" runat="server" CssClass="head1">FL02 Throughput Rate</asp:TableCell>
                    <asp:TableCell ID="FL02OTCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02OTCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02OTCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FL02OTCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FL02OTCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FL02OTCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                    <asp:TableRow ID="SubtitleTH03Row" runat="server">
                    <asp:TableCell ID="SubtitleTH03Cell" CssClass="head2" runat="server" ColumnSpan="100">TH03</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="55"
                    UpperInit="65"
                    PrtFmt="00"
                    ID="TH03WLDRow"
                    PITag="DTP29s"
                    PIFilter="'DTP29s'"
                    AFTemplate="Tailings Line"
                    AFAsset="Western Line"
                    AFAttribute="Density"
                    runat="server"
                    >
                    <asp:TableCell ID="TH03WLDCellHeader" runat="server" CssClass="head1">West Line Density</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03WLDCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03WLDCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03WLDCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03WLDCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH03WLDCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="55"
                    UpperInit="65"
                    PrtFmt="00"
                    ID="TH03ELDRow"
                    PITag="DTP33s"
                    PIFilter="'DTP33s'"
                    AFAsset="Eastern Line"
                    AFAttribute="Density"
                    runat="server"
                    >
                    <asp:TableCell ID="TH03ELDCellHeader" runat="server" CssClass="head1">East Line Density</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03ELDCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03ELDCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03ELDCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03ELDCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TableCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="5"
                    UpperInit="25"
                    PrtFmt="00"
                    ID="TH03TRow"
                    PITag="WTTH3s"
                    PIFilter="'WTTH3s'"
                    AFTemplate="Thickener"
                    AFAsset="355TH003"
                    AFAttribute="Rake Torque"
                    runat="server"
                    >
                    <asp:TableCell ID="TH03TCellHeader" runat="server" CssClass="head1">TH03 Torque</asp:TableCell>
                    <asp:TableCell ID="TH03TCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03TCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03TCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03TCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03TCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03TCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH03TCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="20"
                    UpperInit="80"
                    PrtFmt="00"
                    ID="TH03BLRow"
                    PITag="PTTH3s"
                    PIFilter="'PTTH3s'"
                    AFTemplate="Thickener"
                    AFAsset="355TH003"
                    AFAttribute="Bed Level"
                    runat="server"
                    >
                    <asp:TableCell ID="TH03BLCellHeader" runat="server" CssClass="head1">TH03 Bed Level</asp:TableCell>
                    <asp:TableCell ID="TH03BLCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03BLCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03BLCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03BLCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BLCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH03BLCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow
                    LowerInit="5"
                    UpperInit="25"
                    PrtFmt="00"
                    ID="TH03BMRow"
                    PITag="LETH3s"
                    PIFilter="'LETH3s'"
                    AFTemplate="Thickener"
                    AFAsset="355TH003"
                    AFAttribute="Bed Mass"
                    runat="server"
                    >
                    <asp:TableCell ID="TH03BMCellHeader" runat="server" CssClass="head1">TH03 Bed Mass</asp:TableCell>
                    <asp:TableCell ID="TH03BMCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03BMCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03BMCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TH03BMCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TH03BMCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TH03BMCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>


<%--                <asp:TableRow ID="FootherRow" runat="server">
                    <asp:TableCell ID="TableCell1" runat="server" ColumnSpan="100">Mechanical / Maintenance concerns</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow1" runat="server" Height="70px">
                    <asp:TableCell ID="TableCell2" runat="server" ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow2" runat="server" Height="70px">
                    <asp:TableCell ID="TableCell3" runat="server" ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
--%>

            </asp:Table>
      </ContentTemplate>
    </asp:UpdatePanel>
    </form>

</body>
</html>
