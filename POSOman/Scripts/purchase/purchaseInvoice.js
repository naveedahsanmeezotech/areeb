var controlId = 0;
var vehControlId = 0;
var totalQty = 0;
var perPieceExp = 0;
var perProductExp = 0;
var expensePercentage = 0;
var tmpOrderID = 0;
var POID = 0;
getPOID();
$("#Bank").prop("disabled", true);
//Attach input width
$(function () {    
   // tmpOrderID = getTmpOrderID();        
    $('#btnSubmit').click(function () {        
       //else if (InvoiceNo == "") {
            //isValid = false;
          //  swal("Invoice No.", "Please Enter Invoice No!", "error");         
        //      }
    
            insert();
        
    });    
})
//function getTmpOrderID() {
//    $.ajax({
//        type: "GET",
//        contentType: "application/json; charset=utf-8",
//        url: '/TempPO/getTmpOrderID',
//        async: true,
//        success: function (data) {
//            //console.log("tmpOrderID"+data);
//            $("#tmpOrderID").val(data);
//            tmpOrderID = data;
//        },
//        error: function (err) { console.log(err); }
//    });
//}
function calcVAT() {
    var vat = parseFloat($('#vatInput').val());
    if (vat == "" || isNaN(vat)) {
        vat = 0; $('#vatInput').val(0)
        $('#vatAmount').val(parseFloat(0));
    }
    else {
        var totalInvoice = $("#subAmount").val();
        //var totalInvoice = parseFloat($('#tbl tfoot tr').find('input[id*="txtTotal"]').val());
        var vatAmount = parseFloat((vat * totalInvoice) / 100);
        $('#vatAmount').val(parseFloat(vatAmount).toFixed(2));
        console.log("vatAmount=" + vatAmount);
    }
}
$("#vatInput").on("change", function () {
    calcVAT();
    getNewTotal();
    calcVatExpAmount();
    calcAmountPaid();
});
//  Get New POID 

// if any of amount, expense , vat is changed call this to make effect every where 
function getNewTotal() {
    var gTotal = $("#subAmount").val();
    //var gTotal = $('#tbl tfoot tr').find('input[id*="txtTotal"]').val();
    var Expense = 0;//$('#expenseInput').val();
    var VAT = 0;//$('#vatAmount').val();
    //if (Expense == "" || isNaN(Expense)) { Expense = 0; }
    //if (VAT == "" || isNaN(VAT)) { VAT = 0; $('#inputVAT').val(0) }
    var newTotal = parseFloat(gTotal) + parseFloat(VAT);
    var amountPaid = parseFloat(gTotal) + parseFloat(VAT);
    $('#TotalAmount').val(parseFloat(newTotal).toFixed(2));
    var payStatusSelection = $("#PaymentStatus").val();
    if (payStatusSelection == 1) {
        document.getElementById("amountPaid").value = parseFloat(amountPaid).toFixed(2) || 0;
        var balance = parseFloat(newTotal) - parseFloat(amountPaid);
        $("#balanceAmount").val(parseFloat(balance).toFixed(2));
    }
    else if (payStatusSelection == 2) {
        
    }
}
$("#expenseInput").on("change", function () {
    getNewTotal();
    calcVatExpAmount();
});
// Payment Status DropDOwn, Action according to Payment Status Selection
$("#PaymentStatus").on("change", function () {
    var payStatusSelection = $("#PaymentStatus").val();
    var totalAmount = $("#TotalAmount").val();
    if (payStatusSelection == 1) {
        document.getElementById("amountPaid").readOnly = true;
        getNewTotal();        
        $("#PaymentType").prop("disabled", false);        
    }
    else if (payStatusSelection == 2) {
        document.getElementById("amountPaid").readOnly = false;
        $("#PaymentType").prop("disabled", false);
        document.getElementById("amountPaid").value = 0;        
    }
    else if (payStatusSelection == 3) {
        document.getElementById("amountPaid").readOnly = true;
        document.getElementById("amountPaid").value = 0;
        $("#PaymentType").prop("disabled", true);
        $("#balanceAmount").val(parseFloat(totalAmount).toFixed(2));
        getNewTotal();
        disableBank();
    }
});

