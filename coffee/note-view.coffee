class Pepopo.NoteView extends Backbone.View
  tagName: 'li'
  className: 'pepopo-machine-note'
  render: ->
    @.$el.html(_.template($('#pepopo-machine-note-template').html(), @model.toJSON()))
    @