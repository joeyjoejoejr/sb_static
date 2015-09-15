$(document).on("ready page:load", function() {

  
  // When the player is ready, add listeners for pause, finish, and playProgress
  function addEvents(iframe) {
    var player = $f(iframe);

    player.addEvent('ready', function() {
      player.addEvent('play', onPlay);
      player.addEvent('pause', onPause);
      player.addEvent('finish', onFinish);
      player.addEvent('playProgress', onPlayProgress);
    });
  }

  function onPlay(id) {
    trackEvent('Started video', id);
  }

  function onPause(id) {
    trackEvent('Paused video', id);
  }

  function onFinish(id) {
    trackEvent('Completed video', id);
  }

  function onPlayProgress(data, id) {
    var oldPercent;
    var percent = parseInt(data.percent*100);

    if (percent != oldPercent){
      if (percent == 25) {
        trackEvent('25% Video', id);
      } else if (percent == 50) {
        trackEvent('50% Video', id);
      } else if (percent == 75) {
        trackEvent('75% Video', id);
      }
      oldPercent = percent;  // prevent multiple events
    }
  }

  function trackEvent(event, id) {
    dataLayer.push({'event': 'Vimeo',
                    'eventCategory': 'Vimeo',
                    'eventAction': event,
                    'eventLabel': 'http://player.vimeo.com/video/',
                    'eventValue': undefined,
                    'eventNonInteraction': true,
                    'eventID': id
                  });
  }

  $.each(document.getElementsByTagName("iframe"), function(){
    if (/vimeo.com\/video/.test(this.src))
      addEvents(this);
  });
  
});
