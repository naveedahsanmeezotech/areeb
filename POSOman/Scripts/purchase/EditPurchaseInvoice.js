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
    //tmpOrderID = getTmpOrderID();
    $('#btnSubmit').click(function () {
        var isValid = true;
        var accID = $('#AccountID option:selected').val();
        var InvoiceNo = $('#InvoiceNo').val();
        var PurchaseDate = $('#PurchaseDate').val();
        var amountPaid = $("#amountPaid").val();
        var paymentStatus = $('#PaymentStatus option:selected').val();
        //    var PaymentStatus = $('#PaymentStatus').val();
        var PaymentTypeID = $('#PaymentType option:selected').val();
        var BranchID = $('#BranchID option:selected').val();
        var Bank = $('#Bank option:selected').val();
        var ChqNo = $("#chqNumber").val();

        var chqDate = $('#chqDate').val();
        //   console.log("Branch ID on submit click is = "+BranchID);
        // var BranchID = $('#hdnBranchId').val();

        if (accID == "" || accID == 0 || accID == undefined) {
            isValid = false;
            swal("Vendor", "Please Select Vendor!", "error");
            //alert("Please Select Vendor");
        }
      
        else if (PurchaseDate == "" || PurchaseDate == null) {
            isValid = false;
            swal("Date", "Please Enter Purchase Date!", "error");
        }
        else if (InvoiceNo == "") {
            isValid = false;
            swal("Invoice No.", "Please Enter Invoice No!", "error");
        }
  
        else if (paymentStatus == 0) {
            isValid = false;
            swal("Payment Status.", "Please Select Payment Status!", "error");
        }
        else if ((paymentStatus == 1 || paymentStatus == 2) && (PaymentTypeID == "" || PaymentTypeID == undefined)) {

            isValid = false;
            swal("Payment Type.", "Please Select Payment Type!", "error");
        }
        else if ((paymentStatus == 2) && (amountPaid == "" || amountPaid == 0)) {
            isValid = false;
            swal("Amount Paid!", "Please Enter Amount!", "error");
        }
        else if ((PaymentTypeID == 3 || PaymentTypeID == 2) && (Bank == null || Bank == "" || Bank == undefined)) {
            isValid = false;
            console.log(Bank + "Bank");

            swal("Bank", "Please Select Bank Account!", "error");
        }
        else if (PaymentTypeID == 3 && (ChqNo == null || ChqNo == "")) {
            isValid = false;
            console.log(ChqNo + "ChqNo");


            swal("Cheque No.", "Please Enter Cheque Number!", "error");
        }
        else if (PaymentTypeID == 3 && (DatE == null || DatE == "") && (chqDate == null || chqDate == "" || chqDate == undefined)) {

            isValid = false;
            console.log(DatE + "chDate");
            console.log(chqDate + "chnewDate");

            swal("Date", "Please Enter Cheque Date!", "error");
            //console.log(PurchaseDate + "date");
        }
        else if (isValid == true) {
            uiBlock();
            insert();
        }
    });
    //$('#tbl').keyup(function (e) {
    //    var qty = $(e.target).closest("tr").find('input[id*="txtQty"]').val();
    //    var price = $(e.target).closest("tr").find('input[id*="txtPrice"]').val();
    //    var currency = $('#Currency').val();
    //    if (currency == 2) {
    //        var convRate = $('#exRate').val();
    //        price = price * convRate;
    //        $(e.target).closest("tr").find('input[id*="txtERate"]').val(price);
    //        //console.log("convRate = " + convRate);
    //        //console.log("newPrice = " + price);
    //    }
    //    if (($.isNumeric(price)) && ($.isNumeric(qty))) {
    //        var amount = (qty * price);
    //        $(e.target).closest('tr').find('input[id*="txtSub"]').val(parseFloat(amount).toFixed(3)
    //        );
    //        calcTotal();
    //    }
    //    else {
    //        $(e.target).closest('tr').find('input[id*="txtSub"]').val(''
    //        );
    //    }
    //});

    //get edit invoice detail 

    ////////////

    ////////////
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
        $('#vatAmount').val(parseFloat(vatAmount).toFixed(3));
    }
}
$("#vatInput").on("change", function () {
    calcVAT();
    getNewTotal();
    calcVatExpAmount();
});
//  Get New POID 
function getPOID() {
    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: '/PurchaseOrders/getNewPOID',
        async: true,
        success: function (data) {
            {
                $("#POID").val(data);
                POID = data;
            }
        },
        error: function (err) { console.log(err); }
    });
}

