<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepShiftPage.cs" Inherits="NPMReps.RepShiftPage" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Module 2</title>
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
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RepShiftPerfM1.aspx">Module 1</asp:HyperLink>
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
                    <asp:TableCell ID="TitleCell" runat="server" HorizontalAlign="Center" Wrap="False" ColumnSpan="100">Parameter Compliance - Module 2</asp:TableCell>
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
                    PITag="SCS_123CV006_AT_P80" 
                    PIFilter="'SCS_123CV006_AT_P80'>5" 
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
                    LowerInit="500" 
                    UpperInit="510" 
                    PrtFmt="000" 
                    ID="ML03TPHRow" 
                    PITag="WTWT5s" 
                    PIFilter="'WTWT5s'>100" 
                    AFTemplate="Conveyor" 
                    AFAsset="321CV010" 
                    AFAttribute="Feed Rate" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML03TPHCellHeader" runat="server">ML03 TPH</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03TPHCellLowerTextBox" runat="server" >###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03TPHCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03TPHCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03TPHCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML03TPHCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="94" 
                    UpperInit="98" 
                    PrtFmt="00.0" 
                    ID="ML03CurrentRow" 
                    PITag="ML03_Load" 
                    PIFilter="'ML03_Load'>50" 
                    AFTemplate="SAG Mill" 
                    AFAsset="330ML003" 
                    AFAttribute="Load" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML03CurrentCellHeader" runat="server" CssClass="head1">ML03 % Current</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03CurrentCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03CurrentCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03CurrentCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML03CurrentCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="81"                    
                    UpperInit="85" 
                    PrtFmt="00.0" 
                    ID="ML03SoundRow" 
                    PITag="ML03Snd" 
                    PIFilter="'ML03Snd'>50" 
                    AFTemplate="SAG Mill" 
                    AFAsset="330ML003" 
                    AFAttribute="Sound" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML03SoundCellHeader" runat="server">ML03 Sound</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03SoundCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03SoundCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03SoundCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03SoundCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML03SoundCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="72" 
                    UpperInit="85" 
                    PrtFmt="00.0" 
                    ID="ML03DensityRow" 
                    PITag="330ML003.Feed Density" 
                    PIFilter="'330ML003.Feed Density'>50" 
                    AFTemplate="SAG Mill" 
                    AFAsset="330ML003" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML03DensityCellHeader" runat="server" CssClass="head1">ML03 Density</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML03DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML03DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML03DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleCY04Row" runat="server">
                    <asp:TableCell ID="SubtitleCY04Cell" CssClass="head2" runat="server" ColumnSpan="100">CY04</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="73" 
                    UpperInit="83" 
                    PrtFmt="00" 
                    ID="CY04PressureRow" 
                    PITag="PTCY4s" 
                    PIFilter="'PTCY4s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="330CY004" 
                    AFAttribute="Pressure" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY04PressureCellHeader" runat="server" CssClass="head1">CY04 Pressure</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY04PressureCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY04PressureCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY04PressureCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04PressureCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY04PressureCell_Comments" runat="server"></asp:TableCell>--%>       
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="65" 
                    UpperInit="72" 
                    PrtFmt="00.0" 
                    ID="CY04DensityRow" 
                    PITag="DTCY4s" 
                    PIFilter="'DTCY4s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="330CY004" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY04DensityCellHeader" runat="server" CssClass="head1">CY04 Density</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY04DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY04DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY04DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY04DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY04DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleML04Row" runat="server">
                    <asp:TableCell ID="SubtitleML04Cell" CssClass="head2" runat="server" ColumnSpan="100">ML04</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="4930" 
                    UpperInit="4980" 
                    PrtFmt="0000" 
                    ID="ML04PowerRow" 
                    PITag="ML04_W" 
                    PIFilter="'ML04_W'>100" 
                    AFTemplate="Ball Mill" 
                    AFAsset="330ML004" 
                    AFAttribute="Power" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML04PowerCellHeader" runat="server" CssClass="head1">ML04 Power (kW)</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML04PowerCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML04PowerCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML04PowerCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML04PowerCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML04PowerCell_Comments" runat="server"></asp:TableCell>--%>
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
                    PITag="PSIMod2P80" 
                    PIFilter="'PSIMod1P80'>1" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="340CY006" 
                    AFAttribute="Overflow P80" 
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

                <asp:TableRow ID="SubtitleCY06Row" runat="server">
                    <asp:TableCell ID="SubtitleCY06Cell" CssClass="head2" runat="server" ColumnSpan="100">CY06</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="120" 
                    UpperInit="150" 
                    PrtFmt="000" 
                    ID="CY06PressureRow" 
                    PITag="PTCY06s" 
                    PIFilter="'PTCY06s'>10" 
                    runat="server"
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="340CY006" 
                    AFAttribute="Pressure" 
                    >
                    <asp:TableCell ID="CY06PressureCellHeader" runat="server" CssClass="head1">CY06 Pressure</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY06PressureCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY06PressureCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY06PressureCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06PressureCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY06PressureCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="50" 
                    UpperInit="56" 
                    PrtFmt="00.0" 
                    ID="CY06DensityRow" 
                    PITag="DITCY06s" 
                    PIFilter="'DITCY06s'>10" 
                    AFTemplate="Cyclone Cluster" 
                    AFAsset="340CY006" 
                    AFAttribute="Feed Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="CY06DensityCellHeader" runat="server" CssClass="head1">CY06 Density</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="CY06DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY06DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="CY06DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="CY06DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="CY06DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleML06Row" runat="server">
                    <asp:TableCell ID="SubtitleML06Cell" CssClass="head2" runat="server" ColumnSpan="100">ML06</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="1420" 
                    UpperInit="10000" 
                    PrtFmt="0000" 
                    ID="ML06PowerRow" 
                    PITag="ML06_W" 
                    PIFilter="'ML06_W'>100" 
                    AFTemplate="Tertiary Mill" 
                    AFAsset="340ML006" 
                    AFAttribute="Power" 
                    runat="server"
                    >
                    <asp:TableCell ID="ML06PowerCellHeader" runat="server">ML06 Power (kW)</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="ML06PowerCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML06PowerCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="ML06PowerCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="ML06PowerCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="ML06PowerCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow PrtFmt="000" ID="Sep2Row" runat="server" Height="10px">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="33" 
                    UpperInit="38" 
                    PrtFmt="00.0" 
                    ID="TK36DensityRow" 
                    PITag="DTT36s" 
                    PIFilter="'WTWT5s'>100" 
                    AFTemplate="Tank" 
                    AFAsset="340TK036" 
                    AFAttribute="Density" 
                    runat="server"
                    >
                    <asp:TableCell ID="TK36DensityCellHeader" runat="server">TK36 Density</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="TK36DensityCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TK36DensityCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="TK36DensityCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TK36DensityCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TK36DensityCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="SubtitleJamesonsRow" runat="server">
                    <asp:TableCell ID="SubtitleJamesonsCell" CssClass="head2" runat="server" ColumnSpan="100">Jamesons</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    LowerInit="80" 
                    UpperInit="155" 
                    PrtFmt="000" 
                    ID="FT27PressureRow" 
                    PITag="PTF27s" 
                    PIFilter="'PTF27s'>5" 
                    AFTemplate="Jameson Cell" 
                    AFAsset="340FT027" 
                    AFAttribute="Feed Pressure" 
                    runat="server"
                    >
                    <asp:TableCell ID="FT27PressureCellHeader" runat="server" CssClass="head1">FT27 Pressure</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCellShiftAVG" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCellLower" runat="server">
                        <asp:TextBox Enabled="False" ID="FT27PressureCellLowerTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FT27PressureCellUpper" runat="server">
                        <asp:TextBox Enabled="False" ID="FT27PressureCellUpperTextBox" runat="server">###</asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT27PressureCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT27PressureCell_Comments" runat="server"></asp:TableCell>--%>
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
                    PITag="OSA_M2_FC_CU_PI" 
                    PIFilter="'OSA_M2_FC_CU_PI'>1" 
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340AN004M2FC" 
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
                    PITag="OSA_M2_FF_CU_PI" 
                    PIFilter="'OSA_M2_FF_CU_PI'>0.1" 
                    runat="server"
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340AN004M2FF" 
                    AFAttribute="Copper" 
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
                    PITag="OSA_M2_FFC_CU_PI" 
                    PIFilter="'OSA_M2_FFC_CU_PI'>1" 
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340AN004M2FF" 
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
                    PITag="OSA_M2_FT_CU_MX3_PI" 
                    PIFilter="'OSA_M2_FT_CU_MX3_PI'>0.01" 
                    AFTemplate="On Stream Analyser" 
                    AFAsset="340AN004M2FT" 
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
                <asp:TableRow ID="SubtitleConstraintControlRow" runat="server">
                    <asp:TableCell ID="SubtitleConstraintControlCell" CssClass="head2" runat="server" ColumnSpan="100">Constraint Control</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="SCCRow" PITag="330HLC004.Controller Enabled" runat="server">
                    <asp:TableCell ID="SCCCellHeader" ColumnSpan="4" runat="server" CssClass="head1">SCC</asp:TableCell>
                    <asp:TableCell ID="SCCCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="SCCCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="SCCCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="TCCRow" PITag="340HLC006.Controller Enabled" runat="server">
                    <asp:TableCell ID="TCCCellHeader" ColumnSpan="4" runat="server" CssClass="head1">TCC</asp:TableCell>
                    <asp:TableCell ID="TCCCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="TCCCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="TCCCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="FCCRow" PITag="340HLC008.Controller Enabled" runat="server">
                    <asp:TableCell ID="FCCCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FCC</asp:TableCell>
                    <asp:TableCell ID="FCCCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FCCCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FCCCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="Sep4" runat="server" Height="10px">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>


                <asp:TableRow ID="SubtitleVisioFrothRow" runat="server">
                    <asp:TableCell ID="SubtitleVisioFrothCell" CssClass="head2" runat="server" ColumnSpan="100">Visiofroth Status</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="FT45AirRow" PITag="FT45_AIR_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT45AirCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT45 Air</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45AirCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT45AirCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="FT45LevelRow" PITag="FT45_LVL_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT45LevelCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT45 Level</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT45LevelCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT45LevelCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="Sep5" runat="server" Height="10px" Visible="false">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="FT46AirRow" PITag="FT46_AIR_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT46AirCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT46 Air</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46AirCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT46AirCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="FT46LevelRow" PITag="FT46_LVL_CAS_Enabled" runat="server" Visible="false">
                    <asp:TableCell ID="FT46LevelCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT46 Level</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT46LevelCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT46LevelCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="Sep6" runat="server" Height="10px" Visible="false">
                    <asp:TableCell ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>


                <asp:TableRow ID="FT50AirRow" PITag="FT50_AIR_CAS_Enabled" runat="server">
                    <asp:TableCell ID="FT50AirCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT50 Air</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50AirCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT50AirCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>
                <asp:TableRow ID="FT50LevelRow" PITag="FT50_LVL_CAS_Enabled" runat="server">
                    <asp:TableCell ID="FT50LevelCellHeader" ColumnSpan="4" runat="server" CssClass="head1">FT50 Level</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_0" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_1" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_2" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_3" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_4" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_5" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_6" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_7" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_8" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_9" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_10" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_11" runat="server">###</asp:TableCell>
                    <asp:TableCell ID="FT50LevelCell_12" runat="server">###</asp:TableCell>
                    <%--<asp:TableCell ID="FT50LevelCell_Comments" runat="server"></asp:TableCell>--%>
                </asp:TableRow>



<%--                <asp:TableRow ID="FootherRow" runat="server">
                    <asp:TableCell ID="TableCell1" runat="server" ColumnSpan="100">Mechanical / Maintenance concerns</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow1" runat="server" Height="70px">
                    <asp:TableCell ID="TableCell2" runat="server" ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow2" runat="server" Height="70px">
                    <asp:TableCell ID="TableCell3" runat="server" ColumnSpan="100"></asp:TableCell>
                </asp:TableRow>--%>


            </asp:Table>
      </ContentTemplate>
    </asp:UpdatePanel>
    </form>

</body>
</html>
