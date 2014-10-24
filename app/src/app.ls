require! {
  \react 
  \./components/App.react
}

react.renderComponent do
  App null 
  document.getElementById \container
