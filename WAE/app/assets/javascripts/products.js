(function($){
    $(document).on('turbolinks:load', function () {
        var requestRunning = false;

        function showMessage(messageBoxId, messageText, containerClass){
            var msg = $(document.createElement('div'));
            var container = $('#alert-container-'+messageBoxId);
            msg.attr({class: containerClass, role: 'alert'});
            msg.html(messageText);

            // clear it incase it not empty
            container.show();
            container.append(msg);

            // make it fadeout and disappear after 5 seconds
            setTimeout(function () {
                container.fadeOut('slow', function () {
                    container.empty();
                })
            }, 5000)
        }

        // Add Comment
        $('.comment').on('click', function(){
            var $self = $(this);
            var id = $self.data('product');
            var comment = $('#product-'+id).val()
            var link = window.location.origin + $self.data('link');
            // Return if comment is empty. This should be above requestRunning otherwise, requestRunning will be
            // true and will exit continuously. (It is set to false on complete callback.
            if (comment.trim() == ''){
                showMessage(id, 'Comment box is empty.', 'alert alert-danger');
                return;
            }
            if( requestRunning ){
                return;
            }
            requestRunning = true;
            // enable it after 1 second
            setTimeout(function () {
                requestRunning = false;
            }, 1000);

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
                    // console.log(response, textStatus, jqXHR);
                    var container;
                    // only on show page
                    if(container = $('#comment-container')){
                        $('#comment-container').prepend(medias);
                    }
                    showMessage(id, 'Comment Posted. <a class="alert-link" href="'+link+'#comment-no-'+response.id+'">Click Here to see your comment</a>', 'alert alert-success');
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    console.log(jqXhr, textStatus, errorThrown);
                    showMessage(id, 'Could not post comment', 'alert alert-danger');
                    // msg.attr({class: 'alert alert-danger', role: 'alert'});
                    // msg.text('Could not post comment');
                },
                complete: function (jqXhr, textStatus) {
                    $('#product-'+id).val('');
                    requestRunning = false;
                }
            });
        });

        // Delete Comment
        $('#comment-container').on('click', '.delete-comment', function () {
            var sure = confirm('Are you sure you want to delete the comment ?');
            if(sure){
                $self = $(this);
                var id = $self.data('id');
                var link = $self.data('link');
                console.log(id);
                $.ajax({
                    url: window.location.origin + link,
                    method: 'post',
                    data: {
                        _method: 'delete'
                    },
                    success: function () {
                        $('#media-'+id).remove();
                    },
                    error: function () {

                    },
                    complete: function () {

                    }
                });
            }
        });

        // Enable Tooltip
        $('.user-tip').tooltip();
    })
})(jQuery);