class Pepopo.TrackView extends Backbone.View
  className: 'pepopo-machine-track'
  render: ->
    @.$el.html(_.template($('#pepopo-machine-track-template').html(), @model.toJSON()))

    notes = @model.get('notes')
    if notes
      notes.each (note) =>
        view = new Pepopo.NoteView model: note
        $(@.$el).children(".pepopo-machine-notes").append view.render().el
    @