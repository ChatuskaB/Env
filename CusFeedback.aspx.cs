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
    public partial class CusFeedback : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.AppSettings["ConString"];

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod()]
        public static string GetQuestions()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(
              "select id,question from tbfeedbackques", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }
        }



        [WebMethod()]
        //public static string SaveQuestions(int quesid, int answer, int customer_id)
        public static string SaveAnswers(int id, int answer)
        {

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            //MySqlCommand cmd = new MySqlCommand("Insert into tbfeedbackans(quesid,answer,customer_id) values(@quesid,@answer,@pcustomer_id)", conn);
            MySqlCommand cmd = new MySqlCommand("Insert into tbfeedbackans(quesid,answer) values(@quesid,@answer)", conn);


            MySqlParameter param = new MySqlParameter();
            param.ParameterName = "@pquesid";
            param.Value = id;
            cmd.Parameters.Add(param);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@panswer";
            param1.Value = answer;
            cmd.Parameters.Add(param1);

            //MySqlParameter param2 = new MySqlParameter();
            //param2.ParameterName = "@pcustomer_id";
            //param2.Value = customer_id;
            //cmd.Parameters.Add(param2);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }



    }
}