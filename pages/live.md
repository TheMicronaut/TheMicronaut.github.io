---
layout: page
title: Micronaut On Air
excerpt: "live music streaming"
hidelogo: true
enable_chat: true
search_omit: true
permalink: '/live/'
---
<figure>
<img src="/images/dancing-particles.gif" alt="dancing-particles-image" class="center non-selectable"/>
</figure>
<script>
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
(function (win, doc, script, source, objectName) { (win.RadionomyPlayerObject = win.RadionomyPlayerObject || []).push(objectName); win[objectName] = win[objectName] || function (k, v) { (win[objectName].parameters = win[objectName].parameters || { src: source, version: '1.1' })[k] = v; }; var js, rjs = doc.getElementsByTagName(script)[0]; js = doc.createElement(script); js.async = 1; js.src = source; rjs.parentNode.insertBefore(js, rjs); }(window, document, 'script', 'https://www.radionomy.com/js/radionomy.player.js', 'radplayer'));
radplayer('url', 'glimmeringsounds');
if( isMobile.any() ) {
  radplayer('type', 'mobile');
} else {
  radplayer('type', 'horizontal');
}
radplayer('autoplay', '1');
radplayer('volume', '50');
radplayer('color1', '#ffffff');
radplayer('color2', '#000000');
</script>
<div class="radionomy-player"></div>
Through "Glimmering Sounds", our music radio stream hosted by [radionomy.com](http://www.radionomy.com/en/radio/glimmeringsounds){:target="_blank"}, we share our favourite music. You are most welcome to tune in. This stream is mainly scheduled playlists, but every now and then, we make some time for a live broadcast.

<!-- Next live broadcast: <span id="next-streaming" title="2016-09-25T19:30:00+02:00"></span>

<div id="clockdiv" class="center non-selectable">
  <div>
    <span class="days"></span>
    <div class="smalltext">Days</div>
  </div>
  <div>
    <span class="hours"></span>
    <div class="smalltext">Hours</div>
  </div>
  <div>
    <span class="minutes"></span>
    <div class="smalltext">Minutes</div>
  </div>
  <div>
    <span class="seconds"></span>
    <div class="smalltext">Seconds</div>
  </div>
</div> 
-->

<figure class="center">
	<a href="{{ site.external_data_url }}/images/posts/stories/Man-In-Water-Stephen-Sheffield.png"><img src="{{ site.external_data_url }}/images/posts/stories/Man-In-Water-Stephen-Sheffield.png" alt="Man In Water, by Stephen Sheffield" /></a>
	<figcaption>Photo courtesy: Stephen Sheffield</figcaption>
</figure>

<script type="text/javascript">
    var streamdate = document.getElementById('next-streaming');
    var deadline = new Date( streamdate.getAttribute('title') ); 
	streamdate.innerHTML = deadline.toString();
	
	function getTimeRemaining(endtime) {
		var seconds = 0;
		var minutes = 0;
		var hours = 0;
		var days = 0;	
		var nowdate = new Date();
		var t = Date.parse(endtime) - Date.parse(nowdate);
		if (endtime > nowdate) {
			var seconds = Math.floor((t / 1000) % 60);
			var minutes = Math.floor((t / 1000 / 60) % 60);
			var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
			var days = Math.floor(t / (1000 * 60 * 60 * 24));
		} else {
			t = 0;
		}
		return {
			'total': t,
			'days': days,
			'hours': hours,
			'minutes': minutes,
			'seconds': seconds
		};
	}

	function initializeClock(id, endtime) {
		var clock = document.getElementById(id);
		var daysSpan = clock.querySelector('.days');
		var hoursSpan = clock.querySelector('.hours');
		var minutesSpan = clock.querySelector('.minutes');
		var secondsSpan = clock.querySelector('.seconds');

		function updateClock() {
			var t = getTimeRemaining(endtime);
			daysSpan.innerHTML = ('0' + t.days).slice(-2);
			hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
			minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
			secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);
			if (t.total <= 0) {
			  clearInterval(timeinterval);
			}
		}

		updateClock();
		var timeinterval = setInterval(updateClock, 1000);
	}
	initializeClock('clockdiv', deadline);
</script>