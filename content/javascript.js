// A $( document ).ready() block.
$( document ).ready(function() {
    console.log( "ready!" );

    $(function(){
      $('#projects-list').mixItUp({
        animation: {
          duration: 400,
          effects: 'fade',
          easing: 'ease'
        },
        controls: {
        toggleFilterButtons: true,
        toggleLogic: 'and'
        }
      });  
    });

    $('#projects-list .panel-heading').click(function(){
        $(this).siblings('.panel-body').toggle();
    });
    // $(function() {
    //   $(".category-filter").click(function() {  //use a class, since your ID gets mangled
    //     $(this).toggleClass("active");      //add the class to the clicked element
    //   });
    // });

    // $(function() {
    //   $(".category-filter.active a").click(function() {  //use a class, since your ID gets mangled
    //     var category = $(this).data("target-category");
    //     $('.' + category).show( "slow", function() {});
    //   });
    // });

    // $(function() {
    //   $(".category-filter a").click(function() {  //use a class, since your ID gets mangled
    //     var category = $(this).data("target-category");
    //     $('.' + category).hide( "slow", function() {});
    //   });
    // });

    // $(function() {
    //   $(".project.panel.category-design").addClass("panel-primary");
    // });

    // $( ".toggle-design" ).click(function() {
    //   $( ".category-design" ).toggle( "slow", function() {
    //     // Animation complete.
    //   });
    // });

    // $( ".toggle-cms" ).click(function() {
    //   $( ".category-cms" ).toggle( "slow", function() {
    //     // Animation complete.
    //   });
    // });

});
