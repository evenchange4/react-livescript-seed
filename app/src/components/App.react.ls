require! {
  \react 
} 

{ div, h1 } = react.DOM

App = react.createClass do
  render: ->
    div className: \outlineapp, "I am satisfied 33"

module.exports = App