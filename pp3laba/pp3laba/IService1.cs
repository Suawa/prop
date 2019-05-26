using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace pp3laba
{
	[ServiceContract]
	public interface IService1
	{
		[OperationContract]
		DataSet GetClient();

		[OperationContract]
		void InsertClient(string full_name);

		[OperationContract]
		void DeleteClient(int id);

		[OperationContract]
		void UpdateClient(int id, string full_name);

		[OperationContract]
		DataSet GetRequest();

		[OperationContract]
		void InsertRequest(int client_id, int service_id, int count);

		[OperationContract]
		void DeleteRequest(int id);

		[OperationContract]
		void UpdateRequest(int id, int count);

		[OperationContract]
		DataSet GetService();

		[OperationContract]
		void InsertService(string name, int price);

		[OperationContract]
		void DeleteService(int id);

		[OperationContract]
		void UpdateService(int id, string name, int price);
	}
}
