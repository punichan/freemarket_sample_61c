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
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
    }
  });
});