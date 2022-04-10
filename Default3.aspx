<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
  protected void EmployeesListView_OnItemCommand(object sender, ListViewCommandEventArgs e)
  {
    if (String.Equals(e.CommandName, "AddToList"))
    {
      // Verify that the employee ID is not already in the list. If not, add the
      // employee to the list.
      ListViewDataItem dataItem = (ListViewDataItem)e.Item;
      string employeeID = 
        EmployeesListView.DataKeys[dataItem.DisplayIndex].Value.ToString();

      if (SelectedEmployeesListBox.Items.FindByValue(employeeID) == null)
      {
          ListItem item = new ListItem(e.CommandArgument .ToString (), employeeID);
        SelectedEmployeesListBox.Items.Add(item);
      }
    }
  }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Employee List</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <asp:ListView runat="server" 
        ID="EmployeesListView"
        OnItemCommand="EmployeesListView_OnItemCommand"
        DataSourceID="EmployeesDataSource" 
        DataKeyNames="item_id">
        <LayoutTemplate>
          <table runat="server" id="tblEmployees" 
                 cellspacing="0" cellpadding="1" width="440px" border="1">
            <tr id="itemPlaceholder" runat="server"></tr>
          </table>
          <asp:DataPager ID="EmployeesDataPager" runat="server" PageSize="10">
            <Fields>
              <asp:NumericPagerField />
            </Fields>
          </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
          <tr id="Tr1" runat="server">
            <td>
              <asp:Label runat="server" ID="NameLabel" 
                Text='<%#Eval("descriptn") + ", " + Eval("item") %>' />
            </td>
            <td style="width:80px">
              <asp:LinkButton runat="server" 
                ID="SelectEmployeeButton" 
                Text="Add To List" 
                CommandName="AddToList" 
                CommandArgument='<%#Eval("descriptn") + ", " + Eval("item") %>' />
            </td>
          </tr>
        </ItemTemplate>
      </asp:ListView>

      <br /><br />
      <b>Selected Employees:</b><br />
      <asp:ListBox runat="server" ID="SelectedEmployeesListBox" Rows="10" Width="300px" />

      <!-- This example uses Microsoft SQL Server and connects      -->
      <!-- to the AdventureWorks sample database. Use an ASP.NET    -->
      <!-- expression to retrieve the connection string value       -->
      <!-- from the Web.config file.                                -->       
      <asp:SqlDataSource ID="EmployeesDataSource" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=C:\webshopping\App_Data\Dbshopping.mdf;Integrated Security=True;User Instance=True"
        SelectCommand="SELECT [item_id], [item], [descriptn]
                       FROM Tbl_item
                       ORDER BY [item], [item_id]">
      </asp:SqlDataSource>
    </form>
  </body>
</html>
