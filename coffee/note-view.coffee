class Pepopo.NoteView extends Backbone.View
  tagName: 'button'
  className: 'pepopo-machine-note btn'
  render: ->
    @.$el.html(_.template($('#pepopo-machine-note-template').html(), @model.toJSON()))
    $(@.$el).addClass('btn-primary') if @model.get('enable')
    @