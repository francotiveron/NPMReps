<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepShiftPage.cs" Inherits="NPMReps.RepShiftPage" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Module 1</title>
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
        //        userName = "npm\\aaron.holmquest";
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
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RepShiftPerfM2.aspx">Module 2</asp:HyperLink>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/RepDewatering.aspx">Dewatering</asp:HyperLink>
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
        <ew:TimePicker ID="TimePicker1" runat="server" Culture="en-AU" MinuteInterval="OneHour" >
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
                    <asp:TableCell ID="TitleCell" runat="server" HorizontalAlign="Center" Wrap="False" ColumnSpan="100">Parameter Compliance - Module 1</asp:TableCell>
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
                <asp:TableRow ID="SubtitleGRINDINGRow" runat="server">
                     <asp:TableCell ID="SubtitleGRINDINGCell" CssClass="head2" runat="server" ColumnSpan="100">GRINDING</asp:TableCell>
               </asp:TableRow>
                <asp:TableRow 
                    LowerInit="32" 
                    UpperInit="40" 
                    PrtFmt="00.0" 
                    ID="CV06P80Row"
                    PITag="SCS_123CV006_AT_P80_Filtered" 
                    PIFilter="'SCS_123CV006_AT_P80_Filtered'>5" 
                    AFTemplate="Sizing Camera" 
                    AFAsset="123SZ006" 
                    AFAttribute="P80" 
                    runat="server"
                    >
                    <asp:TableCell ID="CV06P80CellHeader" runat="server">UG CV06 P80</asp:TableCell>
                    <asp:TableCell ID="CV06P80CellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80CellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CV06P80CellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CV06P80CellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CV06P80CellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CV06P80Cell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CV06P80Cell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleSAGRow" runat="server">
                    <asp:TableCell ID="SubtitleSAGCell" CssClass="head2" runat="server" ColumnSpan="100">SAG</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="300" 
                    UpperInit="310" 
                    PrtFmt="000" 
                    ID="ML01TPHRow" 
                    PITag="WWT02s" 
                    PIFilter="'WWT02s'>100" 
                    AFTemplate="Conveyor" 
                    AFAsset="321CV002" 
                    AFAttribute="Feed Rate" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML01TPHCellHeader" runat="server">ML01 TPH</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01TPHCellLowerTextBox" runat="server" >###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01TPHCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01TPHCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01TPHCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML01TPHCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="92" 
                    UpperInit="96" 
                    PrtFmt="00.0" 
                    ID="ML01CurrentRow" 
                    PITag="ML01_Load" 
                    PIFilter="'ML01_Load'>50" 
                    AFTemplate="SAG Mill" 
                    AFAsset="330ML001" 
                    AFAttribute="Load" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML01CurrentCellHeader" runat="server" CssClass="head1">ML01 % Current</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01CurrentCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01CurrentCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01CurrentCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML01CurrentCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="83" 
                    UpperInit="87" 
                    PrtFmt="00.0" 
                    ID="ML01SoundRow" 
                    PITag="ML01Snd" 
                    PIFilter="'ML01Snd'>50" 
                    AFTemplate="SAG Mill" 
                    AFAsset="330ML001" 
                    AFAttribute="Sound" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML01SoundCellHeader" runat="server">ML01 Sound</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01SoundCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01SoundCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01SoundCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01SoundCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML01SoundCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="72" 
                    UpperInit="85" 
                    PrtFmt="00.0" 
                    ID="ML01DensityRow" 
                    PITag="ML01_Feed_Density" 
                    PIFilter="'ML01_Feed_Density'>50" 
                    AFTemplate="SAG Mill" 
                    AFAsset="330ML001" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML01DensityCellHeader" runat="server" CssClass="head1">ML01 Density</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML01DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML01DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML01DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleCY01Row" runat="server">
                    <asp:TableCell ID="SubtitleCY01Cell" CssClass="head2" runat="server" ColumnSpan="100">CY01</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="30" 
                    UpperInit="40" 
                    PrtFmt="00.0" 
                    ID="CY01DensityRow" 
                    PITag="DTCY1s" 
                    PIFilter="'DTCY1s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="330CY001" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY01DensityCellHeader" runat="server" CssClass="head1">CY01 Density</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY01DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY01DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY01DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY01DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY01DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleCY02Row" runat="server">
                    <asp:TableCell ID="SubtitleCY02Cell" CssClass="head2" runat="server" ColumnSpan="100">CY02</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="85" 
                    UpperInit="99" 
                    PrtFmt="00" 
                    ID="CY02PressureRow" 
                    PITag="PTCY2s" 
                    PIFilter="'PTCY2s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="330CY002" 
                    AFAttribute="Pressure" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY02PressureCellHeader" runat="server" CssClass="head1">CY02 Pressure</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY02PressureCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY02PressureCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY02PressureCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02PressureCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY02PressureCell_Comments" runat="server"></asp:TableCell>--%>       
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="65" 
                    UpperInit="73" 
                    PrtFmt="00.0" 
                    ID="CY02DensityRow" 
                    PITag="DTCY2s" 
                    PIFilter="'DTCY2s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="330CY002" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY02DensityCellHeader" runat="server" CssClass="head1">CY02 Density</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY02DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY02DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY02DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY02DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY02DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleML02Row" runat="server">
                    <asp:TableCell ID="SubtitleML02Cell" CssClass="head2" runat="server" ColumnSpan="100">ML02</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="2900" 
                    UpperInit="2980" 
                    PrtFmt="0000" 
                    ID="ML02PowerRow" 
                    PITag="330ML002.Power" 
                    PIFilter="'330ML002.Power'>100" 
                    AFTemplate="Ball Mill" 
                    AFAsset="330ML002" 
                    AFAttribute="Power" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML02PowerCellHeader" runat="server" CssClass="head1">ML02 Power (kW)</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML02PowerCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML02PowerCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML02PowerCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML02PowerCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML02PowerCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="Sep1Row" runat="server" Height="10px">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleFLOTATIONRow" runat="server">
                    <asp:TableCell ID="SubtitleFLOTATIONCell" CssClass="head2" runat="server" ColumnSpan="100">FLOTATION</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="100" 
                    UpperInit="150" 
                    PrtFmt="000.0" 
                    ID="FlotFeedP80Row" 
                    PITag="PSIMod1P80" 
                    PIFilter="'PSIMod1P80'>1" 
                    AFTemplate="Particle Size Analyser" 
                    AFAsset="340AN005M1" 
                    AFAttribute="Flotation Feed P80" 
                    runat="server"
                    >
                    <asp:TableCell ID="FlotFeedP80CellHeader" runat="server">Feed P80</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80CellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80CellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FlotFeedP80CellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80CellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FlotFeedP80CellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlotFeedP80Cell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FlotFeedP80Cell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>

                <asp:TableRow ID="SubtitleCY05Row" runat="server">
                    <asp:TableCell ID="SubtitleCY05Cell" CssClass="head2" runat="server" ColumnSpan="100">CY05</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="90" 
                    UpperInit="125" 
                    PrtFmt="000" 
                    ID="CY05PressureRow" 
                    PITag="PTCY5s" 
                    PIFilter="'PTCY5s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="340CY005" 
                    AFAttribute="Pressure" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY05PressureCellHeader" runat="server" CssClass="head1">CY05 Pressure</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY05PressureCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY05PressureCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY05PressureCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05PressureCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY05PressureCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="50" 
                    UpperInit="56" 
                    PrtFmt="00.0" 
                    ID="CY05DensityRow" 
                    PITag="DTCY5s" 
                    PIFilter="'DTCY5s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="340CY005" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY05DensityCellHeader" runat="server" CssClass="head1">CY05 Density</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY05DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY05DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY05DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY05DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY05DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleML05Row" runat="server">
                    <asp:TableCell ID="SubtitleML05Cell" CssClass="head2" runat="server" ColumnSpan="100">ML05</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="1030" 
                    UpperInit="10000" 
                    PrtFmt="0000" 
                    ID="ML05PowerRow" 
                    PITag="340ML005.Power" 
                    PIFilter="'340ML005.Power'>100" 
                    AFTemplate="Tertiary Mill" 
                    AFAsset="340ML005" 
                    AFAttribute="Power" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML05PowerCellHeader" runat="server">ML05 Power (kW)</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML05PowerCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML05PowerCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML05PowerCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML05PowerCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML05PowerCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow PrtFmt="000" ID="Sep2Row" runat="server" Height="10px">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="33" 
                    UpperInit="38" 
                    PrtFmt="00.0" 
                    ID="TK30DensityRow" 
                    PITag="DTK30s" 
                    PIFilter="'WWT02s'>100" 
                    runat="server"
                    AFTemplate="Flotation Feed Tank" 
                    AFAsset="340TK030" 
                    AFAttribute="Density" 
                    >
                    <asp:TableCell ID="TK30DensityCellHeader" runat="server">TK30 Density</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TK30DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TK30DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TK30DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK30DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TK30DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleJamesonsRow" runat="server">
                    <asp:TableCell ID="SubtitleJamesonsCell" CssClass="head2" runat="server" ColumnSpan="100">Jamesons</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="80" 
                    UpperInit="155" 
                    PrtFmt="000" 
                    ID="FT13PressureRow" 
                    PITag="PTF13s" 
                    PIFilter="'PTF13s'>5" 
                    AFTemplate="Jameson Cell" 
                    AFAsset="340FT013" 
                    AFAttribute="Feed Pressure" 
                    runat="server"
                    >
                    <asp:TableCell ID="FT13PressureCellHeader" runat="server" CssClass="head1">FT13 Pressure</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FT13PressureCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FT13PressureCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FT13PressureCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT13PressureCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT13PressureCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="Sep3" runat="server" Height="10px">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleOSARow" runat="server">
                    <asp:TableCell ID="SubtitleOSACell" CssClass="head2" runat="server" ColumnSpan="100">OSA</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="32.5" 
                    UpperInit="34.5" 
                    PrtFmt="00.0" 
                    ID="FinalConRow" 
                    PITag="OSA_M1_FC_CU_PI" 
                    PIFilter="'OSA_M1_FC_CU_PI'>1" 
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340FT013.Concentrate" 
                    AFAttribute="Copper" 
                    runat="server"
                    >
                    <asp:TableCell ID="FinalConCellHeader" runat="server">Final Con %</asp:TableCell>
                    <asp:TableCell ID="FinalConCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FinalConCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FinalConCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FinalConCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FinalConCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalConCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FinalConCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="0.10" 
                    UpperInit="0.24" 
                    PrtFmt="0.00" 
                    ID="FloatFeedRow" 
                    PITag="OSA_M1_FF_CU_PI" 
                    PIFilter="'OSA_M1_FF_CU_PI'>0.1" 
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340FT051.Tail" 
                    AFAttribute="Copper" 
                    runat="server"
                    >
                    <asp:TableCell ID="FloatFeedCellHeader" runat="server">Float Feed %</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FloatFeedCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FloatFeedCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FloatFeedCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FloatFeedCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FloatFeedCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow Visible="false"
                    LowerInit="30" 
                    UpperInit="33" 
                    PrtFmt="00.0" 
                    ID="FlashFloatConRow" 
                    PITag="OSA_M1_FFC_CU_PI" 
                    PIFilter="'OSA_M1_FFC_CU_PI'>1" 
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340AN004M1FF" 
                    AFAttribute="Copper" 
                    runat="server"
                    >
                    <asp:TableCell ID="FlashFloatConCellHeader" runat="server">Flash Float Con %</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FlashFloatConCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FlashFloatConCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FlashFloatConCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FlashFloatConCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="0.05" 
                    UpperInit="0.11" 
                    PrtFmt="0.000" 
                    ID="FinalTailRow" 
                    PITag="OSA_M1_FT_CU_MX3_PI" 
                    PIFilter="'OSA_M1_FT_CU_MX3_PI'>0.01"  
                    AFTemplate="On Stream Analyser" 
                    AFAsset="Flotation.Tail" 
                    AFAttribute="Copper" 
                    runat="server"
                    >
                    <asp:TableCell ID="FinalTailCellHeader" runat="server">Final Tail %</asp:TableCell>
                    <asp:TableCell ID="FinalTailCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FinalTailCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FinalTailCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FinalTailCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FinalTailCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FinalTailCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="Sep4" runat="server" Height="10px">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleVisioFrothRow" runat="server">
                    <asp:TableCell ID="SubtitleVisioFrothCell" CssClass="head2" runat="server" ColumnSpan="100">Visiofroth Status</asp:TableCell>
                </asp:TableRow>

<%--                <asp:TableRow ID="FT40AirRow" PITag="FT40_AIR_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT40AirCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT40 Air</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40AirCell_12" runat="server">###</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="FT40LevelRow" PITag="FT40_LVL_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT40LevelCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT40 Level</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT40LevelCell_12" runat="server">###</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Sep5" runat="server" Height="10px" Visible="false">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="FT41AirRow" PITag="FT41_AIR_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT41AirCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT41 Air</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41AirCell_12" runat="server">###</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="FT41LevelRow" PITag="FT41_LVL_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT41LevelCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT41 Level</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT41LevelCell_12" runat="server">###</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Sep6" runat="server" Height="10px" Visible="false">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>--%>

                <asp:TableRow ID="FT51AirRow" PITag="FT51_AIR_CAS_Enabled" runat="server">
                    <asp:TableCell ID="FT51AirCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT51 Air</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51AirCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT51AirCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="FT51LevelRow" PITag="FT51_LVL_CAS_Enabled" runat="server">
                    <asp:TableCell ID="FT51LevelCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT51 Level</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT51LevelCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT51LevelCell_Comments" runat="server"></asp:TableCell>--%>
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
