!function(t){t(function(){var n=t(window);t("section [href^=#]").click(function(t){t.preventDefault()}),t(".bs-docs-sidenav").affix({offset:{top:function(){return n.width()<=980?290:210},bottom:270}}),window.prettyPrint&&prettyPrint(),t(".add-on :checkbox").on("click",function(){var n=t(this),o=n.attr("checked")?"addClass":"removeClass";t(this).parents(".add-on")[o]("active")}),t("#gridSystem").length&&t("#gridSystem").tooltip({selector:".show-grid > div",title:function(){return t(this).width()+"px"}}),t(".tooltip-demo").tooltip({selector:"a[rel=tooltip]"}),t(".tooltip-test").tooltip(),t(".popover-test").popover(),t("a[rel=popover]").popover().click(function(t){t.preventDefault()}),t("#fat-btn").click(function(){var n=t(this);n.button("loading"),setTimeout(function(){n.button("reset")},3e3)}),t("#myCarousel").carousel();var o=t("#components.download input"),e=t("#plugins.download input"),a=t("#variables.download input");t("#components.download .toggle-all").on("click",function(t){t.preventDefault(),o.attr("checked",!o.is(":checked"))}),t("#plugins.download .toggle-all").on("click",function(t){t.preventDefault(),e.attr("checked",!e.is(":checked"))}),t("#variables.download .toggle-all").on("click",function(t){t.preventDefault(),a.val("")}),t(".download-btn .btn").on("click",function(){var n=t("#components.download input:checked").map(function(){return this.value}).toArray(),o=t("#plugins.download input:checked").map(function(){return this.value}).toArray(),e={},a=["glyphicons-halflings.png","glyphicons-halflings-white.png"];t("#variables.download input").each(function(){t(this).val()&&(e[t(this).prev().text()]=t(this).val())}),t.ajax({type:"POST",url:/\?dev/.test(window.location)?"http://localhost:3000":"http://bootstrap.herokuapp.com",dataType:"jsonpi",params:{js:o,css:n,vars:e,img:a}})})}),t.ajaxTransport("jsonpi",function(n){var o=n.url;return{send:function(){var e,a,i="jQuery_iframe_"+jQuery.now();e=t("<iframe>").attr("name",i).appendTo("head"),a=t("<form>").attr("method",n.type).attr("action",o).attr("target",i),t.each(n.params,function(n,o){t("<input>").attr("type","hidden").attr("name",n).attr("value","string"==typeof o?o:JSON.stringify(o)).appendTo(a)}),a.appendTo("body").submit()}}})}(window.jQuery),$(".btn-group a").on("click",function(t){t.preventDefault();var n=$(this).siblings(".control-group").find("input[type=hidden]");n.length>0&&n.val().toString()!==$(this).data("value").toString()&&n.val($(this).data("value")).trigger("change")});