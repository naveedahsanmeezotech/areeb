$tableItemCounter = 0;
var $addedProductIDs = [];
$('#Qty').on('input', function (e) {
    var qty = $('#Qty').val();
    var unitPerCarton = $('#unitPerCarton').val();
    var units = parseFloat(qty * unitPerCarton).toFixed(0);
    $('#Units').val(units);
    calcSubTotal();
});
$('#UnitPrice').on('input', function (e) {
    

    var qty = $('#Qty').val();
    var rate = $('#UnitPrice').val();
    if (($.isNumeric(rate)) && ($.isNumeric(qty))) {
        var amount = (qty * rate);
        $('#SubTotalrow').val(parseFloat(amount).toFixed(2));
    }
    else {
        $('#SubTotalrow').val("");
    }
    calcSubTotal();
});
getPOID();
function getPOID() {
    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: '/Purchase/getNewPOID',
        async: true,
        success: function (data) {
            {
              //  alert(data);
                $("#Quotation").val(data);
                POID = data;
            }
        },
        error: function (err) { console.log(err); }
    });
}

function getProducts(categoryID) {
    if (categoryID == "")
    { categoryID = -1; }
    var json = { "CategoryID": categoryID };
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/Products/getProducts',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {
            GetDropdown1("ddlProduct", data, true);
        },
        error: function (err) { console.log(err); }
    });
}

// Get Details of Selected Product
function getDetail(pId) {
    $("#hdnProductID").val(pId);
    // get product description
    var json = { "productId": pId };
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/Products/getProductDetail',
        async: true,
        data: JSON.stringify(json),
        success: function (data) {
            //console.log($('#hdnProductID').val());
            //if (data) { document.getElementById('btnEdit').style.visibility = 'visible'; }
            if (data.Category) { $('#GroupTitle').text("Category: "); $('#Group').text(data.Category); }
            if (data.UnitCode) {
                $('#UnitCodeTitle').text("Un Code: "); $('#UnitCode').text(data.UnitCode);
                $('#unitCode').val(data.UnitCode);
            }
            $('#hdnCostPrice').val(data[0].costPrice);
            var salePrice = data[0].SalePrice;
            $('#hdnSalePrice').val(salePrice);
            $('#Stock').val(data[0].stock);          
        },
        error: function (err) { console.log(err); }
    });   
}
function calcSubTotal() {
    var qty = $('#Qty').val();
    var rate = $('#UnitPrice').val();    
    if (($.isNumeric(rate)) && ($.isNumeric(qty))) {
        var amount = (qty * rate);
        $('#TotalAmount').val(parseFloat(amount).toFixed(2));
    }
    else {
        $('#TotalAmount').val("");
    }
   // calcAmountPaid();
}
// When changed made in product table
$("#tblProduct").focusout(function () {
    var total = 0;
    $('#tblProduct tbody tr').each(function (i, n) {
        var $row = $(n);                              
        var qty = $row.find("#ProductQty").text();
        var rate = $row.find("#ProductCostPrice").text();
      
        if (($.isNumeric(rate)) && ($.isNumeric(qty))) {
            var amount = (qty * rate);
            $row.find("#ProductSubTotal").text(parseFloat(amount).toFixed(2));
            calcTotal();
        }
    });
});
// On part No Selection
$("#ddlProduct").change(function () {
    var pId = $('#ddlProduct').val();
    getDetail(pId);
});
// Add Product to Purchase List 
$("#addRow").click(function () {
    
    var ProductID = $("#ProductId").val(); // hidden
    var product = $("#ProductId :selected").text();  // 1
    var Description = $("#Description").val(); // 2
   var Qty = $("#Qty").val(); 
    var UnitPrice = $("#UnitPrice").val(); 
    var SubTotal = $("#SubTotalrow").val(); 
    var pid = '<input type="hidden" id="productID" value="' + ProductID + '"/>';    
   
    if (ProductID > 0 && (parseInt(Qty)) > 0 && Number(parseFloat(UnitPrice)) && SubTotal > 0) {
        var index = $.inArray(ProductID, $addedProductIDs);
        if (index >= 0) {
            swal("Error", "Product Already Added!", "error");
        }
        else {
            var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + pid + "" + product + "</td><td id='ProductQty' hidden>" + Qty + "</td><td id='ProductDescription'>" + Description + "</td><td  id='ProductCostPrice'>" + parseFloat(UnitPrice).toFixed(2) + "</td><td id='ProductSubTotal' hidden>" + parseFloat(SubTotal).toFixed(2) + "</td></tr>";
            $("#tblProduct tbody").append(markup);
            $tableItemCounter++;
            $addedProductIDs.push(ProductID);
            //if (tmpOrderID > 0) {
            //    insertTempData();
            //}
            clearFields();
            clearLabels();
            calcTotal();
         //   $('#BarCode').focus();
        }
    }
    else if (ProductID == "" || ProductID == "undefined") { swal("Error", "Please Select Product!", "error"); }
    else if (Qty == "" || Qty == "undefined" || !Number.isInteger(parseInt(Qty))) { swal("Error", "Please enter Quantity!", "error"); }
    else if (UnitPrice == "" || UnitPrice == "undefined" || !Number(parseFloat(UnitPrice))) { swal("Error", "Please enter Unit Price!", "error"); }
    else { swal("Error", "Check Entries!", "error"); }
});
function clearLabels() {
    $('#Description').text(''); $('#Description').text('');
   $('#GroupTitle').text(''); $('#Group').text('');    
}
// Clear product fields when added 
function clearFields() {
    $("#Description").val(""); 
    $("#unitCode").val(""); 
   // $("#Qty").val(""); 
    $("#UnitPrice").val("");
    $("#SalePrice").val("");
    $("#SubTotal").val("");
    $("#ddlCategory").focus();
    $('#ProductId').val(null).trigger('change');
    $('#ProductId').val(null).trigger('change.select2');
}
// Remove Selected Products 
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
        var $row = $(n);
        var subTotal = parseFloat($row.find('#ProductSubTotal').text());
        total += parseFloat(subTotal);
    });
    $('#subAmount').val(parseFloat(total).toFixed(2));
    $('#TotalAmount').val(parseFloat(total).toFixed(2));
    $("#amountPaid").val(parseFloat(total).toFixed(2));
   
}