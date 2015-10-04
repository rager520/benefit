using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Gateway;
using PageAdmin;
public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       Member_Valicate MCheck=new Member_Valicate();
       MCheck.Member_Check("cn");
       Data_Bind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

       //��ʱ���충���ţ�

        System.DateTime currentTime=new System.DateTime(); 
            currentTime=System.DateTime.Now;
            string out_trade_no = currentTime.ToString("g");
            out_trade_no = out_trade_no.Replace("-", "");
            out_trade_no = out_trade_no.Replace(":", "");
            out_trade_no = out_trade_no.Replace(" ", "");
       //ҵ�������ֵ��
        string gateway = T_gateway.Text;	//'֧���ӿ�
        string service = T_service.Text;
        string partner = T_partner.Text;		//partner		�������ID			�����ֶ�
        string sign_type = T_sign_type.Text;
        string subject =  T_subject.Text;	//subject		��Ʒ����
        string body = T_body.Text;		//body			��Ʒ����    
        string payment_type = T_payment_type.Text;                  //֧������	
        string total_fee=T_total_fee.Text;                      //�ܽ��					0.01��50000.00
        string show_url = T_show_url.Text;
        string seller_email = T_seller_email.Text;             //�����˺�
        string key = T_key.Text;              //partner�˻���֧������ȫУ����
        string return_url = T_return_url.Text; //������֪ͨ���ؽӿ�
        string notify_url =T_notify_url.Text; //������֪ͨ���ؽӿ�
        string _input_charset = T_inputchatset.Text;
        AliPay ap = new AliPay();
        string aliay_url=ap.CreatUrl(
            gateway, 
            service, 
            partner, 
            sign_type,
            out_trade_no,
            subject, 
            body,
            payment_type, 
            total_fee, 
            show_url, 
            seller_email,
            key, 
            return_url,
            _input_charset,
            notify_url
            );
      
        Response.Redirect(aliay_url);

    }

void Data_Bind()
 {
   string sql="select top 1 * from onlinepay where onlinepay_type='alipay'";
   Conn Myconn=new Conn();
   OleDbConnection conn=new OleDbConnection(Myconn.Constr());
   conn.Open();
   OleDbCommand Comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=Comm.ExecuteReader();
   if(dr.Read())
    {   
      T_total_fee.Attributes.Add("onkeyup","if(isNaN(value))execCommand('undo')");
      T_partner.Text=dr["onlinepay_partnerid"].ToString();
      T_seller_email.Text=dr["onlinepay_mid"].ToString();
      T_key.Text=dr["onlinepay_key"].ToString();
      T_return_url.Text="http://"+Request.ServerVariables["SERVER_NAME"]+"/member/onlinepay/alipay/Alipay_Return.aspx";
      T_notify_url.Text="http://"+Request.ServerVariables["SERVER_NAME"]+"/member/onlinepay/alipay/Alipay_Notify.aspx";
      if(T_show_url.Text=="")
       {
         T_show_url.Text=Request.ServerVariables["SERVER_NAME"];
       }
      Button1.Attributes.Add("onclick","return C_Tb()");
    }   
   else
    {
      Response.End();
    }
   conn.Close();
  
 }
  
}