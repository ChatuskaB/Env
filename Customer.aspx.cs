using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;




namespace Enviro
{
    public partial class Customer : System.Web.UI.Page
    {
        static string ConString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        [WebMethod()]

        public static string SaveCustomer(string name, string address, string contact_no, string email, string plantname, string planttype, string plant_contactno, string plant_location, string plant_capacity)
        {


            if (name.Trim() == "" || name == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js1.Serialize("failed");
            }
            else if (address.Trim() == "" || address == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js2 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js2.Serialize("failed");
            }
            else if (contact_no.Trim() == "" || contact_no == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js3 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js3.Serialize("failed");
            }
            else if (email.Trim() == "" || email == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js4.Serialize("failed");
            }
            else if (plantname.Trim() == "" || plantname == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js5 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js5.Serialize("failed");
            }
            else if (planttype.Trim() == "" || planttype == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js6 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js6.Serialize("failed");
            }
            else if (plant_contactno.Trim() == "" || plant_contactno == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js7 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js7.Serialize("failed");
            }
            else if (plant_location.Trim() == "" || plant_location == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("failed");
            }
            else if (plant_capacity.Trim() == "" || plant_capacity == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js9 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js9.Serialize("failed");
            }
            else
            {



                MySqlConnection conn = new MySqlConnection(ConString);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("Insert into tbcustomer(name,address,contact_no,email) values (@pname,@pAdrss,@pContn,@pemail); Select LAST_INSERT_ID()", conn);


                MySqlParameter param1 = new MySqlParameter();
                param1.ParameterName = "@pname";
                param1.Value = name;
                cmd.Parameters.Add(param1);

                MySqlParameter param2 = new MySqlParameter();
                param2.ParameterName = "@pAdrss";
                param2.Value = address;
                cmd.Parameters.Add(param2);


                MySqlParameter param3 = new MySqlParameter();
                param3.ParameterName = "@pContn";
                param3.Value = contact_no;
                cmd.Parameters.Add(param3);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@pemail";
                param4.Value = email;
                cmd.Parameters.Add(param4);


                Int64 rf = Convert.ToInt64(cmd.ExecuteScalar());

                MySqlCommand cmd1 = new MySqlCommand("Insert into tbplant(plantname,planttype,plant_contactno,customer_id,plant_location,plant_capacity) values (@pPname,@pPtype,@pPcont," + rf + ",@pPloc,@pPcap)", conn);

                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@pPname";
                param5.Value = plantname;
                cmd1.Parameters.Add(param5);

                MySqlParameter param6 = new MySqlParameter();
                param6.ParameterName = "@pPtype";
                param6.Value = planttype;
                cmd1.Parameters.Add(param6);


                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@pPcont";
                param7.Value = plant_contactno;
                cmd1.Parameters.Add(param7);


                //MySqlParameter param8 = new MySqlParameter();
                //param8.ParameterName = "@pcusid";
                //param8.Value = rf;
                //cmd1.Parameters.Add(param8);

                MySqlParameter param9 = new MySqlParameter();
                param9.ParameterName = "@pPloc";
                param9.Value = plant_location;
                cmd1.Parameters.Add(param9);


                MySqlParameter param10 = new MySqlParameter();
                param10.ParameterName = "@pPcap";
                param10.Value = plant_capacity;
                cmd1.Parameters.Add(param10);

                int rff = cmd1.ExecuteNonQuery();
                conn.Close();

                var data = new { status = (rf > 0) };

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js.Serialize(data);
            }
        }





        [WebMethod()]
        public static string gridchange()
        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT tbcustomer.id, name,contact_no,email,plantname,planttype FROM tbcustomer INNER JOIN  tbplant ON tbcustomer.id = tbplant.id; ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }





        [WebMethod()]
        public static string getcustomerdtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT tbcustomer.id as cid, name,address,contact_no,email,plantname,planttype,plant_contactno,plant_location,plant_capacity, tbplant.id  as pid " +
                "FROM tbcustomer " +
                "INNER JOIN  tbplant ON tbcustomer.id = tbplant.customer_id WHERE tbcustomer.id  = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }





