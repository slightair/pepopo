class Pepopo.MachineView extends Backbone.View
  initialize: ->
    @context = new webkitAudioContext()

    @masterGain = @context.createGain()
    @masterGain.connect @context.destination
    @masterGain.gain.value = 0.4

    @nextNoteTime = 0
    @currentNote = 0
    @tempo = 60
    @noteMax = 16
    @timer = null

    @render()

  el: '#pepopo-machine'

  events:
    'click #play-pepopo-machine': 'play'
    'click #stop-pepopo-machine': 'stop'

  render: ->
    if Pepopo.Tracks
      Pepopo.Tracks.each (track) ->
        view = new Pepopo.TrackView model: track
        $('#pepopo-machine-tracks').append view.render().el

  play: ->
    return if @timer

    @nextNoteTime = @context.currentTime
    @currentNote = 0

    @schedule()

  stop: ->
    clearInterval @timer
    @timer = null

  schedule: =>
    while @nextNoteTime < @context.currentTime + 0.200
      Pepopo.Tracks.each (track) =>
        track.schedule @currentNote, @nextNoteTime

      secondsPerBeat = 60.0 / @tempo
      @nextNoteTime += 0.25 * secondsPerBeat

      @currentNote++
      @currentNote = 0 if @currentNote >= @noteMax
    @timer = setTimeout(@schedule, 0)
