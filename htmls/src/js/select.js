$(function () {
	$(".select-menu-input").focus(function(){
		$(this).closest('.select-menu-div').addClass('active-select-menu-div')
	});
	$(".select-menu-input").blur(function(){
		$(this).closest('.select-menu-div').removeClass('active-select-menu-div')
	});
	selectMenu(0);
	selectMenu(1);
	selectMenu(2);
	selectMenu(3);
	function selectMenu(index) {
		$(".select-menu-input").eq(index).val($(".select-this").eq(index).text());//在输入框中自动填充第一个选项的值
		$(".select-menu-div").eq(index).on("click", function (e) {
			var w=$(this).width()
			var liLength=$(".select-menu-ul").eq(index).find('li').length
			if(liLength==0){}
			else{
				if ($(".select-menu-ul").eq(index).css("display") === "block") {
					$(".select-menu-ul").eq(index).hide();
					$(".select-menu-div").eq(index).find("i").removeClass("select-menu-i");
					$(".select-menu-ul").eq(index).animate({ marginTop: "50px", opacity: "0" }, "fast");
				} else {
					$(".select-menu-ul").eq(index).show();
					$(".select-menu-div").eq(index).find("i").addClass("select-menu-i");
					$(".select-menu-ul").eq(index).css('width',w)
					$(".select-menu-ul").eq(index).animate({ marginTop: "5px", opacity: "1" }, "fast");
				}
				for (var i = 0; i < $(".select-menu-ul").length; i++) {
					if (i !== index && $(".select-menu-ul").eq(i).css("display") === "block") {
						$(".select-menu-ul").eq(i).hide();
						$(".select-menu-div").eq(i).find("i").removeClass("select-menu-i");
						$(".select-menu-ul").eq(i).animate({ marginTop: "50px", opacity: "0" }, "fast");

					}
				}
			}
			
			e.stopPropagation();
		});
		$(".select-menu-ul").eq(index).on("click", "li", function () {//给下拉选项绑定点击事件
			$(".select-menu-input").eq(index).val($(this).text());//把被点击的选项的值填入输入框中
			$(".select-menu-input").eq(index).trigger('change')
			$(".select-menu-div").eq(index).click();
			$(this).siblings(".select-this").removeClass("select-this");
			$(this).addClass("select-this");
		});
		$("body").on("click", function (event) {
			if ($(".select-menu-ul").eq(index).css("display") === "block") {
				$(".select-menu-ul").eq(index).hide();
				$(".select-menu-div").eq(index).find("i").removeClass("select-menu-i");
				$(".select-menu-ul").eq(index).animate({ marginTop: "50px", opacity: "0" }, "fast");

			}
			// event.stopPropagation();
		});
	}
})