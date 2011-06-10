class App.Views.Edit extends View
  @template: JST.compile """
       <form>
         <label for="post_title">Title</label>
         <input id="post_title" name="title" type="text" value="<%= model.escape('title') %>" />
   
         <label for="post_body">Body</label>
         <textarea id="post_body" name="body"><%= model.escape('body') %></textarea>
   
         <button><%= model.isNew() ? 'Create' : 'Save' %></button>
       </form>
   """

  events: 
      "submit form": "save"
      
  initialize: ->
    @render()
    
  save: (e)->
    e.preventDefault()

    msg = if @model.isNew() then 'Successfully created!' else 'Saved!'
    
    this.model.save {
        title: @$('[name=title]').val()
        body: @$('[name=body]').val(),
      },
      success: (model, resp) =>
        new App.Views.Notice message: msg
        @model = model
        @render()
        @delegateEvents()
        
        #Backbone.history.saveLocation "posts/#{model.id}"
        window.location = '#'
      error: => new App.Views.Error();
      
  render: ->
    html = App.Views.Edit.template {model: @model}
    $(@el).html(html);
    $('#app').html(@el);
    
    this.$('[name=title]').val(this.model.get('title'))
