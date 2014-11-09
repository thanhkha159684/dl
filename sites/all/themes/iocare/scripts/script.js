$ = jQuery;
$(document).ready(function(){
    
//      jQuery.ajax({
//                 url: "/user",
//                 type: "POST",
// 
//                 data: {city_id : 1, quan_id : 74, price_id : 97, status_id : "All"},
//                 success: function(msg) { 
//                 console.log(msg);
//                 }
//                 });
//    
//    
//    
//    
//    function createCORSRequest(method, url) {
//  var xhr = new XMLHttpRequest();
//  if ("withCredentials" in xhr) {
//
//    // Check if the XMLHttpRequest object has a "withCredentials" property.
//    // "withCredentials" only exists on XMLHTTPRequest2 objects.
//    xhr.open(method, url, true);
//
//  } else if (typeof XDomainRequest != "undefined") {
//
//    // Otherwise, check if XDomainRequest.
//    // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
//    xhr = new XDomainRequest();
//    xhr.open(method, url);
//
//  } else {
//
//    // Otherwise, CORS is not supported by the browser.
//    xhr = null;
//
//  }
//  return xhr;
//}
//
//var xhr = createCORSRequest('POST', 'http://bigland.vn/ajax-info');
//console.log(xhr);
//if (!xhr) {
//  throw new Error('CORS not supported');
//}
//    
//    
//    
//    
//    
    
    
    
    
    
    
    
    
    var categories = $('.view-product-categories');
    $('.view-content > .item-list > ul >li',categories).addClass('li-root');
    $('a.active',categories).closest('.li-root').addClass('active');
    if (!$('a.active',categories).length) {
        $('.li-root:first-child').addClass('active');
    }
    
    $('.view-content > .item-list > ul >li >div > span >a',categories).click(function(e){
        var li = $(this).closest('li');
        if (!li.hasClass('active')) {
            li.parent().find('li.active').find('ul').slideUp(function(){
                li.parent().find('li.active').removeClass('active');
            });
            li.find('ul',this).slideDown(function(){
                li.addClass('active');
            });
        }
        return false;
    });
    
    $('#block-system-main-menu >.block-inner >ul >li.expanded >a').attr('href','#');
    $('#block-system-main-menu >.block-inner >ul >li.expanded >a').click(function(){return false});
    
    $('.cloud-zoom-gallery-thumbs a').each(function(){
            $('body').append('<a id="pdimg" rel="gal" href="'+$(this).attr('href')+'">DSDS</a>');
    });
    $('.product-list img').each(function(){    
    var title = $(this).closest('.views-row').find('.views-field-title').html();
    var body = $(this).closest('.views-row').find('.views-field-field-body').html();
    if (body==null) {
        body ="";
    }
    var img = $(this).attr('src').replace(/styles\S+\/+/g,"product/");
    
    tooltip($(this),img,title,body);    
    
    });    
    $('.cloud-zoom-container').click(function(){
        
    }).trigger('click');
    // translate
    
    $('.component-title').each(function(){
        if ($(this).text()=="Order total") $(this).text("Tổng hóa đơn");
        
    });
});

Drupal.behaviors.dl_core = {
   attach: function (context, settings) {
   
   }
};
if (Drupal.ajax) {
        Drupal.ajax.prototype.commands.showcolorbox = function(ajax, response, status) {
                    $.colorbox({html:response.data,width:1000});
                    $('#colorboxClose').click(function(){
                        $.colorbox.close() ;
                    });
        }
}

function tooltip(seletor,imgsrc,prefix,suffix) {
    var offsetX = 15;
    var offsetY = 15;
    var TooltipOpacity = 1;

    
    // Select all tags having a title attribute
    seletor.mouseenter(function(e) {     
    // Assign customTooltip to variable
    // Append tooltip element to body
    img = '<img src="'+imgsrc+'"/>'; 
    var content = '<div class ="tooltip-item title">'+prefix+'</div>';
    var content = content + '<div class ="tooltip-item">'+img+'</div>';
    var content = content + '<div class ="tooltip-item">'+suffix+'</div>';
    $("body").append('<div id="tooltip">'+content+ '</div>');
     
    // Set X and Y coordinates for Tooltip
    $('#tooltip').css('left', e.pageX + offsetX );
    $('#tooltip').css('top', e.pageY + offsetY );
     
    // FadeIn effect for Tooltip
    $('#tooltip').fadeIn('500');
    $('#tooltip').fadeTo('10',TooltipOpacity);

    }).mousemove(function(e) {
        $('#tooltip').css('left', e.pageX + offsetX );
        if (e.clientY >($(window).height()/2)) {
            $('#tooltip').css('top', e.pageY - offsetY -  $('#tooltip').height());
        }else {
            $('#tooltip').css('top', e.pageY + offsetY );
        }    
    
    }).mouseleave(function() {
    // Remove tooltip element
        $("body").children('div#tooltip').remove();
    });
}
