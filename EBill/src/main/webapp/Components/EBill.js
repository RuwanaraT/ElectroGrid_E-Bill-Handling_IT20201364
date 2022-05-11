$(document).ready(function() 
{ 
if ($("#alertSuccess").text().trim() == "") 
 { 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 

// SAVE ============================================
$(document).on("click", "#btnSubmit", function(event) 
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateEBillForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "EBillAPI", 
 type : type, 
 data : $("#formEBill").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemSaveComplete(response.responseText, status); 
 } 
 }); 
});

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
$("#hidItemIDSave").val($(this).data("itemid")); 
 $("#eaNumber").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#cusName").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#address").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#billingDate").val($(this).closest("tr").find('td:eq(3)').text()); 
  $("#amount").val($(this).closest("tr").find('td:eq(4)').text()); 
});

// DELETE===========================================
$(document).on("click", ".btnRemove", function(event) { 
 $.ajax( 
 { 
 url : "EBillAPI", 
 type : "DELETE", 
 data : "billID=" + $(this).data("itemid"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemDeleteComplete(response.responseText, status); 
 } 
 }); 
});

function onItemSaveComplete(response, status) { 
	
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 
 if (resultSet.status.trim() == "success") { 
	
 $("#alertSuccess").text("Successfully Saved."); 
 $("#alertSuccess").show(); 
 $("#tab").html(resultSet.data); 
 
 } else if (resultSet.status.trim() == "error") { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 }
  else if (status == "error") { 
	
 $("#alertError").text("Error while Saving."); 
 $("#alertError").show(); 
 
 } else { 
	
 $("#alertError").text("Unknown error While Saving !"); 
 $("#alertError").show();
  
 } 

 $("#hidItemIDSave").val(""); 
 $("#formItem")[0].reset(); 
}

function onItemDeleteComplete(response, status) 
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully Deleted."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error While Deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown Error While Deleting.."); 
 $("#alertError").show(); 
 } 
}

// CLIENT-MODEL================================================================

function validateEBillForm() { 
	
 var tmp = $("#eaNumber").val().trim(); 
 if (!$.isNumeric(tmp)) 
 { 
 return "Insert a Numerical Value for Electricity Account Number."; 
 }
	
// eaNumber
/*if ($("#eaNumber").val().trim() == "") 
 { 
 return "Insert Electricity Account Number."; 
 }*/
// cusName
if ($("#cusName").val().trim() == "") 
 { 
 return "Insert Customer Name."; 
 } 

// address-------------------------------
if ($("#address").val().trim() == "") 
 { 
 return "Insert Home Address."; 
 } 
 
 // billingDate-------------------------------
if ($("#billingDate").val().trim() == "") 
 { 
 return "Insert Billing Date."; 
 } 
 
// is numerical value
var tmpPrice = $("#amount").val().trim(); 
if (!$.isNumeric(tmpPrice)) 
 { 
 return "Insert a Numerical Value for Bill Amount."; 
 } 
// convert to decimal price
 $("#amount").val(parseFloat(tmpPrice).toFixed(2)); 


return true; 
} 