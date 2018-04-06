using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using OSIsoft.AF;
using OSIsoft.AF.PI;
using OSIsoft.AF.Asset;
using OSIsoft.AF.Time;
using OSIsoft.AF.Data;
using System.Net;
using System.Data;

namespace NPMReps {
    public class PI {
        public class Point  {
            private PIPoint m_p;
            public Point(string name) { m_p = PI.GetPoint(name); }

            private AFValues _GetData(DateTime _end, string filter) {
                AFValues ret = null;
                var end = DateTime.SpecifyKind(_end, DateTimeKind.Local);
                var tr = new AFTimeRange(new AFTime(end.AddHours(-13)), new AFTime(end));
                var ts = new AFTimeSpan(TimeSpan.FromHours(1.0));
                if (m_p.PointType == PIPointType.Digital) {
                    //IPIData2 pd = m_p.Data as IPIData2;
                    //ret = pd.InterpolatedValues2(end.AddHours(-13), end, "1h");
                    ret = m_p.InterpolatedValues(tr, ts, "", true);
                }
                else {
                    var nv = m_p.FilteredSummaries(tr, ts, filter, AFSummaryTypes.Average, AFCalculationBasis.TimeWeighted, AFSampleType.ExpressionRecordedValues, AFTimeSpan.Parse("1h"), AFTimestampCalculation.Auto);
                    ret = nv[AFSummaryTypes.Average];

                    //IPIData2 pd = m_p.Data as IPIData2;
                    //NamedValues nv = pd.FilteredSummaries(
                    //    end.AddHours(-13), end,
                    //    "1h",
                    //    filter,
                    //    ArchiveSummariesTypeConstants.asAverage,
                    //    CalculationBasisConstants.cbTimeWeighted,
                    //    FilterSampleTypeConstants.fstExpRecordedValues
                    //);
                    //ret = nv["Average"].Value;
                }

                return ret;
            }


            public Dictionary<DateTime, object> GetData(DateTime end, string filter) {
                Dictionary<DateTime, object> ret = new Dictionary<DateTime, object>();
                AFValues vals = _GetData(end, filter);

                foreach(AFValue v in vals) {
                    //DateTime dt = v.TimeStamp.LocalDate;
                    DateTime dt = v.Timestamp.LocalTime;
                    object value = v.Value;

                    if (v.Value is AFEnumerationValue) {
                        var ev = (AFEnumerationValue)v.Value;
                        value = ev.Value;
                    }
                    else value = v.Value;

                    //if (v.Value is DigitalState) {
                    //    DigitalState ds = v.Value;
                    //    value = ds.Code;
                    //}
                    //else value = v.Value;

                    try { ret.Add(dt, value); }
                    catch { }
                }

                return ret;
            }

            public IEnumerable<object> EnumData(DateTime end, string filter) {
                AFValues vals = _GetData(end, filter);

                foreach (AFValue v in vals) {
                    DateTime dt = v.Timestamp.LocalTime;
                    object value = v.Value;
                    yield return new KeyValuePair<DateTime, object>(dt, value);
                }
            }
        }

        #region static & private
        //private static PI _; static PI() { _ = new PI(); }
        private static PISystem af;
        private static PIServer pi;
        static PI() {
            af = (new PISystems()).DefaultPISystem;
            pi = (new PIServers()).DefaultPIServer;
            //var user = new NetworkCredential("pilab", "aafire");
            //var user = new NetworkCredential(@"NPMPROD\SRV_PI", "PIP@rk35");
            af.Connect(new NetworkCredential(@"NPMPROD\SRV_PI", "PIP@rk35"));
            pi.Connect(new NetworkCredential("pilab", "aafire"));
        }

        //private PISDK.PISDK _SDK;
        //private Server _SRV;

        //private PISDK.PISDK SDK {
        //    get {
        //        if (_SDK == null) _SDK = new PISDK.PISDK();
        //        return _SDK;
        //    }
        //}

        //private Server SRV {
        //    get {
        //        if (_SRV == null) {
        //            _SRV = SDK.Servers.DefaultServer;
        //            _SRV.Open("UID=pilab;PWD=aafire");
        //            bool done = false;
        //            while (!done) {
        //                try {
        //                    _SRV.Open("UID=piadmin;PWD=osisoft1");
        //                    done = true;
        //                }
        //                catch { Thread.Sleep(1000); }

        //            }
        //        }
        //        return _SRV;
        //    }
        //}

        //private static Server S { get { return _.SRV; } }

        //~PI() { try { SRV.Close(); } catch { } }
        #endregion

        //private static PIPoint GetPoint(string name) {
        //    while (true) {
        //        try { return S.PIPoints[name]; }
        //        catch { Thread.Sleep(1000); }
        //    }
        //}

        private static PIPoint GetPoint(string name) {
            while (true) {
                try { return PIPoint.FindPIPoint(pi, name); }
                catch { Thread.Sleep(1000); }
            }
        }

        public static Point Tag(string name) {
            return new Point(name);
        }

        private static DataTable afLimits = null;
        public static DataTable AFLimits {
            get {
                if (afLimits == null) afLimits = af.Databases["Northparkes_Mines"].Tables["Limits"].Table;
                return afLimits;
            }
        }
    }
}