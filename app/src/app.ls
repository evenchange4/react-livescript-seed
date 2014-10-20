require! {
  \react 
  \App : \./components/App.react
}

react.renderComponent do
  App null 
  document.getElementById \react
