// $(".is-public-radio-false").click(function(e) {
//   e.preventDefault();
//   var $this = $(this);
//   var isPublicPrivate = $this.attr("is-public-private");
//
//   $.ajax({
//         method: "POST",
//         url: "/bucket_lists/new",
//         dataType: "json",
//         data: { isPublic: isPublicPrivate }
//       }).done(function(resp) {
//         var div = $this.parent();
//         div.find( "#vote-count-" + reviewId ).html(resp.voteCount);
//        });
// });

// $(".is-public-radio-true").click(function(e) {
//   e.preventDefault();
//   var $this = $(this);
//   var isPublic = $this.attr("is-public-radio-true");
//
//   $.ajax({
//         method: "POST",
//         url: "/reviews/" + reviewId + "/votes",
//         dataType: "json",
//         data: { vote: {
//           userId: userId, state: "upvote", reviewId: reviewId
//         } }
//       }).done(function(resp) {
//         var div = $this.parent();
//         div.find( "#vote-count-" + reviewId ).html(resp.voteCount);
//        });
// });
