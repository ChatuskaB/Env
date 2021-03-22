using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using Newtonsoft.Json;
using System.Configuration;
using System.Web.Services;

namespace Enviro
{
    public partial class Services : System.Web.UI.Page
    {

        static string conString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod()]
        public static string GetCustomerNames()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(
              "select id,name from tbcustomer", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }





        [WebMethod()]

        public static string SaveServiceSchedule(int customer_id, int plant_id, string servicetype, string description)
        {

            string servicemaster_refno = System.Guid.NewGuid().ToString().ToUpper();


            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert into tbserviceschedulemaster(customer_id,plant_id,servicetype,description,servicemaster_refno,sermascreated_date) values(@pcustomer_id,@pplant_id,@pservicetype,@pdescription,@pservicemaster_refno,now())", conn);
            

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@pservicemaster_refno";
            param7.Value = servicemaster_refno;
            cmd.Parameters.Add(param7);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pcustomer_id";
            param.Value = customer_id;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pplant_id";
            param1.Value = plant_id;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pservicetype";
            param2.Value = servicetype;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pdescription";
            param3.Value = description;
            cmd.Parameters.Add(param3);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();

            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }


        [WebMethod()]
        public static string Gridchange()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
            //"select * from tbserviceschedulemaster", conn))

            "select tbserviceschedulemaster.id,tbserviceschedulemaster.customer_id,tbserviceschedulemaster.plant_id,tbserviceschedulemaster.servicemaster_refno,tbserviceschedulemaster.servicetype,tbserviceschedulemaster.description,tbserviceschedulemaster.sermascreated_date,tbcustomer.id,tbcustomer.name from tbserviceschedulemaster INNER JOIN tbcustomer ON tbserviceschedulemaster.customer_id = tbcustomer.id", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }


        [WebMethod()]
        public static string GetServiceScheduledtl(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(


                      "Select tbserviceschedulemaster.id, tbserviceschedulemaster.customer_id, tbserviceschedulemaster.plant_id, tbserviceschedulemaster.servicemaster_refno, tbserviceschedulemaster.servicetype, tbserviceschedulemaster.description,tbcustomer.id,tbcustomer.name from tbserviceschedulemaster INNER JOIN tbcustomer ON tbserviceschedulemaster.customer_id = tbcustomer.id WHERE  tbserviceschedulemaster.id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }




        [WebMethod()]

        public static string UpdateServiceSchedule(int customer_id, int plant_id, string servicetype, string description, string id)
        {
          

            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(

                 "UPDATE tbserviceschedulemaster SET customer_id = @pcustomer_id,plant_id = @pplant_id,servicetype = @pservicetype,description = @pdescription   WHERE id='" + id + "' ", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pcustomer_id";
            param.Value = customer_id;
            cmd.Parameters.Add(param);


            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pplant_id";
            param1.Value = plant_id;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pservicetype";
            param2.Value = servicetype;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pdescription";
            param3.Value = description;
            cmd.Parameters.Add(param3);

            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pid";
            param4.Value = id;
            cmd.Parameters.Add(param4);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }




        [WebMethod()]
        public static string popupdelete(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand(

           "Delete from tbserviceschedulemaster WHERE  id='" + id + "' ", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pid";
            param.Value = id;
            cmd.Parameters.Add(param);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }


        [WebMethod()]
        public static string SaveServiceDetail(int customer_id, string status, string description, int sermasid, DateTime scheduledate)
        {
            string servicedetail_refno = System.Guid.NewGuid().ToString().ToUpper();

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert into tbservicescheduledetails(customer_id,scheduledate,servicemaster_id,servicedetail_refno,status,description,serdetailcreated_date) values(@pcustomer_id,@pscheduledate,@pservicemaster_id,@pservicedetail_refno,@pstatus,@pdescription,now())", conn);


            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pcustomer_id";
            param.Value = customer_id;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pservicemaster_id";
            param1.Value = sermasid;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pservicedetail_refno";
            param2.Value = servicedetail_refno;
            cmd.Parameters.Add(param2);



            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pstatus";
            param4.Value = status;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pdescription";
            param5.Value = description;
            cmd.Parameters.Add(param5);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@pscheduledate";
            param6.Value = scheduledate;
            cmd.Parameters.Add(param6);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }




        [WebMethod()]
        public static string ServiceDetailsGridchange(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

            "SELECT tbservicescheduledetails.id,tbservicescheduledetails.customer_id,tbservicescheduledetails.scheduledate,tbservicescheduledetails.status,tbservicescheduledetails.description,tbcustomer.id,tbcustomer.name FROM tbservicescheduledetails INNER JOIN tbcustomer ON tbservicescheduledetails.customer_id = tbcustomer.id WHERE tbservicescheduledetails.servicemaster_id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }


        [WebMethod()]
        public static string GetServiceDetailsdtl(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                      "Select tbservicescheduledetails.id,tbservicescheduledetails.customer_id,tbservicescheduledetails.scheduledate,tbservicescheduledetails.status,tbservicescheduledetails.description,tbcustomer.id,tbcustomer.name from tbservicescheduledetails INNER JOIN tbcustomer ON tbservicescheduledetails.customer_id = tbcustomer.id WHERE  tbservicescheduledetails.id='" + id + "' ", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }




        [WebMethod()]

        public static string UpdateServiceDetails(DateTime scheduledate, string status, string description, string id)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(

                 "UPDATE tbservicescheduledetails SET scheduledate = @pscheduledate,status = @pstatus,description = @pdescription   WHERE id='" + id + "' ", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pscheduledate";
            param.Value = scheduledate;
            cmd.Parameters.Add(param);


            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pstatus";
            param1.Value = status;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pdescription";
            param2.Value = description;
            cmd.Parameters.Add(param2);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pid";
            param4.Value = id;
            cmd.Parameters.Add(param4);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }




        [WebMethod()]
        public static string ServiceDetailsPopupDelete(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbservicescheduledetails WHERE  id='" + id + "' ", conn);
            int rf = cmd.ExecuteNonQuery();
            conn.Close();

            //return status
            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }

    }
}