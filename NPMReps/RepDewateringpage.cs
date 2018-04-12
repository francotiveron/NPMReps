using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPMReps {
    public partial class RepDewateringpage : RepDewatering {
        private static readonly Color m_OKBColor = Color.FromArgb(146, 208, 80);
        private static readonly Color m_KOBColor = Color.Red;
        private static readonly Color m_OKFColor = Color.Black;
        private static readonly Color m_KOFColor = Color.White;
        private static readonly Color m_ErrColor = Color.Yellow;
        private static readonly string[] m_UsersEnabled = {
            @"npm\franco.tiveron", @"npm\william.harry", @"npm\thomas.trott", @"npm\wade.freeman"
        };

        private string PageName { get { return Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath); } }

        protected void Page_Load(object sender, EventArgs e) {
            RepDewateringMXData data = null;
            DateTime endT = DateTime.Now;
            string user = UserName.Value;
            string pageName = PageName;
            Storage storage = new Storage(pageName);

            if (IsPostBack) {
                endT = CalendarPopup1.SelectedDate + TimePicker1.SelectedTime.TimeOfDay;

                bool bSave = false;
                foreach (TextBox tb in TextBoxes)
                    if (tb.Enabled) { bSave = true; storage.Set(tb.ID, tb.Text); }
                if (bSave) storage.Save();

                if (m_UsersEnabled.Contains(user)) foreach (TextBox tb in TextBoxes) tb.Enabled = true;
                if (Session[pageName] != null) data = Session[pageName] as RepDewateringMXData;
            }
            else {
                //CalendarPopup1.SelectedDate = DateTime.Today;
                TimePicker1.SelectedTime = endT.AddHours(-1);
                foreach (TextBox tb in TextBoxes) {
                    try {
                        string s = null;
                        if ((s = storage.Get(tb.ID)) == null) {
                            TableRow r = tb.Parent.Parent as TableRow;
                            if (tb.ID.Contains("Lower")) s = r.Attributes["LowerInit"];
                            else s = r.Attributes["UpperInit"];
                        }
                        tb.Text = s;
                    }
                    catch { }
                }
            }

            if (data == null) {
                if (Application[pageName] == null) {
                    Application[pageName] = data = new RepDewateringMXData();

                    foreach (TableRow r in Table.Rows) {
                        string piTag = r.Attributes["PITag"];
                        string piFilter = r.Attributes["PIFilter"];
                        if (piTag != null) data.PITags.Add(new KeyValuePair<string, string>(piTag, piFilter == null ? "1" : piFilter));
                    }
                }
                else {
                    RepDewateringMXData appData = Application[pageName] as RepDewateringMXData;
                    Session[pageName] = data = CloneData(appData);
                }
            }

            data.Calc(endT);
            TableCell HeaderCellTime = Table.FindControl("HeaderCellTime") as TableCell;
            HeaderCellTime.Text = endT.ToString("dd/MM/yyyy HH:00");

            foreach (TableRow r in Table.Rows) {
                string piTag = r.Attributes["PITag"];
                string tLowerID, tUpperID;
                double dLower = 0, dUpper = 0;

                if (piTag != null && data.Data.ContainsKey(piTag)) {
                    string fmt = r.Attributes["PrtFmt"];
                    double tot = 0.0;
                    ushort iAvg = 0;
                    foreach (TableCell cell in r.Cells) {
                        if (cell.ID.EndsWith("Header")) {
                            cell.ToolTip = r.Attributes["PIFilter"];
                            continue;
                        }
                        string[] ss = cell.ID.Split('_');
                        ushort h = 0;
                        if (ss.Length == 2 && ushort.TryParse(ss[1], out h)) {
                            DateTime dt = data.EndTime.AddHours(-h - 1);
                            cell.ToolTip = dt.ToString();
                            try {
                                if (fmt == null) {
                                    var val = data.Data[piTag][dt.AddHours(1)];
                                    bool bOn = (int)val == 1;
                                    cell.Text = string.Format("{0}", bOn ? "On" : "Off");
                                    cell.BackColor = bOn ? m_OKBColor : m_KOBColor;
                                    cell.ForeColor = bOn ? m_OKFColor : m_KOFColor;
                                }
                                else {
                                    var val = data.Data[piTag][dt];
                                    double dVal = (double)val;
                                    tLowerID = r.ID.Replace("Row", "CellLowerTextBox");
                                    dLower = double.Parse(((TextBox)r.FindControl(tLowerID)).Text);
                                    tUpperID = r.ID.Replace("Row", "CellUpperTextBox");
                                    dUpper = double.Parse(((TextBox)r.FindControl(tUpperID)).Text);
                                    cell.Text = string.Format("{0:" + fmt + "}", dVal);
                                    if (r.ID == "FinalTailRow" && dVal >= 0.11 && dVal <= 0.13) {
                                        cell.BackColor = Color.Orange;
                                        cell.ForeColor = m_OKFColor;
                                    }
                                    else if (r.ID.Contains("ML02Power") || r.ID.Contains("ML04Power")) {
                                        cell.BackColor = (dVal >= dLower && dVal <= dUpper) ? m_OKBColor : Color.Orange;
                                        cell.ForeColor = (dVal >= dLower && dVal <= dUpper) ? m_OKFColor : m_OKFColor;
                                    }
                                    else {
                                        cell.BackColor = (dVal >= dLower && dVal <= dUpper) ? m_OKBColor : m_KOBColor;
                                        cell.ForeColor = (dVal >= dLower && dVal <= dUpper) ? m_OKFColor : m_KOFColor;
                                    }
                                    tot += (double)val; ++iAvg;
                                }
                            }
                            catch (Exception ex) {
                                cell.Text = "Err";
                                cell.BackColor = m_ErrColor;
                                cell.ToolTip += " - " + ex.Message;
                            }
                        }
                    }
                    if (iAvg > 0) {
                        string cAvId = r.ID.Replace("Row", "CellShiftAVG");
                        TableCell cAv = r.FindControl(cAvId) as TableCell;
                        double avg = tot / iAvg;
                        cAv.Text = string.Format("{0:" + fmt + "}", avg);
                        if (r.ID == "FinalTailRow" && avg >= 0.11 && avg <= 0.13) {
                            cAv.BackColor = Color.Orange;
                            cAv.ForeColor = m_OKFColor;
                        }
                        else if (r.ID.Contains("Power")) {
                            cAv.BackColor = (avg >= dLower && avg <= dUpper) ? m_OKBColor : Color.Orange;
                            cAv.ForeColor = (avg >= dLower && avg <= dUpper) ? m_OKFColor : m_OKFColor;
                        }
                        else {
                            cAv.BackColor = (avg >= dLower && avg <= dUpper) ? m_OKBColor : m_KOBColor;
                            cAv.ForeColor = (avg >= dLower && avg <= dUpper) ? m_OKFColor : m_KOFColor;
                        }
                    }
                }
            }
        }
        private IEnumerable<TextBox> TextBoxes {
            get {
                foreach (TableRow r in Table.Rows)
                    foreach (TableCell c in r.Cells)
                        foreach (Control t in c.Controls)
                            if (t is TextBox) yield return (TextBox)t;
            }
        }

        private static RepDewateringMXData CloneData(RepDewateringMXData source) {
            IFormatter formatter = new BinaryFormatter();
            Stream stream = new MemoryStream();
            using (stream) {
                formatter.Serialize(stream, source);
                stream.Seek(0, SeekOrigin.Begin);
                return (RepDewateringMXData)formatter.Deserialize(stream);
            }
        }

    }
}