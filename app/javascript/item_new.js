$(function(){
  $("#item-price").on('input', function(){
    const price = $("#item-price").val();
    if( 300 <= price && price <= 9999999) {
    const fee = Math.floor(price / 10);
    const profit = (price - fee);
    console.log(profit)
    $("span#add-tax-price").text(fee);
    $("span#profit").text(profit);
    }else{
    $("span#add-tax-price").text('');
    $("span#profit").text('');
    }
  })
});