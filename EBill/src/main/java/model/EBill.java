package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.dbconnect;

public class EBill {
	
	// create object of dbconnect
	dbconnect dbconn = new dbconnect();
	
	// Insert Operation
	public String createEBill(String eaNumber, String cusName, String address, String billingDate, String amount) { 
		
	 String output = ""; 
	 try
	 { 
		 
	// create connection object & call the connection method	 
	 Connection con = dbconn.connect(); 
	 
	 if (con == null) {
		 return "Error while connecting to the database for creating e-bill."; 
	} 
	 
	 // create a prepared statement
	 String query = " INSERT INTO ebill (`billID`,`eaNumber`,`cusName`,`address`,`billingDate`,`amount`)" + " VALUES (?, ?, ?, ?, ?, ?)"; 
	 PreparedStatement preparedStmt = con.prepareStatement(query); 
	 
	 // binding values
	 preparedStmt.setInt(1, 0); 
	 //preparedStmt.setInt(2, eaNumber); 
	 preparedStmt.setInt(2, Integer.parseInt(eaNumber));
	 preparedStmt.setString(3, cusName); 
	 preparedStmt.setString(4, address); 
	 preparedStmt.setString(5, billingDate); 
	 //preparedStmt.setDouble(9, amount);
	 preparedStmt.setDouble(6, Double.parseDouble(amount));
	 
	 // execute the statement
	 preparedStmt.execute(); 
	 
	 // close the connection
	 con.close(); 
	 
	 output = "E-Bill Created Successfully."; 
	 
	 } catch (Exception e) { 
		 
	 output = "Error while Creating E-Bill."; 
	 System.err.println(e.getMessage()); 
	 
	 } 
	 
	 return output;
	 
	 }
	
	// Retrieve Operation for Display all the Bills
	public String DisplayEBills() {
		
	 String output = ""; 
	 
	 try{ 
		
	// create connection object & call the connection method
	 Connection con = dbconn.connect(); 
	 
	 if (con == null) {
		 return "Error while connecting to the database for display e-bills."; 
	 } 
	 
	 // prepare the e-bill to be displayed
	 output = "<center><table border='1' width='100%' ><tr> <th>Elec. Account No</th> <th>Customer Name</th> <th>Home Address</th> <th>Billing Date</th> <th>Bill Amount</th> <th>Edit</th> <th>Delete</th>"; 
	 
	 String query = "SELECT * FROM ebill"; 
	 Statement stmt = con.createStatement(); 
	 ResultSet rs = stmt.executeQuery(query); 
	 
	 // iterate through the rows in the result set
	 while (rs.next()) 
	 { 
	 String billID = Integer.toString(rs.getInt("billID")); 
	 String eaNumber = Integer.toString(rs.getInt("eaNumber"));
	 String cusName = rs.getString("cusName"); 
	 String address =  rs.getString("address"); 
	 String billingDate = rs.getString("billingDate"); 
	 String amount = Double.toString(rs.getDouble("amount"));
	 
	 // display body of the e-bill
	 output += "<tr> <td> <input id='hidItemIDUpdate' name='hidItemIDUpdate' type='hidden' value='" + billID + "'>"
			 + eaNumber + "</td>"; 
			 output += "<td>" + cusName + "</td>"; 
			 output += "<td>" + address + "</td>"; 
			 output += "<td>" + billingDate + "</td>"; 
			 output += "<td>" + amount + "</td>"; 
	 
	 // buttons
			 output += "<td> <input name='btnUpdate' type='button' value='Update' class=' btnUpdate btn btn-secondary'> </td> <td><form method='post' action='EBill.jsp'> <input name='btnRemove' type='submit' value='Remove' class='btn btn-danger'> <input name='hidItemIDDelete' type='hidden' value='" + billID + "'>" + "</form> </td> </tr>"; 
	 
	 } 
	 
	 con.close(); 
	 
	 // close the e-bill
	 output += "</table></center>"; 
	 
	 } catch (Exception e) { 
		 
	 output = "Error while Displaying E-Bills."; 
	 System.err.println(e.getMessage()); 
	 
	 } 
	 return output; 
	 
	 }
	
	
	// Update Operation
	public String updateEBill(String billID, String eaNumber, String cusName, String address, String billingDate, String amount) {
		
	 String output = ""; 
	 
	 try { 
		 
	 // create connection object & call the connection method	 
	 Connection con = dbconn.connect(); 
	 
	 if (con == null) {
		 return "Error while connecting to the database for updating e-bill."; 
	 } 
	 
	 // create a prepared statement
	 String query = "UPDATE ebill SET eaNumber=?,cusName=?,address=?,billingDate=?, amount=? WHERE billID=?"; 
	 PreparedStatement preparedStmt = con.prepareStatement(query); 
	 
	 // binding values
	 preparedStmt.setInt(1, Integer.parseInt(eaNumber)); 
	 preparedStmt.setString(2, cusName);
	 preparedStmt.setString(3, address);
	 preparedStmt.setString(4, billingDate); 
	 preparedStmt.setDouble(5, Double.parseDouble(amount)); 
	 preparedStmt.setInt(6, Integer.parseInt(billID)); 

	 // execute the statement
	 preparedStmt.execute(); 
	 
	 // close the connection
	 con.close(); 
	 
	 output = "E-Bill Updated successfully"; 
	 } 
	 
	 catch (Exception e) { 
	 output = "Error while Updating the E-Bill."; 
	 System.err.println(e.getMessage()); 
	 
	 } 
	 
	 return output; 
	 
	 }
	
	// Delete Operation
	public String deleteEBill(String billID) { 
		
	 String output = ""; 
	 try { 
	 // create connection object & call the connection method
	 Connection con = dbconn.connect();
	 
	 if (con == null) {
		 return "Error while connecting to the database for deleting e-bill."; 
	 } 
	 
	 // create a prepared statement
	 String query = "DELETE FROM ebill WHERE billID=?"; 
	 PreparedStatement preparedStmt = con.prepareStatement(query); 
	 
	 // binding values
	 preparedStmt.setInt(1, Integer.parseInt(billID));
	 
	 // execute the statement
	 preparedStmt.execute(); 
	 
	 // close the connection
	 con.close(); 
	 
	 output = "E-Bill Deleted successfully"; 
	 
	 } 
	 catch (Exception e) { 
	 output = "Error while Deleting the E-Bill."; 
	 System.err.println(e.getMessage()); 
	 
	 } 
	 
	 return output; 
	 
	 }
}
