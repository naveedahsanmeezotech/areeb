$tableItemCounter = 0;
var $addedProductIDs = [];
var QtyinPack = 0;
var PackLength = 0;
var PrUntLnth = 0;
var OrderId = $('#OrderId').val();
var Count = 0;
var DatE = null;
var POID = 0;
getPOID();

$("#BranchID").prop('disabled', true);
$("#btnRemove").prop('disabled', false);
$('#TotalAmount').val('');

GetEditVendors(OrderId);
//Edit Vendor

function GetEditVendors(OrderId) {

    if (OrderId == "") { OrderId = -1; }
    var json = { "OrderId": OrderId };

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/PurchaseReturn/GrInvoice',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {


            data[0].ProductsList.forEach(ListProduct);

         
            
        },
        error: function (err) { console.log(err); }
    });
}
//function for edit product list
////////////
function ListProduct(item) {
    console.log(item);

    var pid = '<input type="hidden" id="productID"  value="' + item.MaterailId + '"/>';
    var product = item.MaterailName;
    var Description = item.Description;
    var UnitPrice = item.Price;
    var MeasureOfUnit = item.MeasureOfUnit;
    var SubTotal = item.Price;
    var UnitOfMeasure = item.MeasureOfUnit;
    var cPrice = '<input type="hidden" id="costPrice" value="' + item.cPrice + '"/>';
    var Qty = parseInt(item.Qty);

    var markup = "<tr><td>" + pid + "" + product + "</td><td id='ProductQty'  >" + Qty + "</td><td id='ProductDescription'>" + Description + "</td><td id='ProductMeasure' >" + UnitOfMeasure + "</td><td  id='ProductCostPrice'>" + parseFloat(UnitPrice).toFixed(2) + "</td><td id='ProductSubTotal' hidden>" + parseFloat(SubTotal).toFixed(2) + "</td></tr>";


    $("#tblProductold tbody").append(markup);

    var markupw = '<tr><td>' + pid + "" + product + '</td><td id="ProductQty"" contenteditable="true" >' + Qty + '</td><td><input id="rQty" name="rQty" oninput="validate(this)" style="width: 70px" type="number" min="0" max=' + Qty + ' step="0" value=0 class="form-control"> </td><td id="ProductDescription">' + Description + '</td><td id="ProductMeasure" >' + UnitOfMeasure + '</td><td  id="ProductCostPrice">' + parseFloat(UnitPrice).toFixed(2) + '</td><td id="ProductSubTotal" hidden>' + parseFloat(SubTotal).toFixed(2) + '</td></tr>';


    $("#tblProduct tbody").append(markupw);
    $tableItemCounter++;
    $addedProductIDs.push(item.Product);
    proIdEdit = item.MaterailId;


}
var validate = function (element) {
    
    var maxQty = parseFloat(element.parentNode.previousElementSibling.textContent);
    var inputQty = parseFloat(element.value);
    alert("first" + maxQty);
    alert("sec" + inputQty)

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
function getPOID() {
    debugger
    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: '/Purchase/getNewPOID',
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

    else if (ProductID > 0 && (parseInt(Qty)) > 0 && parseFloat(SubTotal) > 0) {
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
    if (accountID == "") { accountID = -1; }
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

// When changed made in product table
$("#tblProduct").focusout(function () {
    var total = 0;
    $('#tblProduct tbody tr').each(function (i, n) {
        var $row = $(n);
        var qty = $row.find("#ProductQty").text();
        var rate = $row.find("#ProductCostPrice").text();
        ///////////////Changes by ahsan //////////////////////////
        var DiscAm = $row.find("#ProductDiscount").text() || 0;
        var DiscAmPer = $row.find("#ProductDiscountPercent").text();
        var GST = $row.find("#ProductGST").text() || 0;
        var GSTPer = $row.find("#ProductGSTPercent").text();
        /////////////////////////////////////////////////////////
        var currency = 2;
        if (currency == 2) {
            var convRate = $('#exRate').val();
            rate = rate * 1;
            $row.find("#exchangePrice").text(parseFloat(rate).toFixed(2));
        }
        else {
            $row.find("#exchangePrice").text("");
        }
        if (($.isNumeric(rate)) && ($.isNumeric(qty))) {
            // var amount = 0;
            //if ((($.isNumeric(DiscAm)) && ($.isNumeric(GST)))) {
            //console.log(DiscAm + "Discount");
            // console.log(GST + "GST");
            // console.log(rate + "rate");

            var amountWithGST = (parseFloat(rate) + parseFloat(GST));
            var amountWithGSTAndDisc = amountWithGST - parseFloat(DiscAm);
            var amount = parseInt(qty) * amountWithGSTAndDisc;

            //console.log(amountWithGST + "amountWithGST");
            //console.log(amountWithGSTAndDisc + "amountWithGSTAndDisc");
            //console.log(amount + "amount");
            //   }


            $row.find("#ProductSubTotal").text(parseFloat(amount).toFixed(2));
            calcTotal();
        }
    });
});
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



