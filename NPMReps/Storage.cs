using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml;

namespace NPMReps {
    public class Storage {
        private XmlDocument m_x;
        private string m_path = @"<Dir>\<Page>Limits.XML";

        public Storage(string page) {
            m_path = m_path.Replace(@"<Page>", page).Replace(@"<Dir>", HttpContext.Current.Server.MapPath("."));
        }

        private string FilePath { get { return m_path; } }

        private XmlDocument X {
            get {
                if (m_x == null) {
                    m_x = new XmlDocument();
                    try { m_x.Load(FilePath); } 
                    catch { m_x.AppendChild(m_x.CreateElement("Limits")); }
                }
                return m_x; 
            }
        }

        public string Get(string key) { try { return X.DocumentElement[key].InnerText; } catch { return null; } }
        public void Set(string key, string val) {
            try { X.DocumentElement[key].InnerText = val; } 
            catch {
                XmlElement e = X.CreateElement(key);
                e.InnerText = val;
                X.DocumentElement.AppendChild(e);
            } 
        }
        public void Save() {
            m_x.Save(FilePath);
            m_x = null;
        }
    }
}