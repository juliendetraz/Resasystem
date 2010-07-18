jQuery(document).ready(function($) {
    $('div.navigation').css({'width' : '235px', 'float' : 'right'});
    $('div.content').css('display', 'block');

    var onMouseOutOpacity = 0.67;
    $('#thumbs ul.thumbs li').opacityrollover({
        mouseOutOpacity:   onMouseOutOpacity,
        mouseOverOpacity:  1.0,
        fadeSpeed:         'fast',
        exemptionSelector: '.selected'
    });

    var gallery = $('#thumbs').galleriffic({
        delay:                     3000,
        numThumbs:                 6,
        preloadAhead:              3,
        enableTopPager:            true,
        enableBottomPager:         false,
        maxPagesToShow:            6,
        imageContainerSel:         '#slideshow',
        controlsContainerSel:      '#controls',
        captionContainerSel:       '#caption',
        loadingContainerSel:       '#loading',
        renderSSControls:          false,
        renderNavControls:         false,
        nextPageLinkText:          '&rsaquo; &rsaquo;',
        prevPageLinkText:          '&lsaquo; &lsaquo;',
        enableHistory:             true,
        autoStart:                 true,
        syncTransitions:           true,
        defaultTransitionDuration: 900,
        onSlideChange:             function(prevIndex, nextIndex) {
            // 'this' refers to the gallery, which is an extension of $('#thumbs')
            this.find('ul.thumbs').children()
                .eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
                .eq(nextIndex).fadeTo('fast', 1.0);
        },
        onPageTransitionOut:       function(callback) {
            this.fadeTo('fast', 0.0, callback);
        },
        onPageTransitionIn:        function() {
            this.fadeTo('fast', 1.0);
        }
    });
    function pageload(hash) {
        if(hash) {
            $.galleriffic.gotoImage(hash);
        } else {
            gallery.gotoIndex(0);
        }
    }

    $.historyInit(pageload, "advanced.html");

    $("a[rel='history']").live('click', function(e) {
        if (e.button != 0) return true;

        var hash = this.href;
        hash = hash.replace(/^.*#/, '');

        $.historyLoad(hash);

        return false;
    });
});