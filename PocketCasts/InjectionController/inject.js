// Show the close button - default is hidden
// TODO: - Validate jQuery was loaded
$('.player_close').show()

// Get the element we want to watch
// TODO: - Validate angular is used
var element = angular.element(document.getElementById('audio_player')).scope()

element.$watch('mediaPlayer.loaded', (newVal, oldVal) => {
  window.webkit.messageHandlers.mediaPlayer.postMessage(
    JSON.stringify({'old': oldVal, 'new': newVal })
  )
})
