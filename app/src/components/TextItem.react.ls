require! {
  \react : React
  \../actions/AppActionCreators
} 

{ div, p, button, input } = React.DOM

App = React.createClass do
  getInitialState: ->
    {value: \Hello!}
  render: ->
    div null,
      button do
        onClick: @handleClick
        \Click
      p null, @props.text + @state.value
      input do 
        type: \text
        onChange: @handleChange


  handleClick: (evt) !->
    evt.preventDefault();
    AppActionCreators.updateTextItem \Update!
  handleChange: (event) !->
    @setState {value: event.target.value}


module.exports = App