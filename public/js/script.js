$(".outils").on("click",function(e){
    e.stopPropagation()
    id = $(this).attr('name')
    $("#"+id).toggleClass("hide")
    if($("#"+id).hasClass("flex")){
        $("#"+id).removeClass("flex")
    }
    else{
        $("#"+id).addClass("flex")
    }
    $(this).toggleClass("hide")
})
$(".message").each(function(){
    if($(this).text().length > 0){
        $(this).slideDown(500, function(){
            $(this).delay(3000).slideUp(500)
        })
    }
})