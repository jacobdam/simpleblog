class App.Views.Index extends View
  @template: JST.compile """
      <% if (collection.models.length > 0) { %>
        <h3><a href="#posts/new">Create New</a></h3>
        <ul>
          <% collection.each(function(item) { %>
            <li><a href="#posts/<%= item.id %>"><%= item.escape('title') %></a></li>
          <% }); %>
        </ul>
      <% } else { %>
        <h3>No documents! <a href="#posts/new">Create one</a></h3>
      <% } %>
   """

  initialize: ->
    @render()

  render: ->
    out = App.Views.Index.template({collection: @collection})

    $(this.el).html(out)
    $('#app').html(this.el);
