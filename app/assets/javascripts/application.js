// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

(function($){
  $.fn.ajaxFiltering = function() {
    // cache spell-filter DOM element
    var spellFilter = this;

    // remove submit button
    $('input.btn', spellFilter).remove();

    // add reset button
    spellFilter.append('<input id="reset" class="btn btn-default" type="reset" value="Reset">');
    $('input#reset', spellFilter).click(function(event) {
      $('input[type="checkbox"]', spellFilter).attr('checked', false);
      spellFilter.submit();
    });

    // submit form when checkbox selected
    $('input[type="checkbox"]', spellFilter).click(function(event) {
      spellFilter.submit();
    });

    return spellFilter;
  };

  $.fn.ajaxSearch = function() {
    var searchInput = this;

    $('input#search', searchInput).keyup(function(event) {
      if (this.value.length >= 3 || this.value.length == 0) {
        $('input#search', searchInput).parent().submit();
      }
    });
  }
}(jQuery));
