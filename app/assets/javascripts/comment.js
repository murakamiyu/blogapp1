$(function(){
	function buildHTML(comment){
		var html =`<p>
					<a href=/users/${comment.user_id}>${comment.user_name}</a>：${comment.text}  
					Rate : ${comment.rate}
					</p>
					`
					
		return html
	}

	$('#new_comment').on('submit', function(e){
		e.preventDefault();
		console.log(this)
		var formData = new FormData(this);
		var url = $(this).attr('action')
		
		$.ajax({
			url: url,
			type: "POST",
			data: formData,
			dataType: 'json',
			processData: false,
			contentType: false,
		})
		.done(function(data){
			var html = buildHTML(data);
			console.log(html, data)
			$('.card-title.center').animate({scrollTop: $('.card-title.center.below')[0].scrollHeight}, 'fast');
			$('.card-title.center').append(html);
			$('.blue-text').val('');
		})
		.fail(function(){
			alert('error');
        })
	});
});