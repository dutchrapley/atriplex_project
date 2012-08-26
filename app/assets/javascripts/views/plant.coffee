primaryPlantTemplate = _.template("
  <td><%= common_name %></td>
  <td><%= genus %> <%= species %></td>
  <td class='edit-plant'><a href='/plants/<%= id %>/edit' class='btn btn-primary'>edit<a></td>
")

moreInfoTemplate = _.template("
  <tr id='more_<%= id %>' class='more-info' style='display: none;'>
    <td>
      <u>Form</u><br /><%= form %><hr>
      <u>Height</u><br /><%= height %><hr>
      <u>Width</u><br /><%= width %><hr>
      <u>Root Span</u><br /><%= root_span %><hr>
      <u>Lifespan</u><br /><%= lifespan %><hr>
      <u>Growth Rate</u><br /><%= growth_rate %>
    </td>
    <td>
      <u>Nectary</u><br /><%= nectary %><hr>
      <u>Ground Cover</u><br /><%= ground_cover %><hr>
      <u>Cover Crop</u><br /><%= cover_crop %>
    </td>
    <td>
      <u>Dynamic Accumuator</u><br /><%= dynamic_accumulator %><hr>
      <u>Flavor Profile</u><br /><%= flavor_profile %>
    </td>
    <td>
      <u>Seed Stock Sources</u><br /><%= seed_stock_sources %><hr>
      <u>Local Examples</u><br /><%= local_examples %>
    </td>
    <td><u>Sources</u><br /><%= sources %></td>
    <td colspan='3'><u>Notes</u><br /><%= notes %></td>
    <td>
      <u>Insects</u><br /><%= insects %><hr>
      <u>Animals</u><br /><%= animals %>
    </td>
    <td id='images_<%= id %>' colspan='3'></td>
  </tr>
")

window.PlantView = Backbone.View.extend(

  tagName: 'tr'
  className: 'plant_row'

  events: ->
    'click': 'show' # 'toggleMore'
    'click #plant_rog': 'show' #'toggleMore'

  initialize: ->
    _.bindAll this, "toggleMore", "grabImages"

  render: () ->
    $(@el).attr('id', @model.get('id'))
    table = document.getElementById('plantIndex')
    primaryRow = primaryPlantTemplate(@model.toJSON())
    moreInfo = moreInfoTemplate(@model.toJSON())
    $(primaryRow).appendTo(@el)
    $(@el).appendTo(table)
    # $(@el).tooltip({title: 'click to expand/collapse more info'})
    # $(moreInfo).appendTo(table)
    this

  show: ->
    window.location.href = "/#{@model.get('id')}"

  toggleMore: ->
    console.log @model.get('id')
    clicked = @model.get('id')
    $("##{clicked}").toggleClass('open')
    @grabImages()
    $("#more_#{clicked}")
      .toggle()
      .toggleClass('open')

  grabImages: ->
    that = this
    worker = new Worker("wiki_worker.js")

    worker.onmessage = (event) ->
      $("#images_#{that.model.get('id')}").html("")

      console.log event.data, that.model.get('id')

      for image in event.data
        imgSrc = "<img src=#{image}>"
        $("#images_#{that.model.get('id')}").append(imgSrc)

    worker.postMessage("#{@model.get('common_name')}")
)

