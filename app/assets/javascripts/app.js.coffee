#= require jst

@App = 
    Views: {}
    Controllers: {}
    Collections: {}
    init: ->
        new App.Controllers.Posts();
        Backbone.history.start();
