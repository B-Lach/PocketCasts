// Show the close button - default is hidden
// TODO: - Validate jQuery was loaded
$('.player_close').show()

// Get the element we want to add a watcher
// TODO: - Validate angular is available
var element = angular.element(document.getElementById('audio_player')).scope()
// set the watcher
element.$watch('mediaPlayer.loaded', (newVal, oldVal) => {
  window.webkit.messageHandlers.mediaPlayer.postMessage(
    {'old': oldVal, 'new': newVal }
  )
})

// handler definition
var handlePlayPauseMediaKey = () => {
    element.playPause()
}

var handleBackwardMediaKey = () => {
    element.jumpBack()
}

var hanldeForwardMediaKey = () => {
    element.jumpForward()
}
