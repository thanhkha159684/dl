$ = jQuery;
$(document).ready(function(){
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
    var img = $(this).attr('src').replace(/styles\S+\/+/g,"product/");
    tooltip($(this),img,title,body);
    
    
    });    
    $('.cloud-zoom-container').click(function(){  
    }).trigger('click');
 
});

Drupal.behaviors.dl_core = {
   attach: function (context, settings) {
   
   }
};
if (Drupal.ajax) {
        Drupal.ajax.prototype.commands.showcolorbox = function(ajax, response, status) {
                    $.colorbox({html:response.data,width:500,height:500});
        }
}

function tooltip(seletor,imgsrc,prefix,suffix) {
    var offsetX = 15;
    var offsetY = 25;
    var TooltipOpacity = 1;

    
    // Select all tags having a title attribute
    seletor.mouseenter(function(e) {     
    // Assign customTooltip to variable
    // Append tooltip element to body
    img = '<img src="'+imgsrc+'"/>'; 
    var content = '<div class ="tooltip-item">'+prefix+'</div>';
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
        $('#tooltip').css('top', e.pageY + offsetY );
         
    
    }).mouseleave(function() {
    // Remove tooltip element
        $("body").children('div#tooltip').remove();
    });
}
