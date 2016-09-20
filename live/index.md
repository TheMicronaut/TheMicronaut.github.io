---
layout: page
title: Live Streaming
excerpt: "live music streaming"
hidelogo: true
#enable_chat: true
---
<img src="/images/dancing-particles.gif" alt="dancing-particles-image" class="center non-selectable"/>
<iframe class="center" src="https://mixlr.com/users/5538402/embed?autoplay=true" width="100%" height="180px" scrolling="no" frameborder="no" marginheight="0" marginwidth="0"></iframe>
From time to time, Aleh tunes in and  streams his favorite music tracks via the "Glimmer of Sounds" live stream. More info to come soon...

Next  streaming : <span id="next-streaming" class="quote-text" title="2016-09-22T20:00:00+02:00"></span>

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