/*
Template Name: Gatcomart;
Description:  Mega Shop Responsive Ecommerce HTML Template;
Template URI:;
Author Name:Md Bayazid Hasan;
Author URI:;
Version: 1.0;

NOTE: main.js, All custom script and plugin activation script in this file. 
*/

/*================================================
[  Table of contents  ]
==================================================
 1. preloader Activation
 2. Newsletter Popup
 3. Mobile Menu Activation
 4. Tooltip Activation
 5.Menu
    5.1 Vertical-Menu Activation
    5.2 Category menu Activation
    5.3 Checkout Page Activation
 6. NivoSlider Activation
 7. Second Featured Product & New Products Activation
 8. Countdown Js Activation
 9. HotDeal Activation
 10. Best Seller Activation
 11. Recent Post,Random & First Featured Pro Activation
 12. Recent Post Activation
 13. WOW Js Activation
 14. ScrollUp Activation
 15. Price Slider Activation
 16. Related Main Product activation
 17. Thumbnail Product activation
 18. HotDeal Tow Activation
 19. Logo Brand Two Activation
 20. Best Seller Two & Recent Post Two Activation
================================================*/

(function ($) {
    "use Strict";
    /*----------------------------
    1. preloader Activation
    -----------------------------*/
    $(window).load(function () {
        $(".preloader").fadeOut("slow");
    });
    
    /*--------------------------
    2. Newsletter Popup
    ---------------------------*/
    setTimeout(function () {
        $('.popup_wrapper').css({
            "opacity": "1",
            "visibility": "visible"
        });
        $('.popup_off').on('click',function () {
            $(".popup_wrapper").fadeOut(500);
        })
    }, 2500);
    
    /*----------------------------
    3. Mobile Menu Activation
    -----------------------------*/
    jQuery('.mobile-menu nav').meanmenu({
        meanScreenWidth: "991",
    });
    
    /*----------------------------
    4. Tooltip Activation
    ------------------------------ */
    // $('[data-bs-toggle="tooltip"]').tooltip({
    //     animated: 'fade',
    //     placement: 'top',
    //     container: 'body'
    // });
    
    /*----------------------------
    5.1 Vertical-Menu Activation
    -----------------------------*/
    $('.categorie-title').on('click', function () {
        $('.vertical-menu-list').slideToggle();
    });

    /*------------------------------
	 5.2 Category menu Activation
	------------------------------*/
	$('#cate-toggle li.has-sub>a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
			element.find('ul').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul').slideDown();
			element.siblings('li').children('ul').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			element.siblings('li').find('ul').slideUp();
		}
	});
	$('#cate-toggle>ul>li.has-sub>a').append('<span class="holder"></span>');  
    
    /*----------------------------
    5.3 Checkout Page Activation
    -----------------------------*/
    $('#showlogin').on('click', function () {
        $('#checkout-login').slideToggle();
    });
     $('#showcoupon').on('click', function () {
        $('#checkout_coupon').slideToggle();
    });
     $('#cbox').on('click', function () {
        $('#cbox_info').slideToggle();
    });
     $('#ship-box').on('click', function () {
        $('#ship-box-info').slideToggle();
    });
    
    /*----------------------------
    6. NivoSlider Activation
    -----------------------------*/
    $('#slider').nivoSlider({
        effect: 'random',
        animSpeed: 300,
        pauseTime: 5000,
        directionNav: true,
        manualAdvance: false,
        controlNavThumbs: false,
        pauseOnHover: true,
        controlNav: true,
        prevText: "<i class='zmdi zmdi-chevron-left'></i>",
        nextText: "<i class='zmdi zmdi-chevron-right'></i>"
    });
    
    /*---------------------------------------------------------
    7. Second Featured Product & New Products Activation
    ----------------------------------------------------------*/
    $('.second-featured-pro')
        .on('changed.owl.carousel initialized.owl.carousel', function (event) {
            $(event.target)
                .find('.owl-item').removeClass('last')
                .eq(event.item.index + event.page.size - 1).addClass('last');
        }).owlCarousel({
            loop: false,
            nav: true,
            dots: false,
            smartSpeed: 1000,
            addClassActive: true,
            navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                768: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }

        })

    /*----------------------------
    8. Countdown Js Activation
    -----------------------------*/
    $("#countdown")
        .countdown("2026/04/07", function (event) {
            $(this).html(
                event.strftime('<div class="count">%D <span>Days</span></div><div class="count">%H <span>Hour</span></div><div class="count">%M <span>Mins</span></div><div class="count"> %S <span>Secs</span></div>') /* no space between two div!otherwise markup and script don't work*/
            );
        });
    $("#countdown-two")
        .countdown("2025/03/07", function (event) {
            $(this).html(
                event.strftime('<div class="count">%D <span>Days</span></div><div class="count">%H <span>Hour</span></div><div class="count">%M <span>Mins</span></div><div class="count"> %S <span>Secs</span></div>') /* no space between two div!otherwise markup and script don't work*/
            );
        });
    $("#countdown-three")
        .countdown("2025/02/07", function (event) {
            $(this).html(
                event.strftime('<div class="count">%D <span>Days</span></div><div class="count">%H <span>Hour</span></div><div class="count">%M <span>Mins</span></div><div class="count"> %S <span>Secs</span></div>') /* no space between two div!otherwise markup and script don't work*/
            );
        });
     $("#countdown-four")
        .countdown("2025/12/07", function (event) {
            $(this).html(
                event.strftime('<div class="count">%D <span>Days</span></div><div class="count">%H <span>Hour</span></div><div class="count">%M <span>Mins</span></div><div class="count"> %S <span>Secs</span></div>') /* no space between two div!otherwise markup and script don't work*/
            );
        });
    
    /*----------------------------
    9. HotDeal Activation
    -----------------------------*/
    $('.hot-deal').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 0,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2,
                margin: 30
            },
            992: {
                items: 1
            }
        }
    })
    
    /*----------------------------
    10. Best Seller Activation
    -----------------------------*/
    $('.best-seller').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 0,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            1000: {
                items: 2
            }
        }
    })
    
    /*----------------------------------------------------------
    11. Recent Post,Random & First Featured Pro Activation
    -----------------------------------------------------------*/
    $('.recent-post-active').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 5,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    })
    
    /*----------------------------
    12. Recent Post Activation
    -----------------------------*/
    $('.active-logo-brand').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 30,
        responsive: {
            0: {
                items: 2
            },
            480: {
                items: 3
            },
            1000: {
                items: 3
            }
        }
    })
    
    /*----------------------------
     13. WOW Js Activation
    -----------------------------*/
    new WOW().init();
    
    /*----------------------------
    14. ScrollUp Activation
    -----------------------------*/
    $.scrollUp({
        scrollName: 'scrollUp', // Element ID
        topDistance: '300', // Distance from top before showing element (px)
        topSpeed: 1000, // Speed back to top (ms)
        animation: 'fade', // Fade, slide, none
        scrollSpeed: 900,
        animationInSpeed: 1000, // Animation in speed (ms)
        animationOutSpeed: 1000, // Animation out speed (ms)
        scrollText: '<i class="zmdi zmdi-chevron-up"></i>', // Text for element
        activeOverlay: false// Set CSS color to display scrollUp active point, e.g '#00FFFF'
    });
    
    /*----------------------------
    15. Price Slider Activation
    -----------------------------*/
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: 80,
        values: [0, 74],
        slide: function (event, ui) {
            $("#amount").val("$" + ui.values[0] + "  $" + ui.values[1]);
        }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) +
        "  $" + $("#slider-range").slider("values", 1));
    
    /*-----------------------------------------
    16. Related Main Product Activation
    ------------------------------------------*/
     $('.related-main-pro')
        .on('changed.owl.carousel initialized.owl.carousel', function (event) {
            $(event.target)
                .find('.owl-item').removeClass('last')
                .eq(event.item.index + event.page.size - 1).addClass('last');
        }).owlCarousel({
            loop: false,
            nav: true,
            dots: false,
            smartSpeed: 1000,
            addClassActive: true,
            navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
            margin: 0,
            responsive: {
            0: {
                items: 1
            },
            480: {
                items: 2
            },
            768: {
                items: 3
            },
            1000: {
                items: 5
            }
        }

        })

    /*-------------------------------------
    17. Thumbnail Product activation
    --------------------------------------*/
    $('.thumb-menu').owlCarousel({
        loop: false,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 15,
        smartSpeed: 1000,
        nav: true,
        dots: false,
        responsive: {
            0: {
                items: 4
            },
            600: {
                items: 4
            },
            1000: {
                items: 5
            }
        }
    })
    $('.thumb-menu a').on('click', function () {
        $('.thumb-menu a').removeClass('active');
    })
    
    /*----------------------------
    18. HotDeal Tow Activation
    -----------------------------*/
    $('.hotdeal-two').owlCarousel({
        loop: true,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 15,
        nav: true,
        smartSpeed: 1000,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 3
            }
        }
    })
    
    /*----------------------------
    19. Logo Brand Two Activation
    -----------------------------*/
    $('.logo-brand-two').owlCarousel({
        loop: true,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 15,
        nav: true,
        smartSpeed: 1000,
        dots: false,
        responsive: {
            0: {
                items: 3
            },
            768: {
                items: 4
            },
            1000: {
                items: 6
            }
        }
    })
    
    /*----------------------------------------------------
    20. Best Seller Two & Recent Post Two Activation
    -----------------------------------------------------*/
    $('.best-seller-two').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,
        navText: ["<i class='zmdi zmdi-chevron-left'></i>", "<i class='zmdi zmdi-chevron-right'></i>"],
        margin: 0,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 1
            },
            1000: {
                items: 2
            }
        }
    })
    
})(jQuery);