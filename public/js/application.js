$(document).ready(function() {
  $('form').on('submit',function(e){
    e.preventDefault();
    $('#tweets').append("<img src='ajax-loader.gif' id='spinna'>");
    var data = $('form').serialize();
    $.post('/posts',data,function(response){
      $('#spinna').remove();
      console.log(response)
      $('#tweets').append(response);
    })

  })
  $('button').on('click',function(e){
    e.preventDefault();
     $('#tweets').append("<img src='ajax-loader.gif' id='spinna'>");
    $.get("/yolo",function(response){
       $('#spinna').remove();
      $('#tweets').append(response);
    })

  })


  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
