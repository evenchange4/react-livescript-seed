require! {
  \react : React
  \../actions/AppActionCreators
  \../stores/TextItemStore
  \../constants/AppConstants
} 

{ div, h1, p } = React.DOM
TextItem = React.createFactory require \./TextItem.react

App = React.createClass do

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