function disableBank() {
    $("#Bank").prop("disabled", true);
    $("#chqNumber").prop("disabled", true);
    $("#chqDate").prop("disabled", true);
}
// Payment Type Change 
$("#PaymentType").on("change", function () {
    var PaymentTypeID = $('#PaymentType option:selected').val();
    //Cash
    if (PaymentTypeID == 1) {
        //$("#bankName").prop("disabled", true);
        $("#Bank").prop("disabled", true);
        $("#chqNumber").prop("disabled", true);
        $("#chqDate").prop("disabled", true);
    }
        // Bank
    else if (PaymentTypeID == 2) {
        //$("#bankName").prop("disabled", false);
        $("#Bank").prop("disabled", false);
        $("#chqNumber").prop("disabled", true);
        $("#chqDate").prop("disabled", true);
    }        // Cheque
    else if (PaymentTypeID == 3) {
        //$("#bankName").prop("disabled", false);
        $("#Bank").prop("disabled", false);
        $("#chqNumber").prop("disabled", false);
        $("#chqDate").prop("disabled", false);
    }
});
function calcVatExpAmount() {
    var vat = parseFloat($('#vatAmount').val());
    var exp = parseFloat($('#expenseInput').val());
    var productTotal = $("#subAmount").val();
    if (vat == "" || isNaN(vat)) {
        vat = 0;
        $('#vatInput').val(0);
    }
    if (exp == "" || isNaN(exp)) {
        exp = 0; $('#expenseInput').val(0);
    }
    //calcTotalQty();
    if (exp > 0 || vat > 0) {
        var totalParts = $('#tblProduct tbody tr').length;
        var totalVATExp = parseFloat(exp) + parseFloat(vat);
        expensePercentage = parseFloat(totalVATExp) / parseFloat(productTotal);        
    }
}
function insert() {
    $('#btnSubmit').prop('disabled', true);
    //uiBlock();
    var rows = [];
    var stockLog = [];
    var total = 0;
    var qtyVE = 0;
    var isValid = false;
    totalInvoice = parseFloat($('#TotalAmount').val()).toFixed(2);    
    //console.log(bankAccountId + " bankAccountId");
    var BranchID = $('#hdnBranchId').val();
    $('#tblProduct tbody tr').each(function (i, n) {
        var $row = $(n);
        var pId = $row.find('input[id*="productID"]').val();
        var qtyCTN = parseInt($row.find("#ProductQty").text());
        var price = $row.find("#ProductCostPrice").text();             
        var ProductDescription = $row.find("#ProductDescription").text();
        var qty = parseInt(qtyCTN);
                
        if (pId != "" && qty != "" && qty != 0 && price != "" && price != 0) {
            isValid = true;
            rows.push({
                MaterailId: pId,
                Qty: qty,
                Price: price,
                Description: ProductDescription,
                });
            var newprice = parseFloat(price);
            stockLog.push({
                VendorId: $('#VendorId option:selected').val(),
                ProductId: pId,
                StockIN: qty,
                InvoiceDate: $('#DateIssued').val(),
                CostPrice: parseFloat(newprice).toFixed(2),
                SalePrice: "00",
                InReference: 'Purchase',
                OrderTypeID: 1,
                UserReferenceID: $('#InvoiceNo').val(),
                
            });
            //console.log('stockLog=' + stockLog[0].AccountID, stockLog[0].ProductId, stockLog[0].StockIN, stockLog[0].InvoiceDate, stockLog[0].CostPrice, stockLog[0].SalePrice, stockLog[0].InReference, stockLog[0].OrderTypeID, stockLog[0].UserReferenceID, stockLog[0].BranchID, stockLog[0].UnitCode);
            
        }
        else if (pId == "") {
           // uiUnBlock();
            $('#btnSubmit').prop('disabled', false);            
            isValid = false;
            swal("Product", "Please Select Product!", "error");            
        }
        else if (qty == "" || qty == 0) {
          //  uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            isValid = false;
            swal("Quantity", "Please Enter Quantity!", "error");            
        }
        else if (price == "" || price == 0) {
          //  uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            isValid = false;
            swal("Unit Cost", "Please Enter Unit Cost!", "error");            
        }
        else {
          //  uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            swal("Error", "Some error occured!", "error");
            //alert("Error!!!");
        }
    });
    
    if (rows.length && isValid == true) {
        var gTotal = $("#subAmount").val();
        //total = $('#tbl tfoot tr').find('input[id*="txtTotal"]').val();
        //total = $('#Total').val()
        var invoiceAmount = parseFloat(gTotal).toFixed(2);

        var data = {
            'VendorId': $('#VendorId option:selected').val(),
            'QuotationNo': $('#Quotation').val(),
            'TotalAmount': $('#TotalAmount').val(),
            'ReferenceNumber': $('#RefNo').val(),
            'QuotationDetails': rows
        };
       
        var json = JSON.stringify({ 'model': data, 'modelStockLog': stockLog });
        console.log(data);
        debugger
        $.ajax({
            type: 'POST',
            url: '/Purchase/SaveQuotationDetail',
            dataType: 'json',
            async: false,
            data: { 'model': data, 'modelStockLog': stockLog },
            success: function (result) {
               // console.log(result);
                //alert(result);

                if (result == "success") {
                    swal(result, "success", "success");

                    //deleteTempOrder(tmpOrderID);
                    // in case of Purchase Order Submit

                    window.location.href = '/Purchase/Index';
                } else {
                    swal("Error", "Some error occured!", "error");

                }
            },
            error: function (ex) {

            }
        });



        //ajaxCall("POST", json, "application/json; charset=utf-8", "/Purchase/SaveQuotationDetail", "json", onSuccess, onFailure);
        ////debugger;
        //function onSuccess(Result) {
        //    if (Result == "success") {                
        //        //deleteTempOrder(tmpOrderID);
        //        // in case of Purchase Order Submit
        //        var tOrderID = $('#tOrderID').val();
        //        var isPO = $('#hdnIsPO').val();
        //        //console.log(tOrderID);               
        //        uiUnBlock();                
        //        window.location.href = 'Index';
        //    }
        //    else {
        //        uiUnBlock();
        //        $('#btnSubmit').prop('disabled', false);
        //        swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");                
        //    }            
        //}
        //function onFailure(error) {
        //    if (error.statusText == "OK") {
        //        window.location.reload();
        //    }
        //    else {
        //        swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
        //    }
        //}
    }
    else
    {
        uiUnBlock();
        $('#btnSubmit').prop('disabled', false);
    }

}
$("#amountPaid").on("change", function () {
    calcAmountPaid();
});
// calculate balance if amountPaid entered and make changes every where needed
function calcAmountPaid() {    
    var amountPaid = $("#amountPaid").val();
    //var finalAmount = $('#TotalAmount').val();
    var finalAmount = $('#subAmount').val();
    var payStatusSelection = $("#PaymentStatus").val();
    if (payStatusSelection == 2) {
        if (parseFloat(amountPaid) >= parseFloat(finalAmount)) {
            toastr.warning('Partial ! AmountPaid should be less than total amount ')
            $("#amountPaid").val(0)
        }
        else {
            var balance = parseFloat(finalAmount) - parseFloat(amountPaid);
            $("#balanceAmount").val(parseFloat(balance).toFixed(2));
        }
    }
    else {

        var balance = parseFloat(finalAmount) - parseFloat(amountPaid);
        $("#balanceAmount").val(parseFloat(balance).toFixed(2));
    }
}
