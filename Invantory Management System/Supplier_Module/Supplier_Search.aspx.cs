using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory_Management_System
{
    public partial class SearchSupplier : System.Web.UI.Page
    {
        string cs = @"Data Source=(localdb)\MSSQLLocalDB;
                      Initial Catalog=Inventory;
                      Integrated Security=True;";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearResults();
            }
        }


        // =========================================================
        // SEARCH BUTTON
        // =========================================================

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchType = ddlSearchType.SelectedValue;
            string searchValue = txtSearch.Text.Trim();

            ClearResults();

            if (string.IsNullOrEmpty(searchValue))
            {
                ShowMessage("Please Enter A Search Value");
                return;
            }


            // ================= SUPPLIER ID =================

            if (searchType == "ID")
            {
                SearchBySupplierById(searchValue);
            }


            // ================= SUPPLIER NAME =================

            else if (searchType == "NAME")
            {
                SearchBySupplierByName(searchValue);
            }


            // ================= SUPPLIER CATEGORY =================

            else if (searchType == "CATEGORY")
            {
                SearchBySupplierCategory(searchValue);
            }
        }


        // =========================================================
        // SEARCH BY SUPPLIER ID
        // =========================================================

        private void SearchBySupplierById(string supplierId)
        {
            string query = @"
                SELECT
                    sup_id,
                    sup_name,
                    sup_age,
                    sup_gender,
                    sup_category,
                    sup_contact,
                    sup_email,
                    sup_address,
                    sup_userid,
                    sup_password
                FROM supplier
                WHERE sup_id = @sup_id";


            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sup_id", supplierId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    da.Fill(dt);


                    if (dt.Rows.Count == 0)
                    {
                        lblIdNoResult.Text =
                            "No supplier found with Supplier ID: " +
                            supplierId;

                        lblIdNoResult.Visible = true;

                        return;
                    }


                    rptSupplierById.DataSource = dt;
                    rptSupplierById.DataBind();

                    pnlIdResult.Visible = true;
                }
            }
        }


        // =========================================================
        // SEARCH BY SUPPLIER NAME
        // =========================================================

        private void SearchBySupplierByName(string supplierName)
        {
            string query = @"
                SELECT
                    sup_id,
                    sup_name,
                    sup_age,
                    sup_gender,
                    sup_category,
                    sup_contact,
                    sup_email,
                    sup_address
                FROM supplier
                WHERE sup_name LIKE @sup_name
                ORDER BY sup_id";


            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@sup_name",
                        "%" + supplierName + "%"
                    );

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    da.Fill(dt);


                    if (dt.Rows.Count == 0)
                    {
                        lblSearchNoResult.Text =
                            "No supplier found with name: " +
                            supplierName;

                        lblSearchNoResult.Visible = true;

                        return;
                    }


                    gvSupplierSearch.DataSource = dt;
                    gvSupplierSearch.DataBind();

                    pnlSearchResult.Visible = true;
                }
            }
        }


        // =========================================================
        // SEARCH BY SUPPLIER CATEGORY
        // =========================================================

        private void SearchBySupplierCategory(string category)
        {
            string query = @"
                SELECT
                    sup_id,
                    sup_name,
                    sup_age,
                    sup_gender,
                    sup_category,
                    sup_contact,
                    sup_email,
                    sup_address
                FROM supplier
                WHERE sup_category = @sup_category
                ORDER BY sup_name";


            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@sup_category",
                        category
                    );

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    da.Fill(dt);


                    if (dt.Rows.Count == 0)
                    {
                        lblSearchNoResult.Text =
                            "No supplier found in category: " +
                            category;

                        lblSearchNoResult.Visible = true;

                        return;
                    }


                    gvSupplierSearch.DataSource = dt;
                    gvSupplierSearch.DataBind();

                    pnlSearchResult.Visible = true;
                }
            }
        }


        // =========================================================
        // SUPPLIER ID GRID - EDIT / DELETE
        // =========================================================

        protected void rptSupplierById_ItemCommand(
    object source,
    RepeaterCommandEventArgs e)
        {
            string supplierId = e.CommandArgument.ToString();


            // ================= EDIT =================

            if (e.CommandName == "EditSupplier")
            {
                Response.Redirect(
                    "Supplier_Edit.aspx?sup_id=" +
                    Server.UrlEncode(supplierId)
                );
            }


            // ================= DELETE =================

            else if (e.CommandName == "DeleteSupplier")
            {
                DeleteSupplier(supplierId);

                // Search again after delete
                SearchBySupplierById(
                    txtSearch.Text.Trim()
                );
            }
        }


        // =========================================================
        // SUPPLIER SEARCH GRID - VIEW
        // =========================================================

        protected void gvSupplierSearch_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewSupplier")
            {
                string supplierId =
                    e.CommandArgument.ToString();


                Response.Redirect(
                    "Supplier_Edit.aspx?sup_id=" +
                    Server.UrlEncode(supplierId)
                );
            }
        }


        // =========================================================
        // DELETE SUPPLIER
        // =========================================================

        private void DeleteSupplier(string supplierId)
        {
            string query = @"
                DELETE FROM supplier
                WHERE sup_id = @sup_id";


            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@sup_id",
                        supplierId
                    );

                    con.Open();

                    int rows =
                        cmd.ExecuteNonQuery();


                    if (rows > 0)
                    {
                        ShowMessage(
                            "Supplier " +
                            supplierId +
                            " Deleted Successfully"
                        );
                    }
                    else
                    {
                        ShowMessage(
                            "Supplier could not be deleted."
                        );
                    }
                }
            }
        }


        // =========================================================
        // GRID ROW DATA BOUND
        // =========================================================

        protected void gvSupplierById_RowDataBound(
            object sender,
            GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btnDelete =
                    (LinkButton)e.Row.FindControl("btnDelete");

                if (btnDelete != null)
                {
                    btnDelete.OnClientClick =
                        "return confirm('Are you sure you want to delete this supplier?');";
                }
            }
        }


        // =========================================================
        // CLEAR ALL RESULTS
        // =========================================================

        private void ClearResults()
        {
            pnlIdResult.Visible = false;

            pnlSearchResult.Visible = false;


            lblIdNoResult.Visible = false;

            lblSearchNoResult.Visible = false;


            lblIdNoResult.Text = "";

            lblSearchNoResult.Text = "";


            rptSupplierById.DataSource = null;
            rptSupplierById.DataBind();


            gvSupplierSearch.DataSource = null;

            gvSupplierSearch.DataBind();
        }


        // =========================================================
        // SHOW MESSAGE
        // =========================================================

        private void ShowMessage(string message)
        {
            lblIdNoResult.Text = message;

            lblIdNoResult.Visible = true;
        }
    }
}