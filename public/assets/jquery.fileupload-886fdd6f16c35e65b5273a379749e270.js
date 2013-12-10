!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","jquery.ui.widget"],e):e(window.jQuery)}(function(e){"use strict";e.support.xhrFileUpload=!(!window.XMLHttpRequestUpload||!window.FileReader),e.support.xhrFormDataFileUpload=!!window.FormData,e.widget("blueimp.fileupload",{options:{namespace:void 0,dropZone:e(document),fileInput:void 0,replaceFileInput:!0,paramName:void 0,singleFileUploads:!0,limitMultiFileUploads:void 0,sequentialUploads:!1,limitConcurrentUploads:void 0,forceIframeTransport:!1,redirect:void 0,redirectParamName:void 0,postMessage:void 0,multipart:!0,maxChunkSize:void 0,uploadedBytes:void 0,recalculateProgress:!0,formData:function(e){return e.serializeArray()},add:function(e,t){t.submit()},processData:!1,contentType:!1,cache:!1},_refreshOptionsList:["namespace","dropZone","fileInput","multipart","forceIframeTransport"],_isXHRUpload:function(t){return!t.forceIframeTransport&&(!t.multipart&&e.support.xhrFileUpload||e.support.xhrFormDataFileUpload)},_getFormData:function(t){var i;return"function"==typeof t.formData?t.formData(t.form):e.isArray(t.formData)?t.formData:t.formData?(i=[],e.each(t.formData,function(e,t){i.push({name:e,value:t})}),i):[]},_getTotal:function(t){var i=0;return e.each(t,function(e,t){i+=t.size||1}),i},_onProgress:function(e,t){if(e.lengthComputable){var i=t.total||this._getTotal(t.files),n=parseInt(e.loaded/e.total*(t.chunkSize||i),10)+(t.uploadedBytes||0);this._loaded+=n-(t.loaded||t.uploadedBytes||0),t.lengthComputable=!0,t.loaded=n,t.total=i,this._trigger("progress",e,t),this._trigger("progressall",e,{lengthComputable:!0,loaded:this._loaded,total:this._total})}},_initProgressListener:function(t){var i=this,n=t.xhr?t.xhr():e.ajaxSettings.xhr();n.upload&&(e(n.upload).bind("progress",function(e){var n=e.originalEvent;e.lengthComputable=n.lengthComputable,e.loaded=n.loaded,e.total=n.total,i._onProgress(e,t)}),t.xhr=function(){return n})},_initXHRData:function(t){var i,n=t.files[0],a=t.multipart||!e.support.xhrFileUpload,o=t.paramName[0];(!a||t.blob)&&(t.headers=e.extend(t.headers,{"X-File-Name":n.name,"X-File-Type":n.type,"X-File-Size":n.size}),t.blob?a||(t.contentType="application/octet-stream",t.data=t.blob):(t.contentType=n.type,t.data=n)),a&&e.support.xhrFormDataFileUpload&&(t.postMessage?(i=this._getFormData(t),t.blob?i.push({name:o,value:t.blob}):e.each(t.files,function(e,n){i.push({name:t.paramName[e]||o,value:n})})):(t.formData instanceof FormData?i=t.formData:(i=new FormData,e.each(this._getFormData(t),function(e,t){i.append(t.name,t.value)})),t.blob?i.append(o,t.blob,n.name):e.each(t.files,function(e,n){n instanceof Blob&&i.append(t.paramName[e]||o,n,n.name)})),t.data=i),t.blob=null},_initIframeSettings:function(t){t.dataType="iframe "+(t.dataType||""),t.formData=this._getFormData(t),t.redirect&&e("<a></a>").prop("href",t.url).prop("host")!==location.host&&t.formData.push({name:t.redirectParamName||"redirect",value:t.redirect})},_initDataSettings:function(e){this._isXHRUpload(e)?(this._chunkedUpload(e,!0)||(e.data||this._initXHRData(e),this._initProgressListener(e)),e.postMessage&&(e.dataType="postmessage "+(e.dataType||""))):this._initIframeSettings(e,"iframe")},_getParamName:function(t){var i=e(t.fileInput),n=t.paramName;return n?e.isArray(n)||(n=[n]):(n=[],i.each(function(){for(var t=e(this),i=t.prop("name")||"files[]",a=(t.prop("files")||[1]).length;a;)n.push(i),a-=1}),n.length||(n=[i.prop("name")||"files[]"])),n},_initFormSettings:function(t){t.form&&t.form.length||(t.form=e(t.fileInput.prop("form"))),t.paramName=this._getParamName(t),t.url||(t.url=t.form.prop("action")||location.href),t.type=(t.type||t.form.prop("method")||"").toUpperCase(),"POST"!==t.type&&"PUT"!==t.type&&(t.type="POST")},_getAJAXSettings:function(t){var i=e.extend({},this.options,t);return this._initFormSettings(i),this._initDataSettings(i),i},_enhancePromise:function(e){return e.success=e.done,e.error=e.fail,e.complete=e.always,e},_getXHRPromise:function(t,i,n){var a=e.Deferred(),o=a.promise();return i=i||this.options.context||o,t===!0?a.resolveWith(i,n):t===!1&&a.rejectWith(i,n),o.abort=a.promise,this._enhancePromise(o)},_chunkedUpload:function(t,i){var n,a,o,r,s=this,l=t.files[0],p=l.size,d=t.uploadedBytes=t.uploadedBytes||0,u=t.maxChunkSize||p,h=l.webkitSlice||l.mozSlice||l.slice;return this._isXHRUpload(t)&&h&&(d||p>u)&&!t.data?i?!0:d>=p?(l.error="uploadedBytes",this._getXHRPromise(!1,t.context,[null,"error",l.error])):(a=Math.ceil((p-d)/u),n=function(i){return i?n(i-=1).pipe(function(){var n=e.extend({},t);return n.blob=h.call(l,d+i*u,d+(i+1)*u),n.chunkSize=n.blob.size,s._initXHRData(n),s._initProgressListener(n),o=(e.ajax(n)||s._getXHRPromise(!1,n.context)).done(function(){n.loaded||s._onProgress(e.Event("progress",{lengthComputable:!0,loaded:n.chunkSize,total:n.chunkSize}),n),t.uploadedBytes=n.uploadedBytes+=n.chunkSize})}):s._getXHRPromise(!0,t.context)},r=n(a),r.abort=function(){return o.abort()},this._enhancePromise(r)):!1},_beforeSend:function(e,t){0===this._active&&this._trigger("start"),this._active+=1,this._loaded+=t.uploadedBytes||0,this._total+=this._getTotal(t.files)},_onDone:function(t,i,n,a){this._isXHRUpload(a)||this._onProgress(e.Event("progress",{lengthComputable:!0,loaded:1,total:1}),a),a.result=t,a.textStatus=i,a.jqXHR=n,this._trigger("done",null,a)},_onFail:function(e,t,i,n){n.jqXHR=e,n.textStatus=t,n.errorThrown=i,this._trigger("fail",null,n),n.recalculateProgress&&(this._loaded-=n.loaded||n.uploadedBytes||0,this._total-=n.total||this._getTotal(n.files))},_onAlways:function(e,t,i,n){this._active-=1,n.textStatus=t,i&&i.always?(n.jqXHR=i,n.result=e):(n.jqXHR=e,n.errorThrown=i),this._trigger("always",null,n),0===this._active&&(this._trigger("stop"),this._loaded=this._total=0)},_onSend:function(t,i){var n,a,o,r=this,s=r._getAJAXSettings(i),l=function(i,a){return r._sending+=1,n=n||(i!==!1&&r._trigger("send",t,s)!==!1&&(r._chunkedUpload(s)||e.ajax(s))||r._getXHRPromise(!1,s.context,a)).done(function(e,t,i){r._onDone(e,t,i,s)}).fail(function(e,t,i){r._onFail(e,t,i,s)}).always(function(e,t,i){if(r._sending-=1,r._onAlways(e,t,i,s),s.limitConcurrentUploads&&s.limitConcurrentUploads>r._sending)for(var n=r._slots.shift();n;){if(!n.isRejected()){n.resolve();break}n=r._slots.shift()}})};return this._beforeSend(t,s),this.options.sequentialUploads||this.options.limitConcurrentUploads&&this.options.limitConcurrentUploads<=this._sending?(this.options.limitConcurrentUploads>1?(a=e.Deferred(),this._slots.push(a),o=a.pipe(l)):o=this._sequence=this._sequence.pipe(l,l),o.abort=function(){var e=[void 0,"abort","abort"];return n?n.abort():(a&&a.rejectWith(e),l(!1,e))},this._enhancePromise(o)):l()},_onAdd:function(t,i){var n,a,o,r,s=this,l=!0,p=e.extend({},this.options,i),d=p.limitMultiFileUploads,u=this._getParamName(p);if((p.singleFileUploads||d)&&this._isXHRUpload(p))if(!p.singleFileUploads&&d)for(o=[],n=[],r=0;r<i.files.length;r+=d)o.push(i.files.slice(r,r+d)),a=u.slice(r,r+d),a.length||(a=u),n.push(a);else n=u;else o=[i.files],n=[u];return i.originalFiles=i.files,e.each(o||i.files,function(a,r){var p=e.extend({},i);return p.files=o?r:[r],p.paramName=n[a],p.submit=function(){return p.jqXHR=this.jqXHR=s._trigger("submit",t,this)!==!1&&s._onSend(t,this),this.jqXHR},l=s._trigger("add",t,p)}),l},_normalizeFile:function(e,t){void 0===t.name&&void 0===t.size&&(t.name=t.fileName,t.size=t.fileSize)},_replaceFileInput:function(t){var i=t.clone(!0);e("<form></form>").append(i)[0].reset(),t.after(i).detach(),e.cleanData(t.unbind("remove")),this.options.fileInput=this.options.fileInput.map(function(e,n){return n===t[0]?i[0]:n}),t[0]===this.element[0]&&(this.element=i)},_onChange:function(t){var i=t.data.fileupload,n={files:e.each(e.makeArray(t.target.files),i._normalizeFile),fileInput:e(t.target),form:e(t.target.form)};return n.files.length||(n.files=[{name:t.target.value.replace(/^.*\\/,"")}]),i.options.replaceFileInput&&i._replaceFileInput(n.fileInput),i._trigger("change",t,n)===!1||i._onAdd(t,n)===!1?!1:void 0},_onPaste:function(t){var i=t.data.fileupload,n=t.originalEvent.clipboardData,a=n&&n.items||[],o={files:[]};return e.each(a,function(e,t){var i=t.getAsFile&&t.getAsFile();i&&o.files.push(i)}),i._trigger("paste",t,o)===!1||i._onAdd(t,o)===!1?!1:void 0},_onDrop:function(t){var i=t.data.fileupload,n=t.dataTransfer=t.originalEvent.dataTransfer,a={files:e.each(e.makeArray(n&&n.files),i._normalizeFile)};return i._trigger("drop",t,a)===!1||i._onAdd(t,a)===!1?!1:(t.preventDefault(),void 0)},_onDragOver:function(e){var t=e.data.fileupload,i=e.dataTransfer=e.originalEvent.dataTransfer;return t._trigger("dragover",e)===!1?!1:(i&&(i.dropEffect=i.effectAllowed="copy"),e.preventDefault(),void 0)},_initEventHandlers:function(){var e=this.options.namespace;this._isXHRUpload(this.options)&&this.options.dropZone.bind("dragover."+e,{fileupload:this},this._onDragOver).bind("drop."+e,{fileupload:this},this._onDrop).bind("paste."+e,{fileupload:this},this._onPaste),this.options.fileInput.bind("change."+e,{fileupload:this},this._onChange)},_destroyEventHandlers:function(){var e=this.options.namespace;this.options.dropZone.unbind("dragover."+e,this._onDragOver).unbind("drop."+e,this._onDrop).unbind("paste."+e,this._onPaste),this.options.fileInput.unbind("change."+e,this._onChange)},_setOption:function(t,i){var n=-1!==e.inArray(t,this._refreshOptionsList);n&&this._destroyEventHandlers(),e.Widget.prototype._setOption.call(this,t,i),n&&(this._initSpecialOptions(),this._initEventHandlers())},_initSpecialOptions:function(){var t=this.options;void 0===t.fileInput?t.fileInput=this.element.is("input:file")?this.element:this.element.find("input:file"):t.fileInput instanceof e||(t.fileInput=e(t.fileInput)),t.dropZone instanceof e||(t.dropZone=e(t.dropZone))},_create:function(){var t=this.options,i=e.extend({},this.element.data());i[this.widgetName]=void 0,e.extend(t,i),t.namespace=t.namespace||this.widgetName,this._initSpecialOptions(),this._slots=[],this._sequence=this._getXHRPromise(!0),this._sending=this._active=this._loaded=this._total=0,this._initEventHandlers()},destroy:function(){this._destroyEventHandlers(),e.Widget.prototype.destroy.call(this)},enable:function(){e.Widget.prototype.enable.call(this),this._initEventHandlers()},disable:function(){this._destroyEventHandlers(),e.Widget.prototype.disable.call(this)},add:function(t){t&&!this.options.disabled&&(t.files=e.each(e.makeArray(t.files),this._normalizeFile),this._onAdd(null,t))},send:function(t){return t&&!this.options.disabled&&(t.files=e.each(e.makeArray(t.files),this._normalizeFile),t.files.length)?this._onSend(null,t):this._getXHRPromise(!1,t&&t.context)}})});