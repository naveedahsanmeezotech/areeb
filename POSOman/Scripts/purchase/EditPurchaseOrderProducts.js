$tableItemCounter = 0;
var $addedProductIDs = [];
var QtyinPack = 0;
var PackLength = 0;
var PrUntLnth = 0;
var OrderId = $('#OrderID').val();
var Count = 0;
var DatE = null;


$("#BranchID").prop('disabled', true);
$("#btnRemove").prop('disabled', false);

GetEditVendors(OrderId);
//Edit Vendor

function GetEditVendors(OrderId) {
   
    if (OrderId == "")
    { OrderId = -1; }
    var json = { "OrderId": OrderId };

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/PurchaseOrders/GetEditInvoiceVendor',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {

            $('#AccountID').val(data[0].Qry.Value).trigger('change.select2');

            
            //console.log(data[0].Qry1.Name);
         
            $('#BranchID').val(data[0].Qry1.Value).trigger('change.select2');
            //$('#OpeningBal').val(data[0].Qry2);
            var vendorID = $('#AccountID').val();
            $('#hdnAccountID').val(vendorID);      
            
            getVendorDetail(vendorID);

            $('#PaymentStatus').val(data[0].PayStatus).trigger('change.select2');
             if (data[0].PayStatus == 3) {
                $("#PaymentType").prop('disabled', true);
            }
            $("#Bank").val(data[0].Bank.Value).trigger('change.select2');
            DatE = data[0].ChqDate;


            // $('#chqDate').val(DatE.dateFormat("dd/MM/yy"));
            $('#chqNumber').val(data[0].Cheque);
            $('#amountPaid').val(data[0].AmountPaid);
            $('#vatAmount').val(data[0].Tax);
            //$('#finalAmountWithVAT').val(data[0].FinalAmount);
            $('#TotalAmount').val(data[0].TotalAmount);
            $('#subAmount').val(data[0].SubAmount);
            $('#discInput').val(data[0].Discount);
            $('#InvoiceNo').val(data[0].InvNo);


            // console.log(DatE + "ch20Date");

            ////////////populate product edit table/////////////
            data[0].ProductsList.forEach(ListProduct);
            // console.log(data[0].Paytype+"Pay");
            ////////////////////////
           // console.log(data);
            // console.log(data[0].ProductsList);

            if (data[0].Paytype == "" || data[0].Paytype == null) {
            }
            else {
                $('#PaymentType').val(data[0].Paytype.Value).trigger('change.select2');
                if (data[0].Paytype.Value == 1) {
                    $("#Bank").prop("disabled", true);
                    $("#chqNumber").prop("disabled", true);
                    $("#chqDate").prop("disabled", true);
                }
                else if (data[0].Paytype.Value == 2) {
                    $("#Bank").prop("disabled", false);
                    $("#chqNumber").prop("disabled", true);
                    $("#chqDate").prop("disabled", true);
                }
                else {
                    $("#Bank").prop("disabled", false);
                    $("#chqNumber").prop("disabled", false);
                    $("#chqDate").prop("disabled", false);
                }
            }
        },
        error: function (err) { console.log(err); }
    });
}
//function for edit product list
////////////
function ListProduct(item) {
    var pid = '<input type="hidden" id="productID"  value="' + item.ProductID + '"/>';
  
    var cPrice = '<input type="hidden" id="costPrice" value="' + item.cPrice + '"/>';
    var qtyBox = parseInt(item.Qty);
    var unitPerCTN = parseInt(item.UnitPerCarton);

  //  var qty = parseInt(qtyBox / unitPerCTN);
    //console.log("unitPerCTN=" + unitPerCTN);
    //console.log("qty=" + qty);
    //var unitCTN = '<input type="hidden" id="unitPerCTN" value="' + unitPerCTN + '"/>';
    var markup = "<tr><td><input type='radio' name='record'></td><td>" + item.Cat + "</td><td>" + pid + "" + item.ProductName + "</td><td  hidden>" + item.UnitCode+ "</td><td contenteditable='false' id='ProductQty'>" + item.Qty + "</td><td contenteditable='true' id='ProductCostPrice'>" + item.Unit_Price + "</td><td contenteditable='true' id='ProductSalePrice'>" + item.SalePrice + "</td><td id='ProductSubTotal'>" + item.PTotal + "</td></tr>";
    
    //var markup = "<tr><td><input type='radio' name='record'></td><td>" + item.Cat + "</td><td>" + item.ProductID + "</td><td>" + item.UnitCode + "</td><td contenteditable='false' id='ProductQty'>" + item.Qty + "</td><td contenteditable='true' id='ProductCostPrice'>" + item.Unit_Price + "</td><td contenteditable='true' id='ProductSalePrice'>" + item.SalePrice + "</td><td id='ProductSubTotal'>" + item.PTotal + "</td></tr>";

    
    $("#tblProduct tbody").append(markup);
    $tableItemCounter++;
    $addedProductIDs.push(item.Product);
    proIdEdit = item.ProductID;
}
function GetEditProductDetail(OrderId, ProductID, BranchID) {


    var json = { "OrderId": OrderId, "ProductID": ProductID, "BranchID": BranchID };
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/PurchaseOrders/GetEditProductDetail',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {   

            var prodID = parseInt(data[0].productID);
            //$('#ddlProduct').val(prodID).trigger('change.select2');
            $('#ddlProduct').val(data[0].ProductName).trigger('change.select2');

          
            $('#ddlCategory').val(data[0].Cat).trigger('change.select2');
           
            $('#SubTotal').val(data[0].PTotal);
          
            $('#SalePrice').attr('placeholder', data[0].SalePrice);
           //// var qtyBox = parseInt(data[0].ProductsList.Qty);
           //// var unitPerCTN = parseInt(data[0].ProductsList.UnitPerCarton);
           // var qty = parseInt(qtyBox / unitPerCTN);
            $('#Qty').val(data[0].Qty);            
            $('#UnitPrice').val(data[0].Unit_Price);
            getDetail(data[0].ProductID)
            var VatInput = data;

            // getDetail(data[0].ProductsList.ProductID);
            $("#addRow").prop('disabled', false);
            $("#btnRemove").prop('disabled', true);
            $("#btnEdit").prop('disabled', true);
    
        },
        error: function (err) { console.log(err); }
    });
}
function EditProduct(input) {

    $("table tbody").find('input[name="record"]').each(function () {
        if ($(this).is(":checked")) {

            $(this).parents("tr").remove();
            $tableItemCounter--;
            var row = $(this).closest("tr");
            var productID = row.find('input[id*="productID"]').val(); // find hidden id 
            //console.log(productID + "IN Edit Function");

            var index = $.inArray(productID, $addedProductIDs);
            if (index >= 0) { $addedProductIDs.splice(index, 1); }
            var BranchID = $("#hdnBranchId").val();
       
            GetEditProductDetail(OrderId, productID, BranchID);
            //console.log($tableItemCounter + "EditCounter");
            Count = $tableItemCounter;
            //console.log(Count + "EditCountSameCounter");
            // var index = $.inArray(productID, $addedProductIDs);
            //if (index >= 0) { $addedProductIDs.splice(index, 1); }
            calcTotal();
        }
    });
}

