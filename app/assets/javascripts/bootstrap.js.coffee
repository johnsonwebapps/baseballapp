jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

$("#pagination").pagination
  total_pages: 10
  current_page: 2
  callback: (event, page) ->
    alert("Page #{page} was clicked!")