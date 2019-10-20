// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// var options = [
// 	{selector: '.title', offset: 1, callback: function(el) { Materialize.fadeInImage($(el)); } }, 
// 	{selector: '.img', offset: 1, callback: function(el) { Materialize.fadeInImage($(el)); } }, 
// 	{selector: '.text', offset: 1, callback: function(el) { Materialize.fadeInImage($(el)); } },
// ];
function readyFn( jQuery ) {
	$(".button-collapse").sideNav();
	$(".collapsible").collapsible();
}
$( window ).on( "load", readyFn);