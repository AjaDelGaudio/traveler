// <% if adventure.is_achieved %>
//   <%= link_to (fa_icon "check-square-o") + " Seen it! Done it!",
//     "#", class: "achieved-toggle", id: bla.id %>
// <% else %>
//   <%= link_to (fa_icon "square-o") + " Seen it! Done it!",
//     "#", class: "achieved-toggle", id: bla.id %>
// <% end %>




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
