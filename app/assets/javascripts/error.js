$(function(){
  $('.btn-sell').on('click',function(){

    if($('#item_name').val() === ""){
      alert('商品名を入力してください');
      $('#item_name').focus();
    }
    if($('#item_images_attributes_0_images').val() === ""){
      alert('画像を入力してください');
    }
    if($('#item_item_description').val() === ""){
      alert('商品の説明を入力してください');
    }
    if($('#item_category_id').val() === ""){
      alert('カテゴリーを選択してください');
    }
    if($('#item_clothes_size_id').val() === ""){
      alert('サイズを選択してください');
    }
    if($('#item_condition_id').val() === ""){
      alert('状態を選択してください');
    }
    if($('#item_delivery_burden_id').val() === ""){
      alert('配送料の負担を選択してください');
    }
    if($('#item_delivery_way_id').val() === ""){
      alert('配送方法を選択してください');
    }
    if($('#item_prefecture_id').val() === ""){
      alert('発送元の地域を選択してください');
    }
    if($('#item_shipment_days_id').val() === ""){
      alert('発送までの日数を選択してください');
    }
    if($('#item_prefecture_id').val() === ""){
      alert('価格を入力してください');
    }

      return false;
  })
})