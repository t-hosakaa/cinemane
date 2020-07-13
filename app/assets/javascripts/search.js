$(function(){
  
  function appendPastMovie(past_movie){
    let current_user_id = $('.current_user_id').val();
    if (past_movie.user_id == current_user_id) {
      let html = `<div class="Contents">
                  <div class="Contents__item">
                    <a href="/past_movies/${past_movie.id}">
                      <img src="${past_movie.image.url}", class="Contents__item__image">
                    </a>
                  </div>
                </div>`;
      $('.Content').append(html);
    }
  }

  function appendErrMsgToHTML(msg){
    let html = `<div class='ErrorMsg'>${ msg }</div>`;
    $('.Index').append(html);
  }

  $('.SearchBox__input').on('keyup', function(){
    let input = $('.SearchBox__input').val();
    $.ajax({
      type: 'GET',
      url: '/past_movies/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(past_movies){
      $('.Content').empty();
      $('.ErrorMsg').remove();
      if(past_movies.length !== 0) {
        past_movies.forEach(function(past_movie){
          appendPastMovie(past_movie);
        })
      }
      else {
        appendErrMsgToHTML('No match was found..');
      }
    })
    .fail(function(){
      alert('Error');
    });
  });
});