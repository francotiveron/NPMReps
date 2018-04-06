using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace NPMReps {
    [Serializable]
    public class RepShiftPerfMXData {
        private readonly Dictionary<string, Dictionary<DateTime, object>> _data = new Dictionary<string, Dictionary<DateTime, object>>();

        public RepShiftPerfMXData() => PITags = new List<KeyValuePair<string, string>>();

        public List<KeyValuePair<string, string>> PITags { get; private set; }
        public Dictionary<string, Dictionary<DateTime, object>> Data => _data; public string Token { get; set; }

        public DateTime EndTime { get; set; }

        public void Calc(DateTime endTime) {
            endTime = new DateTime(endTime.Year, endTime.Month, endTime.Day, endTime.Hour, 0, 0);
            if (endTime != EndTime)
            {
                EndTime = endTime;
                Data.Clear();
                foreach (KeyValuePair<string, string> piTag in PITags)
                {
                    Dictionary<DateTime, object> data = PI.Tag(piTag.Key).GetData(EndTime, piTag.Value);
                    Data.Add(piTag.Key, data);
                }
            }
        }
    }
}