// if any of amount, expense , vat is changed call this to make effect every where 
function getNewTotal() {
    var gTotal = $("#subAmount").val();
    //var gTotal = $('#tbl tfoot tr').find('input[id*="txtTotal"]').val();
    var Expense = $('#expenseInput').val();
    var VAT = $('#vatAmount').val();
    if (Expense == "" || isNaN(Expense)) { Expense = 0; }
    if (VAT == "" || isNaN(VAT)) { VAT = 0; $('#inputVAT').val(0) }
    var newTotal = parseFloat(gTotal) + parseFloat(Expense) + parseFloat(VAT);
    var amountPaid = parseFloat(gTotal) + parseFloat(VAT);
    $('#TotalAmount').val(parseFloat(newTotal).toFixed(3));
    var payStatusSelection = $("#PaymentStatus").val();
    if (payStatusSelection == 1) {
        document.getElementById("amountPaid").value = parseFloat(amountPaid).toFixed(3);
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
        disableBank();
    }
});

function disableBank() {
    $("#Bank").prop("disabled", true);
    $("#chqNumber").prop("disabled", true);
    $("#chqDate").prop("disabled", true);
}
// Payment Type Change 
// Payment Type Change 
$("#PaymentType").on("change", function () {
    var PaymentTypeID = $('#PaymentType option:selected').val();
    //Cash
    if (PaymentTypeID == 1) {
        //$("#bankName").prop("disabled", true);
        $("#Bank").prop("disabled", true);
        $("#Bank").val(null);
        $("#chqNumber").prop("disabled", true);
        $("#chqNumber").val(null);
        $("#chqDate").prop("disabled", true);
        $("#chqDate").val(null);

    }
    // Bank
    else if (PaymentTypeID == 2) {
        //$("#bankName").prop("disabled", false);
        $("#Bank").prop("disabled", false);
        $("#chqNumber").prop("disabled", true);
        $("#chqNumber").val(null);

        $("#chqDate").prop("disabled", true);
        $("#chqDate").val(null);

    }
    // Cheque
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
   
    //  console.log("Branch ID on insert is = " + BranchID);
    $('#btnSubmit').prop('disabled', true);
    uiBlock();
    var rows = [];
    var stockLog = [];
    var total = 0;
    var qtyVE = 0;
    var isValid = false;
    totalInvoice = parseFloat($('#TotalAmount').val()).toFixed(2);
    var paidAmount = $('#amountPaid').val();
    var bank = $('#Bank option:selected').text();
    var bankAccountId = $('#Bank option:selected').val();
    //console.log(bankAccountId + " bankAccountId");
    var BranchID = $('#hdnBranchId').val();
    var OrderID = $('#OrderID').val();

   
    calcVatExpAmount();

    // 
    $('#tblProduct tbody tr').each(function (i, n) {
        var $row = $(n);
        var pId = $row.find('input[id*="productID"]').val();
        var qtyCTN = parseInt($row.find("#ProductQty").text());
        var price = $row.find("#ProductCostPrice").text();
        var salePrice = $row.find("#ProductSalePrice").text();
        var subTotal = $row.find("#ProductSubTotal").text();
        var qty = parseInt(qtyCTN);
        var unitCode = $row.find("#unitCode").text();

        if (pId != "" && qty != "" && qty != 0 && price != "" && price != 0) {
            isValid = true;
            rows.push({
                ProductId: pId,
                Qty: qty,
                UnitPrice: price,
                UnitCode: unitCode,
                IsReturned: false,
                ReturnedQty: 0,
                SalePrice: salePrice,
                Total: subTotal,
                BranchID: BranchID,

            });
            var newprice = parseFloat(price);
            stockLog.push({
                AccountID: $('#AccountID option:selected').val(),
                ProductId: pId,
                StockIN: qty,
                InvoiceDate: $('#PurchaseDate').val(),
                CostPrice: parseFloat(newprice).toFixed(2),
                SalePrice: salePrice,
                InReference: 'Purchase',
                OrderTypeID: 1,
                UserReferenceID: $('#InvoiceNo').val(),
                BranchID: BranchID,
                UnitCode: unitCode
            });
            //console.log('stockLog=' + stockLog[0].AccountID, stockLog[0].ProductId, stockLog[0].StockIN, stockLog[0].InvoiceDate, stockLog[0].CostPrice, stockLog[0].SalePrice, stockLog[0].InReference, stockLog[0].OrderTypeID, stockLog[0].UserReferenceID, stockLog[0].BranchID, stockLog[0].UnitCode);

        }
        else if (pId == "") {
            uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            isValid = false;
            swal("Product", "Please Select Product!", "error");
        }
        else if (qty == "" || qty == 0) {
            uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            isValid = false;
            swal("Quantity", "Please Enter Quantity!", "error");
        }
        else if (price == "" || price == 0) {
            uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            isValid = false;
            swal("Unit Cost", "Please Enter Unit Cost!", "error");
        }
        else {
            uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
            swal("Error", "Some error occured!", "error");
            //alert("Error!!!");
        }
    });
    if (rows.length && isValid == true) {
        var gTotal = $("#subAmount").val();
        //total = $('#tbl tfoot tr').find('input[id*="txtTotal"]').val();
        //total = $('#Total').val()
        var paymentStatus = 0;
        if ($('#PaymentStatus option:selected').val() != 0) {
            paymentStatus = $('#PaymentStatus option:selected').text()
        }
        var invoiceAmount = parseFloat(gTotal).toFixed(2);
        var data = {
            'AccountID': $('#AccountID option:selected').val(),
            'BranchID': BranchID,
            'POID': $("#POID").val(),
            'InvoiceNo': $('#InvoiceNo').val(),
            'PurchaseDate': $('#PurchaseDate').val(),
            'PaymentStatus': paymentStatus,
            'PaymentTypeID': $('#PaymentType option:selected').val(),
            'Expenses': $('#expenseInput').val(),
            'PurchaseCode': $('#PurchaseCode').val(),
            'TotalAmount': invoiceAmount,
            'ChequeDate': $("#chqDate").val(),
            'ChequeNo': $("#chqNumber").val(),
            'BankName': bank,
            'AmountPaid': $('#amountPaid').val(),
            'PODetails': rows
        };

        var json = JSON.stringify({ 'OrderId': OrderID, 'model': data, 'modelStockLog': stockLog, 'bankAccId': bankAccountId });
        //   console.log(json);
        ajaxCall("POST", json, "application/json; charset=utf-8", "/PurchaseOrders/SaveEditOrder", "json", onSuccess, onFailure);
        //debugger;
        function onSuccess(Result) {
            if (Result == "success") {
                deleteTempOrder(tmpOrderID);
                // in case of Purchase Order Submit
                var tOrderID = $('#tOrderID').val();
                var isPO = $('#hdnIsPO').val();
                //console.log(tOrderID);
                if (tOrderID > 0 && isPO == 1) {
                    updatePurchaseOrderStatus();
                }
                // in case of Unsaved Submit
                var oldtmpOrderID = $('#oldtmpOrderID').val();
                var isUnsaved = $('#hdnIsUnSaved').val();
                if (oldtmpOrderID > 0 && tOrderID > 0 && isUnsaved == 1) {
                    hideTempOrder(oldtmpOrderID, tOrderID);
                }
                uiUnBlock();
                window.location.href = '/PurchaseOrders/Index';
            }
            else {
                uiUnBlock();
                $('#btnSubmit').prop('disabled', false);
                swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
            }

        }
        function onFailure(error) {
            if (error.statusText == "OK") {
                window.location.reload();
            }
            else {
                swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
            }
        }
    }
    else {
        uiUnBlock();
        $('#btnSubmit').prop('disabled', false);
    }

}
function insertTempData() {

    var currencyID = $("#Currency").val();
    var exchangeRate = $('#exRate').val();
    var tempDetails = [];
    var total = 0;
    var qtyVE = 0;
    totalInvoice = $('#TotalAmount').val();
    // var BranchID = $('#hdnBranchId').val();
    var BranchID = $('#BranchID option:selected').val();
    //   console.log("Branch ID on submit click is = " + BranchID);

    $('#tblProduct tbody tr').each(function (i, n) {

        var $row = $(n);
        var pId = $row.find('input[id*="productID"]').val();
        var partNumber = $row.find("td").eq(2).text();
        var pLocation = $row.find("#Location").text();
        var qty = $row.find("#ProductQty").text();
        if (currencyID == 1) {
            price = $row.find("#ProductCostPrice").text();
        }
        else if (currencyID == 2) {
            price = $row.find("#exchangePrice").text();
        }
        //var newRate = $row.find('td:eq(9) input[type="Number"]').val();  // add new field to Database if required
        var salePrice = $row.find("#ProductSalePrice").text();
        var subTotal = $row.find("#ProductSubTotal").text();
        if (pId != "" && qty != "" && qty != 0 && price != "" && price != 0) {
            isValid = true;
            tempDetails.push({
                ProductId: pId,
                Qty: qty,
                UnitPrice: price,
                UnitCode: unitCode,
                IsReturned: false,
                ReturnedQty: 0,
                SalePrice: salePrice,
                Total: subTotal,
                BranchID: BranchID
            });
        }
    });
    if (tempDetails.length) {

        total = $('#SubTotal').val();
        // console.log(total);
        //total = $('#Total').val()
        var paymentStatus = 0;
        if ($('#PaymentStatus option:selected').val() != 0) {
            paymentStatus = $('#PaymentStatus option:selected').text()
        }
        var tmp_Order = {
            'AccountID': $('#AccountID option:selected').val(),
            'BranchID': BranchID,
            'POID': $("#POID").val(),
            'InvoiceNo': $('#InvoiceNo').val(),
            'PurchaseDate': $('#PurchaseDate').val(),
            'PaymentStatus': paymentStatus,
            'PaymentTypeID': $('#PaymentType option:selected').val(),
            'Expenses': $('#expenseInput').val(),
            'PurchaseCode': $('#PurchaseCode').val(),
            'TotalAmount': invoiceAmount,
            'ChequeDate': $("#chqDate").val(),
            'ChequeNo': $("#chqNumber").val(),
            'BankName': bank,
            'AmountPaid': $('#amountPaid').val(),
            'PODetails': rows

        };

        var json = JSON.stringify({ 'model': tmp_Order });
        //console.log(json);

        ajaxCall("POST", json, "application/json; charset=utf-8", "/PurchaseOrders/EditPurchase", "json", onSuccess, onFailure);
        function onSuccess(Result) {
            //if (Result == "success") {
            //    console.log("success");
            //}
            //else {
            //    swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
            //}
        }
        function onFailure(error) {
            if (error.statusText == "OK") {

            }
            else {
                swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
            }
        }

    }
}
$("#amountPaid").on("change", function () {
    calcAmountPaid();
});
// calculate balance if amountPaid entered and make changes every where needed
function calcAmountPaid() {
    var amountPaid = $("#amountPaid").val();
    var finalAmount = $('#TotalAmount').val();
    var payStatusSelection = $("#PaymentStatus").val();
    if (payStatusSelection == 2) {
        if (parseFloat(amountPaid) >= parseFloat(finalAmount)) {
            toastr.warning('Partial ! AmountPaid should be less than total amount ')
            $("#amountPaid").val(0)
        }
        else {
            var balance = parseFloat(finalAmount) - parseFloat(amountPaid);
            $("#balanceAmount").val(parseFloat(balance).toFixed(3));
        }
    }
    else {

        var balance = parseFloat(finalAmount) - parseFloat(amountPaid);
        $("#balanceAmount").val(parseFloat(balance).toFixed(3));
    }
}
function deleteTempOrder(tmpOrderID) {

    var json = { "tmpOrderID": tmpOrderID };
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/Purchase/deleteTempOrder',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {
        },
        error: function (err) { console.log(err); }
    });
}
