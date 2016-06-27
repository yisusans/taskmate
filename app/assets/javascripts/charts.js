
$(document).ready(function () {
    var chartContainerNode = $('#container').attr('data-chart-info');
    if(chartContainerNode) {
        var dataFromAttr = JSON.parse(chartContainerNode);
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Weekly Task Progress'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
                series: [{
                    name: 'Tasks',
                    colorByPoint: true,
                    data: dataFromAttr
                }]
            });
    }
});





