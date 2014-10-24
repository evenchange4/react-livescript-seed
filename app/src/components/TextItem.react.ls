require! {
  \react 
  \../actions/AppActionCreators
} 

{ div, p, button } = react.DOM

App = react.createClass do
  render: ->
    div null,
      button do
        onClick: @handleClick
        \Click
      p null, @props.text

  handleClick: (evt) !->
    evt.preventDefault();
    AppActionCreators.updateTextItem \Update!

module.exports = App