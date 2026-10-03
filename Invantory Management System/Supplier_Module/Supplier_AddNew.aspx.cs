
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Inventory_Management_System
{
    public partial class Supplier_AddNew : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Inventory;Integrated Security=True"
        );

        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SupplierId();

                lblRegistrationDate.Text =
                    DateTime.Now.ToString("dd-MM-yyyy");
            }
        }


        // Generate Supplier ID
        void SupplierId()
        {
            cmd = new SqlCommand(
        "SELECT ISNULL(MAX(CAST(SUBSTRING(sup_id,5,LEN(sup_id)) AS INT)),100)+1 AS sup_id FROM supplier ORDER BY sup_id ASC",
        con
    );

            da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);

            lblSupplierID.Text = "SUP-" +
                ds.Tables[0].Rows[0][0].ToString();
        }




        protected void Button1_Click1(object sender, EventArgs e)
        {
            string gender = "";

            if (RadioButton1.Checked)
            {
                gender = "Male";
            }
            else if (RadioButton2.Checked)
            {
                gender = "Female";
            }
            else
            {
                gender = "Other";
            }


            string sup =
                "INSERT INTO Supplier " +
                "(sup_id, sup_name, sup_age, sup_gender, sup_category, " +
                "sup_contact, sup_email, sup_address, sup_userid, " +
                "sup_password, sup_registerdate) " +

                "VALUES (" +
                "'" + lblSupplierID.Text + "', " +
                "'" + TextBox2.Text + "', " +
                "'" + TextBox3.Text + "', " +
                "'" + gender + "', " +
                "'" + ddlProductCategory.SelectedValue + "', " +
                "'" + TextBox4.Text + "', " +
                "'" + TextBox5.Text + "', " +
                "'" + TextBox6.Text + "', " +
                "'" + TextBox7.Text + "', " +
                "'" + TextBox8.Text + "', " +
                "'" + DateTime.Now.ToString("yyyy-MM-dd") + "')";


            cmd = new SqlCommand(sup, con);

            da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);


            ClientScript.RegisterStartupScript(this.GetType(), "SaveSupplier",
                "alert('Supplier Details Saved Successfully'); window.location='Supplier_AddNew.aspx';", true);
        }
    }
}
