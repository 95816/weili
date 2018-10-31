// JavaScript Document

   //多个tab
	 $(document).ready(function(){
			$("ul.menu1 li:first-child").addClass("current");
			//$(".content1").find(".layout1:not(:first-child)").hide();
			$(".content1 .layout1").attr("id", function(){return idNumber("No")+ $(".content1 .layout1").index(this)});
			$("ul.menu1 li").click(function(){
				var c = $("ul.menu1 li");
				var index = c.index(this);
				var p = idNumber("No");
				show(c,index,p);
			});
			
			function show(controlMenu,num,prefix){
				var content= prefix + num;
				$('#'+content).siblings().hide();
				$('#'+content).show();
				controlMenu.eq(num).addClass("current").siblings().removeClass("current");
			};
		 
			function idNumber(prefix){
				var idNum = prefix;
				return idNum;
			};
		 });
		 
		 
		 
		 
		 