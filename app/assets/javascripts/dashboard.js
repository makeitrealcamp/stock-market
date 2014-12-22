$(document).ready(function(){

  var evtSource = new EventSource("/dashboard/events");

  evtSource.addEventListener("notification", function(e) {
    obj = JSON.parse(e.data);
    $('ul').append('<li>' + obj.message + " " +  obj.date)
  });

});