function remove(input) {
    $("table tbody").find('input[name="record"]').each(function () {
        if ($(this).is(":checked")) {
            $(this).parents("tr").remove();
            $tableItemCounter--;
            var row = $(this).closest("tr");
            calcTotal();
            var productID = row.find('input[id*="productID"]').val(); // find hidden id 
            var index = $.inArray(productID, $addedProductIDs);
            if (index >= 0) { $addedProductIDs.splice(index, 1); }
        }
    });
}
$('#Qty').on('input', function (e) {
    var qty = $('#Qty').val();
    var unitPerCarton = $('#unitPerCarton').val();
    var units = parseFloat(qty * unitPerCarton).toFixed(0);
    $('#BOX').val(units);
    calcSubTotal();
});

//////////////////
$('#UnitPrice').on('input', function (e) {

    calcSubTotal();
});
getPOID();
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
$("#ddlVehCode").change(function () {
    var vehCodeID = $('#ddlVehCode').val();
    //getProducts(vehCodeID);
});
function getDetail(pId) {

    $("#hdnProductID").val(pId);
    
    // get product description
    var json = { "productId": pId };
    //ajaxCall("GET", json, "application/json; charset=utf-8", "/Purchase/getProductDetail", "json", onSuccess, onFailure);
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/PurchaseOrders/getProductDetail',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {
            //console.log($('#hdnProductID').val());
         // if (data) { document.getElementById('btnEdit').style.visibility = 'visible'; }
            //if (data.Description) { $('#DescriptionTitle').text("Desc: "); $('#Description').text(data.Description); }
           // if (data.ProductName) { $('#').text("Group: "); $('#Group').text(data.GroupName); }
           
            //if (data.VehicleName) { $('#VehModelTitle').text("Model: "); $('#VehModel').text(data.VehicleName); }
            //if (data.UnitCode) {
            //    $('#UnitCodeTitle').text("Un Code: "); $('#UnitCode').text(data.UnitCode);
            //    $('#unitCode').val(data.UnitCode);
            //}       console.log(data);

            if (data.ProductName) {
                var vc = data.ProductID;
               //  $("#ddlProduct option:contains(" + data.productID + ")").attr("selected", true);
                $('#ddlProduct').val(vc).trigger('change.select2');
            }

            if (data.CategoryName) {
                var vcs = data.CategoryID;
                //  $("#ddlProduct option:contains(" + data.productID + ")").attr("selected", true);
                $('#ddlCategory').val(vcs).trigger('change.select2');
            }
            //if (data.UnitPerCtn) {
            //    $('#unitPerCarton').val(data.UnitPerCtn);
            //    $('#UnitPerCtnTitle').text("Unit/Ctn: "); $('#UnitPerCtn').text(data.UnitPerCtn);
            //}
            //if (data.QtyPerUnit) {
            //    $('#QtyPerUnitTitle').text("Qty/Unit: "); $('#QtyPerUnit').text(data.QtyPerUnit);
            //    $('#qtyPerUnit').val(data.QtyPerUnit);
         
            //}
        },
        error: function (err) { console.log(err); }
    });   
}

