console.log(jQuery);
(function($){
    $(document).on('ready turbolinks:load', function(){
        var newAuthorBox = $('#new_author');
        var newCategoryBox = $('#new_category');
        newAuthorBox.hide();
        newCategoryBox.hide();

        $('#ps_two_quotation_ps_two_authors_id').change(function(){
            var value = $(this).val();
            if( value == -1 ){
                newAuthorBox.show();
            }
            else {
                newAuthorBox.hide();
            }
        });
        $('#ps_two_quotation_ps_two_categories_id').change(function(){
            if($(this).val() == -1){
                newCategoryBox.show();
            }
            else{
                newCategoryBox.hide();
            }
        });
    });
})(jQuery);