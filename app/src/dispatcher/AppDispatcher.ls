require! {
  \flux
  \react/lib/copyProperties
} 

Dispatcher = flux.Dispatcher

AppDispatcher = copyProperties do 
  new Dispatcher()
  do 
    handleServerAction: (action) !->
      @dispatch do
        source: \SERVER_ACTION
        action: action
    handleViewAction: (action) !->
      @dispatch do
        source: \VIEW_ACTION
        action: action

module.exports = AppDispatcher