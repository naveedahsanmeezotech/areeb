var chqDat = "";
var AccountID = 0;
var Expense = 0;
var VAT = 0;
var VATPercent = 0;
var DiscountAmount = 0;
var DiscountPercent = 0;
var vatAmount = 0;
var discAmount = 0;
var BranchID = 0;
$(function () {

    $('#btnSave').click(function () {
        $('#btnSave').prop('disabled', true);
        uiBlock();
        insert();
    });

});

var invoiceTotal = 0;
function getInvoiceDetails(orderID) {
    ajaxCall("GET", { "OrderID": orderID }, "application/json; charset=utf-8", "/PurchaseReturn/getInvoiceDetails",
        "json", onSuccess, onFailure);

    function onSuccess(data) {
        var ien = data.qry.length;
        $('#tbl').find('tbody').empty();
        if (ien > 0) {
            console.log(data);
            debugger
            var controlReturning = '<input id="rQty" type = "Number" min="0" max=' + returningBalance + ' step="0"  value=0>';
            var html = '';
            for (var i = 0; i < ien; i++) {
                AccountID = data.qry[i].AccountID;
                BranchID = data.qry[i].BranchID;
                VAT = data.qry[i].VAT;
                var isPack = data.qry[i].IsPack;
                var unitCode = data.qry[i].UnitCode;
                DiscountAmount = data.qry[i].DiscountAmount || 0;
                invoiceTotal = data.qry[i].TotalAmount;
                var invoiceWithDiscount = parseFloat(invoiceTotal - DiscountAmount);
                VATPercent = (parseFloat(VAT) * parseFloat(100 / invoiceWithDiscount));
                DiscountPercent = (parseFloat(DiscountAmount) * parseFloat(100 / invoiceTotal));
                var unitPrice = data.qry[i].UnitPrice;
                var qty = data.qry[i].Qty;
                var packet = data.qry[i].Packet;
                var unitPerCarton = data.qry[i].UnitPerCarton;
                var returnedQty = data.qry[i].ReturnedQty;
                var AvQty = 0;
                if (data.qry[i].FIFOQty != "-999") { AvQty = data.qry[i].FIFOQty; }
                else { AvQty = parseFloat(qty - returnedQty); }
                var levelID = data.qry[i].LevelID;
                var levelIDField = '<input type="hidden" id="LevelID" value="' + levelID + '"/>';
                var isPackField = '<input type="hidden" id="isPacket" value="' + isPack + '"/>';
                var unitCTN = '<input type="hidden" id="unitPerCTN" value="' + unitPerCarton + '"/>';

                var returningBalance = parseFloat(qty - returnedQty).toFixed(3);
                html += '<tr>';
                html += '<td>' + data.qry[i].OrderID + '</td>';
                html += '<td>' + isPackField + data.qry[i].InvoiceNo + '</td>';
                html += '<td><input type="hidden" value="' + data.qry[i].ProductID + '">' + data.qry[i].PartNo + '</td>';
                //console.log("Product ID" + data.qry[i].ProductID);
                html += '<td>' + data.qry[i].MaterailName  + '</td>';
                html += '<td>' + data.qry[i].PrDisc + '</td>';
                html += '<td>' + data.qry[i].PrGST + '</td>';
                html += '<td hidden>' + packet + '</td>';
                html += '<td>' + levelIDField + unitPrice + '</td>';
                html += '<td>' + data.qry[i].Total + '</td>';
                html += '<td>' + AvQty + '</td>';
                html += '<td>' + returnedQty + '</td>';
                html += '<input id="returningBalQty" type="hidden" value="' + returningBalance + '">';
                html += '<td> <input id="rQty" name="rQty" oninput="validate(this)" style="width: 70px" type = "number" min="0" max=' + returningBalance + ' step="0"  value=0 class="form-control"> </td>';
                if (isPack == false) {
                    html += '<td hidden> <input id="rPacket" name="rPacket" onkeypress="return isNumberKey(event)" style="width: 70px" type = "number" value=0 class="form-control" readonly> </td>';
                }
                else {
                    html += '<td hidden> <input id="rPacket" name="rPacket" onkeypress="return isNumberKey(event)" style="width: 70px" type = "number" value=0 class="form-control"> </td>';
                }
                html += '<td><input type="number"  class="form-control input-sm" style="width: 120px" name="sub" style="width: 70px" id="txtAmount" disabled />' + '</td>';
                html += '</tr>';
            }
            $('#tbl tbody').append(html);
        }
    }
    function onFailure(err) {
        debugger;
    }
}
$('#tbl').keyup(function (e) {
    $field = $(e.target).closest("tr").find('input[id*="rQty"]');
    var returningQty = $(e.target).closest("tr").find('input[id*="rQty"]').val();
    var price = $(e.target).closest("tr").find("td:eq(7)").text();
    //console.log(price+"=price");
    // Prevent Entering more than balance qty 
    if (returningQty > Number($field.attr("max"))) {
        var max = $field.attr("max");
        $field.val(0);
        toastr.warning('Returning quantity must be equal or less than balance qty!')
    }
    if (($.isNumeric(price)) && ($.isNumeric(returningQty))) {
        var amount = parseFloat(returningQty * price).toFixed(2);
        $(e.target).closest('tr').find('input[id*="txtAmount"]').val(amount);
        calcTotal();
    }
    else {
        $(e.target).closest('tr').find('input[id*="txtSub"]').val(''
        );
    }
});
function calcTotal() {
    var total = 0;
    $('#tbl tbody tr').each(function (i, n) {
        var $row = $(n);
        var subTotal = parseFloat($row.find('input[id*="txtAmount"]').val());
        if ($.isNumeric(subTotal)) {
            total += parseFloat(subTotal);
        }
    });

    $('#tbl tfoot tr').find('input[id*="txtTotal"]').val(parseFloat(total).toFixed(2));
    $('#TotalAmount').val(parseFloat(total).toFixed(2));

}
var validate = function (e) {
    var t = e.value;
    e.value = (t.indexOf(".") >= 0) ? (t.substr(0, t.indexOf(".")) + t.substr(t.indexOf("."), 3)) : t;
}
$('#tbl').keyup(function (e) {
    calcTotal();
    calcDiscount();
    calcVAT();
});
function calcVAT() {
    if (discAmount != "" || parseFloat(discAmount) > 0) {
        var totalInvoice = $('#tbl tfoot tr').find('input[id="txtTotal"]').val();

        var total = totalInvoice - parseFloat(discAmount).toFixed(2);

        vatAmount = parseFloat((VATPercent * total) / 100);
    }
    else {
        var total = $('#tbl tfoot tr').find('input[id="txtTotal"]').val();
        vatAmount = parseFloat((VATPercent * total) / 100);
    }

}
function calcDiscount() {

    //discAmount = parseFloat((DiscountPercent * total) / 100);
    if (DiscountAmount == "" || isNaN(DiscountAmount)) { DiscountAmount = 0; discAmount = 0; }
    else {
        var discPercent = parseFloat((DiscountAmount / invoiceTotal) * 100);
        //DiscountPercent = (parseFloat(DiscountAmount) * parseFloat(100 / invoiceTotal));
        if (discPercent == "" || isNaN(discPercent)) { discPercent = 0; discAmount = 0; }
        else {
            total = $('#tbl tfoot tr').find('input[id="txtTotal"]').val();
            discAmount = parseFloat((discPercent * total) / 100);
        }
    }
}
function insert() {
    var poReturn = [];
    var stockLog = [];
    var total = 0;
    var qtyVE = 0;
    var isValid = false;
    totalInvoice = $('#TotalAmount').val();
    calcVAT();
    calcDiscount();
    var purchaseID = 0;
    var invoiceNo = 0;
    $('#tbl tbody tr').each(function (i, n) {
        var $row = $(n);
        purchaseID = $row.find("td:eq(0)").text();
        invoiceNo = $row.find("td:eq(1)").text();
        //var pId = $row.find("input[hidden='pId']").val();
        var unitPerCTN = $row.find('input[id*="unitPerCTN"]').val();
        var pId = $row.find('td:eq(2) input[type="hidden"]').val()
        //console.log("id"+pId);
        var partNumber = $row.find("td:eq(2)").text();
        var qty = $row.find("td:eq(3)").text();
        var price = $row.find("td:eq(7)").text();
        var DisAmount = $row.find("td:eq(4)").text();
        var GSTAmount = $row.find("td:eq(5)").text();
        var subTotal = $row.find('input[id*="txtAmount"]').val();
        var returningQty = $row.find('input[id*="rQty"]').val();
        var returningPacket = $row.find('input[id*="rPacket"]').val();
        var qty = parseFloat(returningQty);
        var isPack = $row.find('input[id*="isPacket"]').val();

        //console.log(returningQty);
        if (returningQty > 0) {
            price = parseFloat(subTotal / qty);
            isValid = true;
            poReturn.push({
                PartNo: partNumber,
                ProductId: pId,
                Qty: qty,
                DiscountAmount: DisAmount,
                GSTAmount: GSTAmount,
                Packet: returningPacket,
                UnitPrice: price,
                Total: subTotal,
                BranchID: BranchID,
                IsPack: isPack
            });
            stockLog.push({
                AccountID: AccountID,
                ProductId: pId,
                BranchID: BranchID,
                StockOut: qty,
                Packet: returningPacket,
                CostPrice: price,
                OutReference: 'Purchase Return',
                OrderTypeID: 2,
                InvoiceDate: new Date(),
                IsPack: isPack
            });
        }
        else {
            uiUnBlock();
            $('#btnSubmit').prop('disabled', false);
        }
    });

    if (poReturn.length && isValid == true) {

        total = $('#tbl tfoot tr').find('input[id="txtTotal"]').val();
        //console.log(total);
        //total = $('#Total').val()
        var paymentStatus = 0;
        if ($('#PaymentStatus option:selected').val() != 0) {
            paymentStatus = $('#PaymentStatus option:selected').text()
        }
        var data = {
            'AccountID': AccountID,
            'BranchID': BranchID,
            'PurchaseID': purchaseID,
            'InvoiceNo': invoiceNo,
            'ReturnDate': new Date(),
            'VAT': parseFloat(vatAmount).toFixed(2),
            'DiscountAmount': parseFloat(discAmount).toFixed(2),
            'TotalAmount': total,
            'tbl_POReturnDetails': poReturn
        };
        var json = JSON.stringify({ 'model': data, 'modelStockLog': stockLog });
        // console.log(json);

        ajaxCall("POST", json, "application/json; charset=utf-8", "/PurchaseReturn/ReturnOrder", "json", onSuccess, onFailure);
        //debugger;       
        function onSuccess(Result) {
            if (Result == "success") {
                uiUnBlock();
                window.location.href = '/PurchaseReturn';
            }
            else {
                uiUnBlock();
                $('#btnSave').prop('disabled', false);
                swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
            }
            //location.reload();
            //window.location.href = 'Index';
            //alert("success");
        }
        function onFailure(error) {
            if (error.statusText == "OK") {
                console.log(error.statusText);
                //alert(error.status);
            }
            else {
                swal("critical error", "Some error Ocurred! Please Check Your Entries!", "error");
            }
        }
    }
    else {
        uiUnBlock();
        $('#btnSave').prop('disabled', false);
    }
}

