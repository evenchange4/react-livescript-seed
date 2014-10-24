require! {
  \react 
  \../actions/AppActionCreators
  \./TextItem.react
  \../stores/TextItemStore
  \../constants/AppConstants
} 

{ div, h1, p } = react.DOM

App = react.createClass do

  getInitialState: ->
    @getTruth!
  componentDidMount: !->
    TextItemStore.addListener(AppConstants.CHANGE_EVENT, @_onChange)
  render: ->
    div null,
      h1 null, "React Livescript Seed"
      p className: \classname, "I am in components/App.react.ls"
      TextItem do
        text: @state.text

# // private methods - 處理元件內部的事件
  _onChange: !->
    @setState @getTruth!
  getTruth: ->
    TextItemStore.getText!

module.exports = App