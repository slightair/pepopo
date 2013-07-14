window.Pepopo = {}

$ ->
  Pepopo.Tracks = new Pepopo.TrackList

  Pepopo.Tracks.add(frequency: 220)
  Pepopo.Tracks.add(frequency: 440)
  Pepopo.Tracks.add(frequency: 880)

  Pepopo.Machine = new Pepopo.MachineView
