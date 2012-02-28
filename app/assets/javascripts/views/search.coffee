searchField = _.template("
  <input id='search' class='pull-left' type='text' value='' placeholder='Search' name='search'>
")

window.Search = Backbone.View.extend(
  el: '#searchContainer'

  events:
    "keyup input#search": "plantSearch"
    "click input#search": "plantSearch"

  initialize: ->
    _.bindAll this, "plantSearch"
    @render()

  render: ->
    $(searchField()).appendTo(@el)
    this

  plantSearch: ->
    query = $('input#search').val()
    plants.fetch(data: "search=" + query)
    document.getElementById('plantTableHead').scrollIntoView(true);

)
search = new Search()
