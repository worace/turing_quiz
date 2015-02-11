// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var Hidable = function(placeholderText, domElement) {
  this.placeholderText = placeholderText
  this.actualText      = domElement.text()
  this.domElement      = domElement
  this.hidden          = false
}
Hidable.prototype.toggle = function() {
  if(this.hidden) this.show()
  else            this.hide()
  return this
}
Hidable.prototype.hide = function() {
  this.domElement.text(this.placeholderText)
  this.hidden = true
  return this
}
Hidable.prototype.show = function() {
  this.domElement.text(this.actualText)
  this.hidden = false
  return this
}

$(function() {
  var hideByClass = function(className, placeholderText) {
    jQuery(className).each(function(index, rawDomElement) {
      var domElement = jQuery(rawDomElement)
      var hidable    = new Hidable(placeholderText, domElement).toggle()
      domElement.click(function() { hidable.toggle() })
    })
  }
  hideByClass('.answer',          'See Answer')
  hideByClass('.hint',            'Hint')
  hideByClass('.further-thought', 'Going Deeper')
})
