$(function(){

  var search_list = $('.item-search');

  function appendbrand(brand){
    var html = `<li class="item-search--font">${brand.name}</li>`;
    search_list.append(html);
  }
  $("#item_brand_id").on("keyup",function(){
    var input = $("#item_brand_id").val();

    if(input !== ""){
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
            console.log(brand);
          })
        }
      })
    }
  });
});