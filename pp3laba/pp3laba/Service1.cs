using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using MySql.Data.MySqlClient;

namespace pp3laba
{
	public class Service1 : IService1
    {
        DataSet ds;
        MySqlDataAdapter adapter;
        MySqlCommand command;
        MySqlParameter parameter;

		string conn = "Server=127.0.0.1;Port=3306;Database=pp;User Id=root;Password=";

		public DataSet GetClient()
        {
            string proc = "client_select";
            using(MySqlConnection con=new MySqlConnection(conn))
            {
                con.Open();
                adapter = new MySqlDataAdapter(proc, con);
                ds = new DataSet();
                adapter.Fill(ds, "Client");
                con.Close();
            }
            return ds;
        }

        public void InsertClient(string full_name)
        {
            string proc = "client_add";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "full_name", Value = full_name };
                command.Parameters.Add(parameter);
                command.ExecuteNonQuery();
                con.Close();
            }
        }

        public void DeleteClient(int id)
        {
            string proc = "client_delete";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "id", Value = id };
                command.Parameters.Add(parameter);
                command.ExecuteNonQuery();
                con.Close();
            }
        }

        public void UpdateClient(int id, string full_name)
        {
            string proc = "client_change";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "id", Value = id };
                command.Parameters.Add(parameter);
                command.Parameters.Add(new MySqlParameter { ParameterName = "full_name", Value = full_name });
                command.ExecuteNonQuery();
                con.Close();
            }
        }

        public DataSet GetRequest()
        {
            string proc = "request_select";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                adapter = new MySqlDataAdapter(proc, con);
                ds = new DataSet();
                adapter.Fill(ds, "Request");
                con.Close();
            }
            return ds;
        }
        public void InsertRequest(int client_id, int service_id, int count)
        {
            string proc = "request_add";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "client_id", Value = client_id };
                command.Parameters.Add(parameter);
				command.Parameters.Add(new MySqlParameter { ParameterName = "service_id", Value = service_id });
				command.Parameters.Add(new MySqlParameter { ParameterName = "cnt", Value = count });
				var result = command.ExecuteNonQuery();
                con.Close();
            }
        }

        public void DeleteRequest(int id)
        {
            string proc = "request_delete";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "id", Value = id };
                command.Parameters.Add(parameter);
                command.ExecuteNonQuery();
                con.Close();
            }
        }

        public void UpdateRequest(int id, int count)
        {
            string proc = "request_change";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "cnt", Value = count };
                command.Parameters.Add(parameter);
                command.Parameters.Add(new MySqlParameter { ParameterName = "id", Value = id });
                command.ExecuteNonQuery();
                con.Close();
            }
        }

        public DataSet GetService()
        {
            string proc = "service_select";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                adapter = new MySqlDataAdapter(proc, con);
                ds = new DataSet();
                adapter.Fill(ds, "Service");
                con.Close();
            }
            return ds;
        }

        public void InsertService(string name, int price)
        {
            string proc = "service_add";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "name", Value = name };
                command.Parameters.Add(parameter);
                command.Parameters.Add(new MySqlParameter { ParameterName = "price", Value = price });
				var result = command.ExecuteNonQuery();
                con.Close();
            }
        }

        public void DeleteService(int id)
        {
            string proc = "service_delete";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
                parameter = new MySqlParameter { ParameterName = "id", Value = id };
                command.Parameters.Add(parameter);
                command.ExecuteNonQuery();
                con.Close();
            }
        }

        public void UpdateService(int id, string name, int price)
        {
            string proc = "service_change";
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                con.Open();
                command = new MySqlCommand(proc, con);
                command.CommandType = CommandType.StoredProcedure;
				command.Parameters.Add(new MySqlParameter { ParameterName = "name", Value = name });
				command.Parameters.Add(new MySqlParameter { ParameterName = "price", Value = price });
				command.Parameters.Add(new MySqlParameter { ParameterName = "id", Value = id });
				command.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}
