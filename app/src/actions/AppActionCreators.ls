require! {
  \../dispatcher/AppDispatcher
  \../constants/AppConstants
} 

module.exports =
  updateTextItem: (item) !->
    AppDispatcher.handleViewAction do
      actionType: AppConstants.TEXTITEM_UPDATE
      item: item


