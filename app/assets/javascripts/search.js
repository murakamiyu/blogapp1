$(function(){

	var search_list = $('.searchLists')

	function appendBlog(blog){
	var html = `<li>
				  <div class="card-image">
				    <img src="${blog.image}">
				    <span class="card-title">
				  </div>
				  <a class="book_title" href="/blogs/${blog.id}" title="${blog.name}">
				      Title : ${blog.name}
				  </a>
				</li>

				`
	  search_list.append(html);
	}

	function appendNoBlogs(blog){
	var html = `<li>
				  ${blog}
				</li>

				`
	  search_list.append(html);
	}

	$(".search__query").on("keyup", function(){
		var input = $(this).val();
		if (input != 0) {
		console.log(input)

		$.ajax({
			type: 'GET',
			url: 'search',
			data: { keyword: input},
			dataType: 'json'
		})
		.done(function(blogs){
			$(".searchLists").empty();
			if (blogs.length !== 0){
				blogs.forEach(function(blog){
					appendBlog(blog);
				});
			} else {
				appendNoBlogs("一致する映画はありません");
			}
		 })
		 .fail(function(){
		 alert('検索失敗')
	  })
		}
	});
});