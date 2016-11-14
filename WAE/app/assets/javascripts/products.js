(function($){
    $(document).on('ready turbolinks:load', function () {
        var requestRunning = false;
        $('.comment').on('click', function(){
            if( requestRunning ){
                return;
            }
            requestRunning = true;
            var id = $(this).data('product')
            var comment = $('#product-'+id).val();
            var container = $('#alert-container-'+id)
            console.log(comment);


            $.ajax({
                url: window.location.origin + '/comments.json',
                method: 'post',
                dataType: 'json',
                data: {
                    comment: {
                        content: comment,
                        product_id: id
                    }
                },
                success: function (response, textStatus, jqXHR) {
                    //<div class="alert alert-success" role="alert">...</div>
                    var alert = $(document.createElement('div')).attr({class: 'alert alert-success', role: 'alert'});
                    alert.text('Comment posted.');
                    console.log(response, textStatus, jqXHR);
                    container.empty();
                    container.append(alert);
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    console.log(jqXhr, textStatus, errorThrown)
                    var alert = $(document.createElement('div')).attr({class: 'alert alert-danger', role: 'alert'});
                    alert.text('Could not post comment');
                    container.empty();
                    container.append(alert);
                },
                complete: function (jqXhr, textStatus) {
                    $('#product-'+id).val('');
                    requestRunning = false;
                }
            })
        })
    })
})(jQuery);