using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Enviro
{
    /// <summary>
    /// Summary description for UploadHandler
    /// </summary>
    public class UploadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fname;
                    if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                    {

                        // string[] testfiles = file.FileName.Split(new char[] { '\\' });
                        // fname = testfiles[testfiles.Length - 1];

                        string myFilePath = file.FileName;
                        string ext = Path.GetExtension(myFilePath);

                        fname = System.Guid.NewGuid().ToString().Replace("-" , "");

                        fname = string.Concat(fname, ext);

                    }
                    else
                    {

                        string myFilePath = file.FileName;
                        string ext = Path.GetExtension(myFilePath);

                        fname = System.Guid.NewGuid().ToString().Replace("-", "");

                        fname = string.Concat(fname, ext);

                    }

                    fname = Path.Combine(context.Server.MapPath("~/Uploads/Quotation"), fname);
                    file.SaveAs(fname);

                    context.Response.ContentType = "text/plain";
                    context.Response.Write(fname);
                }
            }

           // context.Response.ContentType = "text/plain";
           // context.Response.Write(fname);

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}