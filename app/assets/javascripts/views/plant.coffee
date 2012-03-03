plantTemplate = _.template("
  <td><%= common_name %></td>
  <td><%= genus %></td>
  <td><%= species %></td>
  <td><%= zone %></td>
  <td><%= light %></td>
  <td><%= moisture %></td>
  <td><%= soil_texture %></td>
  <td><%= soil_ph %></td>
  <td><%= native %></td>
  <td><%= edible %></td>
  <td><%= medicinal %></td>
  <td><%= nitrogen_fixer %></td>
  <td><a href='/plants/<%= id %>' class='btn btn-info'>more info</a></td>
  <td><a href='/plants/<%= id %>/edit' class='btn btn-primary'>edit<a></td>
")

window.PlantView = Backbone.View.extend(

  tagName: 'tr'
  className: 'plant_row'

  initialize: ->
    _.bindAll this

  render: () ->
    table = document.getElementById('plantIndex')
    row = plantTemplate(@model.toJSON())
    $(row).appendTo(@el)
    $(@el).appendTo(table)
    this
)

