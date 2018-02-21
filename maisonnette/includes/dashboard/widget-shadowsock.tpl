<div class="widget widget-fullwidth earnings">
    <div class="widget-head">
        <span class="title">流量统计</span>
    </div>
    <div class="earnings-resume">
        <div class="earnings-value earnings-value-big">
            <span class="earnings-counter">
            {if (($addons_html['0']['ssinfo']['transfer_enable'] - ($addons_html['0']['ssinfo']['u'] + $addons_html['0']['ssinfo']['d']))) gt 1073741824}					{(($addons_html['0']['ssinfo']['transfer_enable'] - ($addons_html['0']['ssinfo']['u'] + $addons_html['0']['ssinfo']['d'])) / 1073741824)|round:2} GB
            {else}
            	{(($addons_html['0']['ssinfo']['transfer_enable'] - ($addons_html['0']['ssinfo']['u'] + $addons_html['0']['ssinfo']['d'])) / 1048576)|round:2} MB
            {/if}
            </span>
            <span class="earnings-title">剩余流量</span>
        </div>
        <div class="row">
        	<div class="col-6">
	            <div class="earnings-value">
	                <span class="earnings-counter" style="color: #9B3733;">
	                {if $addons_html['0']['ssinfo']['u'] gt 1073741824}
	                	{($addons_html['0']['ssinfo']['u'] / 1073741824)|round:2} GB
		            {else}
		            	{($addons_html['0']['ssinfo']['u'] / 1048576)|round:2} MB
		            {/if}
	                </span>
	                <span class="earnings-title">上传流量</span>
	            </div>
        	</div>
        	<div class="col-6">
	            <div class="earnings-value">
	                <span class="earnings-counter" style="color: #34C188;">
	                {if $addons_html['0']['ssinfo']['d'] gt 1073741824}
	                	{($addons_html['0']['ssinfo']['d'] / 1073741824)|round:2} GB
		            {else}
		            	{($addons_html['0']['ssinfo']['d'] / 1048576)|round:2} MB
		            {/if}
	                </span>
	                <span class="earnings-title">下载流量</span>
	            </div>
        	</div>
        </div>
    </div>
    <div class="earnings-chart">
        <div id="earnings-chart" style="height: 212px;"></div>
    </div>
    <script>
	jQuery(document).ready(function() {
	    var a = '#78E0B6',
	    b = '#6BD3A9',
	    c = [
	        [1, 10],
	        [2, 60],
	        [3, 40],
	        [4, 50],
	        [5, 30]
	    ],
	    d = [
	        [1, 30],
	        [2, 40],
	        [3, 25],
	        [4, 40],
	        [5, 65]
	    ];
	    $.plot("#earnings-chart", [{
	        data: c
	        , canvasRender: !0
	    }, {
	        data: d
	        , canvasRender: !0
	    }], {
	        series: {
	            lines: {
	                show: !0
	                , lineWidth: 0
	                , fill: !0
	                , fillColor: {
	                    colors: [{
	                        opacity: .7
	                    }, {
	                        opacity: .7
	                    }]
	                }
	            }
	            , fillColor: "rgba(0, 0, 0, 1)"
	            , shadowSize: 0
	            , curvedLines: {
	                apply: !0
	                , active: !0
	                , monotonicFit: !0
	            }
	        }
	        , legend: {
	            show: !1
	        }
	        , grid: {
	            show: !1
	            , hoverable: !0
	            , clickable: !0
	        }
	        , colors: [a, b]
	        , xaxis: {
	            autoscaleMargin: 0
	            , ticks: 11
	            , tickDecimals: 0
	        }
	        , yaxis: {
	            autoscaleMargin: .5
	            , ticks: 5
	            , tickDecimals: 0
	        }
	    });
	});
    </script>
</div>