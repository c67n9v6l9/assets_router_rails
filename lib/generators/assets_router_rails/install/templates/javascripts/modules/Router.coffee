class Router
  list: {}
  add: (path, controller_action) ->
    @list[path] = controller_action
  route: ->
    Controller = window.NS.Controller
    request_path = location.pathname

    _.each @list, (controller_action, path) ->
      if new RegExp("^#{path}$").test request_path
        console.log controller_action

        controller_name = controller_action.split('#')[0]
        action_name = controller_action.split('#')[1]

        controller = new Controller[controller_name]
        do controller[action_name]

@NS.Router = Router
