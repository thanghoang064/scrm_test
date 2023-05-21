(function() {
  var out$ = typeof exports != 'undefined' && exports || this;

  var doctype = '<?xml version="1.0" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">';

  function inlineImages(callback) {
    var images = document.querySelectorAll('svg image');
    var left = images.length;
    if (left == 0) {
      callback();
    }
    for (var i = 0; i < images.length; i++) {
      (function(image) {
        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');
        var img = new Image();
        img.src = image.getAttribute('xlink:href');
        img.onload = function() {
          canvas.width = img.width;
          canvas.height = img.height;
          ctx.drawImage(img, 0, 0);
          image.setAttribute('xlink:href', canvas.toDataURL('image/png'));
          left--;
          if (left == 0) {
            callback();
          }
        }
      })(images[i]);
    }
  }

  function moveChildren(src, dest) {
    // Enclosed in if, for chrome errors
    if(src.children || src.childNodes) {
      while (src.childNodes.length > 0) {
        var child = src.childNodes[0];
        dest.appendChild(child);
      }
    }
    // Enclosed in if, for chrome errors
    return dest;
  }

  function styles(dom) {
    var used = "";
    var sheets = document.styleSheets;
    for (var i = 0; i < sheets.length; i++) {
      var rules = sheets[i].cssRules;
      for (var j = 0; j < rules.length; j++) {
        var rule = rules[j];
        if (typeof(rule.style) != "undefined") {
          var elems = dom.querySelectorAll(rule.selectorText);
          if (elems.length > 0) {
            used += rule.selectorText + " { " + rule.style.cssText + " }\n";
          }
        }
      }
    }

    var s = document.createElement('style');
    s.setAttribute('type', 'text/css');
    s.innerHTML = "<![CDATA[\n" + used + "\n]]>";

    var defs = document.createElement('defs');
    defs.appendChild(s);
    return defs;
  }

  out$.svgAsDataUri = function(el, scaleFactor, cb) {
    scaleFactor = scaleFactor || 1;

    inlineImages(function() {
      var outer = document.createElement("div");
      var clone = el.cloneNode(true);
      var width = parseInt(clone.getAttribute("width"));
      var height = parseInt(clone.getAttribute("height"));
      
      var xmlns = "http://www.w3.org/2000/xmlns/";

      clone.setAttribute("version", "1.1");
      clone.setAttributeNS(xmlns, "xmlns", "http://www.w3.org/2000/svg");
      clone.setAttributeNS(xmlns, "xmlns:xlink", "http://www.w3.org/1999/xlink");
      clone.setAttribute("width", width * scaleFactor);
      clone.setAttribute("height", height * scaleFactor);
      var scaling = document.createElement("g");
      scaling.setAttribute("transform", "scale(" + scaleFactor + ")");
      clone.appendChild(moveChildren(clone, scaling));
      outer.appendChild(clone);

      clone.insertBefore(styles(clone), clone.firstChild);

      var svg = doctype + outer.innerHTML;
      var uri = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svg)));
      if (cb) {
        cb(uri);
      }
    });
  }

  out$.saveSvgAsPng = function(el, name, scaleFactor, cb, transformX, transformY) { // #6129
    out$.svgAsDataUri(el, scaleFactor, function(uri) {
      var image = new Image();
      image.src = uri;
      image.onload = function() {
        var canvas = document.createElement('canvas');
        canvas.width = image.width;
        canvas.height = image.height;
        var context = canvas.getContext('2d');
        // #6129 - Added margins (movement) for SVG transform
        var minX = transformX || 0;
        var minY = transformY || 0;

        try{
            context.drawImage(image, minX, minY); // #6129
            var a = document.createElement('a');
            a.download = name;
            var imageData = canvas.toDataURL('image/png')
            a.href = imageData;

            // #6129 - If set callback, then run and exit
            if(cb) {
            	cb(imageData);
            	return true;
            }

            document.body.appendChild(a);
            a.click();
        }catch (e){
            //fall back for IE 11, possibly something else;
            var canvgConvert  = function(){
                canvas = document.createElement('canvas');
                canvas.width = image.width;
                canvas.height = image.height;
                canvg(canvas,document.getElementById('chart1').innerHTML.replace(/\<\/svg\>.{0,}/g,"</svg>"));
                try{
                    var a = document.createElement('a');
                    a.download = name;
                    a.href = canvas.toDataURL('image/png');
                    document.body.appendChild(a);
                    a.click();
                }catch (e){
                    jQuery.post("index.php?entryPoint=analyticReportBouncer",{image:canvas.toDataURL('image/png')},function(data){
                        window.location = "index.php?entryPoint=analyticReportBouncer?img="+data;

                    })

                }
            };
            if(typeof canvg ==="undefined"){
                var retries = 0;
                var checkAndRepeat = function(){
                    if(typeof canvg !=="undefined"){
                        canvgConvert();
                    }else{
                        retries++;
                        if(retries>50){
                            alert("Error while creating image");
                        }else{
                            setTimeout(checkAndRepeat,100);//retry and hope that this is done
                        }
                    }
                }
                jQuery.getScript("modules/AnalyticReporting/assets/js/canvg/rgbcolor.js")
                    .done(function(){return jQuery.getScript("modules/AnalyticReporting/assets/js/canvg/StackBlur.js")})
                    .done(function(){return jQuery.getScript("modules/AnalyticReporting/assets/js/canvg/canvg.js")})
                    .done(checkAndRepeat).fail(function(){
                        alert("Error while creating image");
                    });
            }else{
                canvgConvert();
            }
        }
      }
    });
  }
})();
