$(function(){
			$("#main_menu").buildMenu(
			{
				template:"/assets/jquery.mb.menu/menuVoices.html",
				additionalData:"pippo=1",
				menuWidth:200,
				openOnRight:false,
				menuSelector: ".menuContainer",
        containment:"wrapper",
				iconPath:"/assets/iconset/sketchdock24/",
				hasImages:true,
				fadeInTime:100,
				fadeOutTime:300,
				adjustLeft:2,
				minZindex:"auto",
				adjustTop:10,
				opacity:.95,
				shadow:true,
				closeOnMouseOut:true,
				closeAfter:1000
			});

});