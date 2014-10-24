require! {
  \../dispatcher/AppDispatcher
  \../constants/AppConstants
  \../actions/AppActionCreators
  \react/lib/merge
  \events
} 

# 取得一個 pub/sub 廣播器
EventEmitter = events.EventEmitter
Store = new EventEmitter()

_text = {text: \InitText}

# //========================================================================
# // Public API
# // 供外界取得 store 內部資料

TextItemStore = merge EventEmitter.prototype, do
  getText: ->
    _text

# //========================================================================
# // event handlers
#  * 向 Dispatcher 註冊自已，才能偵聽到系統發出的事件
#  * 並且取回 dispatchToken 供日後 async 操作用
#  */

AppDispatcher.register (payload) !->
  action = payload.action

  switch action.actionType
  case AppConstants.TEXTITEM_UPDATE
    update action.item
  default
    return true

  TextItemStore.emit AppConstants.CHANGE_EVENT
  return true


# //========================================================================
# // private methods

function update (item)
  _text.text = item

module.exports = TextItemStore
