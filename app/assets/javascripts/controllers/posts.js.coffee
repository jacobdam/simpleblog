App.Controllers.Posts = Backbone.Controller.extend
  routes:
    "posts/:id": "edit"
    "":          "index"
    "posts/new": "newDoc"

  edit: (id) ->
    doc = new Post({ id: id });
    doc.fetch
      success: (model, resp) ->
          new App.Views.Edit({ model: doc });
      error:  ->
          new Error({ message: 'Could not find that document.' });
          window.location.hash = '#';

  newDoc: ->
    new App.Views.Edit({model: new Document})

  index: ->
    posts = new App.Collections.Posts()
    posts.fetch
      success: ->
          new App.Views.Index({ collection: posts })
          
      error: ->
          new Error({ message: "Error loading posts." })
