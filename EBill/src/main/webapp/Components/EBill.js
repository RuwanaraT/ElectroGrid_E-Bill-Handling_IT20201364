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
 $("#formEBill").submit(); 
});

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 $("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val()); 
 $("#eaNumber").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#cusName").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#address").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#billingDate").val($(this).closest("tr").find('td:eq(3)').text()); 
 $("#amount").val($(this).closest("tr").find('td:eq(4)').text()); 
}); 

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