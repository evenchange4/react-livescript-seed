require! {
  \react : React
}

App = React.createFactory require \./components/App.react

React.render do
  App null 
  document.getElementById \container
