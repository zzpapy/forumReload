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