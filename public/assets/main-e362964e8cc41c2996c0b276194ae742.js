$(function(){function e(e){$("#picture_crop_x").val(e.x),$("#picture_crop_y").val(e.y),$("#picture_crop_w").val(e.w),$("#picture_crop_h").val(e.h)}$("#cropbox").Jcrop({boxWidth:770,boxHeight:433,onSelect:e,onChange:e}),$("#fileupload").fileupload({autoUpload:!0,uploadTemplate:function(e){var i=$();return $.each(e.files,function(e,r){console.log(r);var t=$('<li class="span3"><div class="thumbnail"><div class="preview" style="text-align: center;"></div><div class="progress progress-success progress-striped active"><div class="bar" style="width:0%;"></div></div></div>');i=i.add(t)}),i},completed:function(e,i){console.log(i.result[0].url),$('a[href^="'+i.result[0].url+'"]').slimbox()},downloadTemplate:function(e){var i=$();return $.each(e.files,function(e,r){var t=$('<li class="span3" id="picture_'+r.picture_id+'">'+(r.error?'<div class="name"></div><div class="size"></div><div class="error" ></div>':'<div class="thumbnail"><a href="'+r.url+'" rel="lightbox-pictures" class="picture_'+r.id+'" title="<%= pic.description %>"><img src="" alt="">')+'</a><div class="caption"><p style="text-align: center;"><a href="" class="btn btn-mini btn-show" style="margin-right: 4px;"><i class="icon-edit "></i>Edit</a><a class="btn btn-mini btn-delete" confirm="Вы уверены?" data-remote=true data-method="delete" href="" ><i class="icon-trash"></i>Delete</a></p></div></div>');r.error?(t.find(".name").text(r.name),t.find(".error").text(locale.fileupload.errors[r.error]||r.error)):(r.thumbnail_url&&t.find("img").prop("src",r.thumbnail_url),t.find(".btn-delete").attr("href","/galleries/"+$("#galleryID").val()+"/pictures/"+r.picture_id),t.find(".btn-show").attr("href","/galleries/"+$("#galleryID").val()+"/pictures/"+r.picture_id+"/edit")),i=i.add(t)}),i}})});