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
    public partial class InquiryList : System.Web.UI.Page
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

        public static string SaveInquiry(string type, string contact_no, string email, DateTime date, DateTime time, int customer_id, string inquiry)
        {

            string inq_refno = System.Guid.NewGuid().ToString().ToUpper();


            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert into tbinquiry(type,contact_no,email,date,time,customer_id,inquiry,inq_refno) values(@ptype,@pcontact_no,@pemail,@pdate,@ptime,@pcustomer_id,@pinquiry,@inq_refno)", conn);

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@inq_refno";
            param7.Value = inq_refno;
            cmd.Parameters.Add(param7);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@ptype";
            param.Value = type;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pcontact_no";
            param1.Value = contact_no;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pemail";
            param2.Value = email;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pdate";
            param3.Value = date;
            cmd.Parameters.Add(param3);

            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@ptime";
            param4.Value = time;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pcustomer_id";
            param5.Value = customer_id;
            cmd.Parameters.Add(param5);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@pinquiry";
            param6.Value = inquiry;
            cmd.Parameters.Add(param6);



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
                   //"select * from tbinquiry WHERE  is_deleted='" + 0 + "' ", conn))

                   //"select tbinquiry.id,tbinquiry.type,tbinquiry.contact_no,tbinquiry.email,tbinquiry.date,tbinquiry.time,tbinquiry.customer_id,tbinquiry.inquiry,tbinquiry.is_deleted,tbinquiry.inq_refno from tbinquiry WHERE  is_deleted='" + 0 + "' ", conn))

                   "select tbinquiry.id,tbinquiry.type,tbinquiry.contact_no,tbinquiry.email,tbinquiry.date,tbinquiry.time,tbinquiry.customer_id,tbinquiry.inquiry,tbinquiry.is_deleted,tbinquiry.inq_refno,tbcustomer.id,tbcustomer.name from tbinquiry INNER JOIN tbcustomer ON tbinquiry.customer_id = tbcustomer.id WHERE  is_deleted='" + 0 + "' ", conn))


            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }


        [WebMethod()]
        public static string SearchGridchange(string type)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter b = new MySqlDataAdapter(

             "select * from tbinquiry WHERE type LIKE '%" + type + "%' && is_deleted='" + 0 + "'  ", conn))

            {
                DataTable t = new DataTable();
                b.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }



        [WebMethod()]
        public static string GetInquirydtl(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(


              //"Select id, type, contact_no, email, date, time, customer_id, inquiry,inq_refno from tbinquiry WHERE  id='" + id + "' ", conn))

              "Select tbinquiry.id, tbinquiry.type, tbinquiry.contact_no, tbinquiry.email, tbinquiry.date, tbinquiry.time, tbinquiry.customer_id, tbinquiry.inquiry,inq_refno,tbcustomer.id,tbcustomer.name from tbinquiry INNER JOIN tbcustomer ON tbinquiry.customer_id = tbcustomer.id WHERE  tbinquiry.id='" + id + "' ", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }


        [WebMethod()]
     
        public static string UpdateInquiry(string type,string contact_no, string email, DateTime date, DateTime time, int customer_id, string inquiry, string id)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(

                 "UPDATE tbinquiry SET type = @ptype,contact_no = @pcontact_no,email = @pemail,date = @pdate,time = @ptime,customer_id = @pcustomer_id,inquiry = @pinquiry   WHERE id='" + id + "' ", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@ptype";
            param.Value = type;
            cmd.Parameters.Add(param);


            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pcontact_no";
            param1.Value = contact_no;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pemail";
            param2.Value = email;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pdate";
            param3.Value = date;
            cmd.Parameters.Add(param3);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@ptime";
            param4.Value = time;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pcustomer_id";
            param5.Value = customer_id;
            cmd.Parameters.Add(param5);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@pinquiry";
            param6.Value = inquiry;
            cmd.Parameters.Add(param6);

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@pid";
            param7.Value = id;
            cmd.Parameters.Add(param7);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }


        [WebMethod()]
        public static string popupclose(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand(

           "UPDATE tbinquiry SET is_deleted = '1'   WHERE id='" + id + "' ", conn);

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
        public static string SaveQuotation(int customer_id, DateTime quotationdate, string status, string notes, int qid, string quatationSavedPath)
        {
            string quatation_refno = System.Guid.NewGuid().ToString().ToUpper();

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert into tbquotaion(customer_id,quotationdate,status,notes,quatation_refno,inquiry_id,quatationSavedPath) values(@pcustomer_id,@pquotationdate,@pstatus,@pnotes,@quatation_refno,@inquiry_id,@quatationSavedPath)", conn);


            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pcustomer_id";
            param.Value = customer_id;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pquotationdate";
            param1.Value = quotationdate;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pstatus";
            param2.Value = status;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pnotes";
            param3.Value = notes;
            cmd.Parameters.Add(param3);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@quatation_refno";
            param4.Value = quatation_refno;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@inquiry_id";
            param5.Value = qid;
            cmd.Parameters.Add(param5);


            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@quatationSavedPath";
            param6.Value = quatationSavedPath;
            cmd.Parameters.Add(param6);


            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }


        [WebMethod()]
        public static string GetQuotaiondtl(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                 "Select tbquotaion.id, tbquotaion.customer_id, tbquotaion.quotationdate, tbquotaion.status, tbquotaion.notes, tbquotaion.quatation_refno,tbcustomer.id,tbcustomer.name from tbquotaion INNER JOIN tbcustomer ON tbquotaion.customer_id = tbcustomer.id WHERE  tbquotaion.id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }








        //[WebMethod()]

        //public static string UpdateQuotaion(int customer_id, DateTime quotationdate, string status, string notes,  string quatationSavedPath, string id)
        //{


        //    MySqlConnection conn = new MySqlConnection(conString);

        //    conn.Open();

        //    MySqlCommand cmd = new MySqlCommand(

        //         "UPDATE tbquotaion SET customer_id = @pcustomer_id,quotationdate = @pquotationdate,status = @pstatus,notes = @pnotes,quatationSavedPath = @pquatationSavedPath   WHERE id='" + id + "' ", conn);

        //    MySqlParameter param = new MySqlParameter();
        //    param.ParameterName = "@pcustomer_id";
        //    param.Value = customer_id;
        //    cmd.Parameters.Add(param);


        //    MySqlParameter param1 = new MySqlParameter();
        //    param1.ParameterName = "@pquotationdate";
        //    param1.Value = quotationdate;
        //    cmd.Parameters.Add(param1);

        //    MySqlParameter param2 = new MySqlParameter();
        //    param2.ParameterName = "@pstatus";
        //    param2.Value = status;
        //    cmd.Parameters.Add(param2);

        //    MySqlParameter param3 = new MySqlParameter();
        //    param3.ParameterName = "@pnotes";
        //    param3.Value = notes;
        //    cmd.Parameters.Add(param3);


        //    MySqlParameter param4 = new MySqlParameter();
        //    param4.ParameterName = "@pquatationSavedPath";
        //    param4.Value = quatationSavedPath;
        //    cmd.Parameters.Add(param4);

        //    MySqlParameter param5 = new MySqlParameter();
        //    param5.ParameterName = "@pid";
        //    param5.Value = id;
        //    cmd.Parameters.Add(param5);

        //    int rf = cmd.ExecuteNonQuery();
        //    conn.Close();


        //    var data = new { status = (rf > 0) };

        //    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //    return js.Serialize(data);
        //}


        [WebMethod()]
        public static string QuotaionGridchange(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                "SELECT tbquotaion.id,tbquotaion.quotationdate,tbquotaion.customer_id,tbquotaion.status,tbquotaion.notes,tbcustomer.id,tbcustomer.name FROM tbquotaion INNER JOIN tbcustomer ON tbquotaion.customer_id = tbcustomer.id WHERE tbquotaion.inquiry_id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }


        [WebMethod()]
        public static string QuotaionPopupDelete(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbquotaion WHERE  id='" + id + "' ", conn);
            int rf = cmd.ExecuteNonQuery();
            conn.Close();

            //return status
            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }



        [WebMethod()]
        public static string SaveSitevisit(int customer_id, string pumps, string tanks, string others, DateTime sitevisitdate, int plant_id, int qid)

        {
            string sitevisit_refno = System.Guid.NewGuid().ToString().ToUpper();

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert into tbsite_visit(customer_id,pumps,tanks,others,sitevisitdate,plant_id,inquiry_id,sitevisit_refno) values(@pcustomer_id,@ppumps,@ptanks,@pothers,@psitevisitdate,@pplant_id,@inquiry_id,@sitevisit_refno)", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pcustomer_id";
            param.Value = customer_id;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@ppumps";
            param1.Value = pumps;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@ptanks";
            param2.Value = tanks;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pothers";
            param3.Value = others;
            cmd.Parameters.Add(param3);

            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@psitevisitdate";
            param4.Value = sitevisitdate;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pplant_id";
            param5.Value = plant_id;
            cmd.Parameters.Add(param5);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@sitevisit_refno";
            param6.Value = sitevisit_refno;
            cmd.Parameters.Add(param6);


            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@inquiry_id";
            param7.Value = qid;
            cmd.Parameters.Add(param7);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();

            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);


        }


        [WebMethod()]
        public static string SiteVisitGridchange(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

            "SELECT tbsite_visit.id,tbsite_visit.customer_id,tbsite_visit.pumps,tbsite_visit.tanks,tbsite_visit.others,tbsite_visit.sitevisitdate,tbcustomer.id,tbcustomer.name FROM tbsite_visit INNER JOIN tbcustomer ON tbsite_visit.customer_id = tbcustomer.id WHERE tbsite_visit.inquiry_id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }



        [WebMethod()]
        public static string GetSitevisitdtl(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                      "Select id, pumps, tanks, others,plant_id,sitevisitdate from tbsite_visit WHERE  id='" + id + "' ", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }


        [WebMethod()]

        public static string UpdateSitevisit(string pumps, string tanks, string others, DateTime sitevisitdate, int plant_id, string id)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(

                 
            "UPDATE tbsite_visit SET pumps = @ppumps,tanks = @ptanks,others = @pothers,sitevisitdate = @psitevisitdate,plant_id = @pplant_id   WHERE id='" + id + "' ", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@ppumps";
            param.Value = pumps;
            cmd.Parameters.Add(param);


            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@ptanks";
            param1.Value = tanks;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pothers";
            param2.Value = others;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@psitevisitdate";
            param3.Value = sitevisitdate;
            cmd.Parameters.Add(param3);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pplant_id";
            param4.Value = plant_id;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pid";
            param5.Value = id;
            cmd.Parameters.Add(param5);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }


        [WebMethod()]
        public static string GetSiteVisitdtl(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                 "Select id, sitevisitdate, pumps, tanks, others from tbsite_visit WHERE  id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }



        [WebMethod()]
        public static string SiteVisitPopupDelete(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbsite_visit WHERE  id='" + id + "' ", conn);
            int rf = cmd.ExecuteNonQuery();
            conn.Close();

            //return status
            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }



        [WebMethod()]
        public static string SaveJob(DateTime jobdate, int customer_id, string notes, string discription, string jobcostsheet, int qid)

        {
            string job_refno = System.Guid.NewGuid().ToString().ToUpper();

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert into tbjob(jobdate,customer_id,notes,discription,jobcostsheet,jobrefno,inquiry_id) values(@pjobdate,@pcustomer_id,@pnotes,@pdiscription,@jobcostsheet,@job_refno,@pinquiry_id)", conn);

            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pjobdate";
            param.Value = jobdate;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@job_refno";
            param1.Value = job_refno;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@jobcostsheet";
            param2.Value = jobcostsheet;
            cmd.Parameters.Add(param2);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pcustomer_id";
            param3.Value = customer_id;
            cmd.Parameters.Add(param3);

            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pnotes";
            param4.Value = notes;
            cmd.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pdiscription";
            param5.Value = discription;
            cmd.Parameters.Add(param5);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@pinquiry_id";
            param6.Value = qid;
            cmd.Parameters.Add(param6);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();

            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }


        [WebMethod()]
        public static string JobGridchange(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                "SELECT tbjob.jobdate,tbjob.customer_id,tbjob.jobrefno,tbjob.notes,tbjob.discription,tbcustomer.id,tbcustomer.name FROM tbjob INNER JOIN tbcustomer ON tbjob.customer_id = tbcustomer.id WHERE tbjob.inquiry_id='" + id + "' ", conn))


            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }

    }
}