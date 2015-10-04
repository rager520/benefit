using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Net;


public partial class Alipay_Notify : System.Web.UI.Page
{   
    
    /// <summary>
    /// created by sunzhizhi 2006.5.21,sunzhizhi@msn.com��
    /// </summary>

    public static string GetMD5(string s)
    {

        /// <summary>
        /// ��ASP���ݵ�MD5�����㷨
        /// </summary>

        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] t = md5.ComputeHash(Encoding.GetEncoding("utf-8").GetBytes(s));
        StringBuilder sb = new StringBuilder(32);
        for (int i = 0; i < t.Length; i++)
        {
            sb.Append(t[i].ToString("x").PadLeft(2, '0'));
        }
        return sb.ToString();
    }
    public static string[] BubbleSort(string[] R)
    {
        /// <summary>
        /// ð������
        /// </summary>

        int i, j; //������־ 
        string temp;

        bool exchange;

        for (i = 0; i < R.Length; i++) //�����R.Length-1������ 
        {
            exchange = false; //��������ʼǰ��������־ӦΪ��

            for (j = R.Length - 2; j >= i; j--)
            {
                if (System.String.CompareOrdinal(R[j + 1], R[j]) < 0)��//��������
                {
                    temp = R[j + 1];
                    R[j + 1] = R[j];
                    R[j] = temp;

                    exchange = true; //�����˽������ʽ�������־��Ϊ�� 
                }
            }

            if (!exchange) //��������δ������������ǰ��ֹ�㷨 
            {
                break;
            }

        }
        return R;
    }
    //��ȡԶ�̷�����ATN���
    public String Get_Http(String a_strUrl, int timeout)
    {
        string strResult;
        try
        {

            HttpWebRequest myReq = (HttpWebRequest)HttpWebRequest.Create(a_strUrl);
            myReq.Timeout = timeout;
            HttpWebResponse HttpWResp = (HttpWebResponse)myReq.GetResponse();
            Stream myStream = HttpWResp.GetResponseStream();
            StreamReader sr = new StreamReader(myStream, Encoding.Default);
            StringBuilder strBuilder = new StringBuilder();
            while (-1 != sr.Peek())
            {
                strBuilder.Append(sr.ReadLine());
            }

            strResult = strBuilder.ToString();
        }
        catch (Exception exp)
        {

            strResult = "����" + exp.Message;
        }

        return strResult;
    }

 public string  Get_Alipay()
     {
       PageAdmin.Conn Myconn=new PageAdmin.Conn();
       string constr=Myconn.Constr();
       string sql="select top 1 * from onlinepay where onlinepay_type='alipay'";
       OleDbConnection conn=new OleDbConnection(constr);
       conn.Open();
       string Val;
       OleDbCommand comm=new OleDbCommand(sql,conn);
       OleDbDataReader dr=comm.ExecuteReader();
       if(dr.Read())  
        { 
           Val=dr["onlinepay_key"].ToString()+","+dr["onlinepay_partnerid"].ToString();
        }
      else
        {
          Val="";
          Response.Write("error");
          Response.End();
        }
       conn.Close();
       return Val;
     }

    protected void Page_Load(object sender, EventArgs e)
    {
        /// <summary>
        /// created by sunzhizhi 2006.5.21,sunzhizhi@msn.com��
        /// </summary>
        string alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?";
        string[] Alipay_Val=Get_Alipay().Split(',');
        string partner = Alipay_Val[0]; 		//partner�������id��������д��
        string key = Alipay_Val[1]; //partner �Ķ�Ӧ���װ�ȫУ���루������д��

        alipayNotifyURL = alipayNotifyURL + "service=notify_verify" + "&partner=" + partner + "&notify_id=" + Request.Form["notify_id"];

        //��ȡ֧����ATN���ؽ����true����ȷ�Ķ�����Ϣ��false ����Ч��
        string responseTxt = Get_Http(alipayNotifyURL, 120000);
       


        int i;
        NameValueCollection coll;
        //Load Form variables into NameValueCollection variable.
        coll = Request.Form;

        // Get names of all forms into a string array.
        String[] requestarr = coll.AllKeys;
 
       

        //��������
        string[] Sortedstr = BubbleSort(requestarr);

      

        //�����md5ժҪ�ַ��� ��
        string prestr = "";
        for (i = 0; i < Sortedstr.Length; i++)
        {
            if (Request.Form[Sortedstr[i]] != "" && Sortedstr[i] != "sign" && Sortedstr[i] != "sign_type")
            {
                if (i == Sortedstr.Length - 1)
                {
                    prestr = prestr + Sortedstr[i] + "=" + Request.Form[Sortedstr[i]];
                }
                else
                {
                    prestr = prestr + Sortedstr[i] + "=" + Request.Form[Sortedstr[i]] + "&";
                }
            }

        }
        prestr = prestr + key;

        string mysign = GetMD5(prestr);


        string sign = Request.Form["sign"];
       


        if (mysign == sign && responseTxt == "true")   //��֤֧������������Ϣ��ǩ���Ƿ���ȷ
       {
           if (Request.Form["trade_status"] == "TRADE_SUCCESS")// WAIT_SELLER_SEND_GOODS  �ж�֧��״̬���ĵ�����ö�ٱ���Բο���            
            {


                //�����Լ����ݿ�Ķ�����䣬���Լ���дһ��



                Response.Write("success");     //���ظ�֧������Ϣ���ɹ�
            }

            else
            {
                Response.Write("fail");
            }
           
        }

       
    }

  
   
}
