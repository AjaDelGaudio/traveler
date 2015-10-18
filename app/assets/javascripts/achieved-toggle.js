$(".achieved-toggle").click(function(e){
  e.preventDefault();

  var blaID = e.target.id;
  var updatePath = "/bucket_list_adventures/" + blaID;

  $.ajax({
    method: "PATCH",
    url: updatePath,
  });

  if ($(this).html() == '<i class="fa fa-square-o"></i> Seen it! Done it!') {
    $(this).html('<i class="fa fa-check-square-o"></i> Seen it! Done it!');
  } else {
    $(this).html('<i class="fa fa-square-o"></i> Seen it! Done it!');
  }
});
