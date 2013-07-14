class Pepopo.Note extends Backbone.Model
  defaults: ->
    enable: Math.random() * 100 > 50
