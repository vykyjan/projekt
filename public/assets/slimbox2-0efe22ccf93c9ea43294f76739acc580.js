!function(i){function e(){var e=C.scrollLeft(),t=C.width();i([x,T]).css("left",e+t/2),g&&i(w).css({left:e,top:C.scrollTop(),width:t,height:C.height()})}function t(t){t?i("object").add(A?"select":"embed").each(function(i,e){E[i]=[e,e.style.visibility],e.style.visibility="hidden"}):(i.each(E,function(i,e){e[0].style.visibility=e[1]}),E=[]);var o=t?"bind":"unbind";C[o]("scroll resize",e),i(document)[o]("keydown",n)}function n(e){var t=e.keyCode,n=i.inArray;return n(t,u.closeKeys)>=0?c():n(t,u.nextKeys)>=0?a():n(t,u.previousKeys)>=0?o():!1}function o(){return r(p)}function a(){return r(y)}function r(i){return i>=0&&(F=i,f=h[F][0],p=(F||(u.loop?h.length:0))-1,y=(F+1)%h.length||(u.loop?0:-1),d(),x.className="lbLoading",N=new Image,N.onload=s,N.src=f),!1}function s(){x.className="",i(k).css({backgroundImage:"url("+f+")",visibility:"hidden",display:""}),i(D).width(N.width),i([D,L,I]).height(N.height),i(H).html(h[F][1]||""),i(K).html((h.length>1&&u.counterText||"").replace(/{x}/,F+1).replace(/{y}/,h.length)),p>=0&&(O.src=h[p][0]),y>=0&&(W.src=h[y][0]),b=k.offsetWidth,v=k.offsetHeight;var e=Math.max(0,m-v/2);x.offsetHeight!=v&&i(x).animate({height:v,top:e},u.resizeDuration,u.resizeEasing),x.offsetWidth!=b&&i(x).animate({width:b,marginLeft:-b/2},u.resizeDuration,u.resizeEasing),i(x).queue(function(){i(T).css({width:b,top:e+v,marginLeft:-b/2,visibility:"hidden",display:""}),i(k).css({display:"none",visibility:"",opacity:""}).fadeIn(u.imageFadeDuration,l)})}function l(){p>=0&&i(L).show(),y>=0&&i(I).show(),i(z).css("marginTop",-z.offsetHeight).animate({marginTop:0},u.captionAnimationDuration),T.style.visibility=""}function d(){N.onload=null,N.src=O.src=W.src=f,i([x,k,z]).stop(!0),i([L,I,k,T]).hide()}function c(){return F>=0&&(d(),F=p=y=-1,i(x).hide(),i(w).stop().fadeOut(u.overlayFadeDuration,t)),!1}var u,h,f,p,y,g,m,b,v,w,x,k,D,L,I,T,z,H,K,C=i(window),F=-1,A=!window.XMLHttpRequest,E=[],N=(document.documentElement,{}),O=new Image,W=new Image;i(function(){i("body").append(i([w=i('<div id="lbOverlay" />')[0],x=i('<div id="lbCenter" />')[0],T=i('<div id="lbBottomContainer" />')[0]]).css("display","none")),k=i('<div id="lbImage" />').appendTo(x).append(D=i('<div style="position: relative;" />').append([L=i('<a id="lbPrevLink" href="#" />').click(o)[0],I=i('<a id="lbNextLink" href="#" />').click(a)[0]])[0])[0],z=i('<div id="lbBottom" />').appendTo(T).append([i('<a id="lbCloseLink" href="#" />').add(w).click(c)[0],H=i('<div id="lbCaption" />')[0],K=i('<div id="lbNumber" />')[0],i('<div style="clear: both;" />')[0]])[0]}),i.slimbox=function(n,o,a){return u=i.extend({loop:!1,overlayOpacity:.8,overlayFadeDuration:400,resizeDuration:400,resizeEasing:"swing",initialWidth:250,initialHeight:250,imageFadeDuration:400,captionAnimationDuration:400,counterText:"Image {x} of {y}",closeKeys:[27,88,67],previousKeys:[37,80],nextKeys:[39,78]},a),"string"==typeof n&&(n=[[n,o]],o=0),m=C.scrollTop()+C.height()/2,b=u.initialWidth,v=u.initialHeight,i(x).css({top:Math.max(0,m-v/2),width:b,height:v,marginLeft:-b/2}).show(),g=A||w.currentStyle&&"fixed"!=w.currentStyle.position,g&&(w.style.position="absolute"),i(w).css("opacity",u.overlayOpacity).fadeIn(u.overlayFadeDuration),e(),t(1),h=n,u.loop=u.loop&&h.length>1,r(o)},i.fn.slimbox=function(e,t,n){t=t||function(i){return[i.href,i.title]},n=n||function(){return!0};var o=this;return o.unbind("click").click(function(){var a,r,s=this,l=0,d=0;for(a=i.grep(o,function(i,e){return n.call(s,i,e)}),r=a.length;r>d;++d)a[d]==s&&(l=d),a[d]=t(a[d],d);return i.slimbox(a,l,e)})}}(jQuery),/android|iphone|ipod|series60|symbian|windows ce|blackberry/i.test(navigator.userAgent)||jQuery(function(i){i("a[rel^='lightbox']").slimbox({},null,function(i){return this==i||this.rel.length>8&&this.rel==i.rel})});