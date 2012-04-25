/*
var opt = {
	  yaxis: {  ticks: 6, min: 0  , max:1000 },
	  series: { lines: { show: true },
	  points: { show: true} },
	  xaxis:{ ticks: 5, min:0, max:2000}
	   };
$(function(){
	// alert('onload....');
	$.plot($("#placeholder"), dd1, opt);
});

*/	   

$(function(){
	$.plot($("#placeholder"), [d1], {xaxis: {mode: "time", timeformat: "%y-%m"}});
});
