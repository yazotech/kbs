  $(function(){
    $(".dialog-window")
    	.dialog({autoOpen: false, show: "blind", hide: "blind", width: 700});

    $( ".datepicker" ).datepicker()
    .datepicker("option", "dateFormat", "yy-mm-dd" );
  });
