class @Post extends Model
  url: ->
    if @id? then "/posts/#{@id}" else "/posts"
  
App.Collections.Posts = Backbone.Collection.extend
    model: @Post
    url: '/posts'
