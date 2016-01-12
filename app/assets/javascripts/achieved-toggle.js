// $(".achieved-toggle").click(function(e){
//   e.preventDefault();
//
//   var id = e.target.id;
//   var updatePath = "/adventures/" + id;
//
//   $.ajax({
//     method: "PATCH",
//     url: updatePath,
//   });
//
//   if ($(this).html() == '<i class="fa fa-square-o"></i> Seen it! Done it!') {
//     $(this).html('<i class="fa fa-check-square-o"></i> Seen it! Done it!');
//   } else {
//     $(this).html('<i class="fa fa-square-o"></i> Seen it! Done it!');
//   }
// });
