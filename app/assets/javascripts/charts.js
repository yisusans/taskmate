$(function () {
    $(document).ready(function () {
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
                    data: [{
                        name: '',
                        y: null
                }]
            }]
        });
    });
});


// Incomplete tasks for week
// @tasks = Group.tasks
// y = @tasks.incomplete.count

// Tasks completed by each member for week

// @members = Group.users
// @members.each do |member|
//     member.completed_tasks




