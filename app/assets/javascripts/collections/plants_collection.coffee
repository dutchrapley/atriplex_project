window.Plants = Backbone.Collection.extend(
  model: Plant
  url: "/plants/search.json"

  comparator: (plant) ->
    plant.get('common_name')

  initialize: ->
    @bind('reset', @populateTable, this)
    @bind('fetch', @populateTable, this)

  populateTable: ->
    $('.plant_row').each( -> $(this).remove() ) unless $('#search').val() == ""
    _.each(this.models, (plant) ->
      plantView = new PlantView(model: plant)
      plantView.render(plant)
    )

)

plants = new Plants()
