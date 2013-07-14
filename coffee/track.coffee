class Pepopo.Track extends Backbone.Model
  defaults: ->
    frequency: 440
    order: Pepopo.Tracks.nextOrder()
    notes: new Pepopo.NoteList({track: @order, order: i} for i in [1..16])
