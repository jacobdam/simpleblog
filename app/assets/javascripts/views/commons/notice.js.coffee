#= require jquery.dotimeout

App.Views.Notice = Backbone.View.extend
    className: "success"
    displayLength: 5000
    defaultMessage: ''

    initialize: ->
        _.bindAll(this, 'render')
        @message = @options.message || @defaultMessage
        @render()

    render: ->
        $(@el).html(@message)
        $(@el).hide()
        $('#notice').html(@el)
        $(@el).slideDown()
          
        $.doTimeout @displayLength, =>
            $(@el).slideUp()
            $.doTimeout 2000, =>
                @remove()
        this

App.Views.Error = App.Views.Notice.extend
    className: "error"
    defaultMessage: 'Uh oh! Something went wrong. Please try again.'