function calcSubTotal() {
    $('#Qty').prop('disabled', false);

    var qty = $('#Qty').val();
    //var TotMtr = $("#TotalMeters").val() || 0;

    var rate = $('#UnitPrice').val();
    var currency = $('#Currency').val();
    if (currency == 2) {
        var convRate = $('#exRate').val();
        rate = rate * convRate;
        $('#exUnitPrice').val(rate);
        //console.log("rate = " + rate);
        //console.log("convRate = " + convRate);
    }
    if (($.isNumeric(rate)) && ($.isNumeric(qty))) {
        //   console.log("in condition");
        var amount = (qty * rate);
        console.log(qty + " amount");
        $('#SubTotal').val(parseFloat(amount).toFixed(3));
        //        console.log("this is subtotal = something=" + amount);
    }
    else {
        //  console.log("this is subtotal = 0");
        $('#SubTotal').val("");
    }
}

// On produt No Selection
$("#ddlProduct").change(function () {
    var pId = $('#ddlProduct').val();
    getDetail(pId);
});
// Add Product to Purchase List 
$("#addRow").click(function () {
    var category = $("#ddlCategory :selected").text();
    var ProductID = $("#ddlProduct").val(); // hidden
    var product = $("#ddlProduct :selected").text();  // 1
    var Description = $("#Description").text(); // 2
    var UnitCode = $("#UnitCode").text();
    var Qty = $("#Qty").val();
    var UnitPrice = $("#UnitPrice").val();
    var SalePrice = $("#SalePrice").val();
    var SubTotal = $("#SubTotal").val();
    var pid = '<input type="hidden" id="productID" value="' + ProductID + '"/>';
    //console.log("Qty=" + Qty);
    //console.log("ProductID  =" + ProductID);
    //console.log("SubTotal=" + SubTotal);
    if (ProductID == "" || ProductID == "undefined") { swal("Error", "Please Select Product!", "error"); }
    else if (Qty == "" || Qty == "undefined" || !Number.isInteger(parseInt(Qty))) { swal("Error", "Please enter Quantity!", "error"); }       
    else if (UnitPrice == "" || UnitPrice == "undefined" || !Number(parseFloat(UnitPrice))) { swal("Error", "Please enter Unit Price!", "error"); }    

    else if (ProductID > 0 && (parseInt(Qty)) > 0  && parseFloat(SubTotal) > 0) {
        var index = $.inArray(ProductID, $addedProductIDs);
        if (index >= 0) {
            swal("Error", "Product Already Added!", "error");
        }
        else {

            var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + category + "</td><td>" + pid + "" + product + "</td><td id='unitCode' hidden>" + UnitCode + "</td><td contenteditable='true' id='ProductQty'>" + Qty + "</td><td contenteditable='true' id='ProductCostPrice'>" + parseFloat(UnitPrice).toFixed(2) + "</td><td contenteditable='true' id='ProductSalePrice'>" + SalePrice + "</td><td id='ProductSubTotal'>" + parseFloat(SubTotal).toFixed(2) + "</td></tr>";

            $("#tblProduct tbody").append(markup);
            $tableItemCounter++;
            $addedProductIDs.push(ProductID);
            //if (tmpOrderID > 0) {
            //    insertTempData();
            //}

            calcTotal();
            $("#addRow").prop('disabled', true);
            $("#btnRemove").prop('disabled', false);
            $("#btnEdit").prop('disabled', false);

            clearFields();
        }
    }
    else { swal("Error", "Check Entries!", "error"); }
});
//// Clear product fields when added 
//function clearLabels() {
//    $('#DescriptionTitle').text(''); $('#Description').text('');
//    $('#SubsTitle').text(''); $('#SubstituteNo').text('');
//    $('#GroupTitle').text(''); $('#Group').text('');
//    $('#VehModelTitle').text(''); $('#VehModel').text('');
//    $('#LocationTitle').text(''); $('#Location').text('');
//    $('#UnitCodeTitle').text(''); $('#UnitCode').text('');
//    $('#QtyPerUnitTitle').text(''); $('#QtyPerUnit').text('');
//    $('#UnitPerCartonTitle').text(''); $('#UnitPerCarton').text('');
//}
// Clear product fields when added 
function clearFields() {
    $("#Description").text("");
    $("#unitCode").val("");
    $("#Qty").val("");
    $("#UnitPrice").val("");
    
    $('#SalePrice').removeAttr("placeholder").val("");
    $("#SubTotal").val("");
    $("#ddlCategory").focus();
    $('#ddlCategory').val(null).trigger('change');
    $('#ddlProduct').val(null).trigger('change.select2');
}
$("#AccountID").change(function () {
    var vendorID = $('#AccountID').val();
    $('#hdnAccountID').val(vendorID);
      
    getVendorDetail(vendorID);
});

// Get Vendor Balance and Credit Limit 
function getVendorDetail(accountID) {
    if (accountID == "")
    { accountID = -1; }
    var json = {
        "accountID": accountID
    };
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/Vendors/getDetail',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {

            $('#OpeningBal').val(data.Balance);
        },
        error: function (err) {
            console.log(err);
        }
    });
}
// Only allow int 
function isNumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function calcTotal() {

    var total = 0;
    $('#tblProduct tbody tr').each(function (i, n) {
        //  console.log("in tbl product body");
        var $row = $(n);
        var subTotal = parseFloat($row.find('#ProductSubTotal').text());
        total += parseFloat(subTotal);
    });
    $('#subAmount').val(parseFloat(total).toFixed(3));
    $('#TotalAmount').val(parseFloat(total).toFixed(3));
    $('#amountPaid').val('');
}
//function calcSubTotal() {
//    var qty = $('#Qty').val();
//    var price = $('#CostPrice').val();
//    if (($.isNumeric(price)) && ($.isNumeric(qty))) {
//        var amount = (qty * price);
//        $('#SubTotal').val(parseFloat(amount).toFixed(3));
//        calcTotal();
//    }
//    else {
//        $('#subAmount').val(parseFloat(amount).toFixed(3));
//    }
//}



