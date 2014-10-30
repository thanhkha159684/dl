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
    $('.cloud-zoom-container').click(function(){
        var href = $(this).find('#wrap a').attr('href');
        $.coloxbox({html:"sddsd"});
        
    }).trigger('click');
  
});
if (Drupal.ajax) {
        Drupal.ajax.prototype.commands.showcolorbox = function(ajax, response, status) {
                    console.log(response);
                    $.colorbox({html:response.data,width:500,height:500});
        }
}

