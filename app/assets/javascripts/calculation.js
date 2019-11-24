$(document).on('turbolinks:load',function(){
  $('.form-price').on('input',function(){
  var data = $('.form-price').val();
  console.log(data);
  if ((data >= 300 && data <= 9999999)){
    var profit = Math.round(data * 0.9);
    var fee = (data - profit);
    $('.fee__right').html(fee);
    $('.fee__right').prepend('¥');
    $('.profit__right').html(profit);
    $('.profit__right').prepend('¥');
    }
  else {
    console.log(data)
    $('.profit__right').html('');
    $('.fee__right').html(''); 
    }; 
  });
});