        [WebMethod()]
        public static string UpdateCustomer(string name, string contact_no, string email, string plantname, string planttype, int id)
        {


            MySqlConnection conn = new MySqlConnection(ConString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(
                "UPDATE  tbcustomer SET name = @pCusN, contact_no = @pCntNo, email = @pEmail  WHERE id='" + id + "' ", conn);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pCusN";
            param1.Value = name;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pCntNo";
            param2.Value = contact_no;
            cmd.Parameters.Add(param2);


            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@pEmail";
            param3.Value = email;
            cmd.Parameters.Add(param3);

            MySqlCommand cmd1 = new MySqlCommand(
                    "UPDATE  tbplant SET plantname = @pPname, planttype = @pPtype WHERE id='" + id + "' ", conn);

            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pPname";
            param4.Value = plantname;
            cmd1.Parameters.Add(param4);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pPtype";
            param5.Value = planttype;
            cmd1.Parameters.Add(param5);



            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }





        [WebMethod()]
        public static string popupdelete(string id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbcustomer WHERE  id='" + id + "' ", conn);

            int rf = cmd.ExecuteNonQuery();

            MySqlCommand cmd1 = new MySqlCommand("Delete from tbplant WHERE customer_id='" + id + "' ", conn);

            int rf1 = cmd1.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }





        // Plant Equipmnt Form //


        [WebMethod()]

        public static string SaveEquipment(string type, string discription, string unit_id, string serial_no, string module, string plant_id)
        {
           

            //    if (type.Trim() == "" || type == null)
            //{
            //    System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
            //    return js1.Serialize("failed");
            //}
            //else if (discription.Trim() == "" || discription == null)
            //{
            //    System.Web.Script.Serialization.JavaScriptSerializer js2 = new System.Web.Script.Serialization.JavaScriptSerializer();
            //    return js2.Serialize("failed");
            //}
            //else if (unit_id.Trim() == "" || unit_id == null)
            //{
            //    System.Web.Script.Serialization.JavaScriptSerializer js3 = new System.Web.Script.Serialization.JavaScriptSerializer();
            //    return js3.Serialize("failed");
            //}
            //else if (serial_no.Trim() == "" || serial_no == null)
            //{
            //    System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
            //    return js4.Serialize("failed");
            //}
            //else if (module.Trim() == "" || module == null)
            //{
            //    System.Web.Script.Serialization.JavaScriptSerializer js5 = new System.Web.Script.Serialization.JavaScriptSerializer();
            //    return js5.Serialize("failed");
            //}

            //else
            {



                MySqlConnection conn = new MySqlConnection(ConString);
                conn.Open();


                MySqlCommand cmd = new MySqlCommand("Insert into tbplant_equipment(type,discription,unit_id,serial_no,module,plant_id) values (@ptype,@pdis,@puid,@pseriolno,@pmodule,@ppid)", conn);
              

                MySqlParameter param1 = new MySqlParameter();
                param1.ParameterName = "@ptype";
                param1.Value = type;
                cmd.Parameters.Add(param1);

                MySqlParameter param2 = new MySqlParameter();
                param2.ParameterName = "@pdis";
                param2.Value = discription;
                cmd.Parameters.Add(param2);


                MySqlParameter param3 = new MySqlParameter();
                param3.ParameterName = "@puid";
                param3.Value = unit_id;
                cmd.Parameters.Add(param3);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@pseriolno";
                param4.Value = serial_no;
                cmd.Parameters.Add(param4);


                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@pmodule";
                param5.Value = module;
                cmd.Parameters.Add(param5);

                MySqlParameter param6  = new MySqlParameter();
                param6.ParameterName = "@ppid";
                param6.Value = plant_id;
                cmd.Parameters.Add(param6);



                int rf = cmd.ExecuteNonQuery();
                conn.Close();

                //Int64 rf1 = Convert.ToInt64(cmd.ExecuteScalar());

                var data = new { status = (rf > 0) };

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js.Serialize(data);
            }
        }






        [WebMethod()]
        public static string gridchange1(string id)
        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(

                   "select id,type,discription,unit_id,serial_no,module from tbplant_equipment WHERE plant_id= '" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }




        [WebMethod()]
        public static string getequipdtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
                    "Select id,type,discription,unit_id,serial_no,module from tbplant_equipment WHERE  id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }



        [WebMethod()]
        public static string UpdateEquipCustomer(string type, string discription, string unit_id, string serial_no, string module, string id)
        {


            MySqlConnection conn = new MySqlConnection(ConString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(
                "UPDATE tbplant_equipment SET type = @ptype, discription = @pdis, unit_id = @puid, serial_no = @pseriolno, module = @pmodule  WHERE id='" + id + "' ", conn);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@ptype";
            param1.Value = type;
            cmd.Parameters.Add(param1);

            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pdis";
            param2.Value = discription;
            cmd.Parameters.Add(param2);


            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@puid";
            param3.Value = unit_id;
            cmd.Parameters.Add(param3);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@pseriolno";
            param4.Value = serial_no;
            cmd.Parameters.Add(param4);


            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pmodule";
            param5.Value = module;
            cmd.Parameters.Add(param5);




            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }



        [WebMethod()]
        public static string popupdelete1(string id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbplant_equipment WHERE  id='" + id + "' ", conn);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }

    }




}



























