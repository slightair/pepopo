class Pepopo.Track extends Backbone.Model
  defaults: ->
    frequency: 440
    order: Pepopo.Tracks.nextOrder()
    notes: new Pepopo.NoteList({track: @order, order: i} for i in [1..16])
  schedule: (noteIndex, nextNoteTime) ->
    frequency = @.get('frequency')

    note = @.get('notes').models[noteIndex]
    note.schedule(frequency, nextNoteTime) if note.get('enable')
