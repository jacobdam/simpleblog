App.Views.Index = Backbone.View.extend
  initialize: ->
    @render()

  render: ->
    if @collection.models.length > 0
        out = "<h3><a href='#new'>Create New</a></h3><ul>";
        @collection.each (item) ->
            out += "<li><a href='#posts/" + item.id + "'>" + item.escape('title') + "</a></li>";
        out += "</ul>";
    else
        out = "<h3>No documents! <a href='#new'>Create one</a></h3>";

    $(this.el).html(out)
    $('#app').html(this.el);
