class Pepopo.TrackList extends Backbone.Collection
  model: Pepopo.Track
  nextOrder: -> unless @length then 1 else @last().get('order') + 1
