<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="900px">
                <InsertItemTemplate>
                    comment:<br /> <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' Height="300px" TextMode="MultiLine" Width="900px" />
                    <br />
                    author:<asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' Width="850px" />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="留言" CausesValidation="True" CommandName="Insert" OnClick="Button1_Click"/>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" InsertCommand="INSERT INTO [comments] ([author], [comment]) VALUES (@author, @comment)">
                <InsertParameters>
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="comment" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="comment" SortExpression="comment">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("comment") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" BackColor="#CCCCFF" Height="200px" ReadOnly="True" Text='<%# Eval("comment") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                            <br /><br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                    <asp:BoundField DataField="datetime" HeaderText="datetime" SortExpression="datetime" DataFormatString="{0:yyyy/MM/dd}" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:asp_demoConnectionString %>" SelectCommand="SELECT * FROM [comments]" DeleteCommand="DELETE FROM [comments] WHERE [id] = @id" InsertCommand="INSERT INTO [comments] ([author], [comment], [datetime]) VALUES (@author, @comment, @datetime)" UpdateCommand="UPDATE [comments] SET [author] = @author, [comment] = @comment, [datetime] = @datetime WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="comment" Type="String" />
                    <asp:Parameter Name="datetime" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="comment" Type="String" />
                    <asp:Parameter Name="datetime" Type="DateTime" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
