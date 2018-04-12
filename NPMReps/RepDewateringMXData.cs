using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace NPMReps {
    [Serializable]
    public class RepDewateringMXData  {
        /*
        private readonly string[] m_PiTags = {
            "DTP89s", "PTTH1S", "LETH1s", "DTP56s", "PTTH4s", "LETH4s", "DITTH02s", "WTTH2s", "PTTH2s",
            "LETH2s", "Assay_Moisture_FL01", "FL01_DRUM_SPD", "LTFL1s", "Assay_Moisture_FL02", "FL02_DRUM_SPD", "LTFL2s",
            "DTP29s", "DTP33s", "WTTH3s", "PTTH3s", "LETH3s", "WT07s", "WT08s", "PLC15_Pd00Stp", "PLC15_Pd05Stp", "PLC15_Pd03Stp"
        };

        private string[] m_PiFilters = {
            "'DTP89s'", "'PTTH1S'", "'LETH1s'", "'DTP56s'", "'PTTH4s'", "'LETH4s'", "'DITTH02s'", "'PTTH2s'", "'LETH2s'",
            "'Assay_Moisture_FL01'", "'FL01_DRUM_SPD'", "'LTFL1s'", "'WT07s'", "'Assay_Moisture_FL02', "'FL02_DRUM_SPD'",
            "'LTFL2s'", "'WT08s'", "'DTP29s'", "'DTP33s'", "'WTTH3s'", "'PTTH3s'", "'LETH3s'", "'PLC15_Pd00Stp'", "'PLC15_Pd05Stp'",
            "'PLC15_Pd03Stp'"
        };
        */
        public RepDewateringMXData() { PITags = new List<KeyValuePair<string, string>>(); }

        public List<KeyValuePair<string, string>> PITags { get; set; }

        private Dictionary<string, Dictionary<DateTime, object>> m_data = new Dictionary<string,Dictionary<DateTime, object>>();

        private static string GetToken(HttpRequest req = null) {
            return string.Empty;
        }

        public string Token { get; set; }

        public DateTime EndTime { get; set; }

        public Dictionary<string, Dictionary<DateTime, object>> Data { get { return m_data; } }

        public void Calc(DateTime endTime) {
            endTime = new DateTime(endTime.Year, endTime.Month, endTime.Day, endTime.Hour, 0, 0);
            if (endTime != EndTime) {
                EndTime = endTime;
                Data.Clear();
                foreach (KeyValuePair<string, string> piTag in PITags) {
                    Dictionary<DateTime, object> data = PI.Tag(piTag.Key).GetData(EndTime, piTag.Value);
                    m_data.Add(piTag.Key, data);
                }
            }
        }
    }
}