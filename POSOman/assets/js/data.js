var rowNumber = 2;
function itemDataFieldKeyUp(e){
    if(e.keyCode == 13) {

      fieldRow = '<tr><td><strong>'+rowNumber+'</strong></td><td><input id="tdc-row-'+rowNumber+'" class="item-data" onkeyup="itemDataFieldKeyUp(event)" type="text" placeholder="Enter item here" style="width: 100%;background-color: rgba(255,255,255,0);border:none;"><textarea rows="3" placeholder="Enter 3 lines Descrption here" style="width: 100%;background-color: rgba(255,255,255,0);border:none;"></textarea></td><td class="text-center"><input class="item-data" onkeyup="itemDataFieldKeyUp(event)" type="text" style="width: 100%;background-color: rgba(255,255,255,0);border:none;"></td><td class="text-center"><input class="item-data" onkeyup="itemDataFieldKeyUp(event)" type="text" style="width: 100%;background-color: rgba(255,255,255,0);border:none;"></td><td class="text-center"><input class="item-data" onkeyup="itemDataFieldKeyUp(event)" type="text" style="width: 100%;background-color: rgba(255,255,255,0);border:none;"></td></tr>';
      $('#item-table> tbody > tr:eq(' + rowNumber + ')').after(fieldRow);
      $("#tdc-row-"+rowNumber).focus();
      rowNumber++;
    }
}
