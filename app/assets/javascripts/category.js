$(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='childcat' id= 'children_cat'>
                        <div class='childcat-box'>
                          <select class="childcat-select" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.form-group-cat').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='childcat' id= 'grandchildren_cat'>
                        <div class='childcat-box'>
                          <select class="childcat-select" id="grandchild_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.form-group-cat').append(grandchildSelectHtml);
  }
  $('#item_category_id').on('change', function(){
    console.log("change");
    console.log(this);
    var parentCategory = $('#item_category_id').val();
    console.log(parentCategory);
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory},
        dataType: 'json'
      })
      .done(function(children){
        console.log(children)
        $('#children_cat').remove();
        $('#grandchildren_cat').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
    }else{
      $('#children_cat').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $(document).on('change','.childcat-select', function(){
    console.log("change");
    console.log(this);
    var childId = $('.childcat-select').val();
    console.log(childId);
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId},
        dataType: 'json'
      })
      .done(function(grandchildren){
        console.log(grandchildren)
        $('#grandchildren_cat').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
});