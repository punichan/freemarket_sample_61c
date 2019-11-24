$(document).on('turbolinks:load',function(){
  var search_list = $('.item-search');
  function appendbrand(brand){
    var html = `<li class="item-search--font" data-brand-id="${brand.id}">${brand.name}</li>`;
    search_list.append(html);
  }
  
  $("#item_brand_id").on("keyup",function(){
    var input = $("#item_brand_id").val();
    // 文字がある時
    if(input !== ""){
      $('.item-search').empty();
      $.ajax({
        type: 'get',
        url:  '/items/search',
        data:  {keyword: input},
        dataType: 'json'
      })
      .done(function(brands){
        $('.item-search').empty();
        if (brands.length !== 0) {
          brands.forEach(function(brand){
          appendbrand(brand);
          });
        }
      })
    }
    // 文字がない時
    else(input == "");{
      $('.item-search').empty();
    }
  });

  // クリックされると文字がフォームに入力される。DBにはidで保存可能
  $(".myform-group").on('click','.item-search--font',function(){
    var text = $(this).text();
    var id = $(this).data('brand-id');
    $('#item_brand_id').val(text);
    $('#a').val(id);
    $('.item-search').empty();
  })
})