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
});