
@if(! count($stats))
  	<div class="spacing-lg"></div>
	<h1 class="text-center">Uporabnikova statistika je prazna :(</h1>
@else
	<div id='dashboard'></div>
@endif
<script src="/assets/js/d3.v3.min.js"></script>
<script src="/assets/js/dashboard.js"></script>

<script>
	// kako narediti stolpce po mesecih? kaj naj bo maximum?
	// parametri: done, overdued, incompleted
	var stat = {!! json_encode($stats) !!};
	console.log(stat);
	var freqData = [];
	for(var month in stat) {
		console.log(month);
	  if(month != "total") {
	    freqData.push({State:month,freq:{vprasanja:stat[month]["question"], odgovori:stat[month]["answer"], glasovi:stat[month]["vote"], vzpodbudki:stat[month]['endorse']}});  
	  }
	}

	dashboard('#dashboard',freqData);
</script>