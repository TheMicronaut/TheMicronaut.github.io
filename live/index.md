---
layout: page
title: Live Streaming
excerpt: "live music streaming"
hidelogo: true
enable_chat: true
---
<figure>
<img src="/images/dancing-particles.gif" alt="dancing-particles-image" class="center non-selectable"/>
</figure>
<!-- casterfm audio player, alas does not run on android-->
<script type="text/javascript">var cstrpuid = 397415;var cstrpwidth = "450";var cstrpheight = "300";</script>
<script type="text/javascript" src="http://cdn.caster.fm/0070B7/widgets/player.js"></script><a id="cstrplb" href="http://www.caster.fm/">Free Shoutcast Hosting</a><a id="cstrplb2" href="http://www.caster.fm/">Radio Stream Hosting</a>
<div id="cstrpdiv" class="center"></div>
<!-- default html5 audio player, alas does not provide streaming metadata; yet runs on android-->
<!-- <figure id="my-radio-player" class="center">
<audio controls name="media" preload="metadata"><source src="http://shaincast.caster.fm:30567/listen.mp3?authn15da03834676e88b4364762862dcbbd7" type="audio/mpeg">Your browser does not support the audio element.</audio>
</figure> -->
<!-- keep one of the players, depending on os-->
I hereby share my favorite music moments. "Glimmers of Sounds" is the name of my live stream hosted by [caster.fm](http://moonlight.caster.fm/){:target="_blank"}. You are welcome to tune in, and enjoy. <span id="android-msg"></span>

Next  streaming : <span id="next-streaming" class="inline-quote" title="2016-09-25T19:30:00+02:00"></span>

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

<script type="text/javascript">
	var ua = navigator.userAgent.toLowerCase();
	var isAndroid = ua.indexOf("android") > -1; //&& ua.indexOf("mobile");
	var playerToRemove;
	if(isAndroid) {
        playerToRemove = document.getElementById('cstrpdiv');
        var msg = "Unfortunately caster.fm does not provide a free audio plugin for Android... So, you may only listen to this live stream via my caster.fm page (click on the link).";
	    document.getElementById('android-msg').innerHTML = msg;
	}
	if (playerToRemove != null) {
	playerToRemove.parentNode.removeChild(playerToRemove);
	}
</script>

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

<!-- This has CORS issues
<script type="text/javascript">
	/*var jsmediatags = window.jsmediatags;
	jsmediatags.Config.setDisallowedXhrHeaders(['If-Modified-Since', 'Content-Length', 'Content-Range', 'Range']);
	jsmediatags.Config.EXPERIMENTAL_avoidHeadRequests();
	jsmediatags.read("URL_TO_MP3_STREAM", {
	  onSuccess: function(tag) {
		console.log(tag);
	  },
	  onError: function(error) {
		console.log(error);
	  }
	});*/
</script>
-->