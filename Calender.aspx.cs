using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections;


using MySql.Data.MySqlClient;
using System.Data;
using Newtonsoft.Json;
using System.Configuration;

namespace Enviro
{
    public partial class Calender : System.Web.UI.Page
    {

        static string conString = ConfigurationManager.AppSettings["ConString"];


        [WebMethod]
        public static IList GetEvents()
        {
            IList events = new List<Event>();

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

            "select tbserviceschedulemaster.id,tbservicescheduledetails.scheduledate,tbserviceschedulemaster.customer_id,tbcustomer.name from (tbserviceschedulemaster INNER JOIN tbservicescheduledetails ON tbserviceschedulemaster.id = tbservicescheduledetails.servicemaster_id INNER JOIN tbcustomer ON tbserviceschedulemaster.customer_id = tbcustomer.id) ", conn))

            {
                DataTable dt = new DataTable();
                a.Fill(dt);
                conn.Close();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    events.Add(new Event
                    {
                       
                        EventName = dt.Rows[i]["name"].ToString(),
                        StartDate = DateTime.Parse(dt.Rows[i]["scheduledate"].ToString()).ToString("MM-dd-yyyy"),
                        EndDate = DateTime.Parse(dt.Rows[i]["scheduledate"].ToString()).ToString("MM-dd-yyyy"),
                        //ImageType = i % 2,
                        ImageType = 1,
                        //Url = @"http://www.google.com"
                        Url = "/Services.aspx?id=" + dt.Rows[i]["id"].ToString()
                    });

                }

            }

            return events;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }


    public class Event
    {
        public Guid EventID { get { return new Guid(); } }
        public string EventName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int ImageType { get; set; }
        public string Url { get; set; }
    }

}