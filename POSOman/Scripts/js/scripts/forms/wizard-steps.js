/*=========================================================================================
    File Name: wizard-steps.js
    Description: wizard steps page specific js
    ----------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Version: 2.1
    Author: PIXINVENT    
==========================================================================================*/

// Wizard tabs with numbers setup Customized  for Customer Payment dont use this for other pages
$(".number-tab-steps").steps({
    headerTag: "h6",
    bodyTag: "fieldset",
    transitionEffect: "fade",
    titleTemplate: '<span class="step">#index#</span> #title#',
    labels: {
        finish: 'Submit'
    },
    onFinishing: function (event, currentIndex) {
        $('#btnSave').prop('disabled', true);
        uiBlock();
        return true;
    },
    onFinished: function (event, currentIndex) {        
        var customerID = $('#hdnAccountID').val();
        var voucherDate = $('#VoucherDate').val();
        var amountpaid = $('#Amount').val();
        var payType = $('#PayTypeID option:selected').val()
        var bankAccountId = $('#Bank option:selected').val();
        //console.log("THis");
        //alert(amountpaid + "Amount");
        chqDate = $('#ChequeDate').val();
        if (chqDate == "") {
            uiUnBlock();
            $('#btnSave').prop('disabled', false);
            //alert("Please cheque date");
            chqDat = "";
            //console.log(PurchaseDate+"date");
        }
        if (customerID == "" || customerID == 0) {
            uiUnBlock();
            $('#btnSave').prop('disabled', false);
            alert("Please Select Customer");
        }
        else if (voucherDate == "") {
            uiUnBlock();
            $('#btnSave').prop('disabled', false);
            alert("Please Enter Payment Date");
            //console.log(PurchaseDate + "date");
        }
        else if (amountpaid == "" || amountpaid == null || amountpaid == 0) {
            uiUnBlock();
            $('#btnSave').prop('disabled', false);
            alert("Please Enter Amount");
            //console.log(PurchaseDate + "date");
        }
        else if ((payType == 3 || payType == 2) && (bankAccountId == "" || bankAccountId == undefined)) {
            uiUnBlock();
            $('#btnSave').prop('disabled', false);
            alert("Please Select  Bank!");
        }
        else {
            $('#btnSave').prop('disabled', true);
           
            uiBlock();
            insert();
        }
    }
});

// Wizard tabs with icons setup
$(".icons-tab-steps").steps({
    headerTag: "h6",
    bodyTag: "fieldset",
    transitionEffect: "fade",
    titleTemplate: '<span class="step">#index#</span> #title#',
    labels: {
        finish: 'Submit'
    },
    onFinished: function (event, currentIndex) {
        alert("Form submitted.");
    }
});

// Vertical tabs form wizard setup
$(".vertical-tab-steps").steps({
    headerTag: "h6",
    bodyTag: "fieldset",
    transitionEffect: "fade",
    stepsOrientation: "vertical",
    titleTemplate: '<span class="step">#index#</span> #title#',
    labels: {
        finish: 'Submit'
    },
    onFinishing: function (event, currentIndex)
    {
        $('#btnSave').prop('disabled', true);
        uiBlock();
        return true;
    },
    onFinished: function (event, currentIndex) {
        var paymentStatus = $('#PaymentStatus option:selected').val();
        var PaymentTypeID = $('#PaymentType option:selected').val();
        var amountpaid = $('#amountPaid').val();
        //alert(amountpaid + "Amount");


        if (currentIndex == 2 && (paymentStatus == 3 && PaymentTypeID == "") || (paymentStatus == 1 && PaymentTypeID != "") || (paymentStatus == 2 && PaymentTypeID != "" && amountpaid >0)) {            
            $('#btnSave').prop('disabled', true);
            uiBlock();
            insert();
        }
        else
        {
            if(amountpaid <=0 || amountpaid == "" || amountpaid == null){
                uiUnBlock();
                $('#btnSave').prop('disabled', false);
                swal("Amount", "Please Enter Amount!", "error");
            }
    else{
                uiUnBlock();
                $('#btnSave').prop('disabled', false);
        swal("Payment", "Please Select Payment Status And Type!", "error");

}
            
        }
        
    }
});

// Validate steps wizard

// Show form
var form = $(".steps-validation").show();

$(".steps-validation").steps({
    headerTag: "h6",
    bodyTag: "fieldset",
    transitionEffect: "fade",
    titleTemplate: '<span class="step">#index#</span> #title#',
    labels: {
        finish: 'Submit'
    },
    onStepChanging: function (event, currentIndex, newIndex)
    {
        // Allways allow previous action even if the current form is not valid!
        if (currentIndex > newIndex)
        {
            return true;
        }
        // Forbid next action on "Warning" step if the user is to young
        if (newIndex === 3 && Number($("#age-2").val()) < 18)
        {
            return false;
        }
        // Needed in some cases if the user went back (clean up)
        if (currentIndex < newIndex)
        {
            // To remove error styles
            form.find(".body:eq(" + newIndex + ") label.error").remove();
            form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
        }
        form.validate().settings.ignore = ":disabled,:hidden";
        return form.valid();
    },
    onFinishing: function (event, currentIndex)
    {
        form.validate().settings.ignore = ":disabled";
        return form.valid();
    },
    onFinished: function (event, currentIndex)
    {
        alert("Submitted!");
    }
});

// Initialize validation
$(".steps-validation").validate({
    ignore: 'input[type=hidden]', // ignore hidden fields
    errorClass: 'danger',
    successClass: 'success',
    highlight: function(element, errorClass) {
        $(element).removeClass(errorClass);
    },
    unhighlight: function(element, errorClass) {
        $(element).removeClass(errorClass);
    },
    errorPlacement: function(error, element) {
        error.insertAfter(element);
    },
    rules: {
        email: {
            email: true
        }
    }
});

