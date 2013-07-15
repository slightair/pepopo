class Pepopo.Note extends Backbone.Model
  defaults: ->
    enable: Math.random() * 100 > 50
    noteLength: 0.25

  schedule: (frequency, nextNoteTime) ->
    noteLength = @.get('noteLength')

    context = Pepopo.Machine.context
    gain = context.createGain()
    gain.gain.value = 0.3
    gain.gain.setTargetAtTime(0, nextNoteTime, noteLength)
    gain.connect Pepopo.Machine.masterGain

    osc = context.createOscillator()
    osc.connect gain
    osc.frequency.value = frequency

    osc.start nextNoteTime
    osc.stop nextNoteTime + noteLength
